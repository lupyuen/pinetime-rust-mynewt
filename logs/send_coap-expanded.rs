    use cstr_core::CStr;
    use crate::base::*;
    use crate::sensor::*;
    fn send_sensor_data_without_encoding() {
        ();
        "r#a b c";
        ();
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        ();
        let payload =
            {
                "begin none root";
                let root = "root";
                ">> \"device\" >> : device_id , \"node\" : node_id , int_sensor_value ,";
                "TODO : add key : \"device\" , value : parse!(@ none device_id) , to object :\nroot";
                ">> \"node\" >> : node_id , int_sensor_value ,";
                "TODO : add key : \"node\" , value : parse!(@ none node_id) , to object : root";
                ">> int_sensor_value >> ,";
                "TODO : Extract ( key , value ) from _sensor_value : int_sensor_value and add\nto _object : root";
                "--------------------";
                "end none root";
                "return none root to caller";
                root
            };
        ();
    }
    fn send_sensor_data_json() {
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        let payload =
            {
                "begin json root";
                let root = "root";
                {
                    "begin coap_root";
                    {
                        "begin oc_rep_start_root_object";
                        cbor_encoder_create_map(&g_encoder, &root_map,
                                                CborIndefiniteLength);
                        "end oc_rep_start_root_object";
                    };
                    {
                        let values = "values";
                        {
                            "begin coap_array _object0 : root _key0 : values";
                            {
                                "begin oc_rep_set_array , object: root, key: values, child: root_map";
                                cbor_encode_text_string(root_map, values,
                                                        values.len());
                                {
                                    "begin oc_rep_start_array , parent: root_map, key: values, child: values_array";
                                    values_array = CborEncoder{};
                                    cbor_encoder_create_array(&root_map,
                                                              &values_array,
                                                              CborIndefiniteLength);
                                    "end oc_rep_start_array";
                                };
                                "end oc_rep_set_array";
                            };
                            {
                                ">> \"device\" >> : device_id , \"node\" : node_id , int_sensor_value ,";
                                "add1 key : \"device\" value : parse!(@ json device_id) to object : values";
                                {
                                    "begin coap_item_str _parent : values _key : \"device\" _val :\nparse!(@ json device_id)";
                                    {
                                        "begin coap_item array : values";
                                        {
                                            "begin oc_rep_object_array_start_item , key: values, child: values_array";
                                            {
                                                "begin oc_rep_start_object , parent: values_array, key: values, child: values_map";
                                                values_map = CborEncoder{};
                                                cbor_encoder_create_map(&values,
                                                                        &values_map,
                                                                        CborIndefiniteLength);
                                                "end oc_rep_start_object";
                                            };
                                            "end oc_rep_object_array_start_item";
                                        };
                                        {
                                            {
                                                "begin oc_rep_set_text_string , object: values, key: \"key\", value: \"device\", child: values_map";
                                                cbor_encode_text_string(&values_map,
                                                                        "key",
                                                                        "key".len());
                                                cbor_encode_text_string(&values_map,
                                                                        "device",
                                                                        "device".len());
                                                "end oc_rep_set_text_string";
                                            };
                                            {
                                                "begin oc_rep_set_text_string , object: values, key: \"value\", value: parse!(@ json device_id), child: values_map";
                                                cbor_encode_text_string(&values_map,
                                                                        "value",
                                                                        "value".len());
                                                cbor_encode_text_string(&values_map,
                                                                        device_id,
                                                                        device_id.len());
                                                "end oc_rep_set_text_string";
                                            };
                                        };
                                        {
                                            "begin oc_rep_object_array_end_item , key: values, child: values_array";
                                            (/*ERROR*/);
                                            "end oc_rep_object_array_end_item";
                                        };
                                        "end coap_item";
                                    };
                                    "end coap_item_str";
                                };
                                "--------------------";
                                ">> \"node\" >> : node_id , int_sensor_value ,";
                                "add1 key : \"node\" value : parse!(@ json node_id) to object : values";
                                {
                                    "begin coap_item_str _parent : values _key : \"node\" _val :\nparse!(@ json node_id)";
                                    {
                                        "begin coap_item array : values";
                                        {
                                            "begin oc_rep_object_array_start_item , key: values, child: values_array";
                                            {
                                                "begin oc_rep_start_object , parent: values_array, key: values, child: values_map";
                                                values_map = CborEncoder{};
                                                cbor_encoder_create_map(&values,
                                                                        &values_map,
                                                                        CborIndefiniteLength);
                                                "end oc_rep_start_object";
                                            };
                                            "end oc_rep_object_array_start_item";
                                        };
                                        {
                                            {
                                                "begin oc_rep_set_text_string , object: values, key: \"key\", value: \"node\", child: values_map";
                                                cbor_encode_text_string(&values_map,
                                                                        "key",
                                                                        "key".len());
                                                cbor_encode_text_string(&values_map,
                                                                        "node",
                                                                        "node".len());
                                                "end oc_rep_set_text_string";
                                            };
                                            {
                                                "begin oc_rep_set_text_string , object: values, key: \"value\", value: parse!(@ json node_id), child: values_map";
                                                cbor_encode_text_string(&values_map,
                                                                        "value",
                                                                        "value".len());
                                                cbor_encode_text_string(&values_map,
                                                                        node_id,
                                                                        node_id.len());
                                                "end oc_rep_set_text_string";
                                            };
                                        };
                                        {
                                            "begin oc_rep_object_array_end_item , key: values, child: values_array";
                                            (/*ERROR*/);
                                            "end oc_rep_object_array_end_item";
                                        };
                                        "end coap_item";
                                    };
                                    "end coap_item_str";
                                };
                                "--------------------";
                                ">> int_sensor_value >> ,";
                                "TODO : Extract ( key , value ) from _sensor_value : int_sensor_value and add\nto _object : values";
                                "--------------------";
                                {
                                    "begin coap_item_int_val , parent : values , val : int_sensor_value";
                                    "> TODO : assert ( int_sensor_value . val_type == SENSOR_VALUE_TYPE_INT32 )";
                                    "> TODO : coap_item_int (\nvalues , int_sensor_value . key , int_sensor_value . int_val )";
                                    {
                                        "begin coap_item_int , key : int_sensor_value.key , value : 1234";
                                        {
                                            "begin coap_item array : values";
                                            {
                                                "begin oc_rep_object_array_start_item , key: values, child: values_array";
                                                {
                                                    "begin oc_rep_start_object , parent: values_array, key: values, child: values_map";
                                                    values_map =
                                                        CborEncoder{};
                                                    cbor_encoder_create_map(&values,
                                                                            &values_map,
                                                                            CborIndefiniteLength);
                                                    "end oc_rep_start_object";
                                                };
                                                "end oc_rep_object_array_start_item";
                                            };
                                            {
                                                {
                                                    "begin oc_rep_set_text_string , object: values, key: \"key\", value: int_sensor_value.key, child: values_map";
                                                    cbor_encode_text_string(&values_map,
                                                                            "key",
                                                                            "key".len());
                                                    cbor_encode_text_string(&values_map,
                                                                            int_sensor_value.key,
                                                                            int_sensor_value.key.len());
                                                    "end oc_rep_set_text_string";
                                                };
                                                {
                                                    "begin oc_rep_set_int , object: values, key: \"value\", value: 1234, child: values_map";
                                                    cbor_encode_text_string(&values_map,
                                                                            "value",
                                                                            "value".len());
                                                    cbor_encode_int(&values_map,
                                                                    value);
                                                    "end oc_rep_set_int";
                                                };
                                            };
                                            {
                                                "begin oc_rep_object_array_end_item , key: values, child: values_array";
                                                (/*ERROR*/);
                                                "end oc_rep_object_array_end_item";
                                            };
                                            "end coap_item";
                                        };
                                        "end coap_item_int";
                                    };
                                    "end coap_item_int_val";
                                };
                                "--------------------";
                            };
                            {
                                "begin oc_rep_close_array , object: root, key: values, child: root_map";
                                {
                                    "begin oc_rep_end_array , parent: root_map, key: values, child: values_array";
                                    "> TODO: g_err |= cbor_encoder_close_container(&root_map, &values_array);";
                                    "end oc_rep_end_array";
                                };
                                "end oc_rep_close_array";
                            };
                            "end coap_array";
                        };
                    };
                    {
                        "begin oc_rep_end_root_object";
                        "> TODO : g_err |= cbor_encoder_close_container ( & g_encoder , & root_map )";
                        "end oc_rep_end_root_object";
                    };
                    "end coap_root";
                };
                "end json root";
                "return json root to caller";
                root
            };
    }
    fn send_sensor_data_cbor() {
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        let payload =
            {
                "begin cbor root";
                let root = "root";
                {
                    "begin coap_root";
                    {
                        "begin oc_rep_start_root_object";
                        cbor_encoder_create_map(&g_encoder, &root_map,
                                                CborIndefiniteLength);
                        "end oc_rep_start_root_object";
                    };
                    {
                        ">> int_sensor_value >> ,";
                        "TODO : Extract ( key , value ) from _sensor_value : int_sensor_value and add\nto _object : root";
                        "--------------------";
                        {
                            "begin coap_set_int_val , parent : root , val : int_sensor_value";
                            "> TODO : assert ( int_sensor_value . val_type == SENSOR_VALUE_TYPE_INT32 )";
                            {
                                "begin oc_rep_set_int_k , object: root, key: int_sensor_value.key, value: 1234, child: root_map";
                                "> TODO: g_err |= cbor_encode_text_string(&root_map, int_sensor_value.key, strlen(int_sensor_value.key));";
                                "> TODO: g_err |= cbor_encode_int(&root_map, 1234);";
                                "end oc_rep_set_int_k";
                            };
                            "end coap_set_int_val";
                        };
                        "--------------------";
                    };
                    {
                        "begin oc_rep_end_root_object";
                        "> TODO : g_err |= cbor_encoder_close_container ( & g_encoder , & root_map )";
                        "end oc_rep_end_root_object";
                    };
                    "end coap_root";
                };
                "end cbor root";
                "return cbor root to caller";
                root
            };
        let float_sensor_value =
            SensorValueNew{key: "tmp", val: SensorValueType::Float(28.70),};
    }
    fn test_macro2() {
        let root = "root_var";
        let values = "values_var";
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        {
            "begin coap_item_str _parent : values _key : \"device\" _val : device_id";
            {
                "begin coap_item array : values";
                {
                    "begin oc_rep_object_array_start_item , key: values, child: values_array";
                    {
                        "begin oc_rep_start_object , parent: values_array, key: values, child: values_map";
                        values_map = CborEncoder{};
                        cbor_encoder_create_map(&values, &values_map,
                                                CborIndefiniteLength);
                        "end oc_rep_start_object";
                    };
                    "end oc_rep_object_array_start_item";
                };
                {
                    {
                        "begin oc_rep_set_text_string , object: values, key: \"key\", value: \"device\", child: values_map";
                        cbor_encode_text_string(&values_map, "key",
                                                "key".len());
                        cbor_encode_text_string(&values_map, "device",
                                                "device".len());
                        "end oc_rep_set_text_string";
                    };
                    {
                        "begin oc_rep_set_text_string , object: values, key: \"value\", value: device_id, child: values_map";
                        cbor_encode_text_string(&values_map, "value",
                                                "value".len());
                        cbor_encode_text_string(&values_map, device_id,
                                                device_id.len());
                        "end oc_rep_set_text_string";
                    };
                };
                {
                    "begin oc_rep_object_array_end_item , key: values, child: values_array";
                    (/*ERROR*/);
                    "end oc_rep_object_array_end_item";
                };
                "end coap_item";
            };
            "end coap_item_str";
        };
        {
            "begin coap_array _object0 : root _key0 : values";
            {
                "begin oc_rep_set_array , object: root, key: values, child: root_map";
                cbor_encode_text_string(root_map, values, values.len());
                {
                    "begin oc_rep_start_array , parent: root_map, key: values, child: values_array";
                    values_array = CborEncoder{};
                    cbor_encoder_create_array(&root_map, &values_array,
                                              CborIndefiniteLength);
                    "end oc_rep_start_array";
                };
                "end oc_rep_set_array";
            };
            {
                {
                    "begin coap_item_str _parent : values _key : \"device\" _val : device_id";
                    {
                        "begin coap_item array : values";
                        {
                            "begin oc_rep_object_array_start_item , key: values, child: values_array";
                            {
                                "begin oc_rep_start_object , parent: values_array, key: values, child: values_map";
                                values_map = CborEncoder{};
                                cbor_encoder_create_map(&values, &values_map,
                                                        CborIndefiniteLength);
                                "end oc_rep_start_object";
                            };
                            "end oc_rep_object_array_start_item";
                        };
                        {
                            {
                                "begin oc_rep_set_text_string , object: values, key: \"key\", value: \"device\", child: values_map";
                                cbor_encode_text_string(&values_map, "key",
                                                        "key".len());
                                cbor_encode_text_string(&values_map, "device",
                                                        "device".len());
                                "end oc_rep_set_text_string";
                            };
                            {
                                "begin oc_rep_set_text_string , object: values, key: \"value\", value: device_id, child: values_map";
                                cbor_encode_text_string(&values_map, "value",
                                                        "value".len());
                                cbor_encode_text_string(&values_map,
                                                        device_id,
                                                        device_id.len());
                                "end oc_rep_set_text_string";
                            };
                        };
                        {
                            "begin oc_rep_object_array_end_item , key: values, child: values_array";
                            (/*ERROR*/);
                            "end oc_rep_object_array_end_item";
                        };
                        "end coap_item";
                    };
                    "end coap_item_str";
                };
                {
                    "begin coap_item_str _parent : values _key : \"node\" _val : node_id";
                    {
                        "begin coap_item array : values";
                        {
                            "begin oc_rep_object_array_start_item , key: values, child: values_array";
                            {
                                "begin oc_rep_start_object , parent: values_array, key: values, child: values_map";
                                values_map = CborEncoder{};
                                cbor_encoder_create_map(&values, &values_map,
                                                        CborIndefiniteLength);
                                "end oc_rep_start_object";
                            };
                            "end oc_rep_object_array_start_item";
                        };
                        {
                            {
                                "begin oc_rep_set_text_string , object: values, key: \"key\", value: \"node\", child: values_map";
                                cbor_encode_text_string(&values_map, "key",
                                                        "key".len());
                                cbor_encode_text_string(&values_map, "node",
                                                        "node".len());
                                "end oc_rep_set_text_string";
                            };
                            {
                                "begin oc_rep_set_text_string , object: values, key: \"value\", value: node_id, child: values_map";
                                cbor_encode_text_string(&values_map, "value",
                                                        "value".len());
                                cbor_encode_text_string(&values_map, node_id,
                                                        node_id.len());
                                "end oc_rep_set_text_string";
                            };
                        };
                        {
                            "begin oc_rep_object_array_end_item , key: values, child: values_array";
                            (/*ERROR*/);
                            "end oc_rep_object_array_end_item";
                        };
                        "end coap_item";
                    };
                    "end coap_item_str";
                };
            };
            {
                "begin oc_rep_close_array , object: root, key: values, child: root_map";
                {
                    "begin oc_rep_end_array , parent: root_map, key: values, child: values_array";
                    "> TODO: g_err |= cbor_encoder_close_container(&root_map, &values_array);";
                    "end oc_rep_end_array";
                };
                "end oc_rep_close_array";
            };
            "end coap_array";
        };
        let payload =
            {
                "begin coap_root";
                {
                    "begin oc_rep_start_root_object";
                    cbor_encoder_create_map(&g_encoder, &root_map,
                                            CborIndefiniteLength);
                    "end oc_rep_start_root_object";
                };
                {
                    {
                        "begin coap_array _object0 : root _key0 : values";
                        {
                            "begin oc_rep_set_array , object: root, key: values, child: root_map";
                            cbor_encode_text_string(root_map, values,
                                                    values.len());
                            {
                                "begin oc_rep_start_array , parent: root_map, key: values, child: values_array";
                                values_array = CborEncoder{};
                                cbor_encoder_create_array(&root_map,
                                                          &values_array,
                                                          CborIndefiniteLength);
                                "end oc_rep_start_array";
                            };
                            "end oc_rep_set_array";
                        };
                        {
                            {
                                "begin coap_item_str _parent : values _key : \"device\" _val : device_id";
                                {
                                    "begin coap_item array : values";
                                    {
                                        "begin oc_rep_object_array_start_item , key: values, child: values_array";
                                        {
                                            "begin oc_rep_start_object , parent: values_array, key: values, child: values_map";
                                            values_map = CborEncoder{};
                                            cbor_encoder_create_map(&values,
                                                                    &values_map,
                                                                    CborIndefiniteLength);
                                            "end oc_rep_start_object";
                                        };
                                        "end oc_rep_object_array_start_item";
                                    };
                                    {
                                        {
                                            "begin oc_rep_set_text_string , object: values, key: \"key\", value: \"device\", child: values_map";
                                            cbor_encode_text_string(&values_map,
                                                                    "key",
                                                                    "key".len());
                                            cbor_encode_text_string(&values_map,
                                                                    "device",
                                                                    "device".len());
                                            "end oc_rep_set_text_string";
                                        };
                                        {
                                            "begin oc_rep_set_text_string , object: values, key: \"value\", value: device_id, child: values_map";
                                            cbor_encode_text_string(&values_map,
                                                                    "value",
                                                                    "value".len());
                                            cbor_encode_text_string(&values_map,
                                                                    device_id,
                                                                    device_id.len());
                                            "end oc_rep_set_text_string";
                                        };
                                    };
                                    {
                                        "begin oc_rep_object_array_end_item , key: values, child: values_array";
                                        (/*ERROR*/);
                                        "end oc_rep_object_array_end_item";
                                    };
                                    "end coap_item";
                                };
                                "end coap_item_str";
                            };
                            {
                                "begin coap_item_str _parent : values _key : \"node\" _val : node_id";
                                {
                                    "begin coap_item array : values";
                                    {
                                        "begin oc_rep_object_array_start_item , key: values, child: values_array";
                                        {
                                            "begin oc_rep_start_object , parent: values_array, key: values, child: values_map";
                                            values_map = CborEncoder{};
                                            cbor_encoder_create_map(&values,
                                                                    &values_map,
                                                                    CborIndefiniteLength);
                                            "end oc_rep_start_object";
                                        };
                                        "end oc_rep_object_array_start_item";
                                    };
                                    {
                                        {
                                            "begin oc_rep_set_text_string , object: values, key: \"key\", value: \"node\", child: values_map";
                                            cbor_encode_text_string(&values_map,
                                                                    "key",
                                                                    "key".len());
                                            cbor_encode_text_string(&values_map,
                                                                    "node",
                                                                    "node".len());
                                            "end oc_rep_set_text_string";
                                        };
                                        {
                                            "begin oc_rep_set_text_string , object: values, key: \"value\", value: node_id, child: values_map";
                                            cbor_encode_text_string(&values_map,
                                                                    "value",
                                                                    "value".len());
                                            cbor_encode_text_string(&values_map,
                                                                    node_id,
                                                                    node_id.len());
                                            "end oc_rep_set_text_string";
                                        };
                                    };
                                    {
                                        "begin oc_rep_object_array_end_item , key: values, child: values_array";
                                        (/*ERROR*/);
                                        "end oc_rep_object_array_end_item";
                                    };
                                    "end coap_item";
                                };
                                "end coap_item_str";
                            };
                            {
                                "begin coap_set_int_val , parent : root , val : int_sensor_value";
                                "> TODO : assert ( int_sensor_value . val_type == SENSOR_VALUE_TYPE_INT32 )";
                                {
                                    "begin oc_rep_set_int_k , object: root, key: int_sensor_value.key, value: 1234, child: root_map";
                                    "> TODO: g_err |= cbor_encode_text_string(&root_map, int_sensor_value.key, strlen(int_sensor_value.key));";
                                    "> TODO: g_err |= cbor_encode_int(&root_map, 1234);";
                                    "end oc_rep_set_int_k";
                                };
                                "end coap_set_int_val";
                            };
                        };
                        {
                            "begin oc_rep_close_array , object: root, key: values, child: root_map";
                            {
                                "begin oc_rep_end_array , parent: root_map, key: values, child: values_array";
                                "> TODO: g_err |= cbor_encoder_close_container(&root_map, &values_array);";
                                "end oc_rep_end_array";
                            };
                            "end oc_rep_close_array";
                        };
                        "end coap_array";
                    }
                };
                {
                    "begin oc_rep_end_root_object";
                    "> TODO : g_err |= cbor_encoder_close_container ( & g_encoder , & root_map )";
                    "end oc_rep_end_root_object";
                };
                "end coap_root";
            };
    }
    ///  TODO: Start the Network Task in the background.  The Network Task prepares the network drivers
    ///  (ESP8266 and nRF24L01) for transmitting sensor data messages.  
    ///  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
    ///  Also perform WiFi Geolocation if it is enabled.  Return 0 if successful.
    pub fn start_network_task() -> Result<(), i32> {
        console_print(b"start_network_task\n");
        send_sensor_data_without_encoding();
        send_sensor_data_json();
        send_sensor_data_cbor();
        Ok(())
    }
    ///  TODO: Compose a CoAP message (CBOR or JSON) with the sensor value in `val` and transmit to the
    ///  Collector Node (if this is a Sensor Node) or to the CoAP Server (if this is a Collector Node
    ///  or Standalone Node).  
    ///  For Sensor Node or Standalone Node: sensor_node is the sensor name (`bme280_0` or `temp_stm32_0`)
    ///  For Collector Node: sensor_node is the Sensor Node Address of the Sensor Node that transmitted
    ///  the sensor data (like `b3b4b5b6f1`)
    ///  The message will be enqueued for transmission by the CoAP / OIC Background Task 
    ///  so this function will return without waiting for the message to be transmitted.  
    ///  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
    pub fn send_sensor_data(_val: *const SensorValue,
                            _sensor_node: &'static CStr) -> i32 {
        console_print(b"send_sensor_data\n");
        0
    }
}
use core::panic::PanicInfo;
use cortex_m::asm::bkpt;
use crate::base::*;
use crate::listen_sensor::*;
use crate::send_coap::*;
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]
pub extern "C" fn main() -> ! {
    unsafe { rust_sysinit() };
    unsafe { console_flush() };
    let rc = start_network_task();
    rc.expect("");
    let rc = start_sensor_listener();
    if !(rc == 0) {
        {
            ::core::panicking::panic(&("assertion failed: rc == 0",
                                       "src/lib.rs", 41u32, 40u32))
        }
    };
    loop  { unsafe { os_eventq_run(os_eventq_dflt_get()) } }
}
///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    if let Some(location) = info.location() {
        let file = location.file();
        let line = location.line();
        console_print(b"panic at ");
        unsafe { console_buffer(file.as_ptr(), file.len() as u32) }
        console_print(b" line 0x");
        unsafe { console_printhex(line as u8) }
        console_print(b"\n");
        unsafe { console_flush() }
    } else {
        console_print(b"panic unknown loc\n");
        unsafe { console_flush() }
    }
    bkpt();
    loop  { }
}
