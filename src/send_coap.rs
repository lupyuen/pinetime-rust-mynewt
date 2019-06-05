use crate::base::*;
use cstr_core::CStr;

pub fn start_network_task() -> i32 {
    console_print(b"start_network_task\n");
    0
}

pub fn send_sensor_data(val: *const SensorValue, sensor_node: &'static CStr) -> i32 {
    console_print(b"send_sensor_data\n");
    0
}
