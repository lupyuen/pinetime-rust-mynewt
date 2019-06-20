# 1 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c"
# 1 "/mnt/c/stm32bluepill-mynewt-sensor//"
# 1 "<built-in>"
#define __STDC__ 1
#define __STDC_VERSION__ 201710L
#define __STDC_UTF_16__ 1
#define __STDC_UTF_32__ 1
#define __STDC_HOSTED__ 1
#define __GNUC__ 8
#define __GNUC_MINOR__ 2
#define __GNUC_PATCHLEVEL__ 1
#define __VERSION__ "8.2.1 20181213 (release) [gcc-8-branch revision 267074]"
#define __ATOMIC_RELAXED 0
#define __ATOMIC_SEQ_CST 5
#define __ATOMIC_ACQUIRE 2
#define __ATOMIC_RELEASE 3
#define __ATOMIC_ACQ_REL 4
#define __ATOMIC_CONSUME 1
#define __OPTIMIZE_SIZE__ 1
#define __OPTIMIZE__ 1
#define __FINITE_MATH_ONLY__ 0
#define __SIZEOF_INT__ 4
#define __SIZEOF_LONG__ 4
#define __SIZEOF_LONG_LONG__ 8
#define __SIZEOF_SHORT__ 2
#define __SIZEOF_FLOAT__ 4
#define __SIZEOF_DOUBLE__ 8
#define __SIZEOF_LONG_DOUBLE__ 8
#define __SIZEOF_SIZE_T__ 4
#define __CHAR_BIT__ 8
#define __BIGGEST_ALIGNMENT__ 8
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __ORDER_BIG_ENDIAN__ 4321
#define __ORDER_PDP_ENDIAN__ 3412
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __SIZEOF_POINTER__ 4
#define __SIZE_TYPE__ unsigned int
#define __PTRDIFF_TYPE__ int
#define __WCHAR_TYPE__ unsigned int
#define __WINT_TYPE__ unsigned int
#define __INTMAX_TYPE__ long long int
#define __UINTMAX_TYPE__ long long unsigned int
#define __CHAR16_TYPE__ short unsigned int
#define __CHAR32_TYPE__ long unsigned int
#define __SIG_ATOMIC_TYPE__ int
#define __INT8_TYPE__ signed char
#define __INT16_TYPE__ short int
#define __INT32_TYPE__ long int
#define __INT64_TYPE__ long long int
#define __UINT8_TYPE__ unsigned char
#define __UINT16_TYPE__ short unsigned int
#define __UINT32_TYPE__ long unsigned int
#define __UINT64_TYPE__ long long unsigned int
#define __INT_LEAST8_TYPE__ signed char
#define __INT_LEAST16_TYPE__ short int
#define __INT_LEAST32_TYPE__ long int
#define __INT_LEAST64_TYPE__ long long int
#define __UINT_LEAST8_TYPE__ unsigned char
#define __UINT_LEAST16_TYPE__ short unsigned int
#define __UINT_LEAST32_TYPE__ long unsigned int
#define __UINT_LEAST64_TYPE__ long long unsigned int
#define __INT_FAST8_TYPE__ int
#define __INT_FAST16_TYPE__ int
#define __INT_FAST32_TYPE__ int
#define __INT_FAST64_TYPE__ long long int
#define __UINT_FAST8_TYPE__ unsigned int
#define __UINT_FAST16_TYPE__ unsigned int
#define __UINT_FAST32_TYPE__ unsigned int
#define __UINT_FAST64_TYPE__ long long unsigned int
#define __INTPTR_TYPE__ int
#define __UINTPTR_TYPE__ unsigned int
#define __has_include(STR) __has_include__(STR)
#define __has_include_next(STR) __has_include_next__(STR)
#define __GXX_ABI_VERSION 1013
#define __SCHAR_MAX__ 0x7f
#define __SHRT_MAX__ 0x7fff
#define __INT_MAX__ 0x7fffffff
#define __LONG_MAX__ 0x7fffffffL
#define __LONG_LONG_MAX__ 0x7fffffffffffffffLL
#define __WCHAR_MAX__ 0xffffffffU
#define __WCHAR_MIN__ 0U
#define __WINT_MAX__ 0xffffffffU
#define __WINT_MIN__ 0U
#define __PTRDIFF_MAX__ 0x7fffffff
#define __SIZE_MAX__ 0xffffffffU
#define __SCHAR_WIDTH__ 8
#define __SHRT_WIDTH__ 16
#define __INT_WIDTH__ 32
#define __LONG_WIDTH__ 32
#define __LONG_LONG_WIDTH__ 64
#define __WCHAR_WIDTH__ 32
#define __WINT_WIDTH__ 32
#define __PTRDIFF_WIDTH__ 32
#define __SIZE_WIDTH__ 32
#define __INTMAX_MAX__ 0x7fffffffffffffffLL
#define __INTMAX_C(c) c ## LL
#define __UINTMAX_MAX__ 0xffffffffffffffffULL
#define __UINTMAX_C(c) c ## ULL
#define __INTMAX_WIDTH__ 64
#define __SIG_ATOMIC_MAX__ 0x7fffffff
#define __SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)
#define __SIG_ATOMIC_WIDTH__ 32
#define __INT8_MAX__ 0x7f
#define __INT16_MAX__ 0x7fff
#define __INT32_MAX__ 0x7fffffffL
#define __INT64_MAX__ 0x7fffffffffffffffLL
#define __UINT8_MAX__ 0xff
#define __UINT16_MAX__ 0xffff
#define __UINT32_MAX__ 0xffffffffUL
#define __UINT64_MAX__ 0xffffffffffffffffULL
#define __INT_LEAST8_MAX__ 0x7f
#define __INT8_C(c) c
#define __INT_LEAST8_WIDTH__ 8
#define __INT_LEAST16_MAX__ 0x7fff
#define __INT16_C(c) c
#define __INT_LEAST16_WIDTH__ 16
#define __INT_LEAST32_MAX__ 0x7fffffffL
#define __INT32_C(c) c ## L
#define __INT_LEAST32_WIDTH__ 32
#define __INT_LEAST64_MAX__ 0x7fffffffffffffffLL
#define __INT64_C(c) c ## LL
#define __INT_LEAST64_WIDTH__ 64
#define __UINT_LEAST8_MAX__ 0xff
#define __UINT8_C(c) c
#define __UINT_LEAST16_MAX__ 0xffff
#define __UINT16_C(c) c
#define __UINT_LEAST32_MAX__ 0xffffffffUL
#define __UINT32_C(c) c ## UL
#define __UINT_LEAST64_MAX__ 0xffffffffffffffffULL
#define __UINT64_C(c) c ## ULL
#define __INT_FAST8_MAX__ 0x7fffffff
#define __INT_FAST8_WIDTH__ 32
#define __INT_FAST16_MAX__ 0x7fffffff
#define __INT_FAST16_WIDTH__ 32
#define __INT_FAST32_MAX__ 0x7fffffff
#define __INT_FAST32_WIDTH__ 32
#define __INT_FAST64_MAX__ 0x7fffffffffffffffLL
#define __INT_FAST64_WIDTH__ 64
#define __UINT_FAST8_MAX__ 0xffffffffU
#define __UINT_FAST16_MAX__ 0xffffffffU
#define __UINT_FAST32_MAX__ 0xffffffffU
#define __UINT_FAST64_MAX__ 0xffffffffffffffffULL
#define __INTPTR_MAX__ 0x7fffffff
#define __INTPTR_WIDTH__ 32
#define __UINTPTR_MAX__ 0xffffffffU
#define __GCC_IEC_559 0
#define __GCC_IEC_559_COMPLEX 0
#define __FLT_EVAL_METHOD__ 0
#define __FLT_EVAL_METHOD_TS_18661_3__ 0
#define __DEC_EVAL_METHOD__ 2
#define __FLT_RADIX__ 2
#define __FLT_MANT_DIG__ 24
#define __FLT_DIG__ 6
#define __FLT_MIN_EXP__ (-125)
#define __FLT_MIN_10_EXP__ (-37)
#define __FLT_MAX_EXP__ 128
#define __FLT_MAX_10_EXP__ 38
#define __FLT_DECIMAL_DIG__ 9
#define __FLT_MAX__ 3.4028234663852886e+38F
#define __FLT_MIN__ 1.1754943508222875e-38F
#define __FLT_EPSILON__ 1.1920928955078125e-7F
#define __FLT_DENORM_MIN__ 1.4012984643248171e-45F
#define __FLT_HAS_DENORM__ 1
#define __FLT_HAS_INFINITY__ 1
#define __FLT_HAS_QUIET_NAN__ 1
#define __DBL_MANT_DIG__ 53
#define __DBL_DIG__ 15
#define __DBL_MIN_EXP__ (-1021)
#define __DBL_MIN_10_EXP__ (-307)
#define __DBL_MAX_EXP__ 1024
#define __DBL_MAX_10_EXP__ 308
#define __DBL_DECIMAL_DIG__ 17
#define __DBL_MAX__ ((double)1.7976931348623157e+308L)
#define __DBL_MIN__ ((double)2.2250738585072014e-308L)
#define __DBL_EPSILON__ ((double)2.2204460492503131e-16L)
#define __DBL_DENORM_MIN__ ((double)4.9406564584124654e-324L)
#define __DBL_HAS_DENORM__ 1
#define __DBL_HAS_INFINITY__ 1
#define __DBL_HAS_QUIET_NAN__ 1
#define __LDBL_MANT_DIG__ 53
#define __LDBL_DIG__ 15
#define __LDBL_MIN_EXP__ (-1021)
#define __LDBL_MIN_10_EXP__ (-307)
#define __LDBL_MAX_EXP__ 1024
#define __LDBL_MAX_10_EXP__ 308
#define __DECIMAL_DIG__ 17
#define __LDBL_DECIMAL_DIG__ 17
#define __LDBL_MAX__ 1.7976931348623157e+308L
#define __LDBL_MIN__ 2.2250738585072014e-308L
#define __LDBL_EPSILON__ 2.2204460492503131e-16L
#define __LDBL_DENORM_MIN__ 4.9406564584124654e-324L
#define __LDBL_HAS_DENORM__ 1
#define __LDBL_HAS_INFINITY__ 1
#define __LDBL_HAS_QUIET_NAN__ 1
#define __FLT32_MANT_DIG__ 24
#define __FLT32_DIG__ 6
#define __FLT32_MIN_EXP__ (-125)
#define __FLT32_MIN_10_EXP__ (-37)
#define __FLT32_MAX_EXP__ 128
#define __FLT32_MAX_10_EXP__ 38
#define __FLT32_DECIMAL_DIG__ 9
#define __FLT32_MAX__ 3.4028234663852886e+38F32
#define __FLT32_MIN__ 1.1754943508222875e-38F32
#define __FLT32_EPSILON__ 1.1920928955078125e-7F32
#define __FLT32_DENORM_MIN__ 1.4012984643248171e-45F32
#define __FLT32_HAS_DENORM__ 1
#define __FLT32_HAS_INFINITY__ 1
#define __FLT32_HAS_QUIET_NAN__ 1
#define __FLT64_MANT_DIG__ 53
#define __FLT64_DIG__ 15
#define __FLT64_MIN_EXP__ (-1021)
#define __FLT64_MIN_10_EXP__ (-307)
#define __FLT64_MAX_EXP__ 1024
#define __FLT64_MAX_10_EXP__ 308
#define __FLT64_DECIMAL_DIG__ 17
#define __FLT64_MAX__ 1.7976931348623157e+308F64
#define __FLT64_MIN__ 2.2250738585072014e-308F64
#define __FLT64_EPSILON__ 2.2204460492503131e-16F64
#define __FLT64_DENORM_MIN__ 4.9406564584124654e-324F64
#define __FLT64_HAS_DENORM__ 1
#define __FLT64_HAS_INFINITY__ 1
#define __FLT64_HAS_QUIET_NAN__ 1
#define __FLT32X_MANT_DIG__ 53
#define __FLT32X_DIG__ 15
#define __FLT32X_MIN_EXP__ (-1021)
#define __FLT32X_MIN_10_EXP__ (-307)
#define __FLT32X_MAX_EXP__ 1024
#define __FLT32X_MAX_10_EXP__ 308
#define __FLT32X_DECIMAL_DIG__ 17
#define __FLT32X_MAX__ 1.7976931348623157e+308F32x
#define __FLT32X_MIN__ 2.2250738585072014e-308F32x
#define __FLT32X_EPSILON__ 2.2204460492503131e-16F32x
#define __FLT32X_DENORM_MIN__ 4.9406564584124654e-324F32x
#define __FLT32X_HAS_DENORM__ 1
#define __FLT32X_HAS_INFINITY__ 1
#define __FLT32X_HAS_QUIET_NAN__ 1
#define __DEC32_MANT_DIG__ 7
#define __DEC32_MIN_EXP__ (-94)
#define __DEC32_MAX_EXP__ 97
#define __DEC32_MIN__ 1E-95DF
#define __DEC32_MAX__ 9.999999E96DF
#define __DEC32_EPSILON__ 1E-6DF
#define __DEC32_SUBNORMAL_MIN__ 0.000001E-95DF
#define __DEC64_MANT_DIG__ 16
#define __DEC64_MIN_EXP__ (-382)
#define __DEC64_MAX_EXP__ 385
#define __DEC64_MIN__ 1E-383DD
#define __DEC64_MAX__ 9.999999999999999E384DD
#define __DEC64_EPSILON__ 1E-15DD
#define __DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD
#define __DEC128_MANT_DIG__ 34
#define __DEC128_MIN_EXP__ (-6142)
#define __DEC128_MAX_EXP__ 6145
#define __DEC128_MIN__ 1E-6143DL
#define __DEC128_MAX__ 9.999999999999999999999999999999999E6144DL
#define __DEC128_EPSILON__ 1E-33DL
#define __DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL
#define __SFRACT_FBIT__ 7
#define __SFRACT_IBIT__ 0
#define __SFRACT_MIN__ (-0.5HR-0.5HR)
#define __SFRACT_MAX__ 0X7FP-7HR
#define __SFRACT_EPSILON__ 0x1P-7HR
#define __USFRACT_FBIT__ 8
#define __USFRACT_IBIT__ 0
#define __USFRACT_MIN__ 0.0UHR
#define __USFRACT_MAX__ 0XFFP-8UHR
#define __USFRACT_EPSILON__ 0x1P-8UHR
#define __FRACT_FBIT__ 15
#define __FRACT_IBIT__ 0
#define __FRACT_MIN__ (-0.5R-0.5R)
#define __FRACT_MAX__ 0X7FFFP-15R
#define __FRACT_EPSILON__ 0x1P-15R
#define __UFRACT_FBIT__ 16
#define __UFRACT_IBIT__ 0
#define __UFRACT_MIN__ 0.0UR
#define __UFRACT_MAX__ 0XFFFFP-16UR
#define __UFRACT_EPSILON__ 0x1P-16UR
#define __LFRACT_FBIT__ 31
#define __LFRACT_IBIT__ 0
#define __LFRACT_MIN__ (-0.5LR-0.5LR)
#define __LFRACT_MAX__ 0X7FFFFFFFP-31LR
#define __LFRACT_EPSILON__ 0x1P-31LR
#define __ULFRACT_FBIT__ 32
#define __ULFRACT_IBIT__ 0
#define __ULFRACT_MIN__ 0.0ULR
#define __ULFRACT_MAX__ 0XFFFFFFFFP-32ULR
#define __ULFRACT_EPSILON__ 0x1P-32ULR
#define __LLFRACT_FBIT__ 63
#define __LLFRACT_IBIT__ 0
#define __LLFRACT_MIN__ (-0.5LLR-0.5LLR)
#define __LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR
#define __LLFRACT_EPSILON__ 0x1P-63LLR
#define __ULLFRACT_FBIT__ 64
#define __ULLFRACT_IBIT__ 0
#define __ULLFRACT_MIN__ 0.0ULLR
#define __ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR
#define __ULLFRACT_EPSILON__ 0x1P-64ULLR
#define __SACCUM_FBIT__ 7
#define __SACCUM_IBIT__ 8
#define __SACCUM_MIN__ (-0X1P7HK-0X1P7HK)
#define __SACCUM_MAX__ 0X7FFFP-7HK
#define __SACCUM_EPSILON__ 0x1P-7HK
#define __USACCUM_FBIT__ 8
#define __USACCUM_IBIT__ 8
#define __USACCUM_MIN__ 0.0UHK
#define __USACCUM_MAX__ 0XFFFFP-8UHK
#define __USACCUM_EPSILON__ 0x1P-8UHK
#define __ACCUM_FBIT__ 15
#define __ACCUM_IBIT__ 16
#define __ACCUM_MIN__ (-0X1P15K-0X1P15K)
#define __ACCUM_MAX__ 0X7FFFFFFFP-15K
#define __ACCUM_EPSILON__ 0x1P-15K
#define __UACCUM_FBIT__ 16
#define __UACCUM_IBIT__ 16
#define __UACCUM_MIN__ 0.0UK
#define __UACCUM_MAX__ 0XFFFFFFFFP-16UK
#define __UACCUM_EPSILON__ 0x1P-16UK
#define __LACCUM_FBIT__ 31
#define __LACCUM_IBIT__ 32
#define __LACCUM_MIN__ (-0X1P31LK-0X1P31LK)
#define __LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK
#define __LACCUM_EPSILON__ 0x1P-31LK
#define __ULACCUM_FBIT__ 32
#define __ULACCUM_IBIT__ 32
#define __ULACCUM_MIN__ 0.0ULK
#define __ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK
#define __ULACCUM_EPSILON__ 0x1P-32ULK
#define __LLACCUM_FBIT__ 31
#define __LLACCUM_IBIT__ 32
#define __LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)
#define __LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK
#define __LLACCUM_EPSILON__ 0x1P-31LLK
#define __ULLACCUM_FBIT__ 32
#define __ULLACCUM_IBIT__ 32
#define __ULLACCUM_MIN__ 0.0ULLK
#define __ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK
#define __ULLACCUM_EPSILON__ 0x1P-32ULLK
#define __QQ_FBIT__ 7
#define __QQ_IBIT__ 0
#define __HQ_FBIT__ 15
#define __HQ_IBIT__ 0
#define __SQ_FBIT__ 31
#define __SQ_IBIT__ 0
#define __DQ_FBIT__ 63
#define __DQ_IBIT__ 0
#define __TQ_FBIT__ 127
#define __TQ_IBIT__ 0
#define __UQQ_FBIT__ 8
#define __UQQ_IBIT__ 0
#define __UHQ_FBIT__ 16
#define __UHQ_IBIT__ 0
#define __USQ_FBIT__ 32
#define __USQ_IBIT__ 0
#define __UDQ_FBIT__ 64
#define __UDQ_IBIT__ 0
#define __UTQ_FBIT__ 128
#define __UTQ_IBIT__ 0
#define __HA_FBIT__ 7
#define __HA_IBIT__ 8
#define __SA_FBIT__ 15
#define __SA_IBIT__ 16
#define __DA_FBIT__ 31
#define __DA_IBIT__ 32
#define __TA_FBIT__ 63
#define __TA_IBIT__ 64
#define __UHA_FBIT__ 8
#define __UHA_IBIT__ 8
#define __USA_FBIT__ 16
#define __USA_IBIT__ 16
#define __UDA_FBIT__ 32
#define __UDA_IBIT__ 32
#define __UTA_FBIT__ 64
#define __UTA_IBIT__ 64
#define __REGISTER_PREFIX__ 
#define __USER_LABEL_PREFIX__ 
#define __GNUC_STDC_INLINE__ 1
#define __CHAR_UNSIGNED__ 1
#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1
#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1
#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1
#define __GCC_ATOMIC_BOOL_LOCK_FREE 2
#define __GCC_ATOMIC_CHAR_LOCK_FREE 2
#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 2
#define __GCC_ATOMIC_CHAR32_T_LOCK_FREE 2
#define __GCC_ATOMIC_WCHAR_T_LOCK_FREE 2
#define __GCC_ATOMIC_SHORT_LOCK_FREE 2
#define __GCC_ATOMIC_INT_LOCK_FREE 2
#define __GCC_ATOMIC_LONG_LOCK_FREE 2
#define __GCC_ATOMIC_LLONG_LOCK_FREE 1
#define __GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1
#define __GCC_ATOMIC_POINTER_LOCK_FREE 2
#define __GCC_HAVE_DWARF2_CFI_ASM 1
#define __PRAGMA_REDEFINE_EXTNAME 1
#define __SIZEOF_WCHAR_T__ 4
#define __SIZEOF_WINT_T__ 4
#define __SIZEOF_PTRDIFF_T__ 4
#undef __ARM_FEATURE_DSP
# 1 "<built-in>"
#define __ARM_FEATURE_QBIT 1
#define __ARM_FEATURE_SAT 1
#undef __ARM_FEATURE_CRYPTO
# 1 "<built-in>"
#define __ARM_FEATURE_UNALIGNED 1
#undef __ARM_FEATURE_QRDMX
# 1 "<built-in>"
#undef __ARM_FEATURE_CRC32
# 1 "<built-in>"
#undef __ARM_FEATURE_DOTPROD
# 1 "<built-in>"
#define __ARM_32BIT_STATE 1
#undef __ARM_FEATURE_CMSE
# 1 "<built-in>"
#undef __ARM_FEATURE_LDREX
# 1 "<built-in>"
#define __ARM_FEATURE_LDREX 7
#define __ARM_FEATURE_CLZ 1
#undef __ARM_FEATURE_NUMERIC_MAXMIN
# 1 "<built-in>"
#undef __ARM_FEATURE_SIMD32
# 1 "<built-in>"
#define __ARM_SIZEOF_MINIMAL_ENUM 1
#define __ARM_SIZEOF_WCHAR_T 4
#undef __ARM_ARCH_PROFILE
# 1 "<built-in>"
#define __ARM_ARCH_PROFILE 77
#define __arm__ 1
#undef __ARM_ARCH
# 1 "<built-in>"
#define __ARM_ARCH 7
#define __APCS_32__ 1
#define __thumb__ 1
#define __thumb2__ 1
#define __THUMBEL__ 1
#undef __ARM_ARCH_ISA_THUMB
# 1 "<built-in>"
#define __ARM_ARCH_ISA_THUMB 2
#define __ARMEL__ 1
#define __SOFTFP__ 1
#define __VFP_FP__ 1
#undef __ARM_FP
# 1 "<built-in>"
#undef __ARM_FP16_FORMAT_IEEE
# 1 "<built-in>"
#undef __ARM_FP16_FORMAT_ALTERNATIVE
# 1 "<built-in>"
#undef __ARM_FP16_ARGS
# 1 "<built-in>"
#undef __ARM_FEATURE_FP16_SCALAR_ARITHMETIC
# 1 "<built-in>"
#undef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
# 1 "<built-in>"
#undef __ARM_FEATURE_FP16_FML
# 1 "<built-in>"
#undef __ARM_FEATURE_FMA
# 1 "<built-in>"
#undef __ARM_NEON__
# 1 "<built-in>"
#undef __ARM_NEON
# 1 "<built-in>"
#undef __ARM_NEON_FP
# 1 "<built-in>"
#define __THUMB_INTERWORK__ 1
#define __ARM_ARCH_7M__ 1
#define __ARM_PCS 1
#define __ARM_EABI__ 1
#define __ARM_ARCH_EXT_IDIV__ 1
#define __ARM_FEATURE_IDIV 1
#define __ARM_ASM_SYNTAX_UNIFIED__ 1
#undef __ARM_FEATURE_COPROC
# 1 "<built-in>"
#define __ARM_FEATURE_COPROC 15
#define __GXX_TYPEINFO_EQUALITY_INLINE 0
#define __ELF__ 1
# 1 "<command-line>"
#define __USES_INITFINI__ 1
#define APP_NAME my_sensor_app
#define APP_my_sensor_app 1
#define ARCH_NAME cortex_m3
#define ARCH_cortex_m3 1
#define BSP_NAME bluepill
#define BSP_bluepill 1
#define FLOAT_SUPPORT 1
#define MYNEWT 1
#define STM32F103xB 1
#define WITHOUT_OPEN_MEMSTREAM 1
# 1 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c"
/****************************************************************************
**
** Copyright (C) 2016 Intel Corporation
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

#define _BSD_SOURCE 1
#define _DEFAULT_SOURCE 1

#define __STDC_LIMIT_MACROS 1


# 1 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 1
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


#define CBOR_H 

# 1 "repos/apache-mynewt-core/libc/baselibc/include/assert.h" 1
/*
 * assert.h
 */


