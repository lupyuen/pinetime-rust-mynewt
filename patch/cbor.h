/****************************************************************************
**
** Copyright (C) 2015 Intel Corporation
**
** Permission is hereby granted, free of charge, to any person obtaining a copy
** of this software and associated documentation files (the "Software"), to deal
** in the Software without restriction, including without limitation the rights
** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
** copies of the Software, and to permit persons to whom the Software is
** furnished to do so, subject to the following conditions:
**
** The above copyright notice and this permission notice shall be included in
** all copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
** THE SOFTWARE.
**
****************************************************************************/

#ifndef CBOR_H
#define CBOR_H

#include <assert.h>
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#else
#include <stdbool.h>
#endif

#ifndef SIZE_MAX
/* Some systems fail to define SIZE_MAX in <stdint.h>, even though C99 requires it...
 * Conversion from signed to unsigned is defined in 6.3.1.3 (Signed and unsigned integers) p2,
 * which says: "the value is converted by repeatedly adding or subtracting one more than the
 * maximum value that can be represented in the new type until the value is in the range of the
 * new type."
 * So -1 gets converted to size_t by adding SIZE_MAX + 1, which results in SIZE_MAX.
 */
#  define SIZE_MAX ((size_t)-1)
#endif

////  TODO: Don't compile TinyCBOR inline, to reduce ROM size.
#define CBOR_INLINE inline
#define CBOR_INLINE_API static inline

#define _ADDCOUNTER( prefix ) JOIN( NOTUSED_, prefix )

//#define _ADDCOUNTER( prefix ) JOIN( prefix, __COUNTER__ )
#define JOIN( symbol1, symbol2 ) _DO_JOIN( symbol1, symbol2 )
#define _DO_JOIN( symbol1, symbol2 ) symbol1##symbol2

#undef assert
#define assert(x) {}

