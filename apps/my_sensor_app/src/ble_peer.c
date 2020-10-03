/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
//  BLE Peer GATT Service Discovery Functions. Based on https://github.com/apache/mynewt-nimble/blob/master/apps/blecent/src/peer.c

#include <assert.h>
#include <string.h>
#include "host/ble_hs.h"
#include "ble_peer.h"

static void *blepeer_svc_mem;
static struct os_mempool blepeer_svc_pool;

static void *blepeer_chr_mem;
static struct os_mempool blepeer_chr_pool;

static void *blepeer_dsc_mem;
static struct os_mempool blepeer_dsc_pool;

static void *blepeer_mem;
static struct os_mempool blepeer_pool;
static SLIST_HEAD(, blepeer) peers;

static struct blepeer_svc *
blepeer_svc_find_range(struct blepeer *peer, uint16_t attr_handle);
static struct blepeer_svc *
blepeer_svc_find(struct blepeer *peer, uint16_t svc_start_handle,
              struct blepeer_svc **out_prev);
int
blepeer_svc_is_empty(const struct blepeer_svc *svc);

uint16_t
chr_end_handle(const struct blepeer_svc *svc, const struct blepeer_chr *chr);
int
chr_is_empty(const struct blepeer_svc *svc, const struct blepeer_chr *chr);
static struct blepeer_chr *
blepeer_chr_find(const struct blepeer_svc *svc, uint16_t chr_def_handle,
              struct blepeer_chr **out_prev);
static void
blepeer_disc_chrs(struct blepeer *peer);

static int
blepeer_dsc_disced(uint16_t conn_handle, const struct ble_gatt_error *error,
                uint16_t chr_val_handle, const struct ble_gatt_dsc *dsc,
                void *arg);

static struct blepeer *
blepeer_find(uint16_t conn_handle)
{
    struct blepeer *peer;

    SLIST_FOREACH(peer, &peers, next) {
        if (peer->conn_handle == conn_handle) {
            return peer;
        }
    }

    return NULL;
}

static void
blepeer_disc_complete(struct blepeer *peer, int rc)
{
    peer->disc_prev_chr_val = 0;

    /* Notify caller that discovery has completed. */
    if (peer->disc_cb != NULL) {
        peer->disc_cb(peer, rc, peer->disc_cb_arg);
    }
}

static struct blepeer_dsc *
blepeer_dsc_find_prev(const struct blepeer_chr *chr, uint16_t dsc_handle)
{
    struct blepeer_dsc *prev;
    struct blepeer_dsc *dsc;

    prev = NULL;
    SLIST_FOREACH(dsc, &chr->dscs, next) {
        if (dsc->dsc.handle >= dsc_handle) {
            break;
        }

        prev = dsc;
    }

    return prev;
}

static struct blepeer_dsc *
blepeer_dsc_find(const struct blepeer_chr *chr, uint16_t dsc_handle,
              struct blepeer_dsc **out_prev)
{
    struct blepeer_dsc *prev;
    struct blepeer_dsc *dsc;

    prev = blepeer_dsc_find_prev(chr, dsc_handle);
    if (prev == NULL) {
        dsc = SLIST_FIRST(&chr->dscs);
    } else {
        dsc = SLIST_NEXT(prev, next);
    }

    if (dsc != NULL && dsc->dsc.handle != dsc_handle) {
        dsc = NULL;
    }

    if (out_prev != NULL) {
        *out_prev = prev;
    }
    return dsc;
}

static int
blepeer_dsc_add(struct blepeer *peer, uint16_t chr_val_handle,
             const struct ble_gatt_dsc *gatt_dsc)
{
    struct blepeer_dsc *prev;
    struct blepeer_dsc *dsc;
    struct blepeer_svc *svc;
    struct blepeer_chr *chr;

    svc = blepeer_svc_find_range(peer, chr_val_handle);
    if (svc == NULL) {
        /* Can't find service for discovered descriptor; this shouldn't
         * happen.
         */
        assert(0);
        return BLE_HS_EUNKNOWN;
    }

    chr = blepeer_chr_find(svc, chr_val_handle, NULL);
    if (chr == NULL) {
        /* Can't find characteristic for discovered descriptor; this shouldn't
         * happen.
         */
        assert(0);
        return BLE_HS_EUNKNOWN;
    }

    dsc = blepeer_dsc_find(chr, gatt_dsc->handle, &prev);
    if (dsc != NULL) {
        /* Descriptor already discovered. */
        return 0;
    }

    dsc = os_memblock_get(&blepeer_dsc_pool);
    if (dsc == NULL) {
        /* Out of memory. */
        return BLE_HS_ENOMEM;
    }
    memset(dsc, 0, sizeof *dsc);

    dsc->dsc = *gatt_dsc;

    if (prev == NULL) {
        SLIST_INSERT_HEAD(&chr->dscs, dsc, next);
    } else {
        SLIST_NEXT(prev, next) = dsc;
    }

    return 0;
}