#define _ASSERT_H 
# 23 "repos/apache-mynewt-core/libc/baselibc/include/assert.h"
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 1 3 4

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
/* Copyright (C) 1989-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */






/* Any one of these symbols __need_* means that GNU libc
   wants us just to define one data type.  So don't define
   the symbols that indicate this file's entire job has been done.  */



#define _STDDEF_H 
#define _STDDEF_H_ 
/* snaroff@next.com says the NeXT needs this.  */
#define _ANSI_STDDEF_H 



/* This avoids lossage on SunOS but only if stdtypes.h comes first.
   There's no way to win with the other order!  Sun lossage.  */

/* On 4.3bsd-net2, make sure ansi.h is included, so we have
   one less case to deal with in the following.  */



/* On FreeBSD 5, machine/ansi.h does not exist anymore... */




/* In 4.3bsd-net2, machine/ansi.h defines these symbols, which are
   defined if the corresponding type is *not* defined.
   FreeBSD-2.1 defines _MACHINE_ANSI_H_ instead of _ANSI_H_.
   NetBSD defines _I386_ANSI_H_ and _X86_64_ANSI_H_ instead of _ANSI_H_ */
# 92 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
/* Sequent's header files use _PTRDIFF_T_ in some conflicting way.
   Just ignore it.  */




/* On VxWorks, <type/vxTypesBase.h> may have defined macros like
   _TYPE_size_t which will typedef size_t.  fixincludes patched the
   vxTypesBase.h so that this macro is only defined if _GCC_SIZE_T is
   not defined, and so that defining this macro defines _GCC_SIZE_T.
   If we find that the macros are still defined at this point, we must
   invoke them so that the type is defined as expected.  */
# 117 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
/* In case nobody has defined these types, but we aren't running under
   GCC 2.00, make sure that __PTRDIFF_TYPE__, __SIZE_TYPE__, and
   __WCHAR_TYPE__ have reasonable values.  This can happen if the
   parts of GCC is compiled by an older compiler, that actually
   include gstddef.h, such as collect2.  */

/* Signed type of difference of two pointers.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
# 137 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
#define _PTRDIFF_T 
#define _T_PTRDIFF_ 
#define _T_PTRDIFF 
#define __PTRDIFF_T 
#define _PTRDIFF_T_ 
#define _BSD_PTRDIFF_T_ 
#define ___int_ptrdiff_t_h 
#define _GCC_PTRDIFF_T 
#define _PTRDIFF_T_DECLARED 



typedef int ptrdiff_t;
# 160 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
/* If this symbol has done its job, get rid of it.  */
#undef __need_ptrdiff_t



/* Unsigned type of `sizeof' something.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
# 187 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
#define __size_t__ /* BeOS */
#define __SIZE_T__ /* Cray Unicos/Mk */
#define _SIZE_T 
#define _SYS_SIZE_T_H 
#define _T_SIZE_ 
#define _T_SIZE 
#define __SIZE_T 
#define _SIZE_T_ 
#define _BSD_SIZE_T_ 
#define _SIZE_T_DEFINED_ 
#define _SIZE_T_DEFINED 
#define _BSD_SIZE_T_DEFINED_ /* Darwin */
#define _SIZE_T_DECLARED /* FreeBSD 5 */
#define ___int_size_t_h 
#define _GCC_SIZE_T 
#define _SIZET_ 







#define __size_t 





typedef unsigned int size_t;
# 238 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
#undef __need_size_t



/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
# 267 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
#define __wchar_t__ /* BeOS */
#define __WCHAR_T__ /* Cray Unicos/Mk */
#define _WCHAR_T 
#define _T_WCHAR_ 
#define _T_WCHAR 
#define __WCHAR_T 
#define _WCHAR_T_ 
#define _BSD_WCHAR_T_ 
#define _WCHAR_T_DEFINED_ 
#define _WCHAR_T_DEFINED 
#define _WCHAR_T_H 
#define ___int_wchar_t_h 
#define __INT_WCHAR_T_H 
#define _GCC_WCHAR_T 
#define _WCHAR_T_DECLARED 

/* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
   instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
   symbols in the _FOO_T_ family, stays defined even after its
   corresponding type is defined).  If we define wchar_t, then we
   must undef _WCHAR_T_; for BSD/386 1.1 (and perhaps others), if
   we undef _WCHAR_T_, then we must also define rune_t, since 
   headers like runetype.h assume that if machine/ansi.h is included,
   and _BSD_WCHAR_T_ is not defined, then rune_t is available.
   machine/ansi.h says, "Note that _WCHAR_T_ and _RUNE_T_ must be of
   the same type." */

#undef _BSD_WCHAR_T_
# 310 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
/* FreeBSD 5 can't be handled well using "traditional" logic above
   since it no longer defines _BSD_RUNE_T_ yet still desires to export
   rune_t in some cases... */
# 328 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 347 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 362 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
/*  In 4.3bsd-net2, leave these undefined to indicate that size_t, etc.
    are already defined.  */
/*  BSD/OS 3.1 and FreeBSD [23].x require the MACHINE_ANSI_H check here.  */
/*  NetBSD 5 requires the I386_ANSI_H and X86_64_ANSI_H checks here.  */
# 398 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
/* A null pointer constant.  */


#undef NULL




#define NULL ((void *)0)





#undef __need_NULL



/* Offset of member MEMBER in a struct of type TYPE. */
#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)




#define _GCC_MAX_ALIGN_T 
/* Type whose alignment is supported in every context and is at least
   as great as that of any standard type not using alignment
   specifiers.  */
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
  /* _Float128 is defined as a basic type, so max_align_t must be
     sufficiently aligned for it.  This code must work in C++, so we
     use __float128 here; that is only available on some
     architectures, but only on i386 is extra alignment needed for
     __float128.  */



} max_align_t;
# 24 "repos/apache-mynewt-core/libc/baselibc/include/assert.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_fault.h" 1

# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_fault.h"
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


#define _OS_FAULT_H 

# 1 "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h" 1
/**
 * This file was generated by Apache newt version: 1.6.0
 */


#define H_MYNEWT_SYSCFG_ 

/**
 * This macro exists to ensure code includes this header when needed.  If code
 * checks the existence of a setting directly via ifdef without including this
 * header, the setting macro will silently evaluate to 0.  In contrast, an
 * attempt to use these macros without including this header will result in a
 * compiler error.
 */
#define MYNEWT_VAL(_name) MYNEWT_VAL_ ## _name
#define MYNEWT_VAL_CHOICE(_name,_val) MYNEWT_VAL_ ## _name ## __ ## _val



/*** @apache-mynewt-core/crypto/tinycrypt */

#define MYNEWT_VAL_TINYCRYPT_SYSINIT_STAGE (200)



#define MYNEWT_VAL_TINYCRYPT_UECC_RNG_TRNG_DEV_NAME ("trng")



#define MYNEWT_VAL_TINYCRYPT_UECC_RNG_USE_TRNG (0)


/*** @apache-mynewt-core/encoding/cborattr */

#define MYNEWT_VAL_CBORATTR_MAX_SIZE (512)


/*** @apache-mynewt-core/hw/bsp/bluepill */

#define MYNEWT_VAL_STM32_FLASH_SIZE_KB (128)



#define MYNEWT_VAL_TIMER_0 (1)



#define MYNEWT_VAL_TIMER_1 (0)



#define MYNEWT_VAL_TIMER_2 (0)



#define MYNEWT_VAL_UART_0 (1)


/*** @apache-mynewt-core/hw/hal */

#define MYNEWT_VAL_HAL_FLASH_VERIFY_BUF_SZ (16)



#define MYNEWT_VAL_HAL_FLASH_VERIFY_ERASES (0)



#define MYNEWT_VAL_HAL_FLASH_VERIFY_WRITES (0)


/*** @apache-mynewt-core/hw/mcu/stm/stm32f1xx */

#define MYNEWT_VAL_I2C_0 (0)



#define MYNEWT_VAL_MCU_FLASH_ERASED_VAL (0xff)



#define MYNEWT_VAL_MCU_FLASH_MIN_WRITE_SIZE (2)



#define MYNEWT_VAL_MCU_STM32F1 (1)



#define MYNEWT_VAL_SPI_0 (MYNEWT_VAL_SPI_0_MASTER || MYNEWT_VAL_SPI_0_SLAVE)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/hw/mcu/stm/stm32f1xx) */

#define MYNEWT_VAL_SPI_0_MASTER (1)



#define MYNEWT_VAL_SPI_0_SLAVE (0)



#define MYNEWT_VAL_SPI_1 (MYNEWT_VAL_SPI_1_MASTER || MYNEWT_VAL_SPI_1_SLAVE)



#define MYNEWT_VAL_SPI_1_MASTER (0)



#define MYNEWT_VAL_SPI_1_SLAVE (0)



#define MYNEWT_VAL_STM32_FLASH_IS_LINEAR (1)



#define MYNEWT_VAL_STM32_FLASH_SECTOR_SIZE (1024)



#define MYNEWT_VAL_STM32_HAL_I2C_HAS_CLOCKSPEED (1)



#define MYNEWT_VAL_STM32_HAL_SPI_HAS_FIFO (0)



#define MYNEWT_VAL_STM32_HAL_UART_HAS_SR (1)


/*** @apache-mynewt-core/hw/sensor */

#define MYNEWT_VAL_MATHLIB_SUPPORT (0)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/hw/sensor) */

#define MYNEWT_VAL_SENSOR_CLI (0)



#define MYNEWT_VAL_SENSOR_MAX_INTERRUPTS_PINS (2)


#undef MYNEWT_VAL_SENSOR_MGR_EVQ


#define MYNEWT_VAL_SENSOR_NOTIF_EVENTS_MAX (5)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/hw/sensor) */

#define MYNEWT_VAL_SENSOR_OIC (0)



#define MYNEWT_VAL_SENSOR_OIC_OBS_RATE (1000)



#define MYNEWT_VAL_SENSOR_OIC_PERIODIC (0)



#define MYNEWT_VAL_SENSOR_POLL_TEST_LOG (0)



#define MYNEWT_VAL_SENSOR_SYSINIT_STAGE (501)


/*** @apache-mynewt-core/hw/sensor/creator */

#define MYNEWT_VAL_ADXL345_OFB (0)



#define MYNEWT_VAL_BMA253_OFB (0)



#define MYNEWT_VAL_BMA2XX_OFB (0)



#define MYNEWT_VAL_BME280_OFB (0)



#define MYNEWT_VAL_BME680_OFB (0)



#define MYNEWT_VAL_BMP280_OFB (0)



#define MYNEWT_VAL_BNO055_OFB (0)



#define MYNEWT_VAL_DRV2605_OFB (0)



#define MYNEWT_VAL_LIS2DS12_OFB (0)



#define MYNEWT_VAL_LIS2DW12_OFB (0)



#define MYNEWT_VAL_LPS33HW_OFB (0)