#define cbor_encode_text_stringz _ADDCOUNTER(cbor_encode_text_stringz)  ////
#define cbor_encode_bytes_written _ADDCOUNTER(cbor_encode_bytes_written)  ////
#define cbor_encode_boolean _ADDCOUNTER(cbor_encode_boolean)  ////
#define cbor_encode_null _ADDCOUNTER(cbor_encode_null)  ////
#define cbor_encode_undefined _ADDCOUNTER(cbor_encode_undefined)  ////
#define cbor_encode_half_float _ADDCOUNTER(cbor_encode_half_float)  ////
#define cbor_encode_float _ADDCOUNTER(cbor_encode_float)  ////
#define cbor_encode_double _ADDCOUNTER(cbor_encode_double)  ////
#define cbor_value_at_end _ADDCOUNTER(cbor_value_at_end)  ////
#define cbor_value_is_container _ADDCOUNTER(cbor_value_is_container)  ////
#define _cbor_value_extract_int64_helper _ADDCOUNTER(_cbor_value_extract_int64_helper)  ////
#define cbor_value_is_valid _ADDCOUNTER(cbor_value_is_valid)  ////
#define cbor_value_get_type _ADDCOUNTER(cbor_value_get_type)  ////
#define cbor_value_is_null _ADDCOUNTER(cbor_value_is_null)  ////
#define cbor_value_is_undefined _ADDCOUNTER(cbor_value_is_undefined)  ////
#define cbor_value_is_boolean _ADDCOUNTER(cbor_value_is_boolean)  ////
#define cbor_value_get_boolean _ADDCOUNTER(cbor_value_get_boolean)  ////
#define cbor_value_is_simple_type _ADDCOUNTER(cbor_value_is_simple_type)  ////
#define cbor_value_get_simple_type _ADDCOUNTER(cbor_value_get_simple_type)  ////
#define cbor_value_is_integer _ADDCOUNTER(cbor_value_is_integer)  ////
#define cbor_value_is_unsigned_integer _ADDCOUNTER(cbor_value_is_unsigned_integer)  ////
#define cbor_value_is_negative_integer _ADDCOUNTER(cbor_value_is_negative_integer)  ////
#define cbor_value_get_raw_integer _ADDCOUNTER(cbor_value_get_raw_integer)  ////
#define cbor_value_get_uint64 _ADDCOUNTER(cbor_value_get_uint64)  ////
#define cbor_value_get_int64 _ADDCOUNTER(cbor_value_get_int64)  ////
#define cbor_value_get_int _ADDCOUNTER(cbor_value_get_int)  ////
#define cbor_value_is_length_known _ADDCOUNTER(cbor_value_is_length_known)  ////
#define cbor_value_is_tag _ADDCOUNTER(cbor_value_is_tag)  ////
#define cbor_value_get_tag _ADDCOUNTER(cbor_value_get_tag)  ////
#define cbor_value_is_byte_string _ADDCOUNTER(cbor_value_is_byte_string)  ////
#define cbor_value_is_text_string _ADDCOUNTER(cbor_value_is_text_string)  ////
#define cbor_value_get_string_length _ADDCOUNTER(cbor_value_get_string_length)  ////
#define cbor_value_copy_text_string _ADDCOUNTER(cbor_value_copy_text_string)  ////
#define cbor_value_copy_byte_string _ADDCOUNTER(cbor_value_copy_byte_string)  ////
#define cbor_value_dup_text_string _ADDCOUNTER(cbor_value_dup_text_string)  ////
#define cbor_value_dup_byte_string _ADDCOUNTER(cbor_value_dup_byte_string)  ////
#define cbor_value_is_array _ADDCOUNTER(cbor_value_is_array)  ////
#define cbor_value_is_map _ADDCOUNTER(cbor_value_is_map)  ////
#define cbor_value_get_array_length _ADDCOUNTER(cbor_value_get_array_length)  ////
#define cbor_value_get_map_length _ADDCOUNTER(cbor_value_get_map_length)  ////
#define cbor_value_is_half_float _ADDCOUNTER(cbor_value_is_half_float)  ////
#define cbor_value_is_float _ADDCOUNTER(cbor_value_is_float)  ////
#define cbor_value_get_float _ADDCOUNTER(cbor_value_get_float)  ////
#define cbor_value_is_double _ADDCOUNTER(cbor_value_is_double)  ////
#define cbor_value_get_double _ADDCOUNTER(cbor_value_get_double)  ////
#define cbor_value_to_pretty _ADDCOUNTER(cbor_value_to_pretty)  ////
////



#ifndef CBOR_API
#  define CBOR_API
#endif
#ifndef CBOR_PRIVATE_API
#  define CBOR_PRIVATE_API
#endif
#ifndef CBOR_INLINE_API
#  if defined(__cplusplus)
#    define CBOR_INLINE inline
#    define CBOR_INLINE_API inline
#  else
#    define CBOR_INLINE_API static CBOR_INLINE
#    if defined(_MSC_VER)
#      define CBOR_INLINE __inline
#    elif defined(__GNUC__)
#      define CBOR_INLINE __inline__
#    elif defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
#      define CBOR_INLINE inline
#    else
#      define CBOR_INLINE
#    endif
#  endif
#endif

typedef enum CborType {
    CborIntegerType     = 0x00,
    CborByteStringType  = 0x40,
    CborTextStringType  = 0x60,
    CborArrayType       = 0x80,
    CborMapType         = 0xa0,
    CborTagType         = 0xc0,
    CborSimpleType      = 0xe0,
    CborBooleanType     = 0xf5,
    CborNullType        = 0xf6,
    CborUndefinedType   = 0xf7,
    CborHalfFloatType   = 0xf9,
    CborFloatType       = 0xfa,
    CborDoubleType      = 0xfb,

    CborInvalidType     = 0xff              /* equivalent to the break byte, so it will never be used */
} CborType;