static void
blepeer_disc_dscs(struct blepeer *peer)
{
    struct blepeer_chr *chr;
    struct blepeer_svc *svc;
    int rc;

    /* Search through the list of discovered characteristics for the first
     * characteristic that contains undiscovered descriptors.  Then, discover
     * all descriptors belonging to that characteristic.
     */
    SLIST_FOREACH(svc, &peer->svcs, next) {
        SLIST_FOREACH(chr, &svc->chrs, next) {
            if (!chr_is_empty(svc, chr) &&
                SLIST_EMPTY(&chr->dscs) &&
                peer->disc_prev_chr_val <= chr->chr.def_handle) {

                rc = ble_gattc_disc_all_dscs(peer->conn_handle,
                                             chr->chr.val_handle,
                                             chr_end_handle(svc, chr),
                                             blepeer_dsc_disced, peer);
                if (rc != 0) {
                    blepeer_disc_complete(peer, rc);
                }

                peer->disc_prev_chr_val = chr->chr.val_handle;
                return;
            }
        }
    }

    /* All descriptors discovered. */
    blepeer_disc_complete(peer, 0);
}

static int
blepeer_dsc_disced(uint16_t conn_handle, const struct ble_gatt_error *error,
                uint16_t chr_val_handle, const struct ble_gatt_dsc *dsc,
                void *arg)
{
    struct blepeer *peer;
    int rc;

    peer = arg;
    assert(peer->conn_handle == conn_handle);

    switch (error->status) {
    case 0:
        rc = blepeer_dsc_add(peer, chr_val_handle, dsc);
        break;

    case BLE_HS_EDONE:
        /* All descriptors in this characteristic discovered; start discovering
         * descriptors in the next characteristic.
         */
        if (peer->disc_prev_chr_val > 0) {
            blepeer_disc_dscs(peer);
        }
        rc = 0;
        break;

    default:
        /* Error; abort discovery. */
        rc = error->status;
        break;
    }

    if (rc != 0) {
        /* Error; abort discovery. */
        blepeer_disc_complete(peer, rc);
    }

    return rc;
}

uint16_t
chr_end_handle(const struct blepeer_svc *svc, const struct blepeer_chr *chr)
{
    const struct blepeer_chr *next_chr;

    next_chr = SLIST_NEXT(chr, next);
    if (next_chr != NULL) {
        return next_chr->chr.def_handle - 1;
    } else {
        return svc->svc.end_handle;
    }
}

int
chr_is_empty(const struct blepeer_svc *svc, const struct blepeer_chr *chr)
{
    return chr_end_handle(svc, chr) <= chr->chr.val_handle;
}

static struct blepeer_chr *
blepeer_chr_find_prev(const struct blepeer_svc *svc, uint16_t chr_val_handle)
{
    struct blepeer_chr *prev;
    struct blepeer_chr *chr;

    prev = NULL;
    SLIST_FOREACH(chr, &svc->chrs, next) {
        if (chr->chr.val_handle >= chr_val_handle) {
            break;
        }

        prev = chr;
    }

    return prev;
}

static struct blepeer_chr *
blepeer_chr_find(const struct blepeer_svc *svc, uint16_t chr_val_handle,
              struct blepeer_chr **out_prev)
{
    struct blepeer_chr *prev;
    struct blepeer_chr *chr;

    prev = blepeer_chr_find_prev(svc, chr_val_handle);
    if (prev == NULL) {
        chr = SLIST_FIRST(&svc->chrs);
    } else {
        chr = SLIST_NEXT(prev, next);
    }

    if (chr != NULL && chr->chr.val_handle != chr_val_handle) {
        chr = NULL;
    }

    if (out_prev != NULL) {
        *out_prev = prev;
    }
    return chr;
}

static void
blepeer_chr_delete(struct blepeer_chr *chr)
{
    struct blepeer_dsc *dsc;

    while ((dsc = SLIST_FIRST(&chr->dscs)) != NULL) {
        SLIST_REMOVE_HEAD(&chr->dscs, next);
        os_memblock_put(&blepeer_dsc_pool, dsc);
    }

    os_memblock_put(&blepeer_chr_pool, chr);
}