#define MYNEWT_VAL_LPS33THW_OFB (0)



#define MYNEWT_VAL_LSM303DLHC_OFB (0)



#define MYNEWT_VAL_MPU6050_OFB (0)



#define MYNEWT_VAL_MS5837_OFB (0)



#define MYNEWT_VAL_MS5840_OFB (0)



#define MYNEWT_VAL_SENSOR_CREATOR_SYSINIT_STAGE (500)



#define MYNEWT_VAL_TCS34725_OFB (0)



#define MYNEWT_VAL_TSL2561_OFB (0)



#define MYNEWT_VAL_TSL2591_OFB (0)


/*** @apache-mynewt-core/kernel/os */

#define MYNEWT_VAL_FLOAT_USER (0)



#define MYNEWT_VAL_MSYS_1_BLOCK_COUNT (12)



#define MYNEWT_VAL_MSYS_1_BLOCK_SIZE (292)



#define MYNEWT_VAL_MSYS_1_SANITY_MIN_COUNT (0)



#define MYNEWT_VAL_MSYS_2_BLOCK_COUNT (0)



#define MYNEWT_VAL_MSYS_2_BLOCK_SIZE (0)



#define MYNEWT_VAL_MSYS_2_SANITY_MIN_COUNT (0)



#define MYNEWT_VAL_MSYS_SANITY_TIMEOUT (60000)



#define MYNEWT_VAL_OS_CLI (0)



#define MYNEWT_VAL_OS_COREDUMP (0)



#define MYNEWT_VAL_OS_CPUTIME_FREQ (1000000)



#define MYNEWT_VAL_OS_CPUTIME_TIMER_NUM (0)



#define MYNEWT_VAL_OS_CRASH_FILE_LINE (0)



#define MYNEWT_VAL_OS_CRASH_LOG (0)



#define MYNEWT_VAL_OS_CRASH_RESTORE_REGS (0)



#define MYNEWT_VAL_OS_CRASH_STACKTRACE (0)



#define MYNEWT_VAL_OS_CTX_SW_STACK_CHECK (0)



#define MYNEWT_VAL_OS_CTX_SW_STACK_GUARD (4)



#define MYNEWT_VAL_OS_DEBUG_MODE (0)



#define MYNEWT_VAL_OS_EVENTQ_DEBUG (0)



#define MYNEWT_VAL_OS_EVENTQ_MONITOR (0)



#define MYNEWT_VAL_OS_IDLE_TICKLESS_MS_MAX (600000)



#define MYNEWT_VAL_OS_IDLE_TICKLESS_MS_MIN (100)



#define MYNEWT_VAL_OS_MAIN_STACK_SIZE (1024)



#define MYNEWT_VAL_OS_MAIN_TASK_PRIO (127)



#define MYNEWT_VAL_OS_MEMPOOL_CHECK (0)



#define MYNEWT_VAL_OS_MEMPOOL_GUARD (0)



#define MYNEWT_VAL_OS_MEMPOOL_POISON (0)



#define MYNEWT_VAL_OS_SCHEDULING (1)



#define MYNEWT_VAL_OS_SYSINIT_STAGE (0)



#define MYNEWT_VAL_OS_SYSVIEW (0)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/kernel/os) */

#define MYNEWT_VAL_OS_SYSVIEW_TRACE_CALLOUT (0)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/kernel/os) */

#define MYNEWT_VAL_OS_SYSVIEW_TRACE_EVENTQ (0)



#define MYNEWT_VAL_OS_SYSVIEW_TRACE_MBUF (0)



#define MYNEWT_VAL_OS_SYSVIEW_TRACE_MEMPOOL (0)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/kernel/os) */

#define MYNEWT_VAL_OS_SYSVIEW_TRACE_MUTEX (0)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/kernel/os) */

#define MYNEWT_VAL_OS_SYSVIEW_TRACE_SEM (0)



#define MYNEWT_VAL_OS_TIME_DEBUG (0)



#define MYNEWT_VAL_OS_WATCHDOG_MONITOR (0)



#define MYNEWT_VAL_SANITY_INTERVAL (15000)



#define MYNEWT_VAL_WATCHDOG_INTERVAL (30000)


/*** @apache-mynewt-core/libc/baselibc */

#define MYNEWT_VAL_BASELIBC_ASSERT_FILE_LINE (0)



#define MYNEWT_VAL_BASELIBC_PRESENT (1)


/*** @apache-mynewt-core/net/oic */
/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_APP_RESOURCES (2)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_CLIENT (1)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_CLIENT_DISCOVERY_ENABLE (0)



#define MYNEWT_VAL_OC_COAP_RESPONSE_TIMEOUT (4)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_CONCURRENT_REQUESTS (2)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_CONN_EV_CB_CNT (2)



#define MYNEWT_VAL_OC_DEBUG (0)



#define MYNEWT_VAL_OC_LOGGING (0)



#define MYNEWT_VAL_OC_LORA_PORT (0xbb)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_MAX_PAYLOAD (400)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_MAX_PAYLOAD_SIZE (400)



#define MYNEWT_VAL_OC_NUM_DEVICES (1)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_NUM_REP_OBJECTS (2)



#define MYNEWT_VAL_OC_SEPARATE_RESPONSES (1)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_SERVER (0)



#define MYNEWT_VAL_OC_SYSINIT_STAGE_GATT (301)



#define MYNEWT_VAL_OC_SYSINIT_STAGE_IP4 (301)



#define MYNEWT_VAL_OC_SYSINIT_STAGE_IP6 (301)



#define MYNEWT_VAL_OC_SYSINIT_STAGE_LORA (301)



#define MYNEWT_VAL_OC_SYSINIT_STAGE_MAIN (300)



#define MYNEWT_VAL_OC_SYSINIT_STAGE_SERIAL (301)



#define MYNEWT_VAL_OC_TRANSPORT_GATT (0)



#define MYNEWT_VAL_OC_TRANSPORT_IP (0)



#define MYNEWT_VAL_OC_TRANSPORT_IPV4 (0)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_TRANSPORT_IPV6 (0)



#define MYNEWT_VAL_OC_TRANSPORT_LORA (0)



#define MYNEWT_VAL_OC_TRANSPORT_SERIAL (0)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/net/oic) */

#define MYNEWT_VAL_OC_TRANS_SECURITY (0)


/*** @apache-mynewt-core/sys/flash_map */

#define MYNEWT_VAL_FLASH_MAP_MAX_AREAS (10)



#define MYNEWT_VAL_FLASH_MAP_SYSINIT_STAGE (2)


/*** @apache-mynewt-core/sys/log/modlog */

#define MYNEWT_VAL_MODLOG_CONSOLE_DFLT (1)



#define MYNEWT_VAL_MODLOG_LOG_MACROS (0)



#define MYNEWT_VAL_MODLOG_MAX_MAPPINGS (16)



#define MYNEWT_VAL_MODLOG_MAX_PRINTF_LEN (128)



#define MYNEWT_VAL_MODLOG_SYSINIT_STAGE (100)


/*** @apache-mynewt-core/sys/log/stub */

#define MYNEWT_VAL_LOG_CONSOLE (1)



#define MYNEWT_VAL_LOG_FCB (0)



#define MYNEWT_VAL_LOG_FCB_SLOT1 (0)


/* Overridden by apps/my_sensor_app (defined by @apache-mynewt-core/sys/log/stub) */

#define MYNEWT_VAL_LOG_LEVEL (255)


/*** @apache-mynewt-core/sys/mfg */

#define MYNEWT_VAL_MFG_LOG_MODULE (128)



#define MYNEWT_VAL_MFG_MAX_MMRS (2)



#define MYNEWT_VAL_MFG_SYSINIT_STAGE (100)


/*** @apache-mynewt-core/sys/sys */

#define MYNEWT_VAL_DEBUG_PANIC_ENABLED (1)


/*** @apache-mynewt-core/sys/sysdown */

#define MYNEWT_VAL_SYSDOWN_CONSTRAIN_DOWN (1)



#define MYNEWT_VAL_SYSDOWN_PANIC_FILE_LINE (0)



#define MYNEWT_VAL_SYSDOWN_PANIC_MESSAGE (0)



#define MYNEWT_VAL_SYSDOWN_TIMEOUT_MS (10000)


/*** @apache-mynewt-core/sys/sysinit */

#define MYNEWT_VAL_SYSINIT_CONSTRAIN_INIT (1)



#define MYNEWT_VAL_SYSINIT_PANIC_FILE_LINE (0)



#define MYNEWT_VAL_SYSINIT_PANIC_MESSAGE (0)


/*** @apache-mynewt-core/util/rwlock */

#define MYNEWT_VAL_RWLOCK_DEBUG (0)


/*** apps/my_sensor_app */
/* Overridden by apps/my_sensor_app (defined by apps/my_sensor_app) */

#define MYNEWT_VAL_ADC_1 (1)


/* Overridden by apps/my_sensor_app (defined by apps/my_sensor_app) */

#define MYNEWT_VAL_ESP8266 (1)


/* Overridden by apps/my_sensor_app (defined by apps/my_sensor_app) */

#define MYNEWT_VAL_HMAC_PRNG (1)


/* Overridden by apps/my_sensor_app (defined by apps/my_sensor_app) */

#define MYNEWT_VAL_NRF24L01 (1)


/* Overridden by apps/my_sensor_app (defined by apps/my_sensor_app) */

#define MYNEWT_VAL_RAW_TEMP (1)


/* Overridden by apps/my_sensor_app (defined by apps/my_sensor_app) */

#define MYNEWT_VAL_REMOTE_SENSOR (1)



#define MYNEWT_VAL_SEMIHOSTING_CONSOLE (1)


/* Overridden by apps/my_sensor_app (defined by apps/my_sensor_app) */

#define MYNEWT_VAL_SENSOR_COAP (1)


/* Overridden by apps/my_sensor_app (defined by apps/my_sensor_app) */

#define MYNEWT_VAL_SENSOR_NETWORK (1)


/* Overridden by apps/my_sensor_app (defined by apps/my_sensor_app) */

#define MYNEWT_VAL_TEMP_STM32 (1)



#define MYNEWT_VAL_TUTORIAL1 (0)



#define MYNEWT_VAL_TUTORIAL2 (0)


/* Overridden by targets/bluepill_my_sensor (defined by apps/my_sensor_app) */

#define MYNEWT_VAL_TUTORIAL3 (1)



#define MYNEWT_VAL_WIFI_GEOLOCATION (0)


/*** libs/esp8266 */
/* Overridden by targets/bluepill_my_sensor (defined by libs/esp8266) */

#define MYNEWT_VAL_WIFI_PASSWORD ("my_password_is_secret")


/* Overridden by targets/bluepill_my_sensor (defined by libs/esp8266) */

#define MYNEWT_VAL_WIFI_SSID ("my_ssid")


/*** libs/nrf24l01 */
/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_AUTO_ACK (0)


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_AUTO_RETRANSMIT (0)


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_CE_PIN (MCU_GPIO_PORTB(0))


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_CRC_WIDTH (8)


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_CS_PIN (MCU_GPIO_PORTB(2))


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_DATA_RATE (250)


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_FREQ (2476)


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_IRQ_PIN (MCU_GPIO_PORTA(15))


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_POWER (0)


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_SPI_BAUDRATE (200)


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_SPI_NUM (0)


/* Overridden by targets/bluepill_my_sensor (defined by libs/nrf24l01) */

#define MYNEWT_VAL_NRF24L01_TX_SIZE (12)


/*** libs/remote_sensor */
/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__DOUBLE (0)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__FIELD ("t")


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__INT (1)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__NAME (temp_raw)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__SENSOR_TYPE (AMBIENT_TEMPERATURE_RAW)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__UNION (strd)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__DOUBLE (1)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__FIELD ("tf")


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__INT (0)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__NAME (temp)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__SENSOR_TYPE (AMBIENT_TEMPERATURE)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__UNION (std)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__DOUBLE (1)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__FIELD ("p")


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__INT (0)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__NAME (press)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__SENSOR_TYPE (PRESSURE)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__UNION (spd)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__DOUBLE (1)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__FIELD ("h")


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__INT (0)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__NAME (humid)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__SENSOR_TYPE (RELATIVE_HUMIDITY)


/* Overridden by targets/bluepill_my_sensor (defined by libs/remote_sensor) */

#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__UNION (shd)


/*** libs/semihosting_console */

#define MYNEWT_VAL_CONSOLE_COMPAT (1)



#define MYNEWT_VAL_CONSOLE_DEFAULT_LOCK_TIMEOUT (1000)



#define MYNEWT_VAL_CONSOLE_ECHO (0)



#define MYNEWT_VAL_CONSOLE_HISTORY_SIZE (0)



#define MYNEWT_VAL_CONSOLE_INPUT (0)



#define MYNEWT_VAL_CONSOLE_MAX_INPUT_LEN (256)



#define MYNEWT_VAL_CONSOLE_SEMIHOSTING (1)



#define MYNEWT_VAL_CONSOLE_SEMIHOSTING_INPUT_POLL_INTERVAL_MAX (250)



#define MYNEWT_VAL_CONSOLE_SEMIHOSTING_RETRY_COUNT (2)



#define MYNEWT_VAL_CONSOLE_SEMIHOSTING_RETRY_DELAY_MS (2)



#define MYNEWT_VAL_CONSOLE_SEMIHOSTING_RETRY_IN_ISR (0)



#define MYNEWT_VAL_CONSOLE_SYSINIT_STAGE (20)



#define MYNEWT_VAL_CONSOLE_TICKS (0)


/*** libs/sensor_coap */
/* Overridden by apps/my_sensor_app (defined by libs/sensor_coap) */

#define MYNEWT_VAL_COAP_CBOR_ENCODING (1)


/* Overridden by apps/my_sensor_app (defined by libs/sensor_coap) */

#define MYNEWT_VAL_COAP_JSON_ENCODING (1)


/*** libs/sensor_network */
/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_COAP_HOST ("coap.thethings.io")


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_COAP_PORT (5683)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_COAP_URI ("v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8")


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_COLLECTOR_NODE_ADDRESS (0x7878787878ull)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_COLLECTOR_NODE_HW_ID (0x57, 0xff, 0x6a, 0x06, 0x78, 0x78, 0x54, 0x50, 0x49, 0x29, 0x24, 0x67)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NETWORK_ADDRESS (0xb3b4b5b6ull)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NODE_HW_ID_1 (0x38, 0xff, 0x6d, 0x06, 0x4e, 0x57, 0x34, 0x36, 0x25, 0x58, 0x08, 0x43)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NODE_HW_ID_2 (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x02)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NODE_HW_ID_3 (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x03)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NODE_HW_ID_4 (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x04)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NODE_HW_ID_5 (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x05)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NODE_OFFSET_1 (0xf1)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NODE_OFFSET_2 (0xcd)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NODE_OFFSET_3 (0xa3)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NODE_OFFSET_4 (0x0f)


/* Overridden by targets/bluepill_my_sensor (defined by libs/sensor_network) */

#define MYNEWT_VAL_SENSOR_NODE_OFFSET_5 (0x05)


/*** newt */

#define MYNEWT_VAL_APP_NAME ("my_sensor_app")



#define MYNEWT_VAL_APP_my_sensor_app (1)



#define MYNEWT_VAL_ARCH_NAME ("cortex_m3")



#define MYNEWT_VAL_ARCH_cortex_m3 (1)



#define MYNEWT_VAL_BSP_NAME ("bluepill")



#define MYNEWT_VAL_BSP_bluepill (1)



#define MYNEWT_VAL_NEWT_FEATURE_LOGCFG (1)



#define MYNEWT_VAL_NEWT_FEATURE_SYSDOWN (1)



#define MYNEWT_VAL_TARGET_NAME ("bluepill_my_sensor")



#define MYNEWT_VAL_TARGET_bluepill_my_sensor (1)
# 24 "repos/apache-mynewt-core/kernel/os/include/os/os_fault.h" 2





void __assert_func(const char *file, int line, const char *func, const char *e)
    __attribute((noreturn));




#define OS_CRASH() __assert_func(NULL, 0, NULL, NULL)
# 25 "repos/apache-mynewt-core/libc/baselibc/include/assert.h" 2

#define assert(x) ((x) ? (void)0 : OS_CRASH())
# 29 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 2
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include-fixed/limits.h" 1 3 4

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include-fixed/limits.h" 3 4
/* Copyright (C) 1991-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free
Software Foundation; either version 3, or (at your option) any later
version.

GCC is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */


#define _LIMITS_H___ 

/* Number of bits in a `char'.  */
#undef CHAR_BIT
#define CHAR_BIT __CHAR_BIT__

/* Maximum length of a multibyte character.  */

#define MB_LEN_MAX 1


/* Minimum and maximum values a `signed char' can hold.  */
#undef SCHAR_MIN
#define SCHAR_MIN (-SCHAR_MAX - 1)
#undef SCHAR_MAX
#define SCHAR_MAX __SCHAR_MAX__

/* Maximum value an `unsigned char' can hold.  (Minimum is 0).  */
#undef UCHAR_MAX



#define UCHAR_MAX (SCHAR_MAX * 2 + 1)


/* Minimum and maximum values a `char' can hold.  */

#undef CHAR_MIN



#define CHAR_MIN 0

#undef CHAR_MAX
#define CHAR_MAX UCHAR_MAX







/* Minimum and maximum values a `signed short int' can hold.  */
#undef SHRT_MIN
#define SHRT_MIN (-SHRT_MAX - 1)
#undef SHRT_MAX
#define SHRT_MAX __SHRT_MAX__

/* Maximum value an `unsigned short int' can hold.  (Minimum is 0).  */
#undef USHRT_MAX



#define USHRT_MAX (SHRT_MAX * 2 + 1)


