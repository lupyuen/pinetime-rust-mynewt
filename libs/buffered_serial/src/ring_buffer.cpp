
/**
 * @file    Buffer.cpp
 * @brief   Software Buffer - Templated Ring Buffer for most data types
 * @author  sam grove
 * @version 1.0
 * @see     
 *
 * Copyright (c) 2013
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
#include "buffered_serial/ring_buffer.h"

template <class T>
void RingBuffer<T>::init(T *buffer, uint32_t size)
{
    _buf = buffer;
    _size = size;
    clear();    
}

template <class T>
uint32_t RingBuffer<T>::getSize() 
{ 
    return this->_size; 
}

template <class T>
void RingBuffer<T>::clear(void)
{
    _wloc = 0;
    _rloc = 0;
    memset(_buf, 0, _size);
    
    return;
}

template <class T>
uint32_t RingBuffer<T>::peek(char c)
{
    return 1;
}

// make the linker aware of some possible types
template class RingBuffer<uint8_t>;
template class RingBuffer<int8_t>;
template class RingBuffer<uint16_t>;
template class RingBuffer<int16_t>;
template class RingBuffer<uint32_t>;
template class RingBuffer<int32_t>;
template class RingBuffer<uint64_t>;
template class RingBuffer<int64_t>;
template class RingBuffer<char>;
template class RingBuffer<wchar_t>;