static int
blepeer_chr_add(struct blepeer *peer,  uint16_t svc_start_handle,
             const struct ble_gatt_chr *gatt_chr)
{
    struct blepeer_chr *prev;
    struct blepeer_chr *chr;
    struct blepeer_svc *svc;

    svc = blepeer_svc_find(peer, svc_start_handle, NULL);
    if (svc == NULL) {
        /* Can't find service for discovered characteristic; this shouldn't
         * happen.
         */
        assert(0);
        return BLE_HS_EUNKNOWN;
    }

    chr = blepeer_chr_find(svc, gatt_chr->def_handle, &prev);
    if (chr != NULL) {
        /* Characteristic already discovered. */
        return 0;
    }

    chr = os_memblock_get(&blepeer_chr_pool);
    if (chr == NULL) {
        /* Out of memory. */
        return BLE_HS_ENOMEM;
    }
    memset(chr, 0, sizeof *chr);

    chr->chr = *gatt_chr;

    if (prev == NULL) {
        SLIST_INSERT_HEAD(&svc->chrs, chr, next);
    } else {
        SLIST_NEXT(prev, next) = chr;
    }

    return 0;
}

static int
blepeer_chr_disced(uint16_t conn_handle, const struct ble_gatt_error *error,
                const struct ble_gatt_chr *chr, void *arg)
{
    struct blepeer *peer;
    int rc;

    peer = arg;
    assert(peer->conn_handle == conn_handle);

    switch (error->status) {
    case 0:
        rc = blepeer_chr_add(peer, peer->cur_svc->svc.start_handle, chr);
        break;

    case BLE_HS_EDONE:
        /* All characteristics in this service discovered; start discovering
         * characteristics in the next service.
         */
        if (peer->disc_prev_chr_val > 0) {
             blepeer_disc_chrs(peer);
        }
        rc = 0;
        break;

    default:
        rc = error->status;
        break;
    }

    if (rc != 0) {
        /* Error; abort discovery. */
        blepeer_disc_complete(peer, rc);
    }

    return rc;
}

static void
blepeer_disc_chrs(struct blepeer *peer)
{
    struct blepeer_svc *svc;
    int rc;

    /* Search through the list of discovered service for the first service that
     * contains undiscovered characteristics.  Then, discover all
     * characteristics belonging to that service.
     */
    SLIST_FOREACH(svc, &peer->svcs, next) {
        if (!blepeer_svc_is_empty(svc) && SLIST_EMPTY(&svc->chrs)) {
            peer->cur_svc = svc;
            rc = ble_gattc_disc_all_chrs(peer->conn_handle,
                                         svc->svc.start_handle,
                                         svc->svc.end_handle,
                                         blepeer_chr_disced, peer);
            if (rc != 0) {
                blepeer_disc_complete(peer, rc);
            }
            return;
        }
    }

    /* All characteristics discovered. */
    blepeer_disc_dscs(peer);
}

int
blepeer_svc_is_empty(const struct blepeer_svc *svc)
{
    return svc->svc.end_handle <= svc->svc.start_handle;
}

static struct blepeer_svc *
blepeer_svc_find_prev(struct blepeer *peer, uint16_t svc_start_handle)
{
    struct blepeer_svc *prev;
    struct blepeer_svc *svc;

    prev = NULL;
    SLIST_FOREACH(svc, &peer->svcs, next) {
        if (svc->svc.start_handle >= svc_start_handle) {
            break;
        }

        prev = svc;
    }

    return prev;
}

static struct blepeer_svc *
blepeer_svc_find(struct blepeer *peer, uint16_t svc_start_handle,
              struct blepeer_svc **out_prev)
{
    struct blepeer_svc *prev;
    struct blepeer_svc *svc;

    prev = blepeer_svc_find_prev(peer, svc_start_handle);
    if (prev == NULL) {
        svc = SLIST_FIRST(&peer->svcs);
    } else {
        svc = SLIST_NEXT(prev, next);
    }

    if (svc != NULL && svc->svc.start_handle != svc_start_handle) {
        svc = NULL;
    }

    if (out_prev != NULL) {
        *out_prev = prev;
    }
    return svc;
}