typedef uint64_t CborTag;
typedef enum CborKnownTags {
    CborDateTimeStringTag          = 0,        /* RFC 3339 format: YYYY-MM-DD hh:mm:ss+zzzz */
    CborUnixTime_tTag              = 1,
    CborPositiveBignumTag          = 2,
    CborNegativeBignumTag          = 3,
    CborDecimalTag                 = 4,
    CborBigfloatTag                = 5,
    CborExpectedBase64urlTag       = 21,
    CborExpectedBase64Tag          = 22,
    CborExpectedBase16Tag          = 23,
    CborUriTag                     = 32,
    CborBase64urlTag               = 33,
    CborBase64Tag                  = 34,
    CborRegularExpressionTag       = 35,
    CborMimeMessageTag             = 36,       /* RFC 2045-2047 */
    CborSignatureTag               = 55799
} CborKnownTags;

/* Error API */

typedef enum CborError {
    CborNoError = 0,

    /* errors in all modes */
    CborUnknownError,
    CborErrorUnknownLength,         /* request for length in array, map, or string with indeterminate length */
    CborErrorAdvancePastEOF,
    CborErrorIO,

    /* parser errors streaming errors */
    CborErrorGarbageAtEnd = 256,
    CborErrorUnexpectedEOF,
    CborErrorUnexpectedBreak,
    CborErrorUnknownType,           /* can only heppen in major type 7 */
    CborErrorIllegalType,           /* type not allowed here */
    CborErrorIllegalNumber,
    CborErrorIllegalSimpleType,     /* types of value less than 32 encoded in two bytes */

    /* parser errors in strict mode parsing only */
    CborErrorUnknownSimpleType = 512,
    CborErrorUnknownTag,
    CborErrorInappropriateTagForType,
    CborErrorDuplicateObjectKeys,
    CborErrorInvalidUtf8TextString,

    /* encoder errors */
    CborErrorTooManyItems = 768,
    CborErrorTooFewItems,

    /* internal implementation errors */
    CborErrorDataTooLarge = 1024,
    CborErrorNestingTooDeep,
    CborErrorUnsupportedType,

    /* errors in converting to JSON */
    CborErrorJsonObjectKeyIsAggregate,
    CborErrorJsonObjectKeyNotString,
    CborErrorJsonNotImplemented,

    CborErrorOutOfMemory = ~0U / 2 + 1,
    CborErrorInternalError = ~0U
} CborError;

CBOR_API const char *cbor_error_string(CborError error);

struct cbor_encoder_writer;

typedef int (cbor_encoder_write)(struct cbor_encoder_writer *, const char *data, int len);

typedef struct cbor_encoder_writer {
    cbor_encoder_write *write;
    int                 bytes_written;
} cbor_encoder_writer;

struct cbor_iovec {
    void   *iov_base;
    size_t iov_len;
};

/* Encoder API */
struct CborEncoder {
    cbor_encoder_writer *writer;
    void *writer_arg;
    size_t added;
    int flags;
};
typedef struct CborEncoder CborEncoder;

static const size_t CborIndefiniteLength = SIZE_MAX;


CBOR_API void cbor_encoder_init(CborEncoder *encoder, cbor_encoder_writer *pwriter, int flags);
CBOR_API CborError cbor_encode_uint(CborEncoder *encoder, uint64_t value);
CBOR_API CborError cbor_encode_int(CborEncoder *encoder, int64_t value);
CBOR_API CborError cbor_encode_negative_int(CborEncoder *encoder, uint64_t absolute_value);
CBOR_API CborError cbor_encode_simple_value(CborEncoder *encoder, uint8_t value);
CBOR_API CborError cbor_encode_tag(CborEncoder *encoder, CborTag tag);
CBOR_API CborError cbor_encode_text_string(CborEncoder *encoder, const char *string, size_t length);
CBOR_INLINE_API CborError cbor_encode_text_stringz(CborEncoder *encoder, const char *string)
{ return cbor_encode_text_string(encoder, string, strlen(string)); }
CBOR_API CborError cbor_encode_byte_string(CborEncoder *encoder, const uint8_t *string, size_t length);
CBOR_API CborError cbor_encode_byte_iovec(CborEncoder *encoder,
                                          const struct cbor_iovec iov[],
                                          int iov_len);