/* Minimum and maximum values a `signed int' can hold.  */
#undef INT_MIN
#define INT_MIN (-INT_MAX - 1)
#undef INT_MAX
#define INT_MAX __INT_MAX__

/* Maximum value an `unsigned int' can hold.  (Minimum is 0).  */
#undef UINT_MAX
#define UINT_MAX (INT_MAX * 2U + 1U)

/* Minimum and maximum values a `signed long int' can hold.
   (Same as `int').  */
#undef LONG_MIN
#define LONG_MIN (-LONG_MAX - 1L)
#undef LONG_MAX
#define LONG_MAX __LONG_MAX__

/* Maximum value an `unsigned long int' can hold.  (Minimum is 0).  */
#undef ULONG_MAX
#define ULONG_MAX (LONG_MAX * 2UL + 1UL)


/* Minimum and maximum values a `signed long long int' can hold.  */
#undef LLONG_MIN
#define LLONG_MIN (-LLONG_MAX - 1LL)
#undef LLONG_MAX
#define LLONG_MAX __LONG_LONG_MAX__

/* Maximum value an `unsigned long long int' can hold.  (Minimum is 0).  */
#undef ULLONG_MAX
#define ULLONG_MAX (LLONG_MAX * 2ULL + 1ULL)



/* Minimum and maximum values a `signed long long int' can hold.  */
#undef LONG_LONG_MIN
#define LONG_LONG_MIN (-LONG_LONG_MAX - 1LL)
#undef LONG_LONG_MAX
#define LONG_LONG_MAX __LONG_LONG_MAX__

/* Maximum value an `unsigned long long int' can hold.  (Minimum is 0).  */
#undef ULONG_LONG_MAX
#define ULONG_LONG_MAX (LONG_LONG_MAX * 2ULL + 1ULL)
# 30 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 2
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 1 3 4
/* Copyright (C) 1989-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */
# 31 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 2
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdint.h" 1 3 4
# 9 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdint.h" 3 4
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 1 3 4
/*
 * Copyright (c) 2004, 2005 by
 * Ralf Corsepius, Ulm/Germany. All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software
 * is freely granted, provided that this notice is preserved.
 */


#define _STDINT_H 

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/machine/_default_types.h" 1 3 4
/*
 *  $Id$
 */


#define _MACHINE__DEFAULT_TYPES_H 

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/features.h" 1 3 4
/*
 *  Written by Joel Sherrill <joel@OARcorp.com>.
 *
 *  COPYRIGHT (c) 1989-2014.
 *
 *  On-Line Applications Research Corporation (OAR).
 *
 *  Permission to use, copy, modify, and distribute this software for any
 *  purpose without fee is hereby granted, provided that this entire notice
 *  is included in all copies of any software which is or includes a copy
 *  or modification of this software.
 *
 *  THIS SOFTWARE IS BEING PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED
 *  WARRANTY.  IN PARTICULAR,  THE AUTHOR MAKES NO REPRESENTATION
 *  OR WARRANTY OF ANY KIND CONCERNING THE MERCHANTABILITY OF THIS
 *  SOFTWARE OR ITS FITNESS FOR ANY PARTICULAR PURPOSE.
 *
 *  $Id$
 */


#define _SYS_FEATURES_H 





# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/_newlib_version.h" 1 3 4
/* _newlib_version.h.  Generated from _newlib_version.hin by configure.  */
/* Version macros for internal and downstream use. */

#define _NEWLIB_VERSION_H__ 1

#define _NEWLIB_VERSION "3.0.0"
#define __NEWLIB__ 3
#define __NEWLIB_MINOR__ 0
#define __NEWLIB_PATCHLEVEL__ 0
# 29 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/features.h" 2 3 4

/* Macro to test version of GCC.  Returns 0 for non-GCC or too old GCC. */


#define __GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))





/* Version with trailing underscores for BSD compatibility. */
#define __GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)


/*
 * Feature test macros control which symbols are exposed by the system
 * headers.  Any of these must be defined before including any headers.
 *
 * __STRICT_ANSI__ (defined by gcc -ansi, -std=c90, -std=c99, or -std=c11)
 *	ISO C
 *
 * _POSIX_SOURCE (deprecated by _POSIX_C_SOURCE=1)
 * _POSIX_C_SOURCE >= 1
 * 	POSIX.1-1990
 *
 * _POSIX_C_SOURCE >= 2
 * 	POSIX.2-1992
 *
 * _POSIX_C_SOURCE >= 199309L
 * 	POSIX.1b-1993 Real-time extensions
 *
 * _POSIX_C_SOURCE >= 199506L
 * 	POSIX.1c-1995 Threads extensions
 *
 * _POSIX_C_SOURCE >= 200112L
 * 	POSIX.1-2001 and C99
 *
 * _POSIX_C_SOURCE >= 200809L
 * 	POSIX.1-2008
 *
 * _XOPEN_SOURCE
 *	POSIX.1-1990 and XPG4
 *
 * _XOPEN_SOURCE_EXTENDED
 *	SUSv1 (POSIX.2-1992 plus XPG4v2)
 *
 * _XOPEN_SOURCE >= 500
 *	SUSv2 (POSIX.1c-1995 plus XSI)
 *
 * _XOPEN_SOURCE >= 600
 *	SUSv3 (POSIX.1-2001 plus XSI) and C99
 *
 * _XOPEN_SOURCE >= 700
 *	SUSv4 (POSIX.1-2008 plus XSI)
 *
 * _ISOC99_SOURCE or gcc -std=c99 or g++
 * 	ISO C99
 *
 * _ISOC11_SOURCE or gcc -std=c11 or g++ -std=c++11
 * 	ISO C11
 *
 * _ATFILE_SOURCE (implied by _POSIX_C_SOURCE >= 200809L)
 *	"at" functions
 *
 * _LARGEFILE_SOURCE (deprecated by _XOPEN_SOURCE >= 500)
 *	fseeko, ftello
 *
 * _GNU_SOURCE
 * 	All of the above plus GNU extensions
 *
 * _BSD_SOURCE (deprecated by _DEFAULT_SOURCE)
 * _SVID_SOURCE (deprecated by _DEFAULT_SOURCE)
 * _DEFAULT_SOURCE (or none of the above)
 * 	POSIX-1.2008 with BSD and SVr4 extensions
 *
 * _FORTIFY_SOURCE = 1 or 2
 * 	Object Size Checking function wrappers
 */
# 131 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/features.h" 3 4
#undef _DEFAULT_SOURCE
#define _DEFAULT_SOURCE 1



#undef _POSIX_SOURCE
#define _POSIX_SOURCE 1
#undef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE 200809L
# 158 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/features.h" 3 4
#undef _ATFILE_SOURCE
#define _ATFILE_SOURCE 1


/*
 * The following private macros are used throughout the headers to control
 * which symbols should be exposed.  They are for internal use only, as
 * indicated by the leading double underscore, and must never be used outside
 * of these headers.
 *
 * __POSIX_VISIBLE
 * 	any version of POSIX.1; enabled by default, or with _POSIX_SOURCE,
 * 	any value of _POSIX_C_SOURCE, or _XOPEN_SOURCE >= 500.
 *
 * __POSIX_VISIBLE >= 2
 * 	POSIX.2-1992; enabled by default, with _POSIX_C_SOURCE >= 2,
 * 	or _XOPEN_SOURCE >= 500.
 *
 * __POSIX_VISIBLE >= 199309
 * 	POSIX.1b-1993; enabled by default, with _POSIX_C_SOURCE >= 199309L,
 * 	or _XOPEN_SOURCE >= 500.
 *
 * __POSIX_VISIBLE >= 199506
 * 	POSIX.1c-1995; enabled by default, with _POSIX_C_SOURCE >= 199506L,
 * 	or _XOPEN_SOURCE >= 500.
 *
 * __POSIX_VISIBLE >= 200112
 * 	POSIX.1-2001; enabled by default, with _POSIX_C_SOURCE >= 200112L,
 * 	or _XOPEN_SOURCE >= 600.
 *
 * __POSIX_VISIBLE >= 200809
 * 	POSIX.1-2008; enabled by default, with _POSIX_C_SOURCE >= 200809L,
 * 	or _XOPEN_SOURCE >= 700.
 *
 * __XSI_VISIBLE
 *	XPG4 XSI extensions; enabled with any version of _XOPEN_SOURCE.
 *
 * __XSI_VISIBLE >= 4
 *	SUSv1 XSI extensions; enabled with both _XOPEN_SOURCE and
 * 	_XOPEN_SOURCE_EXTENDED together.
 *
 * __XSI_VISIBLE >= 500
 *	SUSv2 XSI extensions; enabled with _XOPEN_SOURCE >= 500.
 *
 * __XSI_VISIBLE >= 600
 *	SUSv3 XSI extensions; enabled with _XOPEN_SOURCE >= 600.
 *
 * __XSI_VISIBLE >= 700
 *	SUSv4 XSI extensions; enabled with _XOPEN_SOURCE >= 700.
 *
 * __ISO_C_VISIBLE >= 1999
 * 	ISO C99; enabled with gcc -std=c99 or newer (on by default since GCC 5),
 * 	any version of C++, or with _ISOC99_SOURCE, _POSIX_C_SOURCE >= 200112L,
 * 	or _XOPEN_SOURCE >= 600.
 *
 * __ISO_C_VISIBLE >= 2011
 * 	ISO C11; enabled with gcc -std=c11 or newer (on by default since GCC 5),
 * 	g++ -std=c++11 or newer (on by default since GCC 6), or with
 * 	_ISOC11_SOURCE.
 *
 * __ATFILE_VISIBLE
 *	"at" functions; enabled by default, with _ATFILE_SOURCE,
 * 	_POSIX_C_SOURCE >= 200809L, or _XOPEN_SOURCE >= 700.
 *
 * __LARGEFILE_VISIBLE
 *	fseeko, ftello; enabled with _LARGEFILE_SOURCE or _XOPEN_SOURCE >= 500.
 *
 * __BSD_VISIBLE
 * 	BSD extensions; enabled by default, or with _BSD_SOURCE.
 *
 * __SVID_VISIBLE
 * 	SVr4 extensions; enabled by default, or with _SVID_SOURCE.
 *
 * __MISC_VISIBLE
 * 	Extensions found in both BSD and SVr4 (shorthand for
 * 	(__BSD_VISIBLE || __SVID_VISIBLE)), or newlib-specific
 * 	extensions; enabled by default.
 *
 * __GNU_VISIBLE
 * 	GNU extensions; enabled with _GNU_SOURCE.
 *
 * __SSP_FORTIFY_LEVEL
 * 	Object Size Checking; defined to 0 (off), 1, or 2.
 *
 * In all cases above, "enabled by default" means either by defining
 * _DEFAULT_SOURCE, or by not defining any of the public feature test macros.
 */


#define __ATFILE_VISIBLE 1





#define __BSD_VISIBLE 1







#define __GNU_VISIBLE 0




#define __ISO_C_VISIBLE 2011
# 277 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/features.h" 3 4
#define __LARGEFILE_VISIBLE 0



#define __MISC_VISIBLE 1





#define __POSIX_VISIBLE 200809
# 303 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/features.h" 3 4
#define __SVID_VISIBLE 1
# 319 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/features.h" 3 4
#define __XSI_VISIBLE 0
# 330 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/features.h" 3 4
#define __SSP_FORTIFY_LEVEL 0


/* RTEMS adheres to POSIX -- 1003.1b with some features from annexes.  */
# 390 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/features.h" 3 4
/* XMK loosely adheres to POSIX -- 1003.1 */
# 9 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/machine/_default_types.h" 2 3 4

/*
 * Guess on types by examining *_MIN / *_MAX defines.
 */

/* GCC >= 3.3.0 has __<val>__ implicitly defined. */
#define __EXP(x) __ ##x ##__






/* Check if "long long" is 64bit wide */
/* Modern GCCs provide __LONG_LONG_MAX__, SUSv3 wants LLONG_MAX */


#define __have_longlong64 1


/* Check if "long" is 64bit or 32bit wide */



#define __have_long32 1







typedef signed char __int8_t;

typedef unsigned char __uint8_t;



#define ___int8_t_defined 1







typedef short int __int16_t;

typedef short unsigned int __uint16_t;



#define ___int16_t_defined 1
# 77 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;



#define ___int32_t_defined 1
# 103 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;



#define ___int64_t_defined 1
# 134 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;



#define ___int_least8_t_defined 1
# 160 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;



#define ___int_least16_t_defined 1
# 182 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;



#define ___int_least32_t_defined 1
# 200 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;



#define ___int_least64_t_defined 1







typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 244 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/machine/_default_types.h" 3 4
#undef __EXP
# 13 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 1 3 4
/*
 * Copyright (c) 2004, 2005 by
 * Ralf Corsepius, Ulm/Germany. All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software
 * is freely granted, provided that this notice is preserved.
 */


#define _SYS__INTSUP_H 

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/features.h" 1 3 4
/*
 *  Written by Joel Sherrill <joel@OARcorp.com>.
 *
 *  COPYRIGHT (c) 1989-2014.
 *
 *  On-Line Applications Research Corporation (OAR).
 *
 *  Permission to use, copy, modify, and distribute this software for any
 *  purpose without fee is hereby granted, provided that this entire notice
 *  is included in all copies of any software which is or includes a copy
 *  or modification of this software.
 *
 *  THIS SOFTWARE IS BEING PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED
 *  WARRANTY.  IN PARTICULAR,  THE AUTHOR MAKES NO REPRESENTATION
 *  OR WARRANTY OF ANY KIND CONCERNING THE MERCHANTABILITY OF THIS
 *  SOFTWARE OR ITS FITNESS FOR ANY PARTICULAR PURPOSE.
 *
 *  $Id$
 */
# 13 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 2 3 4


/* gcc > 3.2 implicitly defines the values we are interested */
#define __STDINT_EXP(x) __ ##x ##__





/* Determine how intptr_t and intN_t fastN_t and leastN_t are defined by gcc
   for this target.  This is used to determine the correct printf() constant in
   inttypes.h and other  constants in stdint.h.
   So we end up with
   ?(signed|unsigned) char == 0
   ?(signed|unsigned) short == 1
   ?(signed|unsigned) int == 2
   ?(signed|unsigned) short int == 3
   ?(signed|unsigned) long == 4
   ?(signed|unsigned) long int == 6
   ?(signed|unsigned) long long == 8
   ?(signed|unsigned) long long int == 10
 */
       
       
       
       
       
       
       
#undef signed
#undef unsigned
#undef char
#undef short
#undef int
#undef __int20
#undef long
#define signed +0
#define unsigned +0
#define char +0
#define short +1
#define __int20 +2
#define int +2
#define long +4
# 64 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 3 4
#define _INTPTR_EQ_INT 






#define _INT32_EQ_LONG 







#define __INT8 "hh"
# 90 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __INT16 "h"
# 101 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __INT32 "l"
# 110 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __INT64 "ll"






#define __FAST8 
# 126 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __FAST16 






#define __FAST32 
# 144 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __FAST64 "ll"



#define __LEAST8 "hh"
# 159 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __LEAST16 "h"
# 170 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __LEAST32 "l"
# 179 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __LEAST64 "ll"

#undef signed
#undef unsigned
#undef char
#undef short
#undef int
#undef long
       
       
       
       
       
# 191 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_intsup.h" 3 4
#undef __int20
       
       
# 14 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_stdint.h" 1 3 4
/*
 * Copyright (c) 2004, 2005 by
 * Ralf Corsepius, Ulm/Germany. All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software
 * is freely granted, provided that this notice is preserved.
 */


#define _SYS__STDINT_H 

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/machine/_default_types.h" 1 3 4
/*
 *  $Id$
 */
# 13 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/sys/_stdint.h" 2 3 4







typedef __int8_t int8_t ;
#define _INT8_T_DECLARED 


typedef __uint8_t uint8_t ;
#define _UINT8_T_DECLARED 

#define __int8_t_defined 1




typedef __int16_t int16_t ;
#define _INT16_T_DECLARED 


typedef __uint16_t uint16_t ;
#define _UINT16_T_DECLARED 

#define __int16_t_defined 1




typedef __int32_t int32_t ;
#define _INT32_T_DECLARED 


typedef __uint32_t uint32_t ;
#define _UINT32_T_DECLARED 

#define __int32_t_defined 1




typedef __int64_t int64_t ;
#define _INT64_T_DECLARED 


typedef __uint64_t uint64_t ;
#define _UINT64_T_DECLARED 

#define __int64_t_defined 1



typedef __intmax_t intmax_t;
#define _INTMAX_T_DECLARED 



typedef __uintmax_t uintmax_t;
#define _UINTMAX_T_DECLARED 



typedef __intptr_t intptr_t;
#define _INTPTR_T_DECLARED 



typedef __uintptr_t uintptr_t;
#define _UINTPTR_T_DECLARED 
# 15 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;
#define __int_least8_t_defined 1



typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;
#define __int_least16_t_defined 1



typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;
#define __int_least32_t_defined 1



typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
#define __int_least64_t_defined 1


/*
 * Fastest minimum-width integer types
 *
 * Assume int to be the fastest type for all types with a width 
 * less than __INT_MAX__ rsp. INT_MAX
 */

  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
#define __int_fast8_t_defined 1







  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
#define __int_fast16_t_defined 1







  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
#define __int_fast32_t_defined 1







  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
#define __int_fast64_t_defined 1






/*
 * Fall back to [u]int_least<N>_t for [u]int_fast<N>_t types
 * not having been defined, yet.
 * Leave undefined, if [u]int_least<N>_t should not be available.
 */
# 128 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INTPTR_MIN (-__INTPTR_MAX__ - 1)
#define INTPTR_MAX (__INTPTR_MAX__)
#define UINTPTR_MAX (__UINTPTR_MAX__)
# 149 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
/* Limits of Specified-Width Integer Types */