static struct blepeer_svc *
blepeer_svc_find_range(struct blepeer *peer, uint16_t attr_handle)
{
    struct blepeer_svc *svc;

    SLIST_FOREACH(svc, &peer->svcs, next) {
        if (svc->svc.start_handle <= attr_handle &&
            svc->svc.end_handle >= attr_handle) {

            return svc;
        }
    }

    return NULL;
}

const struct blepeer_svc *
blepeer_svc_find_uuid(const struct blepeer *peer, const ble_uuid_t *uuid)
{
    const struct blepeer_svc *svc;

    SLIST_FOREACH(svc, &peer->svcs, next) {
        if (ble_uuid_cmp(&svc->svc.uuid.u, uuid) == 0) {
            return svc;
        }
    }

    return NULL;
}

const struct blepeer_chr *
blepeer_chr_find_uuid(const struct blepeer *peer, const ble_uuid_t *svc_uuid,
                   const ble_uuid_t *chr_uuid)
{
    const struct blepeer_svc *svc;
    const struct blepeer_chr *chr;

    svc = blepeer_svc_find_uuid(peer, svc_uuid);
    if (svc == NULL) {
        return NULL;
    }

    SLIST_FOREACH(chr, &svc->chrs, next) {
        if (ble_uuid_cmp(&chr->chr.uuid.u, chr_uuid) == 0) {
            return chr;
        }
    }

    return NULL;
}

const struct blepeer_dsc *
blepeer_dsc_find_uuid(const struct blepeer *peer, const ble_uuid_t *svc_uuid,
                   const ble_uuid_t *chr_uuid, const ble_uuid_t *dsc_uuid)
{
    const struct blepeer_chr *chr;
    const struct blepeer_dsc *dsc;

    chr = blepeer_chr_find_uuid(peer, svc_uuid, chr_uuid);
    if (chr == NULL) {
        return NULL;
    }

    SLIST_FOREACH(dsc, &chr->dscs, next) {
        if (ble_uuid_cmp(&dsc->dsc.uuid.u, dsc_uuid) == 0) {
            return dsc;
        }
    }

    return NULL;
}

static int
blepeer_svc_add(struct blepeer *peer, const struct ble_gatt_svc *gatt_svc)
{
    struct blepeer_svc *prev;
    struct blepeer_svc *svc;

    svc = blepeer_svc_find(peer, gatt_svc->start_handle, &prev);
    if (svc != NULL) {
        /* Service already discovered. */
        return 0;
    }

    svc = os_memblock_get(&blepeer_svc_pool);
    if (svc == NULL) {
        /* Out of memory. */
        return BLE_HS_ENOMEM;
    }
    memset(svc, 0, sizeof *svc);

    svc->svc = *gatt_svc;
    SLIST_INIT(&svc->chrs);

    if (prev == NULL) {
        SLIST_INSERT_HEAD(&peer->svcs, svc, next);
    } else {
        SLIST_INSERT_AFTER(prev, svc, next);
    }

    return 0;
}

static void
blepeer_svc_delete(struct blepeer_svc *svc)
{
    struct blepeer_chr *chr;

    while ((chr = SLIST_FIRST(&svc->chrs)) != NULL) {
        SLIST_REMOVE_HEAD(&svc->chrs, next);
        blepeer_chr_delete(chr);
    }

    os_memblock_put(&blepeer_svc_pool, svc);
}

static int
blepeer_svc_disced(uint16_t conn_handle, const struct ble_gatt_error *error,
                const struct ble_gatt_svc *service, void *arg)
{
    struct blepeer *peer;
    int rc;

    peer = arg;
    assert(peer->conn_handle == conn_handle);

    switch (error->status) {
    case 0:
        rc = blepeer_svc_add(peer, service);
        break;

    case BLE_HS_EDONE:
        /* All services discovered; start discovering characteristics. */
        if (peer->disc_prev_chr_val > 0) {
            blepeer_disc_chrs(peer);
        }
        rc = 0;
        break;

    default:
        rc = error->status;
        break;
    }

    if (rc != 0) {
        /* Error; abort discovery. */
        blepeer_disc_complete(peer, rc);
    }

    return rc;
}


int
blepeer_disc_all(uint16_t conn_handle, blepeer_disc_fn *disc_cb, void *disc_cb_arg)
{
    struct blepeer_svc *svc;
    struct blepeer *peer;
    int rc;

    peer = blepeer_find(conn_handle);
    if (peer == NULL) {
        return BLE_HS_ENOTCONN;
    }

    /* Undiscover everything first. */
    while ((svc = SLIST_FIRST(&peer->svcs)) != NULL) {
        SLIST_REMOVE_HEAD(&peer->svcs, next);
        blepeer_svc_delete(svc);
    }

    peer->disc_prev_chr_val = 1;
    peer->disc_cb = disc_cb;
    peer->disc_cb_arg = disc_cb_arg;

    rc = ble_gattc_disc_all_svcs(conn_handle, blepeer_svc_disced, peer);
    if (rc != 0) {
        return rc;
    }

    return 0;
}