CBOR_API CborError cbor_encode_floating_point(CborEncoder *encoder, CborType fpType, const void *value);
CBOR_INLINE_API CborError cbor_encode_bytes_written(CborEncoder *encoder)
{   return (CborError) encoder->writer->bytes_written; }
CBOR_INLINE_API CborError cbor_encode_boolean(CborEncoder *encoder, bool value)
{ return cbor_encode_simple_value(encoder, (int)value - 1 + (CborBooleanType & 0x1f)); }
CBOR_INLINE_API CborError cbor_encode_null(CborEncoder *encoder)
{ return cbor_encode_simple_value(encoder, CborNullType & 0x1f); }
CBOR_INLINE_API CborError cbor_encode_undefined(CborEncoder *encoder)
{ return cbor_encode_simple_value(encoder, CborUndefinedType & 0x1f); }

CBOR_INLINE_API CborError cbor_encode_half_float(CborEncoder *encoder, const void *value)
{ return cbor_encode_floating_point(encoder, CborHalfFloatType, value); }
CBOR_INLINE_API CborError cbor_encode_float(CborEncoder *encoder, float value)
{ return cbor_encode_floating_point(encoder, CborFloatType, &value); }
CBOR_INLINE_API CborError cbor_encode_double(CborEncoder *encoder, double value)
{ return cbor_encode_floating_point(encoder, CborDoubleType, &value); }

CBOR_API CborError cbor_encoder_create_array(CborEncoder *encoder, CborEncoder *arrayEncoder, size_t length);
CBOR_API CborError cbor_encoder_create_map(CborEncoder *encoder, CborEncoder *mapEncoder, size_t length);
CBOR_API CborError cbor_encoder_create_indef_byte_string(CborEncoder *encoder, CborEncoder *stringEncoder);
CBOR_API CborError cbor_encoder_close_container(CborEncoder *encoder, const CborEncoder *containerEncoder);
CBOR_API CborError cbor_encoder_close_container_checked(CborEncoder *encoder, const CborEncoder *containerEncoder);

/* Parser API */

enum CborParserIteratorFlags
{
    CborIteratorFlag_IntegerValueTooLarge   = 0x01,
    CborIteratorFlag_NegativeInteger        = 0x02,
    CborIteratorFlag_UnknownLength          = 0x04,
    CborIteratorFlag_ContainerIsMap         = 0x20
};

struct cbor_decoder_reader;

typedef uint8_t (cbor_reader_get8)(struct cbor_decoder_reader *d, int offset);
typedef uint16_t (cbor_reader_get16)(struct cbor_decoder_reader *d, int offset);
typedef uint32_t (cbor_reader_get32)(struct cbor_decoder_reader *d, int offset);
typedef uint64_t (cbor_reader_get64)(struct cbor_decoder_reader *d, int offset);
typedef uintptr_t (cbor_memcmp)(struct cbor_decoder_reader *d, char *buf, int offset, size_t len);
typedef uintptr_t (cbor_memcpy)(struct cbor_decoder_reader *d, char *buf, int offset, size_t len);

struct cbor_decoder_reader {
    cbor_reader_get8  *get8;
    cbor_reader_get16 *get16;
    cbor_reader_get32 *get32;
    cbor_reader_get64 *get64;
    cbor_memcmp       *cmp;
    cbor_memcpy       *cpy;
    size_t             message_size;
};

struct CborParser
{
    struct cbor_decoder_reader *d;
    int end;
    int flags;
};
typedef struct CborParser CborParser;

struct CborValue
{
    const CborParser *parser;
    int offset;
    uint32_t remaining;
    uint16_t extra;
    uint8_t type;
    uint8_t flags;
};
typedef struct CborValue CborValue;

CBOR_API CborError cbor_parser_init(struct cbor_decoder_reader *d, int flags, CborParser *parser, CborValue *it);

CBOR_INLINE_API bool cbor_value_at_end(const CborValue *it)
{ return it->remaining == 0; }
CBOR_API CborError cbor_value_advance_fixed(CborValue *it);
CBOR_API CborError cbor_value_advance(CborValue *it);
CBOR_INLINE_API bool cbor_value_is_container(const CborValue *it)
{ return it->type == CborArrayType || it->type == CborMapType; }
CBOR_API CborError cbor_value_enter_container(const CborValue *it, CborValue *recursed);
CBOR_API CborError cbor_value_leave_container(CborValue *it, const CborValue *recursed);