#define INT8_MIN (-__INT8_MAX__ - 1)
#define INT8_MAX (__INT8_MAX__)
#define UINT8_MAX (__UINT8_MAX__)







#define INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)
#define INT_LEAST8_MAX (__INT_LEAST8_MAX__)
#define UINT_LEAST8_MAX (__UINT_LEAST8_MAX__)
# 174 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT16_MIN (-__INT16_MAX__ - 1)
#define INT16_MAX (__INT16_MAX__)
#define UINT16_MAX (__UINT16_MAX__)







#define INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)
#define INT_LEAST16_MAX (__INT_LEAST16_MAX__)
#define UINT_LEAST16_MAX (__UINT_LEAST16_MAX__)
# 196 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT32_MIN (-__INT32_MAX__ - 1)
#define INT32_MAX (__INT32_MAX__)
#define UINT32_MAX (__UINT32_MAX__)
# 212 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)
#define INT_LEAST32_MAX (__INT_LEAST32_MAX__)
#define UINT_LEAST32_MAX (__UINT_LEAST32_MAX__)
# 230 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT64_MIN (-__INT64_MAX__ - 1)
#define INT64_MAX (__INT64_MAX__)
#define UINT64_MAX (__UINT64_MAX__)
# 246 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)
#define INT_LEAST64_MAX (__INT_LEAST64_MAX__)
#define UINT_LEAST64_MAX (__UINT_LEAST64_MAX__)
# 262 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)
#define INT_FAST8_MAX (__INT_FAST8_MAX__)
#define UINT_FAST8_MAX (__UINT_FAST8_MAX__)
# 278 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)
#define INT_FAST16_MAX (__INT_FAST16_MAX__)
#define UINT_FAST16_MAX (__UINT_FAST16_MAX__)
# 294 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)
#define INT_FAST32_MAX (__INT_FAST32_MAX__)
#define UINT_FAST32_MAX (__UINT_FAST32_MAX__)
# 310 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)
#define INT_FAST64_MAX (__INT_FAST64_MAX__)
#define UINT_FAST64_MAX (__UINT_FAST64_MAX__)
# 326 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INTMAX_MAX (__INTMAX_MAX__)
#define INTMAX_MIN (-INTMAX_MAX - 1)







#define UINTMAX_MAX (__UINTMAX_MAX__)





/* This must match size_t in stddef.h, currently long unsigned int */

#define SIZE_MAX (__SIZE_MAX__)




/* This must match sig_atomic_t in <signal.h> (currently int) */
#define SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)
#define SIG_ATOMIC_MAX (__STDINT_EXP(INT_MAX))

/* This must match ptrdiff_t  in <stddef.h> (currently long int) */

#define PTRDIFF_MAX (__PTRDIFF_MAX__)



#define PTRDIFF_MIN (-PTRDIFF_MAX - 1)

/* This must match definition in <wchar.h> */


#define WCHAR_MIN (__WCHAR_MIN__)







/* This must match definition in <wchar.h> */


#define WCHAR_MAX (__WCHAR_MAX__)







/* wint_t is unsigned int on almost all GCC targets.  */

#define WINT_MAX (__WINT_MAX__)




#define WINT_MIN (__WINT_MIN__)




/** Macros for minimum-width integer constant expressions */

#define INT8_C(x) __INT8_C(x)
#define UINT8_C(x) __UINT8_C(x)
# 408 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT16_C(x) __INT16_C(x)
#define UINT16_C(x) __UINT16_C(x)
# 420 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT32_C(x) __INT32_C(x)
#define UINT32_C(x) __UINT32_C(x)
# 433 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
#define INT64_C(x) __INT64_C(x)
#define UINT64_C(x) __UINT64_C(x)
# 447 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/arm-none-eabi/include/stdint.h" 3 4
/** Macros for greatest-width integer constant expression */

#define INTMAX_C(x) __INTMAX_C(x)
#define UINTMAX_C(x) __UINTMAX_C(x)
# 10 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdint.h" 2 3 4



#define _GCC_WRAP_STDINT_H 
# 32 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/string.h" 1

# 1 "repos/apache-mynewt-core/libc/baselibc/include/string.h"
/*
 * string.h
 */


#define _STRING_H 

# 1 "repos/apache-mynewt-core/libc/baselibc/include/klibc/extern.h" 1
/*
 * klibc/extern.h
 */


#define _KLIBC_EXTERN_H 
# 15 "repos/apache-mynewt-core/libc/baselibc/include/klibc/extern.h"
#define __extern extern


#define __alias(x) __attribute__((weak, alias(x)))
# 9 "repos/apache-mynewt-core/libc/baselibc/include/string.h" 2
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 1 3 4

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
/* Copyright (C) 1989-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */
# 10 "repos/apache-mynewt-core/libc/baselibc/include/string.h" 2






# 15 "repos/apache-mynewt-core/libc/baselibc/include/string.h"
extern void *memccpy(void *, const void *, int, size_t);
extern void *memchr(const void *, int, size_t);
extern void *memrchr(const void *, int, size_t);
extern int memcmp(const void *, const void *, size_t);
extern void *memcpy(void *, const void *, size_t);
extern void *memmove(void *, const void *, size_t);
extern void *memset(void *, int, size_t);
extern void *memmem(const void *, size_t, const void *, size_t);
extern void memswap(void *, void *, size_t);
extern void bzero(void *, size_t);
extern int strcasecmp(const char *, const char *);
extern int strncasecmp(const char *, const char *, size_t);
extern char *strcat(char *, const char *);
extern char *strchr(const char *, int);
extern char *index(const char *, int);
extern char *strrchr(const char *, int);
extern char *rindex(const char *, int);
extern int strcmp(const char *, const char *);
extern char *strcpy(char *, const char *);
extern size_t strcspn(const char *, const char *);
extern char *strdup(const char *);
extern char *strndup(const char *, size_t);
extern size_t strlen(const char *);
extern size_t strnlen(const char *, size_t);
extern char *strncat(char *, const char *, size_t);
extern size_t strlcat(char *, const char *, size_t);
extern int strncmp(const char *, const char *, size_t);
extern char *strncpy(char *, const char *, size_t);
extern size_t strlcpy(char *, const char *, size_t);
extern char *strpbrk(const char *, const char *);
extern char *strsep(char **, const char *);
extern size_t strspn(const char *, const char *);
extern char *strstr(const char *, const char *);
extern char *strnstr(const char *, const char *, size_t);
extern char *strtok(char *, const char *);
extern char *strtok_r(char *, const char *, char **);

/* Some dummy functions to avoid errors with C++ cstring */
inline static int strcoll(const char *s1, const char *s2)
{
 return strcmp(s1, s2);
}

inline static size_t strxfrm(char *dest, const char *src, size_t n)
{
 strncpy(dest, src, n);
 return strlen(src);
}
# 33 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 1
/*
 * stdio.h
 */


#define _STDIO_H 

# 1 "repos/apache-mynewt-core/libc/baselibc/include/klibc/extern.h" 1
/*
 * klibc/extern.h
 */
# 9 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/klibc/inline.h" 1
/*
 * klibc/inline.h
 */


#define _KLIBC_INLINE_H 






#define __extern_inline extern inline __attribute__((gnu_inline))
# 10 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 2
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdarg.h" 1 3 4

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdarg.h" 3 4
/* Copyright (C) 1989-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.15  Variable arguments  <stdarg.h>
 */




#define _STDARG_H 
#define _ANSI_STDARG_H_ 

#undef __need___va_list

/* Define __gnuc_va_list.  */


#define __GNUC_VA_LIST 
typedef __builtin_va_list __gnuc_va_list;


/* Define the standard macros for the user,
   if this invocation was from the user program.  */


#define va_start(v,l) __builtin_va_start(v,l)
#define va_end(v) __builtin_va_end(v)
#define va_arg(v,l) __builtin_va_arg(v,l)


#define va_copy(d,s) __builtin_va_copy(d,s)

#define __va_copy(d,s) __builtin_va_copy(d,s)

/* Define va_list, if desired, from __gnuc_va_list. */
/* We deliberately do not define va_list when called from
   stdio.h, because ANSI C says that stdio.h is not supposed to define
   va_list.  stdio.h needs to have access to that data type, 
   but must not use that name.  It should use the name __gnuc_va_list,
   which is safe because it is reserved for the implementation.  */
# 86 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdarg.h" 3 4
/* The macro _VA_LIST_ is the same thing used by this file in Ultrix.
   But on BSD NET2 we must not test or define or undef it.
   (Note that the comments in NET 2's ansi.h
   are incorrect for _VA_LIST_--see stdio.h!)  */

/* The macro _VA_LIST_DEFINED is used in Windows NT 3.5  */

/* The macro _VA_LIST is used in SCO Unix 3.2.  */

/* The macro _VA_LIST_T_H is used in the Bull dpx2  */

/* The macro __va_list__ is used by BeOS.  */

typedef __gnuc_va_list va_list;





#define _VA_LIST_ 


#define _VA_LIST 


#define _VA_LIST_DEFINED 


#define _VA_LIST_T_H 


#define __va_list__ 
# 11 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 2
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 1 3 4
/* Copyright (C) 1989-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */
# 12 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/string.h" 1

# 1 "repos/apache-mynewt-core/libc/baselibc/include/string.h"
/*
 * string.h
 */
# 13 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 2





/* The File structure is designed to be compatible with ChibiOS/RT type
 * BaseSequentialStream.
 */
struct File;

typedef struct File FILE;

struct File_methods
{
    size_t (*write)(FILE* instance, const char *bp, size_t n);
    size_t (*read)(FILE* instance, char *bp, size_t n);
};

struct File
{
    const struct File_methods *vmt;
};


#define EOF (-1)



#define BUFSIZ 1


/* Standard file descriptors - implement these globals yourself. */
extern FILE* const stdin;
extern FILE* const stdout;
extern FILE* const stderr;

/* Wrappers around stream write and read */
extern inline __attribute__((gnu_inline)) size_t fread(void *buf, size_t size, size_t nmemb, FILE *stream)
{
    if (stream->vmt->read == 
# 52 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 3 4
                            ((void *)0)
# 52 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h"
                                ) return 0;
    return stream->vmt->read(stream, (char*)buf, size*nmemb) / size;
}

extern inline __attribute__((gnu_inline)) size_t fwrite(const void *buf, size_t size, size_t nmemb, FILE *stream)
{
    if (stream->vmt->write == 
# 58 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 3 4
                             ((void *)0)
# 58 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h"
                                 ) return 0;
    return stream->vmt->write(stream, (char*)buf, size*nmemb) / size;
}

extern inline __attribute__((gnu_inline)) int fputs(const char *s, FILE *f)
{
 return fwrite(s, 1, strlen(s), f);
}

extern inline __attribute__((gnu_inline)) int puts(const char *s)
{
 return fwrite(s, 1, strlen(s), stdout) + fwrite("\n", 1, 1, stdout);
}

extern inline __attribute__((gnu_inline)) int fputc(int c, FILE *f)
{
 unsigned char ch = c;
 return fwrite(&ch, 1, 1, f) == 1 ? ch : (-1);
}

extern char *fgets(char *, int, FILE *);
extern inline __attribute__((gnu_inline)) int fgetc(FILE *f)
{
 unsigned char ch;
 return fread(&ch, 1, 1, f) == 1 ? ch : (-1);
}

extern int errno;
extern inline __attribute__((gnu_inline)) char *strerror(int errnum)
{
 return (char*)"error_str";
}

#define putc(c,f) fputc((c),(f))
#define putchar(c) fputc((c),stdout)
#define getc(f) fgetc(f)
#define getchar() fgetc(stdin)

extern inline __attribute__((gnu_inline)) int fflush(FILE *stream)
{
 return 0;
}

extern int printf(const char *, ...);
extern int vprintf(const char *, va_list);
extern int fprintf(FILE *, const char *, ...);
extern int vfprintf(FILE *, const char *, va_list);
extern int sprintf(char *, const char *, ...);
extern int vsprintf(char *, const char *, va_list);
extern int snprintf(char *, size_t n, const char *, ...);
extern int vsnprintf(char *, size_t n, const char *, va_list);
extern int asprintf(char **, const char *, ...);
extern int vasprintf(char **, const char *, va_list);

extern int sscanf(const char *, const char *, ...);
extern int vsscanf(const char *, const char *, va_list);

/* Open a memory buffer for writing.
 Note: Does not write null terminator.*/
struct MemFile
{
    struct File file;
    char *buffer;
    size_t bytes_written;
    size_t size;
};

FILE *fmemopen_w(struct MemFile* storage, char *buffer, size_t size);
# 34 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 2




# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdbool.h" 1 3 4

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdbool.h" 3 4
/* Copyright (C) 1998-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.16  Boolean type and values  <stdbool.h>
 */


#define _STDBOOL_H 



#define bool _Bool
#define true 1
#define false 0
# 51 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdbool.h" 3 4
/* Signal that all the definitions are present.  */
#define __bool_true_false_are_defined 1
# 39 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 2
# 53 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
#define CBOR_API 


#define CBOR_PRIVATE_API 






#define CBOR_INLINE_API static CBOR_INLINE



#define CBOR_INLINE __inline__
# 76 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"

# 76 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
typedef enum CborType {
    CborIntegerType = 0x00,
    CborByteStringType = 0x40,
    CborTextStringType = 0x60,
    CborArrayType = 0x80,
    CborMapType = 0xa0,
    CborTagType = 0xc0,
    CborSimpleType = 0xe0,
    CborBooleanType = 0xf5,
    CborNullType = 0xf6,
    CborUndefinedType = 0xf7,
    CborHalfFloatType = 0xf9,
    CborFloatType = 0xfa,
    CborDoubleType = 0xfb,

    CborInvalidType = 0xff /* equivalent to the break byte, so it will never be used */
} CborType;

typedef uint64_t CborTag;
typedef enum CborKnownTags {
    CborDateTimeStringTag = 0, /* RFC 3339 format: YYYY-MM-DD hh:mm:ss+zzzz */
    CborUnixTime_tTag = 1,
    CborPositiveBignumTag = 2,
    CborNegativeBignumTag = 3,
    CborDecimalTag = 4,
    CborBigfloatTag = 5,
    CborExpectedBase64urlTag = 21,
    CborExpectedBase64Tag = 22,
    CborExpectedBase16Tag = 23,
    CborUriTag = 32,
    CborBase64urlTag = 33,
    CborBase64Tag = 34,
    CborRegularExpressionTag = 35,
    CborMimeMessageTag = 36, /* RFC 2045-2047 */
    CborSignatureTag = 55799
} CborKnownTags;

/* Error API */