int
blepeer_delete(uint16_t conn_handle)
{
    struct blepeer_svc *svc;
    struct blepeer *peer;
    int rc;

    peer = blepeer_find(conn_handle);
    if (peer == NULL) {
        return BLE_HS_ENOTCONN;
    }

    SLIST_REMOVE(&peers, peer, peer, next);

    while ((svc = SLIST_FIRST(&peer->svcs)) != NULL) {
        SLIST_REMOVE_HEAD(&peer->svcs, next);
        blepeer_svc_delete(svc);
    }

    rc = os_memblock_put(&blepeer_pool, peer);
    if (rc != 0) {
        return BLE_HS_EOS;
    }

    return 0;
}

int
blepeer_add(uint16_t conn_handle)
{
    struct blepeer *peer;

    /* Make sure the connection handle is unique. */
    peer = blepeer_find(conn_handle);
    if (peer != NULL) {
        return BLE_HS_EALREADY;
    }

    peer = os_memblock_get(&blepeer_pool);
    if (peer == NULL) {
        /* Out of memory. */
        return BLE_HS_ENOMEM;
    }

    memset(peer, 0, sizeof *peer);
    peer->conn_handle = conn_handle;

    SLIST_INSERT_HEAD(&peers, peer, next);

    return 0;
}

static void
blepeer_free_mem(void)
{
    free(blepeer_mem);
    blepeer_mem = NULL;

    free(blepeer_svc_mem);
    blepeer_svc_mem = NULL;

    free(blepeer_chr_mem);
    blepeer_chr_mem = NULL;

    free(blepeer_dsc_mem);
    blepeer_dsc_mem = NULL;
}

int
blepeer_init(int max_peers, int max_svcs, int max_chrs, int max_dscs)
{
    int rc;

    /* Free memory first in case this function gets called more than once. */
    blepeer_free_mem();

    blepeer_mem = malloc(
        OS_MEMPOOL_BYTES(max_peers, sizeof (struct blepeer)));
    if (blepeer_mem == NULL) {
        rc = BLE_HS_ENOMEM;
        goto err;
    }

    rc = os_mempool_init(&blepeer_pool, max_peers,
                         sizeof (struct blepeer), blepeer_mem,
                         "blepeer_pool");
    if (rc != 0) {
        rc = BLE_HS_EOS;
        goto err;
    }

    blepeer_svc_mem = malloc(
        OS_MEMPOOL_BYTES(max_svcs, sizeof (struct blepeer_svc)));
    if (blepeer_svc_mem == NULL) {
        rc = BLE_HS_ENOMEM;
        goto err;
    }

    rc = os_mempool_init(&blepeer_svc_pool, max_svcs,
                         sizeof (struct blepeer_svc), blepeer_svc_mem,
                         "blepeer_svc_pool");
    if (rc != 0) {
        rc = BLE_HS_EOS;
        goto err;
    }

    blepeer_chr_mem = malloc(
        OS_MEMPOOL_BYTES(max_chrs, sizeof (struct blepeer_chr)));
    if (blepeer_chr_mem == NULL) {
        rc = BLE_HS_ENOMEM;
        goto err;
    }

    rc = os_mempool_init(&blepeer_chr_pool, max_chrs,
                         sizeof (struct blepeer_chr), blepeer_chr_mem,
                         "blepeer_chr_pool");
    if (rc != 0) {
        rc = BLE_HS_EOS;
        goto err;
    }

    blepeer_dsc_mem = malloc(
        OS_MEMPOOL_BYTES(max_dscs, sizeof (struct blepeer_dsc)));
    if (blepeer_dsc_mem == NULL) {
        rc = BLE_HS_ENOMEM;
        goto err;
    }

    rc = os_mempool_init(&blepeer_dsc_pool, max_dscs,
                         sizeof (struct blepeer_dsc), blepeer_dsc_mem,
                         "blepeer_dsc_pool");
    if (rc != 0) {
        rc = BLE_HS_EOS;
        goto err;
    }

    return 0;

err:
    blepeer_free_mem();
    return rc;
}