CBOR_PRIVATE_API uint64_t _cbor_value_decode_int64_internal(const CborValue *value);
CBOR_INLINE_API uint64_t _cbor_value_extract_int64_helper(const CborValue *value)
{
    return value->flags & CborIteratorFlag_IntegerValueTooLarge ?
                _cbor_value_decode_int64_internal(value) : value->extra;
}

CBOR_INLINE_API bool cbor_value_is_valid(const CborValue *value)
{ return value && value->type != CborInvalidType; }
CBOR_INLINE_API CborType cbor_value_get_type(const CborValue *value)
{ return (CborType)value->type; }

/* Null & undefined type */
CBOR_INLINE_API bool cbor_value_is_null(const CborValue *value)
{ return value->type == CborNullType; }
CBOR_INLINE_API bool cbor_value_is_undefined(const CborValue *value)
{ return value->type == CborUndefinedType; }

/* Booleans */
CBOR_INLINE_API bool cbor_value_is_boolean(const CborValue *value)
{ return value->type == CborBooleanType; }
CBOR_INLINE_API CborError cbor_value_get_boolean(const CborValue *value, bool *result)
{
    assert(cbor_value_is_boolean(value));
    *result = !!value->extra;
    return CborNoError;
}

/* Simple types */
CBOR_INLINE_API bool cbor_value_is_simple_type(const CborValue *value)
{ return value->type == CborSimpleType; }
CBOR_INLINE_API CborError cbor_value_get_simple_type(const CborValue *value, uint8_t *result)
{
    assert(cbor_value_is_simple_type(value));
    *result = (uint8_t)value->extra;
    return CborNoError;
}

/* Integers */
CBOR_INLINE_API bool cbor_value_is_integer(const CborValue *value)
{ return value->type == CborIntegerType; }
CBOR_INLINE_API bool cbor_value_is_unsigned_integer(const CborValue *value)
{ return cbor_value_is_integer(value) && (value->flags & CborIteratorFlag_NegativeInteger) == 0; }
CBOR_INLINE_API bool cbor_value_is_negative_integer(const CborValue *value)
{ return cbor_value_is_integer(value) && (value->flags & CborIteratorFlag_NegativeInteger); }

CBOR_INLINE_API CborError cbor_value_get_raw_integer(const CborValue *value, uint64_t *result)
{
    assert(cbor_value_is_integer(value));
    *result = _cbor_value_extract_int64_helper(value);
    return CborNoError;
}

CBOR_INLINE_API CborError cbor_value_get_uint64(const CborValue *value, uint64_t *result)
{
    assert(cbor_value_is_unsigned_integer(value));
    *result = _cbor_value_extract_int64_helper(value);
    return CborNoError;
}

CBOR_INLINE_API CborError cbor_value_get_int64(const CborValue *value, int64_t *result)
{
    assert(cbor_value_is_integer(value));
    *result = (int64_t) _cbor_value_extract_int64_helper(value);
    if (value->flags & CborIteratorFlag_NegativeInteger)
        *result = -*result - 1;
    return CborNoError;
}

CBOR_INLINE_API CborError cbor_value_get_int(const CborValue *value, int *result)
{
    assert(cbor_value_is_integer(value));
    *result = (int) _cbor_value_extract_int64_helper(value);
    if (value->flags & CborIteratorFlag_NegativeInteger)
        *result = -*result - 1;
    return CborNoError;
}

CBOR_API CborError cbor_value_get_int64_checked(const CborValue *value, int64_t *result);
CBOR_API CborError cbor_value_get_int_checked(const CborValue *value, int *result);

CBOR_INLINE_API bool cbor_value_is_length_known(const CborValue *value)
{ return (value->flags & CborIteratorFlag_UnknownLength) == 0; }