typedef enum CborError {
    CborNoError = 0,

    /* errors in all modes */
    CborUnknownError,
    CborErrorUnknownLength, /* request for length in array, map, or string with indeterminate length */
    CborErrorAdvancePastEOF,
    CborErrorIO,

    /* parser errors streaming errors */
    CborErrorGarbageAtEnd = 256,
    CborErrorUnexpectedEOF,
    CborErrorUnexpectedBreak,
    CborErrorUnknownType, /* can only heppen in major type 7 */
    CborErrorIllegalType, /* type not allowed here */
    CborErrorIllegalNumber,
    CborErrorIllegalSimpleType, /* types of value less than 32 encoded in two bytes */

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

 const char *cbor_error_string(CborError error);

struct cbor_encoder_writer;

typedef int (cbor_encoder_write)(struct cbor_encoder_writer *, const char *data, int len);

typedef struct cbor_encoder_writer {
    cbor_encoder_write *write;
    int bytes_written;
} cbor_encoder_writer;

struct cbor_iovec {
    void *iov_base;
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

static const size_t CborIndefiniteLength = 
# 183 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
                                          (0xffffffffU)
# 183 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                                                  ;


 void cbor_encoder_init(CborEncoder *encoder, cbor_encoder_writer *pwriter, int flags);
 CborError cbor_encode_uint(CborEncoder *encoder, uint64_t value);
 CborError cbor_encode_int(CborEncoder *encoder, int64_t value);
 CborError cbor_encode_negative_int(CborEncoder *encoder, uint64_t absolute_value);
 CborError cbor_encode_simple_value(CborEncoder *encoder, uint8_t value);
 CborError cbor_encode_tag(CborEncoder *encoder, CborTag tag);
 CborError cbor_encode_text_string(CborEncoder *encoder, const char *string, size_t length);
static __inline__ CborError cbor_encode_text_stringz(CborEncoder *encoder, const char *string)
{ return cbor_encode_text_string(encoder, string, strlen(string)); }
 CborError cbor_encode_byte_string(CborEncoder *encoder, const uint8_t *string, size_t length);
 CborError cbor_encode_byte_iovec(CborEncoder *encoder,
                                          const struct cbor_iovec iov[],
                                          int iov_len);
 CborError cbor_encode_floating_point(CborEncoder *encoder, CborType fpType, const void *value);
static __inline__ CborError cbor_encode_bytes_written(CborEncoder *encoder)
{ return (CborError) encoder->writer->bytes_written; }
static __inline__ CborError cbor_encode_boolean(CborEncoder *encoder, 
# 202 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
                                                                   _Bool 
# 202 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                                                                        value)
{ return cbor_encode_simple_value(encoder, (int)value - 1 + (CborBooleanType & 0x1f)); }
static __inline__ CborError cbor_encode_null(CborEncoder *encoder)
{ return cbor_encode_simple_value(encoder, CborNullType & 0x1f); }
static __inline__ CborError cbor_encode_undefined(CborEncoder *encoder)
{ return cbor_encode_simple_value(encoder, CborUndefinedType & 0x1f); }

static __inline__ CborError cbor_encode_half_float(CborEncoder *encoder, const void *value)
{ return cbor_encode_floating_point(encoder, CborHalfFloatType, value); }
static __inline__ CborError cbor_encode_float(CborEncoder *encoder, float value)
{ return cbor_encode_floating_point(encoder, CborFloatType, &value); }
static __inline__ CborError cbor_encode_double(CborEncoder *encoder, double value)
{ return cbor_encode_floating_point(encoder, CborDoubleType, &value); }

 CborError cbor_encoder_create_array(CborEncoder *encoder, CborEncoder *arrayEncoder, size_t length);
 CborError cbor_encoder_create_map(CborEncoder *encoder, CborEncoder *mapEncoder, size_t length);
 CborError cbor_encoder_create_indef_byte_string(CborEncoder *encoder, CborEncoder *stringEncoder);
 CborError cbor_encoder_close_container(CborEncoder *encoder, const CborEncoder *containerEncoder);
 CborError cbor_encoder_close_container_checked(CborEncoder *encoder, const CborEncoder *containerEncoder);

/* Parser API */

enum CborParserIteratorFlags
{
    CborIteratorFlag_IntegerValueTooLarge = 0x01,
    CborIteratorFlag_NegativeInteger = 0x02,
    CborIteratorFlag_UnknownLength = 0x04,
    CborIteratorFlag_ContainerIsMap = 0x20
};

struct cbor_decoder_reader;

typedef uint8_t (cbor_reader_get8)(struct cbor_decoder_reader *d, int offset);
typedef uint16_t (cbor_reader_get16)(struct cbor_decoder_reader *d, int offset);
typedef uint32_t (cbor_reader_get32)(struct cbor_decoder_reader *d, int offset);
typedef uint64_t (cbor_reader_get64)(struct cbor_decoder_reader *d, int offset);
typedef uintptr_t (cbor_memcmp)(struct cbor_decoder_reader *d, char *buf, int offset, size_t len);
typedef uintptr_t (cbor_memcpy)(struct cbor_decoder_reader *d, char *buf, int offset, size_t len);

struct cbor_decoder_reader {
    cbor_reader_get8 *get8;
    cbor_reader_get16 *get16;
    cbor_reader_get32 *get32;
    cbor_reader_get64 *get64;
    cbor_memcmp *cmp;
    cbor_memcpy *cpy;
    size_t message_size;
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

 CborError cbor_parser_init(struct cbor_decoder_reader *d, int flags, CborParser *parser, CborValue *it);

static __inline__ 
# 272 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 272 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_at_end(const CborValue *it)
{ return it->remaining == 0; }
 CborError cbor_value_advance_fixed(CborValue *it);
 CborError cbor_value_advance(CborValue *it);
static __inline__ 
# 276 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 276 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_container(const CborValue *it)
{ return it->type == CborArrayType || it->type == CborMapType; }
 CborError cbor_value_enter_container(const CborValue *it, CborValue *recursed);
 CborError cbor_value_leave_container(CborValue *it, const CborValue *recursed);

 uint64_t _cbor_value_decode_int64_internal(const CborValue *value);
static __inline__ uint64_t _cbor_value_extract_int64_helper(const CborValue *value)
{
    return value->flags & CborIteratorFlag_IntegerValueTooLarge ?
                _cbor_value_decode_int64_internal(value) : value->extra;
}

static __inline__ 
# 288 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 288 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_valid(const CborValue *value)
{ return value && value->type != CborInvalidType; }
static __inline__ CborType cbor_value_get_type(const CborValue *value)
{ return (CborType)value->type; }

/* Null & undefined type */
static __inline__ 
# 294 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 294 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_null(const CborValue *value)
{ return value->type == CborNullType; }
static __inline__ 
# 296 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 296 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_undefined(const CborValue *value)
{ return value->type == CborUndefinedType; }

/* Booleans */
static __inline__ 
# 300 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 300 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_boolean(const CborValue *value)
{ return value->type == CborBooleanType; }
static __inline__ CborError cbor_value_get_boolean(const CborValue *value, 
# 302 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
                                                                        _Bool 
# 302 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                                                                             *result)
{
    ((cbor_value_is_boolean(value)) ? (void)0 : __assert_func(
# 304 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 304 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 304 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 304 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 304 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 304 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    *result = !!value->extra;
    return CborNoError;
}

/* Simple types */
static __inline__ 
# 310 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 310 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_simple_type(const CborValue *value)
{ return value->type == CborSimpleType; }
static __inline__ CborError cbor_value_get_simple_type(const CborValue *value, uint8_t *result)
{
    ((cbor_value_is_simple_type(value)) ? (void)0 : __assert_func(
# 314 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 314 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 314 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 314 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 314 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 314 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    *result = (uint8_t)value->extra;
    return CborNoError;
}

/* Integers */
static __inline__ 
# 320 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 320 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_integer(const CborValue *value)
{ return value->type == CborIntegerType; }
static __inline__ 
# 322 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 322 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_unsigned_integer(const CborValue *value)
{ return cbor_value_is_integer(value) && (value->flags & CborIteratorFlag_NegativeInteger) == 0; }
static __inline__ 
# 324 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 324 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_negative_integer(const CborValue *value)
{ return cbor_value_is_integer(value) && (value->flags & CborIteratorFlag_NegativeInteger); }

static __inline__ CborError cbor_value_get_raw_integer(const CborValue *value, uint64_t *result)
{
    ((cbor_value_is_integer(value)) ? (void)0 : __assert_func(
# 329 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 329 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 329 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 329 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 329 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 329 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    *result = _cbor_value_extract_int64_helper(value);
    return CborNoError;
}

static __inline__ CborError cbor_value_get_uint64(const CborValue *value, uint64_t *result)
{
    ((cbor_value_is_unsigned_integer(value)) ? (void)0 : __assert_func(
# 336 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 336 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 336 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 336 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 336 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 336 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    *result = _cbor_value_extract_int64_helper(value);
    return CborNoError;
}

static __inline__ CborError cbor_value_get_int64(const CborValue *value, int64_t *result)
{
    ((cbor_value_is_integer(value)) ? (void)0 : __assert_func(
# 343 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 343 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 343 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 343 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 343 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 343 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    *result = (int64_t) _cbor_value_extract_int64_helper(value);
    if (value->flags & CborIteratorFlag_NegativeInteger)
        *result = -*result - 1;
    return CborNoError;
}

static __inline__ CborError cbor_value_get_int(const CborValue *value, int *result)
{
    ((cbor_value_is_integer(value)) ? (void)0 : __assert_func(
# 352 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 352 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 352 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 352 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 352 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 352 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    *result = (int) _cbor_value_extract_int64_helper(value);
    if (value->flags & CborIteratorFlag_NegativeInteger)
        *result = -*result - 1;
    return CborNoError;
}

 CborError cbor_value_get_int64_checked(const CborValue *value, int64_t *result);
 CborError cbor_value_get_int_checked(const CborValue *value, int *result);

static __inline__ 
# 362 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 362 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_length_known(const CborValue *value)
{ return (value->flags & CborIteratorFlag_UnknownLength) == 0; }

/* Tags */
static __inline__ 
# 366 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 366 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_tag(const CborValue *value)
{ return value->type == CborTagType; }
static __inline__ CborError cbor_value_get_tag(const CborValue *value, CborTag *result)
{
    ((cbor_value_is_tag(value)) ? (void)0 : __assert_func(
# 370 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 370 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 370 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 370 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 370 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 370 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    *result = _cbor_value_extract_int64_helper(value);
    return CborNoError;
}
 CborError cbor_value_skip_tag(CborValue *it);

/* Strings */
static __inline__ 
# 377 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 377 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_byte_string(const CborValue *value)
{ return value->type == CborByteStringType; }
static __inline__ 
# 379 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 379 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_text_string(const CborValue *value)
{ return value->type == CborTextStringType; }

static __inline__ CborError cbor_value_get_string_length(const CborValue *value, size_t *length)
{
    ((cbor_value_is_byte_string(value) || cbor_value_is_text_string(value)) ? (void)0 : __assert_func(
# 384 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 384 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 384 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 384 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 384 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 384 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    if (!cbor_value_is_length_known(value))
        return CborErrorUnknownLength;
    uint64_t v = _cbor_value_extract_int64_helper(value);
    *length = v;
    if (*length != v)
        return CborErrorDataTooLarge;
    return CborNoError;
}

 CborError _cbor_value_copy_string(const CborValue *value, void *buffer,
                                                   size_t *buflen, CborValue *next);
 CborError _cbor_value_dup_string(const CborValue *value, void **buffer,
                                                  size_t *buflen, CborValue *next);

 CborError cbor_value_calculate_string_length(const CborValue *value, size_t *length);

static __inline__ CborError cbor_value_copy_text_string(const CborValue *value, char *buffer,
                                                      size_t *buflen, CborValue *next)
{
    ((cbor_value_is_text_string(value)) ? (void)0 : __assert_func(
# 404 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 404 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 404 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 404 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 404 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 404 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    return _cbor_value_copy_string(value, buffer, buflen, next);
}
static __inline__ CborError cbor_value_copy_byte_string(const CborValue *value, uint8_t *buffer,
                                                      size_t *buflen, CborValue *next)
{
    ((cbor_value_is_byte_string(value)) ? (void)0 : __assert_func(
# 410 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 410 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 410 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 410 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 410 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 410 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    return _cbor_value_copy_string(value, buffer, buflen, next);
}

static __inline__ CborError cbor_value_dup_text_string(const CborValue *value, char **buffer,
                                                     size_t *buflen, CborValue *next)
{
    ((cbor_value_is_text_string(value)) ? (void)0 : __assert_func(
# 417 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 417 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 417 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 417 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 417 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 417 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    return _cbor_value_dup_string(value, (void **)buffer, buflen, next);
}
static __inline__ CborError cbor_value_dup_byte_string(const CborValue *value, uint8_t **buffer,
                                                     size_t *buflen, CborValue *next)
{
    ((cbor_value_is_byte_string(value)) ? (void)0 : __assert_func(
# 423 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 423 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 423 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 423 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 423 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 423 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    return _cbor_value_dup_string(value, (void **)buffer, buflen, next);
}

/* ### TBD: partial reading API */

 CborError cbor_value_text_string_equals(const CborValue *value, const char *string, 
# 429 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
                                                                                            _Bool 
# 429 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                                                                                                 *result);

/* Maps and arrays */
static __inline__ 
# 432 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 432 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_array(const CborValue *value)
{ return value->type == CborArrayType; }
static __inline__ 
# 434 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 434 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_map(const CborValue *value)
{ return value->type == CborMapType; }

static __inline__ CborError cbor_value_get_array_length(const CborValue *value, size_t *length)
{
    ((cbor_value_is_array(value)) ? (void)0 : __assert_func(
# 439 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 439 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 439 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 439 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 439 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 439 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    if (!cbor_value_is_length_known(value))
        return CborErrorUnknownLength;
    uint64_t v = _cbor_value_extract_int64_helper(value);
    *length = v;
    if (*length != v)
        return CborErrorDataTooLarge;
    return CborNoError;
}

static __inline__ CborError cbor_value_get_map_length(const CborValue *value, size_t *length)
{
    ((cbor_value_is_map(value)) ? (void)0 : __assert_func(
# 451 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 451 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 451 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 451 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 451 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 451 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    if (!cbor_value_is_length_known(value))
        return CborErrorUnknownLength;
    uint64_t v = _cbor_value_extract_int64_helper(value);
    *length = v;
    if (*length != v)
        return CborErrorDataTooLarge;
    return CborNoError;
}

 CborError cbor_value_map_find_value(const CborValue *map, const char *string, CborValue *element);

/* Floating point */
static __inline__ 
# 464 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 464 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_half_float(const CborValue *value)
{ return value->type == CborHalfFloatType; }
 CborError cbor_value_get_half_float(const CborValue *value, void *result);

static __inline__ 
# 468 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 468 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_float(const CborValue *value)
{ return value->type == CborFloatType; }
static __inline__ CborError cbor_value_get_float(const CborValue *value, float *result)
{
    ((cbor_value_is_float(value)) ? (void)0 : __assert_func(
# 472 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 472 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 472 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 472 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 472 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 472 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    ((value->flags & CborIteratorFlag_IntegerValueTooLarge) ? (void)0 : __assert_func(
# 473 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 473 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 473 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 473 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 473 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 473 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    uint32_t data = (uint32_t)_cbor_value_decode_int64_internal(value);
    memcpy(result, &data, sizeof(*result));
    return CborNoError;
}

static __inline__ 
# 479 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
               _Bool 
# 479 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                    cbor_value_is_double(const CborValue *value)
{ return value->type == CborDoubleType; }
static __inline__ CborError cbor_value_get_double(const CborValue *value, double *result)
{
    ((cbor_value_is_double(value)) ? (void)0 : __assert_func(
# 483 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 483 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 483 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 483 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 483 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 483 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    ((value->flags & CborIteratorFlag_IntegerValueTooLarge) ? (void)0 : __assert_func(
# 484 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 484 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 0, 
# 484 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 484 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   , 
# 484 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
   ((void *)0)
# 484 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
   ));
    uint64_t data = _cbor_value_decode_int64_internal(value);
    memcpy(result, &data, sizeof(*result));
    return CborNoError;
}

/* Human-readable (dump) API */
 CborError cbor_value_to_pretty_advance(FILE *out, CborValue *value);
static __inline__ CborError cbor_value_to_pretty(FILE *out, const CborValue *value)
{
    CborValue copy = *value;
    return cbor_value_to_pretty_advance(out, &copy);
}

struct mgmt_cbuf {
    struct CborParser parser;
    struct CborEncoder encoder;
    struct CborValue it;
};
# 32 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 2
# 1 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cborconstants_p.h" 1
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


#define CBORCONSTANTS_P_H 





/*
 * CBOR Major types
 * Encoded in the high 3 bits of the descriptor byte
 * See http://tools.ietf.org/html/rfc7049#section-2.1
 */
typedef enum CborMajorTypes {
    UnsignedIntegerType = 0U,
    NegativeIntegerType = 1U,
    ByteStringType = 2U,
    TextStringType = 3U,
    ArrayType = 4U,
    MapType = 5U, /* a.k.a. object */
    TagType = 6U,
    SimpleTypesType = 7U
} CborMajorTypes;

/*
 * CBOR simple and floating point types
 * Encoded in the low 8 bits of the descriptor byte when the
 * Major Type is 7.
 */
typedef enum CborSimpleTypes {
    FalseValue = 20,
    TrueValue = 21,
    NullValue = 22,
    UndefinedValue = 23,
    SimpleTypeInNextByte = 24, /* not really a simple type */
    HalfPrecisionFloat = 25, /* ditto */
    SinglePrecisionFloat = 26, /* ditto */
    DoublePrecisionFloat = 27, /* ditto */
    Break = 31
} CborSimpleTypes;

enum {
    SmallValueBitLength = 5U,
    SmallValueMask = (1U << SmallValueBitLength) - 1, /* 31 */
    Value8Bit = 24U,
    Value16Bit = 25U,
    Value32Bit = 26U,
    Value64Bit = 27U,
    IndefiniteLength = 31U,

    MajorTypeShift = SmallValueBitLength,
    MajorTypeMask = ~0U << MajorTypeShift,

    BreakByte = (unsigned)Break | (SimpleTypesType << MajorTypeShift)
};
# 33 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 2
# 1 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h" 1
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


#define COMPILERSUPPORT_H 

# 1 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 1
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
# 29 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h" 2
# 40 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h"
# 1 "repos/apache-mynewt-core/libc/baselibc/include/assert.h" 1
/*
 * assert.h
 */
# 41 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h" 2
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/float.h" 1 3 4

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/float.h" 3 4
/* Copyright (C) 2002-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  5.2.4.2.2  Characteristics of floating types <float.h>
 */


#define _FLOAT_H___ 

/* Radix of exponent representation, b. */
#undef FLT_RADIX
#define FLT_RADIX __FLT_RADIX__

/* Number of base-FLT_RADIX digits in the significand, p.  */
#undef FLT_MANT_DIG
#undef DBL_MANT_DIG
#undef LDBL_MANT_DIG
#define FLT_MANT_DIG __FLT_MANT_DIG__
#define DBL_MANT_DIG __DBL_MANT_DIG__
#define LDBL_MANT_DIG __LDBL_MANT_DIG__

/* Number of decimal digits, q, such that any floating-point number with q
   decimal digits can be rounded into a floating-point number with p radix b
   digits and back again without change to the q decimal digits,

	p * log10(b)			if b is a power of 10
	floor((p - 1) * log10(b))	otherwise
*/
#undef FLT_DIG
#undef DBL_DIG
#undef LDBL_DIG
#define FLT_DIG __FLT_DIG__
#define DBL_DIG __DBL_DIG__
#define LDBL_DIG __LDBL_DIG__

/* Minimum int x such that FLT_RADIX**(x-1) is a normalized float, emin */
#undef FLT_MIN_EXP
#undef DBL_MIN_EXP
#undef LDBL_MIN_EXP
#define FLT_MIN_EXP __FLT_MIN_EXP__
#define DBL_MIN_EXP __DBL_MIN_EXP__
#define LDBL_MIN_EXP __LDBL_MIN_EXP__

/* Minimum negative integer such that 10 raised to that power is in the
   range of normalized floating-point numbers,

	ceil(log10(b) * (emin - 1))
*/
#undef FLT_MIN_10_EXP
#undef DBL_MIN_10_EXP
#undef LDBL_MIN_10_EXP
#define FLT_MIN_10_EXP __FLT_MIN_10_EXP__
#define DBL_MIN_10_EXP __DBL_MIN_10_EXP__
#define LDBL_MIN_10_EXP __LDBL_MIN_10_EXP__

/* Maximum int x such that FLT_RADIX**(x-1) is a representable float, emax.  */
#undef FLT_MAX_EXP
#undef DBL_MAX_EXP
#undef LDBL_MAX_EXP
#define FLT_MAX_EXP __FLT_MAX_EXP__
#define DBL_MAX_EXP __DBL_MAX_EXP__
#define LDBL_MAX_EXP __LDBL_MAX_EXP__

/* Maximum integer such that 10 raised to that power is in the range of
   representable finite floating-point numbers,

	floor(log10((1 - b**-p) * b**emax))
*/
#undef FLT_MAX_10_EXP
#undef DBL_MAX_10_EXP
#undef LDBL_MAX_10_EXP
#define FLT_MAX_10_EXP __FLT_MAX_10_EXP__
#define DBL_MAX_10_EXP __DBL_MAX_10_EXP__
#define LDBL_MAX_10_EXP __LDBL_MAX_10_EXP__

/* Maximum representable finite floating-point number,

	(1 - b**-p) * b**emax
*/
#undef FLT_MAX
#undef DBL_MAX
#undef LDBL_MAX
#define FLT_MAX __FLT_MAX__
#define DBL_MAX __DBL_MAX__
#define LDBL_MAX __LDBL_MAX__

/* The difference between 1 and the least value greater than 1 that is
   representable in the given floating point type, b**1-p.  */
#undef FLT_EPSILON
#undef DBL_EPSILON
#undef LDBL_EPSILON
#define FLT_EPSILON __FLT_EPSILON__
#define DBL_EPSILON __DBL_EPSILON__
#define LDBL_EPSILON __LDBL_EPSILON__

/* Minimum normalized positive floating-point number, b**(emin - 1).  */
#undef FLT_MIN
#undef DBL_MIN
#undef LDBL_MIN
#define FLT_MIN __FLT_MIN__
#define DBL_MIN __DBL_MIN__
#define LDBL_MIN __LDBL_MIN__

/* Addition rounds to 0: zero, 1: nearest, 2: +inf, 3: -inf, -1: unknown.  */
/* ??? This is supposed to change with calls to fesetround in <fenv.h>.  */
#undef FLT_ROUNDS
#define FLT_ROUNDS 1



/* The floating-point expression evaluation method.  The precise
   definitions of these values are generalised to include support for
   the interchange and extended types defined in ISO/IEC TS 18661-3.
   Prior to this (for C99/C11) the definitions were:

	-1  indeterminate
	 0  evaluate all operations and constants just to the range and
	    precision of the type
	 1  evaluate operations and constants of type float and double
	    to the range and precision of the double type, evaluate
	    long double operations and constants to the range and
	    precision of the long double type
	 2  evaluate all operations and constants to the range and
	    precision of the long double type

   The TS 18661-3 definitions are:

	-1  indeterminate
	 0  evaluate all operations and constants, whose semantic type has
	    at most the range and precision of float, to the range and
	    precision of float; evaluate all other operations and constants
	    to the range and precision of the semantic type.
	 1  evaluate all operations and constants, whose semantic type has
	    at most the range and precision of double, to the range and
	    precision of double; evaluate all other operations and constants
	    to the range and precision of the semantic type.
	 2  evaluate all operations and constants, whose semantic type has
	    at most the range and precision of long double, to the range and
	    precision of long double; evaluate all other operations and
	    constants to the range and precision of the semantic type.
	 N  where _FloatN  is a supported interchange floating type
	    evaluate all operations and constants, whose semantic type has
	    at most the range and precision of the _FloatN type, to the
	    range and precision of the _FloatN type; evaluate all other
	    operations and constants to the range and precision of the
	    semantic type.
	 N + 1, where _FloatNx is a supported extended floating type
	    evaluate operations and constants, whose semantic type has at
	    most the range and precision of the _FloatNx type, to the range
	    and precision of the _FloatNx type; evaluate all other
	    operations and constants to the range and precision of the
	    semantic type.

   The compiler predefines two macros:

      __FLT_EVAL_METHOD__
      Which, depending on the value given for
      -fpermitted-flt-eval-methods, may be limited to only those values
      for FLT_EVAL_METHOD defined in C99/C11.

     __FLT_EVAL_METHOD_TS_18661_3__
      Which always permits the values for FLT_EVAL_METHOD defined in
      ISO/IEC TS 18661-3.

     Here we want to use __FLT_EVAL_METHOD__, unless
     __STDC_WANT_IEC_60559_TYPES_EXT__ is defined, in which case the user
     is specifically asking for the ISO/IEC TS 18661-3 types, so we use
     __FLT_EVAL_METHOD_TS_18661_3__.

   ??? This ought to change with the setting of the fp control word;
   the value provided by the compiler assumes the widest setting.  */
#undef FLT_EVAL_METHOD



#define FLT_EVAL_METHOD __FLT_EVAL_METHOD__


/* Number of decimal digits, n, such that any floating-point number in the
   widest supported floating type with pmax radix b digits can be rounded
   to a floating-point number with n decimal digits and back again without
   change to the value,

	pmax * log10(b)			if b is a power of 10
	ceil(1 + pmax * log10(b))	otherwise
*/
#undef DECIMAL_DIG
#define DECIMAL_DIG __DECIMAL_DIG__




/* Versions of DECIMAL_DIG for each floating-point type.  */
#undef FLT_DECIMAL_DIG
#undef DBL_DECIMAL_DIG
#undef LDBL_DECIMAL_DIG
#define FLT_DECIMAL_DIG __FLT_DECIMAL_DIG__
#define DBL_DECIMAL_DIG __DBL_DECIMAL_DIG__
#define LDBL_DECIMAL_DIG __LDBL_DECIMAL_DIG__

/* Whether types support subnormal numbers.  */
#undef FLT_HAS_SUBNORM
#undef DBL_HAS_SUBNORM
#undef LDBL_HAS_SUBNORM
#define FLT_HAS_SUBNORM __FLT_HAS_DENORM__
#define DBL_HAS_SUBNORM __DBL_HAS_DENORM__
#define LDBL_HAS_SUBNORM __LDBL_HAS_DENORM__

/* Minimum positive values, including subnormals.  */
#undef FLT_TRUE_MIN
#undef DBL_TRUE_MIN
#undef LDBL_TRUE_MIN
#define FLT_TRUE_MIN __FLT_DENORM_MIN__
#define DBL_TRUE_MIN __DBL_DENORM_MIN__
#define LDBL_TRUE_MIN __LDBL_DENORM_MIN__
# 42 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h" 2
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 1 3 4
/* Copyright (C) 1989-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */
# 43 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h" 2

# 1 "repos/apache-mynewt-core/libc/baselibc/include/string.h" 1

# 1 "repos/apache-mynewt-core/libc/baselibc/include/string.h"
/*
 * string.h
 */
# 45 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h" 2


# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdbool.h" 1 3 4

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdbool.h" 3 4
/* Copyright (C) 1998-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.16  Boolean type and values  <stdbool.h>
 */
# 48 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h" 2







#define cbor_static_assert(x) _Static_assert(x, #x)







# 62 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h"
/* inline is a keyword */





#define STRINGIFY(x) STRINGIFY2(x)
#define STRINGIFY2(x) #x
# 80 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h"
#define DBL_DECIMAL_DIG_STR STRINGIFY(DBL_DECIMAL_DIG)


#define __has_builtin(x) 0





#define cbor_ntohll __builtin_bswap64
#define cbor_htonll __builtin_bswap64
#define cbor_ntohl __builtin_bswap32
#define cbor_htonl __builtin_bswap32




#define cbor_ntohs __builtin_bswap16
#define cbor_htons __builtin_bswap16
# 153 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h"
/* C-style const_cast without triggering a warning with -Wcast-qual */
#define CONST_CAST(t,v) (t)(uintptr_t)(v)



#define likely(x) __builtin_expect(!!(x), 1)
#define unlikely(x) __builtin_expect(!!(x), 0)
#define unreachable() __builtin_unreachable()
# 171 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h"
static inline 
# 171 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h" 3 4
             _Bool 
# 171 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/compilersupport_p.h"
                  add_check_overflow(size_t v1, size_t v2, size_t *r)
{

    return __builtin_add_overflow(v1, v2, r);





}

static inline unsigned short encode_half(double val)
{



    uint64_t v;
    memcpy(&v, &val, sizeof(v));
    int sign = v >> 63 << 15;
    int exp = (v >> 52) & 0x7ff;
    int mant = v << 12 >> 12 >> (53-11); /* keep only the 11 most significant bits of the mantissa */
    exp -= 1023;
    if (exp == 1024) {
        /* infinity or NaN */
        exp = 16;
        mant >>= 1;
    } else if (exp >= 16) {
        /* overflow, as largest number */
        exp = 15;
        mant = 1023;
    } else if (exp >= -14) {
        /* regular normal */
    } else if (exp >= -24) {
        /* subnormal */
        mant |= 1024;
        mant >>= -(exp + 14);
        exp = -15;
    } else {
        /* underflow, make zero */
        return 0;
    }
    return sign | ((exp + 15) << 10) | mant;

}
# 34 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 2

# 1 "repos/apache-mynewt-core/libc/baselibc/include/assert.h" 1
/*
 * assert.h
 */
# 36 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h" 1
/*
 * stdlib.h
 */


#define _STDLIB_H 

# 1 "repos/apache-mynewt-core/libc/baselibc/include/klibc/extern.h" 1
/*
 * klibc/extern.h
 */
# 9 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/klibc/inline.h" 1
/*
 * klibc/inline.h
 */
# 10 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h" 2
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 1 3 4

# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h" 3 4
/* Copyright (C) 1989-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */
# 11 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h" 2
# 1 "/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/lib/gcc/arm-none-eabi/8.2.1/include/stdbool.h" 1 3 4
/* Copyright (C) 1998-2018 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.16  Boolean type and values  <stdbool.h>
 */
# 12 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h" 2






# 17 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h"
extern inline __attribute__((gnu_inline)) int abs(int __n)
{
 return (__n < 0) ? -__n : __n;
}

extern int atoi(const char *);
extern long atol(const char *);
extern long long atoll(const char *);

extern double atof(const char *str);
extern double strtod(const char *nptr, char **endptr);

extern inline __attribute__((gnu_inline)) long labs(long __n)
{
 return (__n < 0L) ? -__n : __n;
}

extern inline __attribute__((gnu_inline)) long long llabs(long long __n)
{
 return (__n < 0LL) ? -__n : __n;
}

extern void free(void *);
extern void *malloc(size_t);
extern void *calloc(size_t, size_t);
extern void *realloc(void *, size_t);

/* Giving malloc some memory from which to allocate */
extern void add_malloc_block(void *, size_t);
extern void get_malloc_memory_status(size_t *, size_t *);

/* Malloc locking
 * Until the callbacks are set, malloc doesn't do any locking.
 * malloc_lock() *may* timeout, in which case malloc() will return NULL.
 */
typedef 
# 52 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h" 3 4
       _Bool 
# 52 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h"
            (*malloc_lock_t)();
typedef void (*malloc_unlock_t)();
extern void set_malloc_locking(malloc_lock_t, malloc_unlock_t);

extern long strtol(const char *, char **, int);
extern long long strtoll(const char *, char **, int);
extern unsigned long strtoul(const char *, char **, int);
extern unsigned long long strtoull(const char *, char **, int);

typedef int (*__comparefunc_t) (const void *, const void *);
extern void *bsearch(const void *, const void *, size_t, size_t,
         __comparefunc_t);
extern void qsort(void *, size_t, size_t, __comparefunc_t);

extern long jrand48(unsigned short *);
extern long mrand48(void);
extern long nrand48(unsigned short *);
extern long lrand48(void);
extern unsigned short *seed48(const unsigned short *);
extern void srand48(long);

extern inline __attribute__((gnu_inline)) char *getenv(const char *name)
{
 return 
# 75 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h" 3 4
       ((void *)0)
# 75 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h"
           ;
}

#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1
extern void _exit(int s);
extern inline __attribute__((gnu_inline)) void exit(int err)
{
 _exit(err);
}

#define RAND_MAX 0x7fffffff
extern inline __attribute__((gnu_inline)) int rand(void)
{
 return (int)lrand48();
}
extern inline __attribute__((gnu_inline)) void srand(unsigned int __s)
{
 srand48(__s);
}
extern inline __attribute__((gnu_inline)) long random(void)
{
 return lrand48();
}
extern inline __attribute__((gnu_inline)) void srandom(unsigned int __s)
{
 srand48(__s);
}
# 37 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/string.h" 1
/*
 * string.h
 */
# 38 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 2

# 1 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/assert_p.h" 1
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

# 1 "repos/apache-mynewt-core/libc/baselibc/include/assert.h" 1
/*
 * assert.h
 */
# 26 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/assert_p.h" 2
# 40 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 2

/**
 * \defgroup CborEncoding Encoding to CBOR
 * \brief Group of functions used to encode data to CBOR.
 *
 * CborEncoder is used to encode data into a CBOR stream. The outermost
 * CborEncoder is initialized by calling cbor_encoder_init(), with the buffer
 * where the CBOR stream will be stored. The outermost CborEncoder is usually
 * used to encode exactly one item, most often an array or map. It is possible
 * to encode more than one item, but care must then be taken on the decoder
 * side to ensure the state is reset after each item was decoded.
 *
 * Nested CborEncoder objects are created using cbor_encoder_create_array() and
 * cbor_encoder_create_map(), later closed with cbor_encoder_close_container()
 * or cbor_encoder_close_container_checked(). The pairs of creation and closing
 * must be exactly matched and their parameters are always the same.
 *
 * CborEncoder writes directly to the user-supplied buffer, without extra
 * buffering. CborEncoder does not allocate memory and CborEncoder objects are
 * usually created on the stack of the encoding functions.
 *
 * The example below initializes a CborEncoder object with a buffer and encodes
 * a single integer.
 *
 * \code
 *      uint8_t buf[16];
 *      CborEncoder encoder;
 *      cbor_encoder_init(&encoder, &buf, sizeof(buf), 0);
 *      cbor_encode_int(&encoder, some_value);
 * \endcode
 *
 * As explained before, usually the outermost CborEncoder object is used to add
 * one array or map, which in turn contains multiple elements. The example
 * below creates a CBOR map with one element: a key "foo" and a boolean value.
 *
 * \code
 *      uint8_t buf[16];
 *      CborEncoder encoder, mapEncoder;
 *      cbor_encoder_init(&encoder, &buf, sizeof(buf), 0);
 *      cbor_encoder_create_map(&encoder, &mapEncoder, 1);
 *      cbor_encode_text_stringz(&mapEncoder, "foo");
 *      cbor_encode_boolean(&mapEncoder, some_value);
 *      cbor_encoder_close_container(&encoder, &mapEncoder);
 * \endcode
 *
 * <h3 class="groupheader">Error checking and buffer size</h2>
 *
 * All functions operating on CborEncoder return a condition of type CborError.
 * If the encoding was successful, they return CborNoError. Some functions do
 * extra checking on the input provided and may return some other error
 * conditions (for example, cbor_encode_simple_value() checks that the type is
 * of the correct type).
 *
 * In addition, all functions check whether the buffer has enough bytes to
 * encode the item being appended. If that is not possible, they return
 * CborErrorOutOfMemory.
 *
 * It is possible to continue with the encoding of data past the first function
 * that returns CborErrorOutOfMemory. CborEncoder functions will not overrun
 * the buffer, but will instead count how many more bytes are needed to
 * complete the encoding. At the end, you can obtain that count by calling
 * cbor_encoder_get_extra_bytes_needed().
 *
 * \section1 Finalizing the encoding
 *
 * Once all items have been appended and the containers have all been properly
 * closed, the user-supplied buffer will contain the CBOR stream and may be
 * immediately used. To obtain the size of the buffer, call
 * cbor_encoder_get_buffer_size() with the original buffer pointer.
 *
 * The example below illustrates how one can encode an item with error checking
 * and then pass on the buffer for network sending.
 *
 * \code
 *      uint8_t buf[16];
 *      CborError err;
 *      CborEncoder encoder, mapEncoder;
 *      cbor_encoder_init(&encoder, &buf, sizeof(buf), 0);
 *      err = cbor_encoder_create_map(&encoder, &mapEncoder, 1);
 *      if (!err)
 *          return err;
 *      err = cbor_encode_text_stringz(&mapEncoder, "foo");
 *      if (!err)
 *          return err;
 *      err = cbor_encode_boolean(&mapEncoder, some_value);
 *      if (!err)
 *          return err;
 *      err = cbor_encoder_close_container_checked(&encoder, &mapEncoder);
 *      if (!err)
 *          return err;
 *
 *      size_t len = cbor_encoder_get_buffer_size(&encoder, buf);
 *      send_payload(buf, len);
 *      return CborNoError;
 * \endcode
 *
 * Finally, the example below illustrates expands on the one above and also
 * deals with dynamically growing the buffer if the initial allocation wasn't
 * big enough. Note the two places where the error checking was replaced with
 * an assertion, showing where the author assumes no error can occur.
 *
 * \code
 * uint8_t *encode_string_array(const char **strings, int n, size_t *bufsize)
 * {
 *     CborError err;
 *     CborEncoder encoder, arrayEncoder;
 *     size_t size = 256;
 *     uint8_t *buf = NULL;
 *
 *     while (1) {
 *         int i;
 *         size_t more_bytes;
 *         uint8_t *nbuf = realloc(buf, size);
 *         if (nbuf == NULL)
 *             goto error;
 *         buf = nbuf;
 *
 *         cbor_encoder_init(&encoder, &buf, size, 0);
 *         err = cbor_encoder_create_array(&encoder, &arrayEncoder, n);
 *         assert(err);         // can't fail, the buffer is always big enough
 *
 *         for (i = 0; i < n; ++i) {
 *             err = cbor_encode_text_stringz(&arrayEncoder, strings[i]);
 *             if (err && err != CborErrorOutOfMemory)
 *                 goto error;
 *         }
 *
 *         err = cbor_encoder_close_container_checked(&encoder, &arrayEncoder);
 *         assert(err);         // shouldn't fail!
 *
 *         more_bytes = cbor_encoder_get_extra_bytes_needed(encoder);
 *         if (more_size) {
 *             // buffer wasn't big enough, try again
 *             size += more_bytes;
 *             continue;
 *         }
 *
 *         *bufsize = cbor_encoder_get_buffer_size(encoder, buf);
 *         return buf;
 *     }
 *  error:
 *     free(buf);
 *     return NULL;
 *  }
 * \endcode
 */

/**
 * \addtogroup CborEncoding
 * @{
 */

/**
 * \struct CborEncoder
 * Structure used to encode to CBOR.
 */

/**
 * Initializes a CborEncoder structure \a encoder by pointing it to buffer \a
 * buffer of size \a size. The \a flags field is currently unused and must be
 * zero.
 */
void cbor_encoder_init(CborEncoder *encoder, cbor_encoder_writer *writer, int flags)
{
    encoder->writer = writer;
    encoder->added = 0;
    encoder->flags = flags;
}


static inline void put16(void *where, uint16_t v)
{
    v = __builtin_bswap16(v);
    memcpy(where, &v, sizeof(v));
}


/* Note: Since this is currently only used in situations where OOM is the only
 * valid error, we KNOW this to be true.  Thus, this function now returns just 'true',
 * but if in the future, any function starts returning a non-OOM error, this will need
 * to be changed to the test.  At the moment, this is done to prevent more branches
 * being created in the tinycbor output */
static inline 
# 222 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 3 4
             _Bool 
# 222 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c"
                  isOomError(CborError err)
{
    (void) err;
    return 
# 225 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 3 4
          1
# 225 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c"
              ;
}


static inline void put32(void *where, uint32_t v)
{
    v = __builtin_bswap32(v);
    memcpy(where, &v, sizeof(v));
}


static inline void put64(void *where, uint64_t v)
{
    v = __builtin_bswap64(v);
    memcpy(where, &v, sizeof(v));
}

static inline CborError append_to_buffer(CborEncoder *encoder, const void *data, size_t len)
{
    return encoder->writer->write(encoder->writer, data, len);
}

static inline CborError append_byte_to_buffer(CborEncoder *encoder, uint8_t byte)
{
    return append_to_buffer(encoder, &byte, 1);
}

static inline CborError encode_number_no_update(CborEncoder *encoder, uint64_t ui, uint8_t shiftedMajorType)
{
    /* Little-endian would have been so much more convenient here:
     * We could just write at the beginning of buf but append_to_buffer
     * only the necessary bytes.
     * Since it has to be big endian, do it the other way around:
     * write from the end. */
    uint64_t buf[2];
    uint8_t *const bufend = (uint8_t *)buf + sizeof(buf);
    uint8_t *bufstart = bufend - 1;
    put64(buf + 1, ui); /* we probably have a bunch of zeros in the beginning */

    if (ui < Value8Bit) {
        *bufstart += shiftedMajorType;
    } else {
        unsigned more = 0;
        if (ui > 0xffU)
            ++more;
        if (ui > 0xffffU)
            ++more;
        if (ui > 0xffffffffU)
            ++more;
        bufstart -= (size_t)1 << more;
        *bufstart = shiftedMajorType + Value8Bit + more;
    }

    return append_to_buffer(encoder, bufstart, bufend - bufstart);
}

static inline CborError encode_number(CborEncoder *encoder, uint64_t ui, uint8_t shiftedMajorType)
{
    ++encoder->added;
    return encode_number_no_update(encoder, ui, shiftedMajorType);
}

/**
 * Appends the unsigned 64-bit integer \a value to the CBOR stream provided by
 * \a encoder.
 *
 * \sa cbor_encode_negative_int, cbor_encode_int
 */
CborError cbor_encode_uint(CborEncoder *encoder, uint64_t value)
{
    return encode_number(encoder, value, UnsignedIntegerType << MajorTypeShift);
}

/**
 * Appends the negative 64-bit integer whose absolute value is \a
 * absolute_value to the CBOR stream provided by \a encoder.
 *
 * \sa cbor_encode_uint, cbor_encode_int
 */
CborError cbor_encode_negative_int(CborEncoder *encoder, uint64_t absolute_value)
{
    return encode_number(encoder, absolute_value, NegativeIntegerType << MajorTypeShift);
}

/**
 * Appends the signed 64-bit integer \a value to the CBOR stream provided by
 * \a encoder.
 *
 * \sa cbor_encode_negative_int, cbor_encode_uint
 */
CborError cbor_encode_int(CborEncoder *encoder, int64_t value)
{
    /* adapted from code in RFC 7049 appendix C (pseudocode) */
    uint64_t ui = value >> 63; /* extend sign to whole length */
    uint8_t majorType = ui & 0x20; /* extract major type */
    ui ^= value; /* complement negatives */
    return encode_number(encoder, ui, majorType);
}

/**
 * Appends the CBOR Simple Type of value \a value to the CBOR stream provided by
 * \a encoder.
 *
 * This function may return error CborErrorIllegalSimpleType if the \a value
 * variable contains a number that is not a valid simple type.
 */
CborError cbor_encode_simple_value(CborEncoder *encoder, uint8_t value)
{

    /* check if this is a valid simple type */
    if (value >= HalfPrecisionFloat && value <= Break)
        return CborErrorIllegalSimpleType;

    return encode_number(encoder, value, SimpleTypesType << MajorTypeShift);
}


/**
 * Appends the floating-point value of type \a fpType and pointed to by \a
 * value to the CBOR stream provided by \a encoder. The value of \a fpType must
 * be one of CborHalfFloatType, CborFloatType or CborDoubleType, otherwise the
 * behavior of this function is undefined.
 *
 * This function is useful for code that needs to pass through floating point
 * values but does not wish to have the actual floating-point code.
 *
 * \sa cbor_encode_half_float, cbor_encode_float, cbor_encode_double
 */
CborError cbor_encode_floating_point(CborEncoder *encoder, CborType fpType, const void *value)
{
    uint8_t buf[1 + sizeof(uint64_t)];
    ((fpType == CborHalfFloatType || fpType == CborFloatType || fpType == CborDoubleType) ? (void)0 : __assert_func(
# 356 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 3 4
   ((void *)0)
# 356 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c"
   , 0, 
# 356 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 3 4
   ((void *)0)
# 356 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c"
   , 
# 356 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 3 4
   ((void *)0)
# 356 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c"
   ));
    buf[0] = fpType;

    unsigned size = 2U << (fpType - CborHalfFloatType);
    if (size == 8)
        put64(buf + 1, *(const uint64_t*)value);
    else if (size == 4)
        put32(buf + 1, *(const uint32_t*)value);
    else
        put16(buf + 1, *(const uint16_t*)value);
    ++encoder->added;
    return append_to_buffer(encoder, buf, size + 1);
}


/**
 * Appends the CBOR tag \a tag to the CBOR stream provided by \a encoder.
 *
 * \sa CborTag
 */
CborError cbor_encode_tag(CborEncoder *encoder, CborTag tag)
{
    /* tags don't count towards the number of elements in an array or map */
    return encode_number_no_update(encoder, tag, TagType << MajorTypeShift);
}

static CborError encode_string(CborEncoder *encoder, size_t length, uint8_t shiftedMajorType, const void *string)
{
    CborError err = encode_number(encoder, length, shiftedMajorType);
    if (err && !isOomError(err))
        return err;
    return append_to_buffer(encoder, string, length);
}

/**
 * \fn CborError cbor_encode_text_stringz(CborEncoder *encoder, const char *string)
 *
 * Appends the null-terminated text string \a string to the CBOR stream
 * provided by \a encoder. CBOR requires that \a string be valid UTF-8, but
 * TinyCBOR makes no verification of correctness. The terminating null is not
 * included in the stream.
 *
 * \sa cbor_encode_text_string, cbor_encode_byte_string
 */

/**
 * Appends the text string \a string of length \a length to the CBOR stream
 * provided by \a encoder. CBOR requires that \a string be valid UTF-8, but
 * TinyCBOR makes no verification of correctness.
 *
 * \sa CborError cbor_encode_text_stringz, cbor_encode_byte_string
 */
CborError cbor_encode_byte_string(CborEncoder *encoder, const uint8_t *string, size_t length)
{
    return encode_string(encoder, length, ByteStringType << MajorTypeShift, string);
}

/**
 * Appends the byte string passed as \a iov and \a iov_len to the CBOR
 * stream provided by \a encoder. CBOR byte strings are arbitrary raw data.
 *
 * \sa CborError cbor_encode_text_stringz, cbor_encode_byte_string
 */
CborError cbor_encode_byte_iovec(CborEncoder *encoder,
                                 const struct cbor_iovec iov[], int iov_len)
{
    CborError err;
    size_t length;
    int i;

    length = 0;
    for (i = 0; i < iov_len; i++) {
        length += iov[i].iov_len;
    }
    err = encode_number(encoder, length, ByteStringType << MajorTypeShift);
    if (err && !isOomError(err)) {
        return err;
    }
    for (i = 0; i < iov_len; i++) {
        err = append_to_buffer(encoder, iov[i].iov_base, iov[i].iov_len);
        if (err && !isOomError(err)) {
            return err;
        }
    }
    return 0;
}

/**
 * Appends the byte string \a string of length \a length to the CBOR stream
 * provided by \a encoder. CBOR byte strings are arbitrary raw data.
 *
 * \sa cbor_encode_text_stringz, cbor_encode_text_string
 */
CborError cbor_encode_text_string(CborEncoder *encoder, const char *string, size_t length)
{
    return encode_string(encoder, length, TextStringType << MajorTypeShift, string);
}


__attribute__((noinline))

static CborError create_container(CborEncoder *encoder, CborEncoder *container, size_t length, uint8_t shiftedMajorType)
{
    CborError err;
    container->writer = encoder->writer;
    ++encoder->added;
    container->added = 0;

    _Static_assert(((MapType << MajorTypeShift) & CborIteratorFlag_ContainerIsMap) == CborIteratorFlag_ContainerIsMap, "((MapType << MajorTypeShift) & CborIteratorFlag_ContainerIsMap) == CborIteratorFlag_ContainerIsMap");
    _Static_assert(((ArrayType << MajorTypeShift) & CborIteratorFlag_ContainerIsMap) == 0, "((ArrayType << MajorTypeShift) & CborIteratorFlag_ContainerIsMap) == 0");
    container->flags = shiftedMajorType & CborIteratorFlag_ContainerIsMap;

    if (length == CborIndefiniteLength) {
        container->flags |= CborIteratorFlag_UnknownLength;
        err = append_byte_to_buffer(container, shiftedMajorType + IndefiniteLength);
    } else {
        err = encode_number_no_update(container, length, shiftedMajorType);
    }
    if (err && !isOomError(err))
        return err;

    return CborNoError;
}

/**
 * Creates a CBOR array in the CBOR stream provided by \a encoder and
 * initializes \a arrayEncoder so that items can be added to the array using
 * the CborEncoder functions. The array must be terminated by calling either
 * cbor_encoder_close_container() or cbor_encoder_close_container_checked()
 * with the same \a encoder and \a arrayEncoder parameters.
 *
 * The number of items inserted into the array must be exactly \a length items,
 * otherwise the stream is invalid. If the number of items is not known when
 * creating the array, the constant \ref CborIndefiniteLength may be passed as
 * length instead.
 *
 * \sa cbor_encoder_create_map
 */
CborError cbor_encoder_create_array(CborEncoder *encoder, CborEncoder *arrayEncoder, size_t length)
{
    return create_container(encoder, arrayEncoder, length, ArrayType << MajorTypeShift);
}

/**
 * Creates a CBOR map in the CBOR stream provided by \a encoder and
 * initializes \a mapEncoder so that items can be added to the map using
 * the CborEncoder functions. The map must be terminated by calling either
 * cbor_encoder_close_container() or cbor_encoder_close_container_checked()
 * with the same \a encoder and \a mapEncoder parameters.
 *
 * The number of pair of items inserted into the map must be exactly \a length
 * items, otherwise the stream is invalid. If the number of items is not known
 * when creating the map, the constant \ref CborIndefiniteLength may be passed as
 * length instead.
 *
 * \b{Implementation limitation:} TinyCBOR cannot encode more than SIZE_MAX/2
 * key-value pairs in the stream. If the length \a length is larger than this
 * value, this function returns error CborErrorDataTooLarge.
 *
 * \sa cbor_encoder_create_array
 */
CborError cbor_encoder_create_map(CborEncoder *encoder, CborEncoder *mapEncoder, size_t length)
{
    if (length != CborIndefiniteLength && length > 
# 519 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c" 3 4
                                                  (0xffffffffU) 
# 519 "repos/apache-mynewt-core/encoding/tinycbor/src/cborencoder.c"
                                                           / 2)
        return CborErrorDataTooLarge;
    return create_container(encoder, mapEncoder, length, MapType << MajorTypeShift);
}

/**
 * Creates a indefinite-length byte string in the CBOR stream provided by
 * \a encoder and initializes \a stringEncoder so that chunks of original string
 * can be added using the CborEncoder functions. The string must be terminated by
 * calling cbor_encoder_close_container() with the same \a encoder and
 * \a stringEncoder parameters.
 *
 * \sa cbor_encoder_create_array
 */
CborError cbor_encoder_create_indef_byte_string(CborEncoder *encoder, CborEncoder *stringEncoder)
{
    return create_container(encoder, stringEncoder, CborIndefiniteLength, ByteStringType << MajorTypeShift);
}

/**
 * Closes the CBOR container (array, map or indefinite-length string) provided
 * by \a containerEncoder and updates the CBOR stream provided by \a encoder.
 * Both parameters must be the same as were passed to cbor_encoder_create_array() or
 * cbor_encoder_create_map() or cbor_encoder_create_indef_byte_string().
 *
 * This function does not verify that the number of items (or pair of items, in
 * the case of a map) was correct. To execute that verification, call
 * cbor_encoder_close_container_checked() instead.
 *
 * \sa cbor_encoder_create_array(), cbor_encoder_create_map()
 */
CborError cbor_encoder_close_container(CborEncoder *encoder, const CborEncoder *containerEncoder)
{
    encoder->writer = containerEncoder->writer;

    if (containerEncoder->flags & CborIteratorFlag_UnknownLength)
        return append_byte_to_buffer(encoder, BreakByte);
    return CborNoError;
}

/**
 * \fn CborError cbor_encode_boolean(CborEncoder *encoder, bool value)
 *
 * Appends the boolean value \a value to the CBOR stream provided by \a encoder.
 */

/**
 * \fn CborError cbor_encode_null(CborEncoder *encoder)
 *
 * Appends the CBOR type representing a null value to the CBOR stream provided
 * by \a encoder.
 *
 * \sa cbor_encode_undefined()
 */

/**
 * \fn CborError cbor_encode_undefined(CborEncoder *encoder)
 *
 * Appends the CBOR type representing an undefined value to the CBOR stream
 * provided by \a encoder.
 *
 * \sa cbor_encode_null()
 */

/**
 * \fn CborError cbor_encode_half_float(CborEncoder *encoder, const void *value)
 *
 * Appends the IEEE 754 half-precision (16-bit) floating point value pointed to
 * by \a value to the CBOR stream provided by \a encoder.
 *
 * \sa cbor_encode_floating_point(), cbor_encode_float(), cbor_encode_double()
 */

/**
 * \fn CborError cbor_encode_float(CborEncoder *encoder, float value)
 *
 * Appends the IEEE 754 single-precision (32-bit) floating point value \a value
 * to the CBOR stream provided by \a encoder.
 *
 * \sa cbor_encode_floating_point(), cbor_encode_half_float(), cbor_encode_double()
 */

/**
 * \fn CborError cbor_encode_double(CborEncoder *encoder, double value)
 *
 * Appends the IEEE 754 double-precision (64-bit) floating point value \a value
 * to the CBOR stream provided by \a encoder.
 *
 * \sa cbor_encode_floating_point(), cbor_encode_half_float(), cbor_encode_float()
 */

/**
 * \fn size_t cbor_encoder_get_buffer_size(const CborEncoder *encoder, const uint8_t *buffer)
 *
 * Returns the total size of the buffer starting at \a buffer after the
 * encoding finished without errors. The \a encoder and \a buffer arguments
 * must be the same as supplied to cbor_encoder_init().
 *
 * If the encoding process had errors, the return value of this function is
 * meaningless. If the only errors were CborErrorOutOfMemory, instead use
 * cbor_encoder_get_extra_bytes_needed() to find out by how much to grow the
 * buffer before encoding again.
 *
 * See \ref CborEncoding for an example of using this function.
 *
 * \sa cbor_encoder_init(), cbor_encoder_get_extra_bytes_needed(), CborEncoding
 */

/**
 * \fn size_t cbor_encoder_get_extra_bytes_needed(const CborEncoder *encoder)
 *
 * Returns how many more bytes the original buffer supplied to
 * cbor_encoder_init() needs to be extended by so that no CborErrorOutOfMemory
 * condition will happen for the encoding. If the buffer was big enough, this
 * function returns 0. The \a encoder must be the original argument as passed
 * to cbor_encoder_init().
 *
 * This function is usually called after an encoding sequence ended with one or
 * more CborErrorOutOfMemory errors, but no other error. If any other error
 * happened, the return value of this function is meaningless.
 *
 * See \ref CborEncoding for an example of using this function.
 *
 * \sa cbor_encoder_init(), cbor_encoder_get_buffer_size(), CborEncoding
 */

/** @} */
