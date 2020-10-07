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
//! Contains the Mynewt Sensor Manager API for Rust, including the safe version of the API.

use crate::{
    hw::sensor::{
        mgr_find_next_bydevname,
        sensor_ptr,
    },
    Strn,
};

/// Returns an iterator of sensors that match the device name `devname`
pub fn find_bydevname(devname: &Strn) -> SensorsByDevname {
    SensorsByDevname { 
        devname: *devname,
        previous: core::ptr::null_mut()
    }
    // MynewtResult<*mut sensor>
}

/// Implement the iterator for finding a sensor by device name
impl Iterator for SensorsByDevname {
    /// Iterator returns a pointer to a sensor
    type Item = sensor_ptr;

    /// Return the next sensor that matches the device name    
    fn next(&mut self) -> Option<sensor_ptr> {
        //  Based on last iteration, find the next sensor with matching device name.
        let sensor = mgr_find_next_bydevname(&self.devname, self.previous)
            .expect("find sensor");
        if sensor.is_null() { None }  //  If sensor not found, return None
        else {
            //  If sensor found, remember this sensor for next iteration.
            self.previous = sensor;
            Some(sensor)  //  Return the sensor
        }
    }
}

/// State for iterating sensors by device name
pub struct SensorsByDevname {
    /// Device name of the sensor
    devname: Strn,
    /// Last sensor that was returned
    previous: sensor_ptr,
}