/* Tags */
CBOR_INLINE_API bool cbor_value_is_tag(const CborValue *value)
{ return value->type == CborTagType; }
CBOR_INLINE_API CborError cbor_value_get_tag(const CborValue *value, CborTag *result)
{
    assert(cbor_value_is_tag(value));
    *result = _cbor_value_extract_int64_helper(value);
    return CborNoError;
}
CBOR_API CborError cbor_value_skip_tag(CborValue *it);

/* Strings */
CBOR_INLINE_API bool cbor_value_is_byte_string(const CborValue *value)
{ return value->type == CborByteStringType; }
CBOR_INLINE_API bool cbor_value_is_text_string(const CborValue *value)
{ return value->type == CborTextStringType; }

CBOR_INLINE_API CborError cbor_value_get_string_length(const CborValue *value, size_t *length)
{
    assert(cbor_value_is_byte_string(value) || cbor_value_is_text_string(value));
    if (!cbor_value_is_length_known(value))
        return CborErrorUnknownLength;
    uint64_t v = _cbor_value_extract_int64_helper(value);
    *length = v;
    if (*length != v)
        return CborErrorDataTooLarge;
    return CborNoError;
}

CBOR_PRIVATE_API CborError _cbor_value_copy_string(const CborValue *value, void *buffer,
                                                   size_t *buflen, CborValue *next);
CBOR_PRIVATE_API CborError _cbor_value_dup_string(const CborValue *value, void **buffer,
                                                  size_t *buflen, CborValue *next);

CBOR_API CborError cbor_value_calculate_string_length(const CborValue *value, size_t *length);

CBOR_INLINE_API CborError cbor_value_copy_text_string(const CborValue *value, char *buffer,
                                                      size_t *buflen, CborValue *next)
{
    assert(cbor_value_is_text_string(value));
    return _cbor_value_copy_string(value, buffer, buflen, next);
}
CBOR_INLINE_API CborError cbor_value_copy_byte_string(const CborValue *value, uint8_t *buffer,
                                                      size_t *buflen, CborValue *next)
{
    assert(cbor_value_is_byte_string(value));
    return _cbor_value_copy_string(value, buffer, buflen, next);
}

CBOR_INLINE_API CborError cbor_value_dup_text_string(const CborValue *value, char **buffer,
                                                     size_t *buflen, CborValue *next)
{
    assert(cbor_value_is_text_string(value));
    return _cbor_value_dup_string(value, (void **)buffer, buflen, next);
}
CBOR_INLINE_API CborError cbor_value_dup_byte_string(const CborValue *value, uint8_t **buffer,
                                                     size_t *buflen, CborValue *next)
{
    assert(cbor_value_is_byte_string(value));
    return _cbor_value_dup_string(value, (void **)buffer, buflen, next);
}

/* ### TBD: partial reading API */

CBOR_API CborError cbor_value_text_string_equals(const CborValue *value, const char *string, bool *result);

/* Maps and arrays */
CBOR_INLINE_API bool cbor_value_is_array(const CborValue *value)
{ return value->type == CborArrayType; }
CBOR_INLINE_API bool cbor_value_is_map(const CborValue *value)
{ return value->type == CborMapType; }

CBOR_INLINE_API CborError cbor_value_get_array_length(const CborValue *value, size_t *length)
{
    assert(cbor_value_is_array(value));
    if (!cbor_value_is_length_known(value))
        return CborErrorUnknownLength;
    uint64_t v = _cbor_value_extract_int64_helper(value);
    *length = v;
    if (*length != v)
        return CborErrorDataTooLarge;
    return CborNoError;
}

CBOR_INLINE_API CborError cbor_value_get_map_length(const CborValue *value, size_t *length)
{
    assert(cbor_value_is_map(value));
    if (!cbor_value_is_length_known(value))
        return CborErrorUnknownLength;
    uint64_t v = _cbor_value_extract_int64_helper(value);
    *length = v;
    if (*length != v)
        return CborErrorDataTooLarge;
    return CborNoError;
}

CBOR_API CborError cbor_value_map_find_value(const CborValue *map, const char *string, CborValue *element);

/* Floating point */
CBOR_INLINE_API bool cbor_value_is_half_float(const CborValue *value)
{ return value->type == CborHalfFloatType; }
CBOR_API CborError cbor_value_get_half_float(const CborValue *value, void *result);

CBOR_INLINE_API bool cbor_value_is_float(const CborValue *value)
{ return value->type == CborFloatType; }
CBOR_INLINE_API CborError cbor_value_get_float(const CborValue *value, float *result)
{
    assert(cbor_value_is_float(value));
    assert(value->flags & CborIteratorFlag_IntegerValueTooLarge);
    uint32_t data = (uint32_t)_cbor_value_decode_int64_internal(value);
    memcpy(result, &data, sizeof(*result));
    return CborNoError;
}

CBOR_INLINE_API bool cbor_value_is_double(const CborValue *value)
{ return value->type == CborDoubleType; }
CBOR_INLINE_API CborError cbor_value_get_double(const CborValue *value, double *result)
{
    assert(cbor_value_is_double(value));
    assert(value->flags & CborIteratorFlag_IntegerValueTooLarge);
    uint64_t data = _cbor_value_decode_int64_internal(value);
    memcpy(result, &data, sizeof(*result));
    return CborNoError;
}

/* Human-readable (dump) API */
CBOR_API CborError cbor_value_to_pretty_advance(FILE *out, CborValue *value);
CBOR_INLINE_API CborError cbor_value_to_pretty(FILE *out, const CborValue *value)
{
    CborValue copy = *value;
    return cbor_value_to_pretty_advance(out, &copy);
}

struct mgmt_cbuf {
    struct CborParser  parser;
    struct CborEncoder encoder;
    struct CborValue   it;
};


////

#undef assert
#define assert(x) ((x) ? (void)0 : OS_CRASH())

#undef CBOR_INLINE
#undef CBOR_INLINE_API

#define CBOR_INLINE
#define CBOR_INLINE_API

#undef cbor_encode_text_stringz
#undef cbor_encode_bytes_written
#undef cbor_encode_boolean
#undef cbor_encode_null
#undef cbor_encode_undefined
#undef cbor_encode_half_float
#undef cbor_encode_float
#undef cbor_encode_double
#undef cbor_value_at_end
#undef cbor_value_is_container
#undef _cbor_value_extract_int64_helper
#undef cbor_value_is_valid
#undef cbor_value_get_type
#undef cbor_value_is_null
#undef cbor_value_is_undefined
#undef cbor_value_is_boolean
#undef cbor_value_get_boolean
#undef cbor_value_is_simple_type
#undef cbor_value_get_simple_type
#undef cbor_value_is_integer
#undef cbor_value_is_unsigned_integer
#undef cbor_value_is_negative_integer
#undef cbor_value_get_raw_integer
#undef cbor_value_get_uint64
#undef cbor_value_get_int64
#undef cbor_value_get_int
#undef cbor_value_is_length_known
#undef cbor_value_is_tag
#undef cbor_value_get_tag
#undef cbor_value_is_byte_string
#undef cbor_value_is_text_string
#undef cbor_value_get_string_length
#undef cbor_value_copy_text_string
#undef cbor_value_copy_byte_string
#undef cbor_value_dup_text_string
#undef cbor_value_dup_byte_string
#undef cbor_value_is_array
#undef cbor_value_is_map
#undef cbor_value_get_array_length
#undef cbor_value_get_map_length
#undef cbor_value_is_half_float
#undef cbor_value_is_float
#undef cbor_value_get_float
#undef cbor_value_is_double
#undef cbor_value_get_double
#undef cbor_value_to_pretty

CBOR_INLINE_API CborError cbor_encode_text_stringz(CborEncoder *encoder, const char *string);
CBOR_INLINE_API CborError cbor_encode_bytes_written(CborEncoder *encoder);
CBOR_INLINE_API CborError cbor_encode_boolean(CborEncoder *encoder, bool value);
CBOR_INLINE_API CborError cbor_encode_null(CborEncoder *encoder);
CBOR_INLINE_API CborError cbor_encode_undefined(CborEncoder *encoder);
CBOR_INLINE_API CborError cbor_encode_half_float(CborEncoder *encoder, const void *value);
CBOR_INLINE_API CborError cbor_encode_float(CborEncoder *encoder, float value);
CBOR_INLINE_API CborError cbor_encode_double(CborEncoder *encoder, double value);
CBOR_INLINE_API bool cbor_value_at_end(const CborValue *it);
CBOR_INLINE_API bool cbor_value_is_container(const CborValue *it);
CBOR_INLINE_API uint64_t _cbor_value_extract_int64_helper(const CborValue *value);
CBOR_INLINE_API bool cbor_value_is_valid(const CborValue *value);
CBOR_INLINE_API CborType cbor_value_get_type(const CborValue *value);
CBOR_INLINE_API bool cbor_value_is_null(const CborValue *value);
CBOR_INLINE_API bool cbor_value_is_undefined(const CborValue *value);
CBOR_INLINE_API bool cbor_value_is_boolean(const CborValue *value);
CBOR_INLINE_API CborError cbor_value_get_boolean(const CborValue *value, bool *result);
CBOR_INLINE_API bool cbor_value_is_simple_type(const CborValue *value);
CBOR_INLINE_API CborError cbor_value_get_simple_type(const CborValue *value, uint8_t *result);
CBOR_INLINE_API bool cbor_value_is_integer(const CborValue *value);
CBOR_INLINE_API bool cbor_value_is_unsigned_integer(const CborValue *value);
CBOR_INLINE_API bool cbor_value_is_negative_integer(const CborValue *value);
CBOR_INLINE_API CborError cbor_value_get_raw_integer(const CborValue *value, uint64_t *result);
CBOR_INLINE_API CborError cbor_value_get_uint64(const CborValue *value, uint64_t *result);
CBOR_INLINE_API CborError cbor_value_get_int64(const CborValue *value, int64_t *result);
CBOR_INLINE_API CborError cbor_value_get_int(const CborValue *value, int *result);
CBOR_INLINE_API bool cbor_value_is_length_known(const CborValue *value);
CBOR_INLINE_API bool cbor_value_is_tag(const CborValue *value);
CBOR_INLINE_API CborError cbor_value_get_tag(const CborValue *value, CborTag *result);
CBOR_INLINE_API bool cbor_value_is_byte_string(const CborValue *value);
CBOR_INLINE_API bool cbor_value_is_text_string(const CborValue *value);
CBOR_INLINE_API CborError cbor_value_get_string_length(const CborValue *value, size_t *length);
CBOR_INLINE_API CborError cbor_value_copy_text_string(const CborValue *value, char *buffer,
                                                      size_t *buflen, CborValue *next);
CBOR_INLINE_API CborError cbor_value_copy_byte_string(const CborValue *value, uint8_t *buffer,
                                                      size_t *buflen, CborValue *next);
CBOR_INLINE_API CborError cbor_value_dup_text_string(const CborValue *value, char **buffer,
                                                     size_t *buflen, CborValue *next);
CBOR_INLINE_API CborError cbor_value_dup_byte_string(const CborValue *value, uint8_t **buffer,
                                                     size_t *buflen, CborValue *next);
CBOR_INLINE_API bool cbor_value_is_array(const CborValue *value);
CBOR_INLINE_API bool cbor_value_is_map(const CborValue *value);
CBOR_INLINE_API CborError cbor_value_get_array_length(const CborValue *value, size_t *length);
CBOR_INLINE_API CborError cbor_value_get_map_length(const CborValue *value, size_t *length);
CBOR_INLINE_API bool cbor_value_is_half_float(const CborValue *value);
CBOR_INLINE_API bool cbor_value_is_float(const CborValue *value);
CBOR_INLINE_API CborError cbor_value_get_float(const CborValue *value, float *result);
CBOR_INLINE_API bool cbor_value_is_double(const CborValue *value);
CBOR_INLINE_API CborError cbor_value_get_double(const CborValue *value, double *result);
CBOR_INLINE_API CborError cbor_value_to_pretty(FILE *out, const CborValue *value);
////


#ifdef __cplusplus
}
#endif

#endif /* CBOR_H */

