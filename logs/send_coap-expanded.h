# 1 "apps/my_sensor_app/src/send_coap.c"
# 1 "/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor//"
# 1 "<built-in>"
#define __STDC__ 1
#define __STDC_VERSION__ 201112L
#define __STDC_UTF_16__ 1
#define __STDC_UTF_32__ 1
#define __STDC_HOSTED__ 1
#define __GNUC__ 7
#define __GNUC_MINOR__ 3
#define __GNUC_PATCHLEVEL__ 1
#define __VERSION__ "7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
#define __ATOMIC_RELAXED 0
#define __ATOMIC_SEQ_CST 5
#define __ATOMIC_ACQUIRE 2
#define __ATOMIC_RELEASE 3
#define __ATOMIC_ACQ_REL 4
#define __ATOMIC_CONSUME 1
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
#define __GXX_ABI_VERSION 1011
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
#define __ARM_32BIT_STATE 1
#define __ARM_FEATURE_LDREX 7
#define __ARM_FEATURE_CLZ 1
#undef __ARM_FEATURE_NUMERIC_MAXMIN
# 1 "<built-in>"
#undef __ARM_FEATURE_SIMD32
# 1 "<built-in>"
#define __ARM_SIZEOF_MINIMAL_ENUM 1
#define __ARM_SIZEOF_WCHAR_T 4
#define __ARM_ARCH_PROFILE 77
#define __arm__ 1
#define __ARM_ARCH 7
#define __APCS_32__ 1
#define __thumb__ 1
#define __thumb2__ 1
#define __THUMBEL__ 1
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
# 1 "apps/my_sensor_app/src/send_coap.c"
# 13 "apps/my_sensor_app/src/send_coap.c"
# 1 "repos/apache-mynewt-core/sys/sysinit/include/sysinit/sysinit.h" 1
# 21 "repos/apache-mynewt-core/sys/sysinit/include/sysinit/sysinit.h"
#define H_SYSINIT_ 

# 1 "repos/apache-mynewt-core/libc/baselibc/include/inttypes.h" 1





#define _INTTYPES_H 

# 1 "repos/apache-mynewt-core/libc/baselibc/include/klibc/extern.h" 1





#define _KLIBC_EXTERN_H 
# 15 "repos/apache-mynewt-core/libc/baselibc/include/klibc/extern.h"
#define __extern extern


#define __alias(x) __attribute__((weak, alias(x)))
# 9 "repos/apache-mynewt-core/libc/baselibc/include/inttypes.h" 2
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdint.h" 1 3 4
# 9 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdint.h" 3 4
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 1 3 4
# 10 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define _STDINT_H 

# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 1 3 4





#define _MACHINE__DEFAULT_TYPES_H 

# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/features.h" 1 3 4
# 22 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/features.h" 3 4
#define _SYS_FEATURES_H 





# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/_newlib_version.h" 1 3 4



#define _NEWLIB_VERSION_H__ 1

#define _NEWLIB_VERSION "3.0.0"
#define __NEWLIB__ 3
#define __NEWLIB_MINOR__ 0
#define __NEWLIB_PATCHLEVEL__ 0
# 29 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/features.h" 2 3 4




#define __GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))






#define __GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)
# 131 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/features.h" 3 4
#undef _DEFAULT_SOURCE
#define _DEFAULT_SOURCE 1



#undef _POSIX_SOURCE
#define _POSIX_SOURCE 1
#undef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE 200809L
# 158 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/features.h" 3 4
#undef _ATFILE_SOURCE
#define _ATFILE_SOURCE 1
# 247 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/features.h" 3 4
#define __ATFILE_VISIBLE 1





#define __BSD_VISIBLE 1







#define __GNU_VISIBLE 0




#define __ISO_C_VISIBLE 2011
# 277 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/features.h" 3 4
#define __LARGEFILE_VISIBLE 0



#define __MISC_VISIBLE 1





#define __POSIX_VISIBLE 200809
# 303 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/features.h" 3 4
#define __SVID_VISIBLE 1
# 319 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/features.h" 3 4
#define __XSI_VISIBLE 0
# 330 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/features.h" 3 4
#define __SSP_FORTIFY_LEVEL 0
# 9 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 2 3 4






#define __EXP(x) __ ##x ##__
# 26 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 3 4
#define __have_longlong64 1






#define __have_long32 1








# 41 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;



#define ___int8_t_defined 1







typedef short int __int16_t;

typedef short unsigned int __uint16_t;



#define ___int16_t_defined 1
# 77 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;



#define ___int32_t_defined 1
# 103 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;



#define ___int64_t_defined 1
# 134 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;



#define ___int_least8_t_defined 1
# 160 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;



#define ___int_least16_t_defined 1
# 182 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;



#define ___int_least32_t_defined 1
# 200 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;



#define ___int_least64_t_defined 1







typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 244 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_default_types.h" 3 4
#undef __EXP
# 13 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 10 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#define _SYS__INTSUP_H 





#define __STDINT_EXP(x) __ ##x ##__
# 35 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
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
# 64 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#define _INTPTR_EQ_INT 






#define _INT32_EQ_LONG 







#define __INT8 "hh"
# 90 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __INT16 "h"
# 101 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __INT32 "l"
# 110 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __INT64 "ll"






#define __FAST8 
# 126 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __FAST16 






#define __FAST32 
# 144 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __FAST64 "ll"



#define __LEAST8 "hh"
# 159 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __LEAST16 "h"
# 170 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __LEAST32 "l"
# 179 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __LEAST64 "ll"

#undef signed
#undef unsigned
#undef char
#undef short
#undef int
#undef long
       
       
       
       
       
# 191 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_intsup.h" 3 4
#undef __int20
       
       
# 14 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 10 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_stdint.h" 3 4
#define _SYS__STDINT_H 
# 20 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_stdint.h" 3 4
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
# 15 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 2 3 4






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
# 51 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
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
# 128 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INTPTR_MIN (-__INTPTR_MAX__ - 1)
#define INTPTR_MAX (__INTPTR_MAX__)
#define UINTPTR_MAX (__UINTPTR_MAX__)
# 152 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT8_MIN (-__INT8_MAX__ - 1)
#define INT8_MAX (__INT8_MAX__)
#define UINT8_MAX (__UINT8_MAX__)







#define INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)
#define INT_LEAST8_MAX (__INT_LEAST8_MAX__)
#define UINT_LEAST8_MAX (__UINT_LEAST8_MAX__)
# 174 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT16_MIN (-__INT16_MAX__ - 1)
#define INT16_MAX (__INT16_MAX__)
#define UINT16_MAX (__UINT16_MAX__)







#define INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)
#define INT_LEAST16_MAX (__INT_LEAST16_MAX__)
#define UINT_LEAST16_MAX (__UINT_LEAST16_MAX__)
# 196 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT32_MIN (-__INT32_MAX__ - 1)
#define INT32_MAX (__INT32_MAX__)
#define UINT32_MAX (__UINT32_MAX__)
# 212 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)
#define INT_LEAST32_MAX (__INT_LEAST32_MAX__)
#define UINT_LEAST32_MAX (__UINT_LEAST32_MAX__)
# 230 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT64_MIN (-__INT64_MAX__ - 1)
#define INT64_MAX (__INT64_MAX__)
#define UINT64_MAX (__UINT64_MAX__)
# 246 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)
#define INT_LEAST64_MAX (__INT_LEAST64_MAX__)
#define UINT_LEAST64_MAX (__UINT_LEAST64_MAX__)
# 262 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)
#define INT_FAST8_MAX (__INT_FAST8_MAX__)
#define UINT_FAST8_MAX (__UINT_FAST8_MAX__)
# 278 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)
#define INT_FAST16_MAX (__INT_FAST16_MAX__)
#define UINT_FAST16_MAX (__UINT_FAST16_MAX__)
# 294 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)
#define INT_FAST32_MAX (__INT_FAST32_MAX__)
#define UINT_FAST32_MAX (__UINT_FAST32_MAX__)
# 310 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)
#define INT_FAST64_MAX (__INT_FAST64_MAX__)
#define UINT_FAST64_MAX (__UINT_FAST64_MAX__)
# 326 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INTMAX_MAX (__INTMAX_MAX__)
#define INTMAX_MIN (-INTMAX_MAX - 1)







#define UINTMAX_MAX (__UINTMAX_MAX__)







#define SIZE_MAX (__SIZE_MAX__)





#define SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)
#define SIG_ATOMIC_MAX (__STDINT_EXP(INT_MAX))



#define PTRDIFF_MAX (__PTRDIFF_MAX__)



#define PTRDIFF_MIN (-PTRDIFF_MAX - 1)




#define WCHAR_MIN (__WCHAR_MIN__)
# 374 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define WCHAR_MAX (__WCHAR_MAX__)
# 384 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define WINT_MAX (__WINT_MAX__)




#define WINT_MIN (__WINT_MIN__)






#define INT8_C(x) __INT8_C(x)
#define UINT8_C(x) __UINT8_C(x)
# 408 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT16_C(x) __INT16_C(x)
#define UINT16_C(x) __UINT16_C(x)
# 420 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT32_C(x) __INT32_C(x)
#define UINT32_C(x) __UINT32_C(x)
# 433 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INT64_C(x) __INT64_C(x)
#define UINT64_C(x) __UINT64_C(x)
# 449 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/stdint.h" 3 4
#define INTMAX_C(x) __INTMAX_C(x)
#define UINTMAX_C(x) __UINTMAX_C(x)
# 10 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdint.h" 2 3 4



#define _GCC_WRAP_STDINT_H 
# 10 "repos/apache-mynewt-core/libc/baselibc/include/inttypes.h" 2
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 39 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#define _STDDEF_H 
#define _STDDEF_H_ 

#define _ANSI_STDDEF_H 
# 137 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
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
# 161 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 187 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#define __size_t__ 
#define __SIZE_T__ 
#define _SIZE_T 
#define _SYS_SIZE_T_H 
#define _T_SIZE_ 
#define _T_SIZE 
#define __SIZE_T 
#define _SIZE_T_ 
#define _BSD_SIZE_T_ 
#define _SIZE_T_DEFINED_ 
#define _SIZE_T_DEFINED 
#define _BSD_SIZE_T_DEFINED_ 
#define _SIZE_T_DECLARED 
#define ___int_size_t_h 
#define _GCC_SIZE_T 
#define _SIZET_ 







#define __size_t 





typedef unsigned int size_t;
# 238 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_size_t
# 267 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#define __wchar_t__ 
#define __WCHAR_T__ 
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
# 294 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef _BSD_WCHAR_T_
# 328 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 347 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 401 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)




#define _GCC_MAX_ALIGN_T 



typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 437 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
} max_align_t;
# 11 "repos/apache-mynewt-core/libc/baselibc/include/inttypes.h" 2






# 16 "repos/apache-mynewt-core/libc/baselibc/include/inttypes.h"
static __inline__ intmax_t imaxabs(intmax_t __n)
{
 return (__n < (intmax_t) 0) ? -__n : __n;
}

extern intmax_t strtoimax(const char *, char **, int);
extern uintmax_t strtoumax(const char *, char **, int);


extern intmax_t strntoimax(const char *, char **, int, size_t);
extern uintmax_t strntoumax(const char *, char **, int, size_t);



#define __PRI64_RANK "ll"
#define __PRI32_RANK "l"

#define PRId8 "d"
#define PRId16 "d"
#define PRId32 "d"
#define PRId64 __PRI64_RANK "d"

#define PRIdLEAST8 "d"
#define PRIdLEAST16 "d"
#define PRIdLEAST32 "d"
#define PRIdLEAST64 __PRI64_RANK "d"

#define PRIdFAST8 "d"
#define PRIdFAST16 __PRIFAST_RANK "d"
#define PRIdFAST32 __PRIFAST_RANK "d"
#define PRIdFAST64 __PRI64_RANK "d"

#define PRIdMAX __PRI64_RANK "d"
#define PRIdPTR __PRIPTR_RANK "d"

#define PRIi8 "i"
#define PRIi16 "i"
#define PRIi32 "i"
#define PRIi64 __PRI64_RANK "i"

#define PRIiLEAST8 "i"
#define PRIiLEAST16 "i"
#define PRIiLEAST32 "i"
#define PRIiLEAST64 __PRI64_RANK "i"

#define PRIiFAST8 "i"
#define PRIiFAST16 __PRIFAST_RANK "i"
#define PRIiFAST32 __PRIFAST_RANK "i"
#define PRIiFAST64 __PRI64_RANK "i"

#define PRIiMAX __PRI64_RANK "i"
#define PRIiPTR __PRIPTR_RANK "i"

#define PRIo8 "o"
#define PRIo16 "o"
#define PRIo32 "o"
#define PRIo64 __PRI64_RANK "o"

#define PRIoLEAST8 "o"
#define PRIoLEAST16 "o"
#define PRIoLEAST32 "o"
#define PRIoLEAST64 __PRI64_RANK "o"

#define PRIoFAST8 "o"
#define PRIoFAST16 __PRIFAST_RANK "o"
#define PRIoFAST32 __PRIFAST_RANK "o"
#define PRIoFAST64 __PRI64_RANK "o"

#define PRIoMAX __PRI64_RANK "o"
#define PRIoPTR __PRIPTR_RANK "o"

#define PRIu8 "u"
#define PRIu16 "u"
#define PRIu32 "u"
#define PRIu64 __PRI64_RANK "u"

#define PRIuLEAST8 "u"
#define PRIuLEAST16 "u"
#define PRIuLEAST32 "u"
#define PRIuLEAST64 __PRI64_RANK "u"

#define PRIuFAST8 "u"
#define PRIuFAST16 __PRIFAST_RANK "u"
#define PRIuFAST32 __PRIFAST_RANK "u"
#define PRIuFAST64 __PRI64_RANK "u"

#define PRIuMAX __PRI64_RANK "u"
#define PRIuPTR __PRIPTR_RANK "u"

#define PRIx8 "x"
#define PRIx16 "x"
#define PRIx32 __PRI32_RANK "x"
#define PRIx64 __PRI64_RANK "x"

#define PRIxLEAST8 "x"
#define PRIxLEAST16 "x"
#define PRIxLEAST32 "x"
#define PRIxLEAST64 __PRI64_RANK "x"

#define PRIxFAST8 "x"
#define PRIxFAST16 __PRIFAST_RANK "x"
#define PRIxFAST32 __PRIFAST_RANK "x"
#define PRIxFAST64 __PRI64_RANK "x"

#define PRIxMAX __PRI64_RANK "x"
#define PRIxPTR __PRIPTR_RANK "x"

#define PRIX8 "X"
#define PRIX16 "X"
#define PRIX32 __PRI32_RANK "X"
#define PRIX64 __PRI64_RANK "X"

#define PRIXLEAST8 "X"
#define PRIXLEAST16 "X"
#define PRIXLEAST32 "X"
#define PRIXLEAST64 __PRI64_RANK "X"

#define PRIXFAST8 "X"
#define PRIXFAST16 __PRIFAST_RANK "X"
#define PRIXFAST32 __PRIFAST_RANK "X"
#define PRIXFAST64 __PRI64_RANK "X"

#define PRIXMAX __PRI64_RANK "X"
#define PRIXPTR __PRIPTR_RANK "X"

#define SCNd8 "hhd"
#define SCNd16 "hd"
#define SCNd32 "d"
#define SCNd64 __PRI64_RANK "d"

#define SCNdLEAST8 "hhd"
#define SCNdLEAST16 "hd"
#define SCNdLEAST32 "d"
#define SCNdLEAST64 __PRI64_RANK "d"

#define SCNdFAST8 "hhd"
#define SCNdFAST16 __PRIFAST_RANK "d"
#define SCNdFAST32 __PRIFAST_RANK "d"
#define SCNdFAST64 __PRI64_RANK "d"

#define SCNdMAX __PRI64_RANK "d"
#define SCNdPTR __PRIPTR_RANK "d"

#define SCNi8 "hhi"
#define SCNi16 "hi"
#define SCNi32 "i"
#define SCNi64 __PRI64_RANK "i"

#define SCNiLEAST8 "hhi"
#define SCNiLEAST16 "hi"
#define SCNiLEAST32 "i"
#define SCNiLEAST64 __PRI64_RANK "i"

#define SCNiFAST8 "hhi"
#define SCNiFAST16 __PRIFAST_RANK "i"
#define SCNiFAST32 __PRIFAST_RANK "i"
#define SCNiFAST64 __PRI64_RANK "i"

#define SCNiMAX __PRI64_RANK "i"
#define SCNiPTR __PRIPTR_RANK "i"

#define SCNo8 "hho"
#define SCNo16 "ho"
#define SCNo32 "o"
#define SCNo64 __PRI64_RANK "o"

#define SCNoLEAST8 "hho"
#define SCNoLEAST16 "ho"
#define SCNoLEAST32 "o"
#define SCNoLEAST64 __PRI64_RANK "o"

#define SCNoFAST8 "hho"
#define SCNoFAST16 __PRIFAST_RANK "o"
#define SCNoFAST32 __PRIFAST_RANK "o"
#define SCNoFAST64 __PRI64_RANK "o"

#define SCNoMAX __PRI64_RANK "o"
#define SCNoPTR __PRIPTR_RANK "o"

#define SCNu8 "hhu"
#define SCNu16 "hu"
#define SCNu32 "u"
#define SCNu64 __PRI64_RANK "u"

#define SCNuLEAST8 "hhu"
#define SCNuLEAST16 "hu"
#define SCNuLEAST32 "u"
#define SCNuLEAST64 __PRI64_RANK "u"

#define SCNuFAST8 "hhu"
#define SCNuFAST16 __PRIFAST_RANK "u"
#define SCNuFAST32 __PRIFAST_RANK "u"
#define SCNuFAST64 __PRI64_RANK "u"

#define SCNuMAX __PRI64_RANK "u"
#define SCNuPTR __PRIPTR_RANK "u"

#define SCNx8 "hhx"
#define SCNx16 "hx"
#define SCNx32 "x"
#define SCNx64 __PRI64_RANK "x"

#define SCNxLEAST8 "hhx"
#define SCNxLEAST16 "hx"
#define SCNxLEAST32 "x"
#define SCNxLEAST64 __PRI64_RANK "x"

#define SCNxFAST8 "hhx"
#define SCNxFAST16 __PRIFAST_RANK "x"
#define SCNxFAST32 __PRIFAST_RANK "x"
#define SCNxFAST64 __PRI64_RANK "x"

#define SCNxMAX __PRI64_RANK "x"
#define SCNxPTR __PRIPTR_RANK "x"
# 24 "repos/apache-mynewt-core/sys/sysinit/include/sysinit/sysinit.h" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/assert.h" 1





#define _ASSERT_H 
# 23 "repos/apache-mynewt-core/libc/baselibc/include/assert.h"
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 24 "repos/apache-mynewt-core/libc/baselibc/include/assert.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_fault.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/os_fault.h"
#define _OS_FAULT_H 

# 1 "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h" 1





#define H_MYNEWT_SYSCFG_ 
# 15 "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#define MYNEWT_VAL(_name) MYNEWT_VAL_ ## _name
#define MYNEWT_VAL_CHOICE(_name,_val) MYNEWT_VAL_ ## _name ## __ ## _val





#define MYNEWT_VAL_TINYCRYPT_SYSINIT_STAGE (200)



#define MYNEWT_VAL_TINYCRYPT_UECC_RNG_TRNG_DEV_NAME ("trng")



#define MYNEWT_VAL_TINYCRYPT_UECC_RNG_USE_TRNG (0)




#define MYNEWT_VAL_CBORATTR_MAX_SIZE (512)




#define MYNEWT_VAL_STM32_FLASH_SIZE_KB (128)



#define MYNEWT_VAL_TIMER_0 (1)



#define MYNEWT_VAL_TIMER_1 (0)



#define MYNEWT_VAL_TIMER_2 (0)



#define MYNEWT_VAL_UART_0 (1)




#define MYNEWT_VAL_HAL_FLASH_VERIFY_BUF_SZ (16)



#define MYNEWT_VAL_HAL_FLASH_VERIFY_ERASES (0)



#define MYNEWT_VAL_HAL_FLASH_VERIFY_WRITES (0)




#define MYNEWT_VAL_I2C_0 (0)



#define MYNEWT_VAL_MCU_FLASH_ERASED_VAL (0xff)



#define MYNEWT_VAL_MCU_FLASH_MIN_WRITE_SIZE (2)



#define MYNEWT_VAL_MCU_STM32F1 (1)



#define MYNEWT_VAL_SPI_0 (MYNEWT_VAL_SPI_0_MASTER || MYNEWT_VAL_SPI_0_SLAVE)




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




#define MYNEWT_VAL_MATHLIB_SUPPORT (0)




#define MYNEWT_VAL_SENSOR_CLI (0)



#define MYNEWT_VAL_SENSOR_MAX_INTERRUPTS_PINS (2)


#undef MYNEWT_VAL_SENSOR_MGR_EVQ


#define MYNEWT_VAL_SENSOR_NOTIF_EVENTS_MAX (5)




#define MYNEWT_VAL_SENSOR_OIC (0)



#define MYNEWT_VAL_SENSOR_OIC_OBS_RATE (1000)



#define MYNEWT_VAL_SENSOR_OIC_PERIODIC (0)



#define MYNEWT_VAL_SENSOR_POLL_TEST_LOG (0)



#define MYNEWT_VAL_SENSOR_SYSINIT_STAGE (501)




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




#define MYNEWT_VAL_OS_SYSVIEW_TRACE_CALLOUT (0)




#define MYNEWT_VAL_OS_SYSVIEW_TRACE_EVENTQ (0)



#define MYNEWT_VAL_OS_SYSVIEW_TRACE_MBUF (0)



#define MYNEWT_VAL_OS_SYSVIEW_TRACE_MEMPOOL (0)




#define MYNEWT_VAL_OS_SYSVIEW_TRACE_MUTEX (0)




#define MYNEWT_VAL_OS_SYSVIEW_TRACE_SEM (0)



#define MYNEWT_VAL_OS_TIME_DEBUG (0)



#define MYNEWT_VAL_OS_WATCHDOG_MONITOR (0)



#define MYNEWT_VAL_SANITY_INTERVAL (15000)



#define MYNEWT_VAL_WATCHDOG_INTERVAL (30000)




#define MYNEWT_VAL_BASELIBC_ASSERT_FILE_LINE (0)



#define MYNEWT_VAL_BASELIBC_PRESENT (1)





#define MYNEWT_VAL_OC_APP_RESOURCES (2)




#define MYNEWT_VAL_OC_CLIENT (1)




#define MYNEWT_VAL_OC_CLIENT_DISCOVERY_ENABLE (0)



#define MYNEWT_VAL_OC_COAP_RESPONSE_TIMEOUT (4)




#define MYNEWT_VAL_OC_CONCURRENT_REQUESTS (2)




#define MYNEWT_VAL_OC_CONN_EV_CB_CNT (2)



#define MYNEWT_VAL_OC_DEBUG (0)



#define MYNEWT_VAL_OC_LOGGING (0)



#define MYNEWT_VAL_OC_LORA_PORT (0xbb)




#define MYNEWT_VAL_OC_MAX_PAYLOAD (400)




#define MYNEWT_VAL_OC_MAX_PAYLOAD_SIZE (400)



#define MYNEWT_VAL_OC_NUM_DEVICES (1)




#define MYNEWT_VAL_OC_NUM_REP_OBJECTS (2)



#define MYNEWT_VAL_OC_SEPARATE_RESPONSES (1)




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




#define MYNEWT_VAL_OC_TRANSPORT_IPV6 (0)



#define MYNEWT_VAL_OC_TRANSPORT_LORA (0)



#define MYNEWT_VAL_OC_TRANSPORT_SERIAL (0)




#define MYNEWT_VAL_OC_TRANS_SECURITY (0)




#define MYNEWT_VAL_FLASH_MAP_MAX_AREAS (10)



#define MYNEWT_VAL_FLASH_MAP_SYSINIT_STAGE (2)




#define MYNEWT_VAL_MODLOG_CONSOLE_DFLT (1)



#define MYNEWT_VAL_MODLOG_LOG_MACROS (0)



#define MYNEWT_VAL_MODLOG_MAX_MAPPINGS (16)



#define MYNEWT_VAL_MODLOG_MAX_PRINTF_LEN (128)



#define MYNEWT_VAL_MODLOG_SYSINIT_STAGE (100)




#define MYNEWT_VAL_LOG_CONSOLE (1)



#define MYNEWT_VAL_LOG_FCB (0)



#define MYNEWT_VAL_LOG_FCB_SLOT1 (0)




#define MYNEWT_VAL_LOG_LEVEL (255)




#define MYNEWT_VAL_MFG_LOG_MODULE (128)



#define MYNEWT_VAL_MFG_MAX_MMRS (2)



#define MYNEWT_VAL_MFG_SYSINIT_STAGE (100)




#define MYNEWT_VAL_DEBUG_PANIC_ENABLED (1)




#define MYNEWT_VAL_SYSDOWN_CONSTRAIN_DOWN (1)



#define MYNEWT_VAL_SYSDOWN_PANIC_FILE_LINE (0)



#define MYNEWT_VAL_SYSDOWN_PANIC_MESSAGE (0)



#define MYNEWT_VAL_SYSDOWN_TIMEOUT_MS (10000)




#define MYNEWT_VAL_SYSINIT_CONSTRAIN_INIT (1)



#define MYNEWT_VAL_SYSINIT_PANIC_FILE_LINE (0)



#define MYNEWT_VAL_SYSINIT_PANIC_MESSAGE (0)




#define MYNEWT_VAL_RWLOCK_DEBUG (0)





#define MYNEWT_VAL_ADC_1 (1)




#define MYNEWT_VAL_ESP8266 (1)




#define MYNEWT_VAL_HMAC_PRNG (1)




#define MYNEWT_VAL_NRF24L01 (1)




#define MYNEWT_VAL_RAW_TEMP (1)




#define MYNEWT_VAL_REMOTE_SENSOR (1)



#define MYNEWT_VAL_SEMIHOSTING_CONSOLE (1)




#define MYNEWT_VAL_SENSOR_COAP (1)




#define MYNEWT_VAL_SENSOR_NETWORK (1)




#define MYNEWT_VAL_TEMP_STM32 (1)



#define MYNEWT_VAL_TUTORIAL1 (0)



#define MYNEWT_VAL_TUTORIAL2 (0)




#define MYNEWT_VAL_TUTORIAL3 (1)



#define MYNEWT_VAL_WIFI_GEOLOCATION (0)





#define MYNEWT_VAL_WIFI_PASSWORD ("my_password_is_secret")




#define MYNEWT_VAL_WIFI_SSID ("my_ssid")





#define MYNEWT_VAL_NRF24L01_AUTO_ACK (0)




#define MYNEWT_VAL_NRF24L01_AUTO_RETRANSMIT (0)




#define MYNEWT_VAL_NRF24L01_CE_PIN (MCU_GPIO_PORTB(0))




#define MYNEWT_VAL_NRF24L01_CRC_WIDTH (8)




#define MYNEWT_VAL_NRF24L01_CS_PIN (MCU_GPIO_PORTB(2))




#define MYNEWT_VAL_NRF24L01_DATA_RATE (250)




#define MYNEWT_VAL_NRF24L01_FREQ (2476)




#define MYNEWT_VAL_NRF24L01_IRQ_PIN (MCU_GPIO_PORTA(15))




#define MYNEWT_VAL_NRF24L01_POWER (0)




#define MYNEWT_VAL_NRF24L01_SPI_BAUDRATE (200)




#define MYNEWT_VAL_NRF24L01_SPI_NUM (0)




#define MYNEWT_VAL_NRF24L01_TX_SIZE (12)





#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__DOUBLE (0)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__FIELD ("t")




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__INT (1)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__NAME (temp_raw)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__SENSOR_TYPE (AMBIENT_TEMPERATURE_RAW)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__UNION (strd)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__DOUBLE (1)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__FIELD ("tf")




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__INT (0)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__NAME (temp)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__SENSOR_TYPE (AMBIENT_TEMPERATURE)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__UNION (std)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__DOUBLE (1)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__FIELD ("p")




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__INT (0)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__NAME (press)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__SENSOR_TYPE (PRESSURE)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__UNION (spd)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__DOUBLE (1)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__FIELD ("h")




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__INT (0)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__NAME (humid)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__SENSOR_TYPE (RELATIVE_HUMIDITY)




#define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__UNION (shd)




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





#define MYNEWT_VAL_COAP_CBOR_ENCODING (1)




#define MYNEWT_VAL_COAP_JSON_ENCODING (1)





#define MYNEWT_VAL_COAP_HOST ("coap.thethings.io")




#define MYNEWT_VAL_COAP_PORT (5683)




#define MYNEWT_VAL_COAP_URI ("v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8")




#define MYNEWT_VAL_COLLECTOR_NODE_ADDRESS (0x7878787878ull)




#define MYNEWT_VAL_COLLECTOR_NODE_HW_ID (0x57, 0xff, 0x6a, 0x06, 0x78, 0x78, 0x54, 0x50, 0x49, 0x29, 0x24, 0x67)




#define MYNEWT_VAL_SENSOR_NETWORK_ADDRESS (0xb3b4b5b6ull)




#define MYNEWT_VAL_SENSOR_NODE_HW_ID_1 (0x38, 0xff, 0x6d, 0x06, 0x4e, 0x57, 0x34, 0x36, 0x25, 0x58, 0x08, 0x43)




#define MYNEWT_VAL_SENSOR_NODE_HW_ID_2 (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x02)




#define MYNEWT_VAL_SENSOR_NODE_HW_ID_3 (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x03)




#define MYNEWT_VAL_SENSOR_NODE_HW_ID_4 (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x04)




#define MYNEWT_VAL_SENSOR_NODE_HW_ID_5 (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x05)




#define MYNEWT_VAL_SENSOR_NODE_OFFSET_1 (0xf1)




#define MYNEWT_VAL_SENSOR_NODE_OFFSET_2 (0xcd)




#define MYNEWT_VAL_SENSOR_NODE_OFFSET_3 (0xa3)




#define MYNEWT_VAL_SENSOR_NODE_OFFSET_4 (0x0f)




#define MYNEWT_VAL_SENSOR_NODE_OFFSET_5 (0x05)




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
# 25 "repos/apache-mynewt-core/sys/sysinit/include/sysinit/sysinit.h" 2
# 35 "repos/apache-mynewt-core/sys/sysinit/include/sysinit/sysinit.h"
extern uint8_t sysinit_active;

void sysinit_start(void);
void sysinit_end(void);

typedef void sysinit_panic_fn(const char *file, int line, const char *func,
                              const char *expr, const char *msg);

extern sysinit_panic_fn *sysinit_panic_cb;

void sysinit_panic_set(sysinit_panic_fn *panic_fn);
# 60 "repos/apache-mynewt-core/sys/sysinit/include/sysinit/sysinit.h"
#define SYSINIT_PANIC_MSG(msg) sysinit_panic_cb(0, 0, 0, 0, 0)




#define SYSINIT_PANIC() SYSINIT_PANIC_MSG(NULL)

#define SYSINIT_PANIC_ASSERT_MSG(rc,msg) do { if (!(rc)) { SYSINIT_PANIC_MSG(msg); } } while (0)






#define SYSINIT_PANIC_ASSERT(rc) SYSINIT_PANIC_ASSERT_MSG(rc, NULL)







#define SYSINIT_ASSERT_ACTIVE() assert(sysinit_active)
# 114 "repos/apache-mynewt-core/sys/sysinit/include/sysinit/sysinit.h"
void sysinit_app(void);
#define sysinit() do { sysinit_start(); sysinit_app(); sysinit_end(); } while (0)
# 14 "apps/my_sensor_app/src/send_coap.c" 2


# 1 "libs/semihosting_console/include/console/console.h" 1
# 20 "libs/semihosting_console/include/console/console.h"
#define __SEMIHOSTING_CONSOLE_H__ 


# 1 "repos/apache-mynewt-core/kernel/os/include/os/mynewt.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/mynewt.h"
#define H_OS_MYNEWT_ 


# 1 "repos/apache-mynewt-core/sys/sysdown/include/sysdown/sysdown.h" 1
# 21 "repos/apache-mynewt-core/sys/sysdown/include/sysdown/sysdown.h"
#define H_SYSDOWN_ 



# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdbool.h" 1 3 4
# 29 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdbool.h" 3 4
#define _STDBOOL_H 



#define bool _Bool
#define true 1
#define false 0
# 52 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdbool.h" 3 4
#define __bool_true_false_are_defined 1
# 26 "repos/apache-mynewt-core/sys/sysdown/include/sysdown/sysdown.h" 2






#define SYSDOWN_COMPLETE 0
#define SYSDOWN_IN_PROGRESS 1




extern 
# 38 "repos/apache-mynewt-core/sys/sysdown/include/sysdown/sysdown.h" 3 4
      _Bool 
# 38 "repos/apache-mynewt-core/sys/sysdown/include/sysdown/sysdown.h"
           sysdown_active;

typedef int sysdown_fn(int reason);
typedef void sysdown_panic_fn(const char *file, int line, const char *func,
                              const char *expr, const char *msg);
typedef void sysdown_complete_fn(int status, void *arg);

extern sysdown_fn * const sysdown_cbs[];
extern sysdown_panic_fn *sysdown_panic_cb;

void sysdown_panic_set(sysdown_panic_fn *panic_fn);
# 63 "repos/apache-mynewt-core/sys/sysdown/include/sysdown/sysdown.h"
#define SYSDOWN_PANIC_MSG(msg) sysdown_panic_cb(0, 0, 0, 0, 0)




#define SYSDOWN_PANIC() SYSDOWN_PANIC_MSG(NULL)

#define SYSDOWN_ASSERT_MSG(rc,msg) do { if (!(rc)) { SYSDOWN_PANIC_MSG(msg); } } while (0)






#define SYSDOWN_ASSERT(rc) SYSDOWN_ASSERT_MSG(rc, NULL)







#define SYSDOWN_ASSERT_ACTIVE() assert(sysdown_active)
# 102 "repos/apache-mynewt-core/sys/sysdown/include/sysdown/sysdown.h"
int sysdown(int reason);
# 112 "repos/apache-mynewt-core/sys/sysdown/include/sysdown/sysdown.h"
void sysdown_release(void);
# 25 "repos/apache-mynewt-core/kernel/os/include/os/mynewt.h" 2

# 1 "bin/targets/bluepill_my_sensor/generated/include/sysflash/sysflash.h" 1





#define H_MYNEWT_SYSFLASH_ 

# 1 "repos/apache-mynewt-core/sys/flash_map/include/flash_map/flash_map.h" 1
# 21 "repos/apache-mynewt-core/sys/flash_map/include/flash_map/flash_map.h"
#define H_UTIL_FLASH_MAP_ 
# 47 "repos/apache-mynewt-core/sys/flash_map/include/flash_map/flash_map.h"
struct flash_area {
    uint8_t fa_id;
    uint8_t fa_device_id;
    uint16_t pad16;
    uint32_t fa_off;
    uint32_t fa_size;
};

struct flash_sector_range {
    struct flash_area fsr_flash_area;
    uint32_t fsr_range_start;
    uint16_t fsr_first_sector;
    uint16_t fsr_sector_count;
    uint32_t fsr_sector_size;
    uint8_t fsr_align;
};

extern const struct flash_area *flash_map;
extern int flash_map_entries;





void flash_map_init(void);




int flash_area_open(uint8_t id, const struct flash_area **);


#define flash_area_close(flash_area) 




int flash_area_read(const struct flash_area *, uint32_t off, void *dst,
  uint32_t len);
int flash_area_write(const struct flash_area *, uint32_t off, const void *src,
  uint32_t len);
int flash_area_erase(const struct flash_area *, uint32_t off, uint32_t len);




int flash_area_is_empty(const struct flash_area *, 
# 93 "repos/apache-mynewt-core/sys/flash_map/include/flash_map/flash_map.h" 3 4
                                                  _Bool 
# 93 "repos/apache-mynewt-core/sys/flash_map/include/flash_map/flash_map.h"
                                                       *);







int flash_area_read_is_empty(const struct flash_area *, uint32_t off, void *dst,
  uint32_t len);




uint8_t flash_area_align(const struct flash_area *);




uint32_t flash_area_erased_val(const struct flash_area *fa);




int flash_area_to_sectors(int idx, int *cnt, struct flash_area *ret);




int flash_area_to_sector_ranges(int id, int *cnt,
  struct flash_sector_range *ret);





int flash_area_getnext_sector(int id, int *sec_id, struct flash_area *ret);

int flash_area_id_from_image_slot(int slot);
int flash_area_id_to_image_slot(int area_id);
# 9 "bin/targets/bluepill_my_sensor/generated/include/sysflash/sysflash.h" 2






extern const struct flash_area sysflash_map_dflt[6];

#define FLASH_AREA_BOOTLOADER 0
#define FLASH_AREA_IMAGE_0 1
#define FLASH_AREA_IMAGE_1 2
#define FLASH_AREA_IMAGE_SCRATCH 3
#define FLASH_AREA_REBOOT_LOG 16
#define FLASH_AREA_NFFS 17
# 27 "repos/apache-mynewt-core/kernel/os/include/os/mynewt.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/os.h"
#define _OS_H 

# 1 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h" 1





#define _STDLIB_H 


# 1 "repos/apache-mynewt-core/libc/baselibc/include/klibc/inline.h" 1





#define _KLIBC_INLINE_H 






#define __extern_inline extern inline __attribute__((gnu_inline))
# 10 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h" 2
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 11 "repos/apache-mynewt-core/libc/baselibc/include/stdlib.h" 2






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


extern void add_malloc_block(void *, size_t);
extern void get_malloc_memory_status(size_t *, size_t *);





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
# 24 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 33 "repos/apache-mynewt-core/kernel/os/include/os/os.h"
#define min(a,b) ((a)<(b)?(a):(b))



#define max(a,b) ((a)>(b)?(a):(b))


#define os_get_return_addr() (__builtin_return_address(0))

#define OS_ALIGN(__n,__a) ( (((__n) & ((__a) - 1)) == 0) ? (__n) : ((__n) + ((__a) - ((__n) & ((__a) - 1)))) )






#define CTASSERT(x) typedef int __ctasssert ## __LINE__[(x) ? 1 : -1]
# 59 "repos/apache-mynewt-core/kernel/os/include/os/os.h"
extern int g_os_started;

int os_info_init(void);



void os_init_idle_task(void);
# 75 "repos/apache-mynewt-core/kernel/os/include/os/os.h"
int os_started(void);





#define OS_WAIT_FOREVER (-1)




#define OS_IDLE_PRIO (0xff)




#define OS_MAIN_TASK_PRIO MYNEWT_VAL(OS_MAIN_TASK_PRIO)



#define OS_MAIN_STACK_SIZE MYNEWT_VAL(OS_MAIN_STACK_SIZE)







void os_init(int (*fn)(int argc, char **argv));




void os_start(void);




void os_reboot(int reason);





void os_system_reset(void);

# 1 "repos/apache-mynewt-core/kernel/os/include/os/endian.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/endian.h"
#define H_ENDIAN_ 
# 31 "repos/apache-mynewt-core/kernel/os/include/os/endian.h"
#define os_bswap_64(x) ((uint64_t) ((((x) & 0xff00000000000000ull) >> 56) | (((x) & 0x00ff000000000000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56)))
# 43 "repos/apache-mynewt-core/kernel/os/include/os/endian.h"
#define os_bswap_32(x) ((uint32_t) ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >> 8) | (((x) & 0x0000ff00) << 8) | (((x) & 0x000000ff) << 24)))







#define os_bswap_16(x) ((uint16_t) ((((x) & 0xff00) >> 8) | (((x) & 0x00ff) << 8)))
# 133 "repos/apache-mynewt-core/kernel/os/include/os/endian.h"
#define ntohll(x) os_bswap_64(x)



#define htonll ntohll



#define ntohl(x) os_bswap_32(x)



#define htonl ntohl



#define htons(x) os_bswap_16(x)



#define ntohs htons



#define htobe16(x) os_bswap_16(x)



#define htole16(x) ((uint16_t)(x))



#define be16toh(x) os_bswap_16(x)



#define le16toh(x) ((uint16_t)(x))



#define htobe32(x) os_bswap_32(x)



#define htole32(x) ((uint32_t)(x))



#define be32toh(x) os_bswap_32(x)



#define le32toh(x) ((uint32_t)(x))



#define htobe64(x) os_bswap_64(x)



#define htole64(x) ((uint64_t)(x))



#define be64toh(x) os_bswap_64(x)



#define le64toh(x) ((uint64_t)(x))




void put_le16(void *buf, uint16_t x);
void put_le32(void *buf, uint32_t x);
void put_le64(void *buf, uint64_t x);
uint16_t get_le16(const void *buf);
uint32_t get_le32(const void *buf);
uint64_t get_le64(const void *buf);
void put_be16(void *buf, uint16_t x);
void put_be32(void *buf, uint32_t x);
void put_be64(void *buf, uint64_t x);
uint16_t get_be16(const void *buf);
uint32_t get_be32(const void *buf);
uint64_t get_be64(const void *buf);
void swap_in_place(void *buf, int len);
void swap_buf(uint8_t *dst, const uint8_t *src, int len);
# 122 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h" 1
# 20 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h"
#define _OS_CALLOUT_H 
# 34 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h"
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h" 1
# 29 "repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h"
#define _OS_EVENTQ_H 



# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h" 1
# 61 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
#define _OS_TIME_H 



# 1 "repos/apache-mynewt-core/kernel/os/include/os/arch/cortex_m3/os/os_arch.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/arch/cortex_m3/os/os_arch.h"
#define _OS_ARCH_ARM_H 



# 1 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/include/mcu/cmsis_nvic.h" 1







#define MBED_CMSIS_NVIC_H 



#define NVIC_USER_IRQ_OFFSET 16
#define NVIC_NUM_VECTORS (NVIC_USER_IRQ_OFFSET + 43)

# 1 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f1xx.h" 1
# 57 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f1xx.h"
#define __STM32F1XX_H 
# 71 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f1xx.h"
#define STM32F1 
# 113 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f1xx.h"
#define __STM32F1_CMSIS_VERSION_MAIN (0x04)
#define __STM32F1_CMSIS_VERSION_SUB1 (0x02)
#define __STM32F1_CMSIS_VERSION_SUB2 (0x00)
#define __STM32F1_CMSIS_VERSION_RC (0x00)
#define __STM32F1_CMSIS_VERSION ((__STM32F1_CMSIS_VERSION_MAIN << 24) |(__STM32F1_CMSIS_VERSION_SUB1 << 16) |(__STM32F1_CMSIS_VERSION_SUB2 << 8 ) |(__STM32F1_CMSIS_VERSION_RC))
# 149 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f1xx.h"
# 1 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h" 1
# 56 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define __STM32F103xB_H 
# 68 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define __CM3_REV 0x0200U
#define __MPU_PRESENT 0U
#define __NVIC_PRIO_BITS 4U
#define __Vendor_SysTickConfig 0U
# 87 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
typedef enum
{

  NonMaskableInt_IRQn = -14,
  HardFault_IRQn = -13,
  MemoryManagement_IRQn = -12,
  BusFault_IRQn = -11,
  UsageFault_IRQn = -10,
  SVCall_IRQn = -5,
  DebugMonitor_IRQn = -4,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,


  WWDG_IRQn = 0,
  PVD_IRQn = 1,
  TAMPER_IRQn = 2,
  RTC_IRQn = 3,
  FLASH_IRQn = 4,
  RCC_IRQn = 5,
  EXTI0_IRQn = 6,
  EXTI1_IRQn = 7,
  EXTI2_IRQn = 8,
  EXTI3_IRQn = 9,
  EXTI4_IRQn = 10,
  DMA1_Channel1_IRQn = 11,
  DMA1_Channel2_IRQn = 12,
  DMA1_Channel3_IRQn = 13,
  DMA1_Channel4_IRQn = 14,
  DMA1_Channel5_IRQn = 15,
  DMA1_Channel6_IRQn = 16,
  DMA1_Channel7_IRQn = 17,
  ADC1_2_IRQn = 18,
  USB_HP_CAN1_TX_IRQn = 19,
  USB_LP_CAN1_RX0_IRQn = 20,
  CAN1_RX1_IRQn = 21,
  CAN1_SCE_IRQn = 22,
  EXTI9_5_IRQn = 23,
  TIM1_BRK_IRQn = 24,
  TIM1_UP_IRQn = 25,
  TIM1_TRG_COM_IRQn = 26,
  TIM1_CC_IRQn = 27,
  TIM2_IRQn = 28,
  TIM3_IRQn = 29,
  TIM4_IRQn = 30,
  I2C1_EV_IRQn = 31,
  I2C1_ER_IRQn = 32,
  I2C2_EV_IRQn = 33,
  I2C2_ER_IRQn = 34,
  SPI1_IRQn = 35,
  SPI2_IRQn = 36,
  USART1_IRQn = 37,
  USART2_IRQn = 38,
  USART3_IRQn = 39,
  EXTI15_10_IRQn = 40,
  RTC_Alarm_IRQn = 41,
  USBWakeUp_IRQn = 42,
} IRQn_Type;





# 1 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h" 1
# 32 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
#define __CORE_CM3_H_GENERIC 
# 63 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
# 1 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_version.h" 1
# 32 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_version.h"
#define __CMSIS_VERSION_H 


#define __CM_CMSIS_VERSION_MAIN ( 5U)
#define __CM_CMSIS_VERSION_SUB ( 1U)
#define __CM_CMSIS_VERSION ((__CM_CMSIS_VERSION_MAIN << 16U) | __CM_CMSIS_VERSION_SUB )
# 64 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h" 2


#define __CM3_CMSIS_VERSION_MAIN (__CM_CMSIS_VERSION_MAIN)
#define __CM3_CMSIS_VERSION_SUB (__CM_CMSIS_VERSION_SUB)
#define __CM3_CMSIS_VERSION ((__CM3_CMSIS_VERSION_MAIN << 16U) | __CM3_CMSIS_VERSION_SUB )


#define __CORTEX_M (3U)




#define __FPU_USED 0U
# 115 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
# 1 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_compiler.h" 1
# 26 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_compiler.h"
#define __CMSIS_COMPILER_H 
# 54 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_compiler.h"
# 1 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h" 1
# 26 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
#define __CMSIS_GCC_H 


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"



#define __has_builtin(x) (0)




#define __ASM __asm


#define __INLINE inline


#define __STATIC_INLINE static inline


#define __STATIC_FORCEINLINE __attribute__((always_inline)) static inline


#define __NO_RETURN __attribute__((__noreturn__))


#define __USED __attribute__((used))


#define __WEAK __attribute__((weak))


#define __PACKED __attribute__((packed, aligned(1)))


#define __PACKED_STRUCT struct __attribute__((packed, aligned(1)))


#define __PACKED_UNION union __attribute__((packed, aligned(1)))


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma GCC diagnostic pop
#define __UNALIGNED_UINT32(x) (((struct T_UINT32 *)(x))->v)


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma GCC diagnostic pop
#define __UNALIGNED_UINT16_WRITE(addr,val) (void)((((struct T_UINT16_WRITE *)(void *)(addr))->v) = (val))


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma GCC diagnostic pop
#define __UNALIGNED_UINT16_READ(addr) (((const struct T_UINT16_READ *)(const void *)(addr))->v)


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma GCC diagnostic pop
#define __UNALIGNED_UINT32_WRITE(addr,val) (void)((((struct T_UINT32_WRITE *)(void *)(addr))->v) = (val))


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma GCC diagnostic pop
#define __UNALIGNED_UINT32_READ(addr) (((const struct T_UINT32_READ *)(const void *)(addr))->v)


#define __ALIGNED(x) __attribute__((aligned(x)))


#define __RESTRICT __restrict
# 129 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __enable_irq(void)
{
  __asm volatile ("cpsie i" : : : "memory");
}







__attribute__((always_inline)) static inline void __disable_irq(void)
{
  __asm volatile ("cpsid i" : : : "memory");
}







__attribute__((always_inline)) static inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 181 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
}
# 205 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static inline uint32_t __get_PSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, psp" : "=r" (result) );
  return(result);
}
# 277 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}
# 301 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __get_MSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, msp" : "=r" (result) );
  return(result);
}
# 331 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}
# 382 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) :: "memory");
  return(result);
}
# 412 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 439 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __enable_fault_irq(void)
{
  __asm volatile ("cpsie f" : : : "memory");
}







__attribute__((always_inline)) static inline void __disable_fault_irq(void)
{
  __asm volatile ("cpsid f" : : : "memory");
}







__attribute__((always_inline)) static inline uint32_t __get_BASEPRI(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, basepri" : "=r" (result) );
  return(result);
}
# 491 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_BASEPRI(uint32_t basePri)
{
  __asm volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}
# 516 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  __asm volatile ("MSR basepri_max, %0" : : "r" (basePri) : "memory");
}







__attribute__((always_inline)) static inline uint32_t __get_FAULTMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, faultmask" : "=r" (result) );
  return(result);
}
# 557 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_FAULTMASK(uint32_t faultMask)
{
  __asm volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}
# 766 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __get_FPSCR(void)
{
# 782 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
  return(0U);

}







__attribute__((always_inline)) static inline void __set_FPSCR(uint32_t fpscr)
{
# 805 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
  (void)fpscr;

}
# 827 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
#define __CMSIS_GCC_OUT_REG(r) "=r" (r)
#define __CMSIS_GCC_RW_REG(r) "+r" (r)
#define __CMSIS_GCC_USE_REG(r) "r" (r)






#define __NOP() __ASM volatile ("nop")





#define __WFI() __ASM volatile ("wfi")







#define __WFE() __ASM volatile ("wfe")






#define __SEV() __ASM volatile ("sev")
# 866 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __ISB(void)
{
  __asm volatile ("isb 0xF":::"memory");
}







__attribute__((always_inline)) static inline void __DSB(void)
{
  __asm volatile ("dsb 0xF":::"memory");
}







__attribute__((always_inline)) static inline void __DMB(void)
{
  __asm volatile ("dmb 0xF":::"memory");
}
# 900 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __REV(uint32_t value)
{

  return __builtin_bswap32(value);






}
# 919 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __REV16(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rev16 %0, %1" : "=r" (result) : "r" (value) );
  return result;
}
# 934 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline int16_t __REVSH(int16_t value)
{

  return (int16_t)__builtin_bswap16(value);






}
# 954 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  op2 %= 32U;
  if (op2 == 0U)
  {
    return op1;
  }
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 972 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
#define __BKPT(value) __ASM volatile ("bkpt "#value)
# 981 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __RBIT(uint32_t value)
{
  uint32_t result;




   __asm volatile ("rbit %0, %1" : "=r" (result) : "r" (value) );
# 1001 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
  return result;
}
# 1011 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint8_t __CLZ(uint32_t value)
{
# 1022 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
  if (value == 0U)
  {
    return 32U;
  }
  return __builtin_clz(value);
}
# 1040 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint8_t __LDREXB(volatile uint8_t *addr)
{
    uint32_t result;


   __asm volatile ("ldrexb %0, %1" : "=r" (result) : "Q" (*addr) );






   return ((uint8_t) result);
}
# 1062 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint16_t __LDREXH(volatile uint16_t *addr)
{
    uint32_t result;


   __asm volatile ("ldrexh %0, %1" : "=r" (result) : "Q" (*addr) );






   return ((uint16_t) result);
}
# 1084 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __LDREXW(volatile uint32_t *addr)
{
    uint32_t result;

   __asm volatile ("ldrex %0, %1" : "=r" (result) : "Q" (*addr) );
   return(result);
}
# 1101 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __STREXB(uint8_t value, volatile uint8_t *addr)
{
   uint32_t result;

   __asm volatile ("strexb %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
   return(result);
}
# 1118 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __STREXH(uint16_t value, volatile uint16_t *addr)
{
   uint32_t result;

   __asm volatile ("strexh %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
   return(result);
}
# 1135 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __STREXW(uint32_t value, volatile uint32_t *addr)
{
   uint32_t result;

   __asm volatile ("strex %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" (value) );
   return(result);
}






__attribute__((always_inline)) static inline void __CLREX(void)
{
  __asm volatile ("clrex" ::: "memory");
}
# 1169 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
#define __SSAT(ARG1,ARG2) __extension__ ({ int32_t __RES, __ARG1 = (ARG1); __ASM ("ssat %0, %1, %2" : "=r" (__RES) : "I" (ARG2), "r" (__ARG1) ); __RES; })
# 1185 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
#define __USAT(ARG1,ARG2) __extension__ ({ uint32_t __RES, __ARG1 = (ARG1); __ASM ("usat %0, %1, %2" : "=r" (__RES) : "I" (ARG2), "r" (__ARG1) ); __RES; })
# 1201 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rrx %0, %1" : "=r" (result) : "r" (value) );
  return(result);
}
# 1216 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint8_t __LDRBT(volatile uint8_t *ptr)
{
    uint32_t result;


   __asm volatile ("ldrbt %0, %1" : "=r" (result) : "Q" (*ptr) );






   return ((uint8_t) result);
}
# 1238 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint16_t __LDRHT(volatile uint16_t *ptr)
{
    uint32_t result;


   __asm volatile ("ldrht %0, %1" : "=r" (result) : "Q" (*ptr) );






   return ((uint16_t) result);
}
# 1260 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __LDRT(volatile uint32_t *ptr)
{
    uint32_t result;

   __asm volatile ("ldrt %0, %1" : "=r" (result) : "Q" (*ptr) );
   return(result);
}
# 1275 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __STRBT(uint8_t value, volatile uint8_t *ptr)
{
   __asm volatile ("strbt %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1287 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __STRHT(uint16_t value, volatile uint16_t *ptr)
{
   __asm volatile ("strht %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1299 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __STRT(uint32_t value, volatile uint32_t *ptr)
{
   __asm volatile ("strt %1, %0" : "=Q" (*ptr) : "r" (value) );
}
# 2099 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_gcc.h"
#pragma GCC diagnostic pop
# 55 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/cmsis_compiler.h" 2
# 116 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h" 2
# 127 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
#define __CORE_CM3_H_DEPENDANT 
# 167 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
#define __I volatile const

#define __O volatile
#define __IO volatile


#define __IM volatile const
#define __OM volatile
#define __IOM volatile
# 206 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
typedef union
{
  struct
  {
    uint32_t _reserved0:27;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;


#define APSR_N_Pos 31U
#define APSR_N_Msk (1UL << APSR_N_Pos)

#define APSR_Z_Pos 30U
#define APSR_Z_Msk (1UL << APSR_Z_Pos)

#define APSR_C_Pos 29U
#define APSR_C_Msk (1UL << APSR_C_Pos)

#define APSR_V_Pos 28U
#define APSR_V_Msk (1UL << APSR_V_Pos)

#define APSR_Q_Pos 27U
#define APSR_Q_Msk (1UL << APSR_Q_Pos)





typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;


#define IPSR_ISR_Pos 0U
#define IPSR_ISR_Msk (0x1FFUL )





typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:1;
    uint32_t ICI_IT_1:6;
    uint32_t _reserved1:8;
    uint32_t T:1;
    uint32_t ICI_IT_2:2;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;


#define xPSR_N_Pos 31U
#define xPSR_N_Msk (1UL << xPSR_N_Pos)

#define xPSR_Z_Pos 30U
#define xPSR_Z_Msk (1UL << xPSR_Z_Pos)

#define xPSR_C_Pos 29U
#define xPSR_C_Msk (1UL << xPSR_C_Pos)

#define xPSR_V_Pos 28U
#define xPSR_V_Msk (1UL << xPSR_V_Pos)

#define xPSR_Q_Pos 27U
#define xPSR_Q_Msk (1UL << xPSR_Q_Pos)

#define xPSR_ICI_IT_2_Pos 25U
#define xPSR_ICI_IT_2_Msk (3UL << xPSR_ICI_IT_2_Pos)

#define xPSR_T_Pos 24U
#define xPSR_T_Msk (1UL << xPSR_T_Pos)

#define xPSR_ICI_IT_1_Pos 10U
#define xPSR_ICI_IT_1_Msk (0x3FUL << xPSR_ICI_IT_1_Pos)

#define xPSR_ISR_Pos 0U
#define xPSR_ISR_Msk (0x1FFUL )





typedef union
{
  struct
  {
    uint32_t nPRIV:1;
    uint32_t SPSEL:1;
    uint32_t _reserved1:30;
  } b;
  uint32_t w;
} CONTROL_Type;


#define CONTROL_SPSEL_Pos 1U
#define CONTROL_SPSEL_Msk (1UL << CONTROL_SPSEL_Pos)

#define CONTROL_nPRIV_Pos 0U
#define CONTROL_nPRIV_Msk (1UL )
# 340 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
typedef struct
{
  volatile uint32_t ISER[8U];
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];
        uint32_t RESERVED1[24U];
  volatile uint32_t ISPR[8U];
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];
        uint32_t RESERVED4[56U];
  volatile uint8_t IP[240U];
        uint32_t RESERVED5[644U];
  volatile uint32_t STIR;
} NVIC_Type;


#define NVIC_STIR_INTID_Pos 0U
#define NVIC_STIR_INTID_Msk (0x1FFUL )
# 374 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;
  volatile uint32_t VTOR;
  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
  volatile uint8_t SHP[12U];
  volatile uint32_t SHCSR;
  volatile uint32_t CFSR;
  volatile uint32_t HFSR;
  volatile uint32_t DFSR;
  volatile uint32_t MMFAR;
  volatile uint32_t BFAR;
  volatile uint32_t AFSR;
  volatile const uint32_t PFR[2U];
  volatile const uint32_t DFR;
  volatile const uint32_t ADR;
  volatile const uint32_t MMFR[4U];
  volatile const uint32_t ISAR[5U];
        uint32_t RESERVED0[5U];
  volatile uint32_t CPACR;
} SCB_Type;


#define SCB_CPUID_IMPLEMENTER_Pos 24U
#define SCB_CPUID_IMPLEMENTER_Msk (0xFFUL << SCB_CPUID_IMPLEMENTER_Pos)

#define SCB_CPUID_VARIANT_Pos 20U
#define SCB_CPUID_VARIANT_Msk (0xFUL << SCB_CPUID_VARIANT_Pos)

#define SCB_CPUID_ARCHITECTURE_Pos 16U
#define SCB_CPUID_ARCHITECTURE_Msk (0xFUL << SCB_CPUID_ARCHITECTURE_Pos)

#define SCB_CPUID_PARTNO_Pos 4U
#define SCB_CPUID_PARTNO_Msk (0xFFFUL << SCB_CPUID_PARTNO_Pos)

#define SCB_CPUID_REVISION_Pos 0U
#define SCB_CPUID_REVISION_Msk (0xFUL )


#define SCB_ICSR_NMIPENDSET_Pos 31U
#define SCB_ICSR_NMIPENDSET_Msk (1UL << SCB_ICSR_NMIPENDSET_Pos)

#define SCB_ICSR_PENDSVSET_Pos 28U
#define SCB_ICSR_PENDSVSET_Msk (1UL << SCB_ICSR_PENDSVSET_Pos)

#define SCB_ICSR_PENDSVCLR_Pos 27U
#define SCB_ICSR_PENDSVCLR_Msk (1UL << SCB_ICSR_PENDSVCLR_Pos)

#define SCB_ICSR_PENDSTSET_Pos 26U
#define SCB_ICSR_PENDSTSET_Msk (1UL << SCB_ICSR_PENDSTSET_Pos)

#define SCB_ICSR_PENDSTCLR_Pos 25U
#define SCB_ICSR_PENDSTCLR_Msk (1UL << SCB_ICSR_PENDSTCLR_Pos)

#define SCB_ICSR_ISRPREEMPT_Pos 23U
#define SCB_ICSR_ISRPREEMPT_Msk (1UL << SCB_ICSR_ISRPREEMPT_Pos)

#define SCB_ICSR_ISRPENDING_Pos 22U
#define SCB_ICSR_ISRPENDING_Msk (1UL << SCB_ICSR_ISRPENDING_Pos)

#define SCB_ICSR_VECTPENDING_Pos 12U
#define SCB_ICSR_VECTPENDING_Msk (0x1FFUL << SCB_ICSR_VECTPENDING_Pos)

#define SCB_ICSR_RETTOBASE_Pos 11U
#define SCB_ICSR_RETTOBASE_Msk (1UL << SCB_ICSR_RETTOBASE_Pos)

#define SCB_ICSR_VECTACTIVE_Pos 0U
#define SCB_ICSR_VECTACTIVE_Msk (0x1FFUL )



#define SCB_VTOR_TBLBASE_Pos 29U
#define SCB_VTOR_TBLBASE_Msk (1UL << SCB_VTOR_TBLBASE_Pos)

#define SCB_VTOR_TBLOFF_Pos 7U
#define SCB_VTOR_TBLOFF_Msk (0x3FFFFFUL << SCB_VTOR_TBLOFF_Pos)






#define SCB_AIRCR_VECTKEY_Pos 16U
#define SCB_AIRCR_VECTKEY_Msk (0xFFFFUL << SCB_AIRCR_VECTKEY_Pos)

#define SCB_AIRCR_VECTKEYSTAT_Pos 16U
#define SCB_AIRCR_VECTKEYSTAT_Msk (0xFFFFUL << SCB_AIRCR_VECTKEYSTAT_Pos)

#define SCB_AIRCR_ENDIANESS_Pos 15U
#define SCB_AIRCR_ENDIANESS_Msk (1UL << SCB_AIRCR_ENDIANESS_Pos)

#define SCB_AIRCR_PRIGROUP_Pos 8U
#define SCB_AIRCR_PRIGROUP_Msk (7UL << SCB_AIRCR_PRIGROUP_Pos)

#define SCB_AIRCR_SYSRESETREQ_Pos 2U
#define SCB_AIRCR_SYSRESETREQ_Msk (1UL << SCB_AIRCR_SYSRESETREQ_Pos)

#define SCB_AIRCR_VECTCLRACTIVE_Pos 1U
#define SCB_AIRCR_VECTCLRACTIVE_Msk (1UL << SCB_AIRCR_VECTCLRACTIVE_Pos)

#define SCB_AIRCR_VECTRESET_Pos 0U
#define SCB_AIRCR_VECTRESET_Msk (1UL )


#define SCB_SCR_SEVONPEND_Pos 4U
#define SCB_SCR_SEVONPEND_Msk (1UL << SCB_SCR_SEVONPEND_Pos)

#define SCB_SCR_SLEEPDEEP_Pos 2U
#define SCB_SCR_SLEEPDEEP_Msk (1UL << SCB_SCR_SLEEPDEEP_Pos)

#define SCB_SCR_SLEEPONEXIT_Pos 1U
#define SCB_SCR_SLEEPONEXIT_Msk (1UL << SCB_SCR_SLEEPONEXIT_Pos)


#define SCB_CCR_STKALIGN_Pos 9U
#define SCB_CCR_STKALIGN_Msk (1UL << SCB_CCR_STKALIGN_Pos)

#define SCB_CCR_BFHFNMIGN_Pos 8U
#define SCB_CCR_BFHFNMIGN_Msk (1UL << SCB_CCR_BFHFNMIGN_Pos)

#define SCB_CCR_DIV_0_TRP_Pos 4U
#define SCB_CCR_DIV_0_TRP_Msk (1UL << SCB_CCR_DIV_0_TRP_Pos)

#define SCB_CCR_UNALIGN_TRP_Pos 3U
#define SCB_CCR_UNALIGN_TRP_Msk (1UL << SCB_CCR_UNALIGN_TRP_Pos)

#define SCB_CCR_USERSETMPEND_Pos 1U
#define SCB_CCR_USERSETMPEND_Msk (1UL << SCB_CCR_USERSETMPEND_Pos)

#define SCB_CCR_NONBASETHRDENA_Pos 0U
#define SCB_CCR_NONBASETHRDENA_Msk (1UL )


#define SCB_SHCSR_USGFAULTENA_Pos 18U
#define SCB_SHCSR_USGFAULTENA_Msk (1UL << SCB_SHCSR_USGFAULTENA_Pos)

#define SCB_SHCSR_BUSFAULTENA_Pos 17U
#define SCB_SHCSR_BUSFAULTENA_Msk (1UL << SCB_SHCSR_BUSFAULTENA_Pos)

#define SCB_SHCSR_MEMFAULTENA_Pos 16U
#define SCB_SHCSR_MEMFAULTENA_Msk (1UL << SCB_SHCSR_MEMFAULTENA_Pos)

#define SCB_SHCSR_SVCALLPENDED_Pos 15U
#define SCB_SHCSR_SVCALLPENDED_Msk (1UL << SCB_SHCSR_SVCALLPENDED_Pos)

#define SCB_SHCSR_BUSFAULTPENDED_Pos 14U
#define SCB_SHCSR_BUSFAULTPENDED_Msk (1UL << SCB_SHCSR_BUSFAULTPENDED_Pos)

#define SCB_SHCSR_MEMFAULTPENDED_Pos 13U
#define SCB_SHCSR_MEMFAULTPENDED_Msk (1UL << SCB_SHCSR_MEMFAULTPENDED_Pos)

#define SCB_SHCSR_USGFAULTPENDED_Pos 12U
#define SCB_SHCSR_USGFAULTPENDED_Msk (1UL << SCB_SHCSR_USGFAULTPENDED_Pos)

#define SCB_SHCSR_SYSTICKACT_Pos 11U
#define SCB_SHCSR_SYSTICKACT_Msk (1UL << SCB_SHCSR_SYSTICKACT_Pos)

#define SCB_SHCSR_PENDSVACT_Pos 10U
#define SCB_SHCSR_PENDSVACT_Msk (1UL << SCB_SHCSR_PENDSVACT_Pos)

#define SCB_SHCSR_MONITORACT_Pos 8U
#define SCB_SHCSR_MONITORACT_Msk (1UL << SCB_SHCSR_MONITORACT_Pos)

#define SCB_SHCSR_SVCALLACT_Pos 7U
#define SCB_SHCSR_SVCALLACT_Msk (1UL << SCB_SHCSR_SVCALLACT_Pos)

#define SCB_SHCSR_USGFAULTACT_Pos 3U
#define SCB_SHCSR_USGFAULTACT_Msk (1UL << SCB_SHCSR_USGFAULTACT_Pos)

#define SCB_SHCSR_BUSFAULTACT_Pos 1U
#define SCB_SHCSR_BUSFAULTACT_Msk (1UL << SCB_SHCSR_BUSFAULTACT_Pos)

#define SCB_SHCSR_MEMFAULTACT_Pos 0U
#define SCB_SHCSR_MEMFAULTACT_Msk (1UL )


#define SCB_CFSR_USGFAULTSR_Pos 16U
#define SCB_CFSR_USGFAULTSR_Msk (0xFFFFUL << SCB_CFSR_USGFAULTSR_Pos)

#define SCB_CFSR_BUSFAULTSR_Pos 8U
#define SCB_CFSR_BUSFAULTSR_Msk (0xFFUL << SCB_CFSR_BUSFAULTSR_Pos)

#define SCB_CFSR_MEMFAULTSR_Pos 0U
#define SCB_CFSR_MEMFAULTSR_Msk (0xFFUL )


#define SCB_CFSR_MMARVALID_Pos (SCB_SHCSR_MEMFAULTACT_Pos + 7U)
#define SCB_CFSR_MMARVALID_Msk (1UL << SCB_CFSR_MMARVALID_Pos)

#define SCB_CFSR_MSTKERR_Pos (SCB_SHCSR_MEMFAULTACT_Pos + 4U)
#define SCB_CFSR_MSTKERR_Msk (1UL << SCB_CFSR_MSTKERR_Pos)

#define SCB_CFSR_MUNSTKERR_Pos (SCB_SHCSR_MEMFAULTACT_Pos + 3U)
#define SCB_CFSR_MUNSTKERR_Msk (1UL << SCB_CFSR_MUNSTKERR_Pos)

#define SCB_CFSR_DACCVIOL_Pos (SCB_SHCSR_MEMFAULTACT_Pos + 1U)
#define SCB_CFSR_DACCVIOL_Msk (1UL << SCB_CFSR_DACCVIOL_Pos)

#define SCB_CFSR_IACCVIOL_Pos (SCB_SHCSR_MEMFAULTACT_Pos + 0U)
#define SCB_CFSR_IACCVIOL_Msk (1UL )


#define SCB_CFSR_BFARVALID_Pos (SCB_CFSR_BUSFAULTSR_Pos + 7U)
#define SCB_CFSR_BFARVALID_Msk (1UL << SCB_CFSR_BFARVALID_Pos)

#define SCB_CFSR_STKERR_Pos (SCB_CFSR_BUSFAULTSR_Pos + 4U)
#define SCB_CFSR_STKERR_Msk (1UL << SCB_CFSR_STKERR_Pos)

#define SCB_CFSR_UNSTKERR_Pos (SCB_CFSR_BUSFAULTSR_Pos + 3U)
#define SCB_CFSR_UNSTKERR_Msk (1UL << SCB_CFSR_UNSTKERR_Pos)

#define SCB_CFSR_IMPRECISERR_Pos (SCB_CFSR_BUSFAULTSR_Pos + 2U)
#define SCB_CFSR_IMPRECISERR_Msk (1UL << SCB_CFSR_IMPRECISERR_Pos)

#define SCB_CFSR_PRECISERR_Pos (SCB_CFSR_BUSFAULTSR_Pos + 1U)
#define SCB_CFSR_PRECISERR_Msk (1UL << SCB_CFSR_PRECISERR_Pos)

#define SCB_CFSR_IBUSERR_Pos (SCB_CFSR_BUSFAULTSR_Pos + 0U)
#define SCB_CFSR_IBUSERR_Msk (1UL << SCB_CFSR_IBUSERR_Pos)


#define SCB_CFSR_DIVBYZERO_Pos (SCB_CFSR_USGFAULTSR_Pos + 9U)
#define SCB_CFSR_DIVBYZERO_Msk (1UL << SCB_CFSR_DIVBYZERO_Pos)

#define SCB_CFSR_UNALIGNED_Pos (SCB_CFSR_USGFAULTSR_Pos + 8U)
#define SCB_CFSR_UNALIGNED_Msk (1UL << SCB_CFSR_UNALIGNED_Pos)

#define SCB_CFSR_NOCP_Pos (SCB_CFSR_USGFAULTSR_Pos + 3U)
#define SCB_CFSR_NOCP_Msk (1UL << SCB_CFSR_NOCP_Pos)

#define SCB_CFSR_INVPC_Pos (SCB_CFSR_USGFAULTSR_Pos + 2U)
#define SCB_CFSR_INVPC_Msk (1UL << SCB_CFSR_INVPC_Pos)

#define SCB_CFSR_INVSTATE_Pos (SCB_CFSR_USGFAULTSR_Pos + 1U)
#define SCB_CFSR_INVSTATE_Msk (1UL << SCB_CFSR_INVSTATE_Pos)

#define SCB_CFSR_UNDEFINSTR_Pos (SCB_CFSR_USGFAULTSR_Pos + 0U)
#define SCB_CFSR_UNDEFINSTR_Msk (1UL << SCB_CFSR_UNDEFINSTR_Pos)


#define SCB_HFSR_DEBUGEVT_Pos 31U
#define SCB_HFSR_DEBUGEVT_Msk (1UL << SCB_HFSR_DEBUGEVT_Pos)

#define SCB_HFSR_FORCED_Pos 30U
#define SCB_HFSR_FORCED_Msk (1UL << SCB_HFSR_FORCED_Pos)

#define SCB_HFSR_VECTTBL_Pos 1U
#define SCB_HFSR_VECTTBL_Msk (1UL << SCB_HFSR_VECTTBL_Pos)


#define SCB_DFSR_EXTERNAL_Pos 4U
#define SCB_DFSR_EXTERNAL_Msk (1UL << SCB_DFSR_EXTERNAL_Pos)

#define SCB_DFSR_VCATCH_Pos 3U
#define SCB_DFSR_VCATCH_Msk (1UL << SCB_DFSR_VCATCH_Pos)

#define SCB_DFSR_DWTTRAP_Pos 2U
#define SCB_DFSR_DWTTRAP_Msk (1UL << SCB_DFSR_DWTTRAP_Pos)

#define SCB_DFSR_BKPT_Pos 1U
#define SCB_DFSR_BKPT_Msk (1UL << SCB_DFSR_BKPT_Pos)

#define SCB_DFSR_HALTED_Pos 0U
#define SCB_DFSR_HALTED_Msk (1UL )
# 655 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const uint32_t ICTR;

  volatile uint32_t ACTLR;



} SCnSCB_Type;


#define SCnSCB_ICTR_INTLINESNUM_Pos 0U
#define SCnSCB_ICTR_INTLINESNUM_Msk (0xFUL )



#define SCnSCB_ACTLR_DISOOFP_Pos 9U
#define SCnSCB_ACTLR_DISOOFP_Msk (1UL << SCnSCB_ACTLR_DISOOFP_Pos)

#define SCnSCB_ACTLR_DISFPCA_Pos 8U
#define SCnSCB_ACTLR_DISFPCA_Msk (1UL << SCnSCB_ACTLR_DISFPCA_Pos)

#define SCnSCB_ACTLR_DISFOLD_Pos 2U
#define SCnSCB_ACTLR_DISFOLD_Msk (1UL << SCnSCB_ACTLR_DISFOLD_Pos)

#define SCnSCB_ACTLR_DISDEFWBUF_Pos 1U
#define SCnSCB_ACTLR_DISDEFWBUF_Msk (1UL << SCnSCB_ACTLR_DISDEFWBUF_Pos)

#define SCnSCB_ACTLR_DISMCYCINT_Pos 0U
#define SCnSCB_ACTLR_DISMCYCINT_Msk (1UL )
# 701 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;


#define SysTick_CTRL_COUNTFLAG_Pos 16U
#define SysTick_CTRL_COUNTFLAG_Msk (1UL << SysTick_CTRL_COUNTFLAG_Pos)

#define SysTick_CTRL_CLKSOURCE_Pos 2U
#define SysTick_CTRL_CLKSOURCE_Msk (1UL << SysTick_CTRL_CLKSOURCE_Pos)

#define SysTick_CTRL_TICKINT_Pos 1U
#define SysTick_CTRL_TICKINT_Msk (1UL << SysTick_CTRL_TICKINT_Pos)

#define SysTick_CTRL_ENABLE_Pos 0U
#define SysTick_CTRL_ENABLE_Msk (1UL )


#define SysTick_LOAD_RELOAD_Pos 0U
#define SysTick_LOAD_RELOAD_Msk (0xFFFFFFUL )


#define SysTick_VAL_CURRENT_Pos 0U
#define SysTick_VAL_CURRENT_Msk (0xFFFFFFUL )


#define SysTick_CALIB_NOREF_Pos 31U
#define SysTick_CALIB_NOREF_Msk (1UL << SysTick_CALIB_NOREF_Pos)

#define SysTick_CALIB_SKEW_Pos 30U
#define SysTick_CALIB_SKEW_Msk (1UL << SysTick_CALIB_SKEW_Pos)

#define SysTick_CALIB_TENMS_Pos 0U
#define SysTick_CALIB_TENMS_Msk (0xFFFFFFUL )
# 753 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
typedef struct
{
  volatile union
  {
    volatile uint8_t u8;
    volatile uint16_t u16;
    volatile uint32_t u32;
  } PORT [32U];
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;
        uint32_t RESERVED3[32U];
        uint32_t RESERVED4[43U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
        uint32_t RESERVED5[6U];
  volatile const uint32_t PID4;
  volatile const uint32_t PID5;
  volatile const uint32_t PID6;
  volatile const uint32_t PID7;
  volatile const uint32_t PID0;
  volatile const uint32_t PID1;
  volatile const uint32_t PID2;
  volatile const uint32_t PID3;
  volatile const uint32_t CID0;
  volatile const uint32_t CID1;
  volatile const uint32_t CID2;
  volatile const uint32_t CID3;
} ITM_Type;


#define ITM_TPR_PRIVMASK_Pos 0U
#define ITM_TPR_PRIVMASK_Msk (0xFFFFFFFFUL )


#define ITM_TCR_BUSY_Pos 23U
#define ITM_TCR_BUSY_Msk (1UL << ITM_TCR_BUSY_Pos)

#define ITM_TCR_TraceBusID_Pos 16U
#define ITM_TCR_TraceBusID_Msk (0x7FUL << ITM_TCR_TraceBusID_Pos)

#define ITM_TCR_GTSFREQ_Pos 10U
#define ITM_TCR_GTSFREQ_Msk (3UL << ITM_TCR_GTSFREQ_Pos)

#define ITM_TCR_TSPrescale_Pos 8U
#define ITM_TCR_TSPrescale_Msk (3UL << ITM_TCR_TSPrescale_Pos)

#define ITM_TCR_SWOENA_Pos 4U
#define ITM_TCR_SWOENA_Msk (1UL << ITM_TCR_SWOENA_Pos)

#define ITM_TCR_DWTENA_Pos 3U
#define ITM_TCR_DWTENA_Msk (1UL << ITM_TCR_DWTENA_Pos)

#define ITM_TCR_SYNCENA_Pos 2U
#define ITM_TCR_SYNCENA_Msk (1UL << ITM_TCR_SYNCENA_Pos)

#define ITM_TCR_TSENA_Pos 1U
#define ITM_TCR_TSENA_Msk (1UL << ITM_TCR_TSENA_Pos)

#define ITM_TCR_ITMENA_Pos 0U
#define ITM_TCR_ITMENA_Msk (1UL )


#define ITM_LSR_ByteAcc_Pos 2U
#define ITM_LSR_ByteAcc_Msk (1UL << ITM_LSR_ByteAcc_Pos)

#define ITM_LSR_Access_Pos 1U
#define ITM_LSR_Access_Msk (1UL << ITM_LSR_Access_Pos)

#define ITM_LSR_Present_Pos 0U
#define ITM_LSR_Present_Msk (1UL )
# 841 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t CYCCNT;
  volatile uint32_t CPICNT;
  volatile uint32_t EXCCNT;
  volatile uint32_t SLEEPCNT;
  volatile uint32_t LSUCNT;
  volatile uint32_t FOLDCNT;
  volatile const uint32_t PCSR;
  volatile uint32_t COMP0;
  volatile uint32_t MASK0;
  volatile uint32_t FUNCTION0;
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;
  volatile uint32_t MASK1;
  volatile uint32_t FUNCTION1;
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;
  volatile uint32_t MASK2;
  volatile uint32_t FUNCTION2;
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;
  volatile uint32_t MASK3;
  volatile uint32_t FUNCTION3;
} DWT_Type;


#define DWT_CTRL_NUMCOMP_Pos 28U
#define DWT_CTRL_NUMCOMP_Msk (0xFUL << DWT_CTRL_NUMCOMP_Pos)

#define DWT_CTRL_NOTRCPKT_Pos 27U
#define DWT_CTRL_NOTRCPKT_Msk (0x1UL << DWT_CTRL_NOTRCPKT_Pos)

#define DWT_CTRL_NOEXTTRIG_Pos 26U
#define DWT_CTRL_NOEXTTRIG_Msk (0x1UL << DWT_CTRL_NOEXTTRIG_Pos)

#define DWT_CTRL_NOCYCCNT_Pos 25U
#define DWT_CTRL_NOCYCCNT_Msk (0x1UL << DWT_CTRL_NOCYCCNT_Pos)

#define DWT_CTRL_NOPRFCNT_Pos 24U
#define DWT_CTRL_NOPRFCNT_Msk (0x1UL << DWT_CTRL_NOPRFCNT_Pos)

#define DWT_CTRL_CYCEVTENA_Pos 22U
#define DWT_CTRL_CYCEVTENA_Msk (0x1UL << DWT_CTRL_CYCEVTENA_Pos)

#define DWT_CTRL_FOLDEVTENA_Pos 21U
#define DWT_CTRL_FOLDEVTENA_Msk (0x1UL << DWT_CTRL_FOLDEVTENA_Pos)

#define DWT_CTRL_LSUEVTENA_Pos 20U
#define DWT_CTRL_LSUEVTENA_Msk (0x1UL << DWT_CTRL_LSUEVTENA_Pos)

#define DWT_CTRL_SLEEPEVTENA_Pos 19U
#define DWT_CTRL_SLEEPEVTENA_Msk (0x1UL << DWT_CTRL_SLEEPEVTENA_Pos)

#define DWT_CTRL_EXCEVTENA_Pos 18U
#define DWT_CTRL_EXCEVTENA_Msk (0x1UL << DWT_CTRL_EXCEVTENA_Pos)

#define DWT_CTRL_CPIEVTENA_Pos 17U
#define DWT_CTRL_CPIEVTENA_Msk (0x1UL << DWT_CTRL_CPIEVTENA_Pos)

#define DWT_CTRL_EXCTRCENA_Pos 16U
#define DWT_CTRL_EXCTRCENA_Msk (0x1UL << DWT_CTRL_EXCTRCENA_Pos)

#define DWT_CTRL_PCSAMPLENA_Pos 12U
#define DWT_CTRL_PCSAMPLENA_Msk (0x1UL << DWT_CTRL_PCSAMPLENA_Pos)

#define DWT_CTRL_SYNCTAP_Pos 10U
#define DWT_CTRL_SYNCTAP_Msk (0x3UL << DWT_CTRL_SYNCTAP_Pos)

#define DWT_CTRL_CYCTAP_Pos 9U
#define DWT_CTRL_CYCTAP_Msk (0x1UL << DWT_CTRL_CYCTAP_Pos)

#define DWT_CTRL_POSTINIT_Pos 5U
#define DWT_CTRL_POSTINIT_Msk (0xFUL << DWT_CTRL_POSTINIT_Pos)

#define DWT_CTRL_POSTPRESET_Pos 1U
#define DWT_CTRL_POSTPRESET_Msk (0xFUL << DWT_CTRL_POSTPRESET_Pos)

#define DWT_CTRL_CYCCNTENA_Pos 0U
#define DWT_CTRL_CYCCNTENA_Msk (0x1UL )


#define DWT_CPICNT_CPICNT_Pos 0U
#define DWT_CPICNT_CPICNT_Msk (0xFFUL )


#define DWT_EXCCNT_EXCCNT_Pos 0U
#define DWT_EXCCNT_EXCCNT_Msk (0xFFUL )


#define DWT_SLEEPCNT_SLEEPCNT_Pos 0U
#define DWT_SLEEPCNT_SLEEPCNT_Msk (0xFFUL )


#define DWT_LSUCNT_LSUCNT_Pos 0U
#define DWT_LSUCNT_LSUCNT_Msk (0xFFUL )


#define DWT_FOLDCNT_FOLDCNT_Pos 0U
#define DWT_FOLDCNT_FOLDCNT_Msk (0xFFUL )


#define DWT_MASK_MASK_Pos 0U
#define DWT_MASK_MASK_Msk (0x1FUL )


#define DWT_FUNCTION_MATCHED_Pos 24U
#define DWT_FUNCTION_MATCHED_Msk (0x1UL << DWT_FUNCTION_MATCHED_Pos)

#define DWT_FUNCTION_DATAVADDR1_Pos 16U
#define DWT_FUNCTION_DATAVADDR1_Msk (0xFUL << DWT_FUNCTION_DATAVADDR1_Pos)

#define DWT_FUNCTION_DATAVADDR0_Pos 12U
#define DWT_FUNCTION_DATAVADDR0_Msk (0xFUL << DWT_FUNCTION_DATAVADDR0_Pos)

#define DWT_FUNCTION_DATAVSIZE_Pos 10U
#define DWT_FUNCTION_DATAVSIZE_Msk (0x3UL << DWT_FUNCTION_DATAVSIZE_Pos)

#define DWT_FUNCTION_LNK1ENA_Pos 9U
#define DWT_FUNCTION_LNK1ENA_Msk (0x1UL << DWT_FUNCTION_LNK1ENA_Pos)

#define DWT_FUNCTION_DATAVMATCH_Pos 8U
#define DWT_FUNCTION_DATAVMATCH_Msk (0x1UL << DWT_FUNCTION_DATAVMATCH_Pos)

#define DWT_FUNCTION_CYCMATCH_Pos 7U
#define DWT_FUNCTION_CYCMATCH_Msk (0x1UL << DWT_FUNCTION_CYCMATCH_Pos)

#define DWT_FUNCTION_EMITRANGE_Pos 5U
#define DWT_FUNCTION_EMITRANGE_Msk (0x1UL << DWT_FUNCTION_EMITRANGE_Pos)

#define DWT_FUNCTION_FUNCTION_Pos 0U
#define DWT_FUNCTION_FUNCTION_Msk (0xFUL )
# 988 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
typedef struct
{
  volatile const uint32_t SSPSR;
  volatile uint32_t CSPSR;
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;
        uint32_t RESERVED2[131U];
  volatile const uint32_t FFSR;
  volatile uint32_t FFCR;
  volatile const uint32_t FSCR;
        uint32_t RESERVED3[759U];
  volatile const uint32_t TRIGGER;
  volatile const uint32_t FIFO0;
  volatile const uint32_t ITATBCTR2;
        uint32_t RESERVED4[1U];
  volatile const uint32_t ITATBCTR0;
  volatile const uint32_t FIFO1;
  volatile uint32_t ITCTRL;
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;
  volatile uint32_t CLAIMCLR;
        uint32_t RESERVED7[8U];
  volatile const uint32_t DEVID;
  volatile const uint32_t DEVTYPE;
} TPI_Type;


#define TPI_ACPR_PRESCALER_Pos 0U
#define TPI_ACPR_PRESCALER_Msk (0x1FFFUL )


#define TPI_SPPR_TXMODE_Pos 0U
#define TPI_SPPR_TXMODE_Msk (0x3UL )


#define TPI_FFSR_FtNonStop_Pos 3U
#define TPI_FFSR_FtNonStop_Msk (0x1UL << TPI_FFSR_FtNonStop_Pos)

#define TPI_FFSR_TCPresent_Pos 2U
#define TPI_FFSR_TCPresent_Msk (0x1UL << TPI_FFSR_TCPresent_Pos)

#define TPI_FFSR_FtStopped_Pos 1U
#define TPI_FFSR_FtStopped_Msk (0x1UL << TPI_FFSR_FtStopped_Pos)

#define TPI_FFSR_FlInProg_Pos 0U
#define TPI_FFSR_FlInProg_Msk (0x1UL )


#define TPI_FFCR_TrigIn_Pos 8U
#define TPI_FFCR_TrigIn_Msk (0x1UL << TPI_FFCR_TrigIn_Pos)

#define TPI_FFCR_EnFCont_Pos 1U
#define TPI_FFCR_EnFCont_Msk (0x1UL << TPI_FFCR_EnFCont_Pos)


#define TPI_TRIGGER_TRIGGER_Pos 0U
#define TPI_TRIGGER_TRIGGER_Msk (0x1UL )


#define TPI_FIFO0_ITM_ATVALID_Pos 29U
#define TPI_FIFO0_ITM_ATVALID_Msk (0x1UL << TPI_FIFO0_ITM_ATVALID_Pos)

#define TPI_FIFO0_ITM_bytecount_Pos 27U
#define TPI_FIFO0_ITM_bytecount_Msk (0x3UL << TPI_FIFO0_ITM_bytecount_Pos)

#define TPI_FIFO0_ETM_ATVALID_Pos 26U
#define TPI_FIFO0_ETM_ATVALID_Msk (0x1UL << TPI_FIFO0_ETM_ATVALID_Pos)

#define TPI_FIFO0_ETM_bytecount_Pos 24U
#define TPI_FIFO0_ETM_bytecount_Msk (0x3UL << TPI_FIFO0_ETM_bytecount_Pos)

#define TPI_FIFO0_ETM2_Pos 16U
#define TPI_FIFO0_ETM2_Msk (0xFFUL << TPI_FIFO0_ETM2_Pos)

#define TPI_FIFO0_ETM1_Pos 8U
#define TPI_FIFO0_ETM1_Msk (0xFFUL << TPI_FIFO0_ETM1_Pos)

#define TPI_FIFO0_ETM0_Pos 0U
#define TPI_FIFO0_ETM0_Msk (0xFFUL )


#define TPI_ITATBCTR2_ATREADY2_Pos 0U
#define TPI_ITATBCTR2_ATREADY2_Msk (0x1UL )

#define TPI_ITATBCTR2_ATREADY1_Pos 0U
#define TPI_ITATBCTR2_ATREADY1_Msk (0x1UL )


#define TPI_FIFO1_ITM_ATVALID_Pos 29U
#define TPI_FIFO1_ITM_ATVALID_Msk (0x1UL << TPI_FIFO1_ITM_ATVALID_Pos)

#define TPI_FIFO1_ITM_bytecount_Pos 27U
#define TPI_FIFO1_ITM_bytecount_Msk (0x3UL << TPI_FIFO1_ITM_bytecount_Pos)

#define TPI_FIFO1_ETM_ATVALID_Pos 26U
#define TPI_FIFO1_ETM_ATVALID_Msk (0x1UL << TPI_FIFO1_ETM_ATVALID_Pos)

#define TPI_FIFO1_ETM_bytecount_Pos 24U
#define TPI_FIFO1_ETM_bytecount_Msk (0x3UL << TPI_FIFO1_ETM_bytecount_Pos)

#define TPI_FIFO1_ITM2_Pos 16U
#define TPI_FIFO1_ITM2_Msk (0xFFUL << TPI_FIFO1_ITM2_Pos)

#define TPI_FIFO1_ITM1_Pos 8U
#define TPI_FIFO1_ITM1_Msk (0xFFUL << TPI_FIFO1_ITM1_Pos)

#define TPI_FIFO1_ITM0_Pos 0U
#define TPI_FIFO1_ITM0_Msk (0xFFUL )


#define TPI_ITATBCTR0_ATREADY2_Pos 0U
#define TPI_ITATBCTR0_ATREADY2_Msk (0x1UL )

#define TPI_ITATBCTR0_ATREADY1_Pos 0U
#define TPI_ITATBCTR0_ATREADY1_Msk (0x1UL )


#define TPI_ITCTRL_Mode_Pos 0U
#define TPI_ITCTRL_Mode_Msk (0x3UL )


#define TPI_DEVID_NRZVALID_Pos 11U
#define TPI_DEVID_NRZVALID_Msk (0x1UL << TPI_DEVID_NRZVALID_Pos)

#define TPI_DEVID_MANCVALID_Pos 10U
#define TPI_DEVID_MANCVALID_Msk (0x1UL << TPI_DEVID_MANCVALID_Pos)

#define TPI_DEVID_PTINVALID_Pos 9U
#define TPI_DEVID_PTINVALID_Msk (0x1UL << TPI_DEVID_PTINVALID_Pos)

#define TPI_DEVID_MinBufSz_Pos 6U
#define TPI_DEVID_MinBufSz_Msk (0x7UL << TPI_DEVID_MinBufSz_Pos)

#define TPI_DEVID_AsynClkIn_Pos 5U
#define TPI_DEVID_AsynClkIn_Msk (0x1UL << TPI_DEVID_AsynClkIn_Pos)

#define TPI_DEVID_NrTraceInput_Pos 0U
#define TPI_DEVID_NrTraceInput_Msk (0x1FUL )


#define TPI_DEVTYPE_SubType_Pos 4U
#define TPI_DEVTYPE_SubType_Msk (0xFUL )

#define TPI_DEVTYPE_MajorType_Pos 0U
#define TPI_DEVTYPE_MajorType_Msk (0xFUL << TPI_DEVTYPE_MajorType_Pos)
# 1246 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
typedef struct
{
  volatile uint32_t DHCSR;
  volatile uint32_t DCRSR;
  volatile uint32_t DCRDR;
  volatile uint32_t DEMCR;
} CoreDebug_Type;


#define CoreDebug_DHCSR_DBGKEY_Pos 16U
#define CoreDebug_DHCSR_DBGKEY_Msk (0xFFFFUL << CoreDebug_DHCSR_DBGKEY_Pos)

#define CoreDebug_DHCSR_S_RESET_ST_Pos 25U
#define CoreDebug_DHCSR_S_RESET_ST_Msk (1UL << CoreDebug_DHCSR_S_RESET_ST_Pos)

#define CoreDebug_DHCSR_S_RETIRE_ST_Pos 24U
#define CoreDebug_DHCSR_S_RETIRE_ST_Msk (1UL << CoreDebug_DHCSR_S_RETIRE_ST_Pos)

#define CoreDebug_DHCSR_S_LOCKUP_Pos 19U
#define CoreDebug_DHCSR_S_LOCKUP_Msk (1UL << CoreDebug_DHCSR_S_LOCKUP_Pos)

#define CoreDebug_DHCSR_S_SLEEP_Pos 18U
#define CoreDebug_DHCSR_S_SLEEP_Msk (1UL << CoreDebug_DHCSR_S_SLEEP_Pos)

#define CoreDebug_DHCSR_S_HALT_Pos 17U
#define CoreDebug_DHCSR_S_HALT_Msk (1UL << CoreDebug_DHCSR_S_HALT_Pos)

#define CoreDebug_DHCSR_S_REGRDY_Pos 16U
#define CoreDebug_DHCSR_S_REGRDY_Msk (1UL << CoreDebug_DHCSR_S_REGRDY_Pos)

#define CoreDebug_DHCSR_C_SNAPSTALL_Pos 5U
#define CoreDebug_DHCSR_C_SNAPSTALL_Msk (1UL << CoreDebug_DHCSR_C_SNAPSTALL_Pos)

#define CoreDebug_DHCSR_C_MASKINTS_Pos 3U
#define CoreDebug_DHCSR_C_MASKINTS_Msk (1UL << CoreDebug_DHCSR_C_MASKINTS_Pos)

#define CoreDebug_DHCSR_C_STEP_Pos 2U
#define CoreDebug_DHCSR_C_STEP_Msk (1UL << CoreDebug_DHCSR_C_STEP_Pos)

#define CoreDebug_DHCSR_C_HALT_Pos 1U
#define CoreDebug_DHCSR_C_HALT_Msk (1UL << CoreDebug_DHCSR_C_HALT_Pos)

#define CoreDebug_DHCSR_C_DEBUGEN_Pos 0U
#define CoreDebug_DHCSR_C_DEBUGEN_Msk (1UL )


#define CoreDebug_DCRSR_REGWnR_Pos 16U
#define CoreDebug_DCRSR_REGWnR_Msk (1UL << CoreDebug_DCRSR_REGWnR_Pos)

#define CoreDebug_DCRSR_REGSEL_Pos 0U
#define CoreDebug_DCRSR_REGSEL_Msk (0x1FUL )


#define CoreDebug_DEMCR_TRCENA_Pos 24U
#define CoreDebug_DEMCR_TRCENA_Msk (1UL << CoreDebug_DEMCR_TRCENA_Pos)

#define CoreDebug_DEMCR_MON_REQ_Pos 19U
#define CoreDebug_DEMCR_MON_REQ_Msk (1UL << CoreDebug_DEMCR_MON_REQ_Pos)

#define CoreDebug_DEMCR_MON_STEP_Pos 18U
#define CoreDebug_DEMCR_MON_STEP_Msk (1UL << CoreDebug_DEMCR_MON_STEP_Pos)

#define CoreDebug_DEMCR_MON_PEND_Pos 17U
#define CoreDebug_DEMCR_MON_PEND_Msk (1UL << CoreDebug_DEMCR_MON_PEND_Pos)

#define CoreDebug_DEMCR_MON_EN_Pos 16U
#define CoreDebug_DEMCR_MON_EN_Msk (1UL << CoreDebug_DEMCR_MON_EN_Pos)

#define CoreDebug_DEMCR_VC_HARDERR_Pos 10U
#define CoreDebug_DEMCR_VC_HARDERR_Msk (1UL << CoreDebug_DEMCR_VC_HARDERR_Pos)

#define CoreDebug_DEMCR_VC_INTERR_Pos 9U
#define CoreDebug_DEMCR_VC_INTERR_Msk (1UL << CoreDebug_DEMCR_VC_INTERR_Pos)

#define CoreDebug_DEMCR_VC_BUSERR_Pos 8U
#define CoreDebug_DEMCR_VC_BUSERR_Msk (1UL << CoreDebug_DEMCR_VC_BUSERR_Pos)

#define CoreDebug_DEMCR_VC_STATERR_Pos 7U
#define CoreDebug_DEMCR_VC_STATERR_Msk (1UL << CoreDebug_DEMCR_VC_STATERR_Pos)

#define CoreDebug_DEMCR_VC_CHKERR_Pos 6U
#define CoreDebug_DEMCR_VC_CHKERR_Msk (1UL << CoreDebug_DEMCR_VC_CHKERR_Pos)

#define CoreDebug_DEMCR_VC_NOCPERR_Pos 5U
#define CoreDebug_DEMCR_VC_NOCPERR_Msk (1UL << CoreDebug_DEMCR_VC_NOCPERR_Pos)

#define CoreDebug_DEMCR_VC_MMERR_Pos 4U
#define CoreDebug_DEMCR_VC_MMERR_Msk (1UL << CoreDebug_DEMCR_VC_MMERR_Pos)

#define CoreDebug_DEMCR_VC_CORERESET_Pos 0U
#define CoreDebug_DEMCR_VC_CORERESET_Msk (1UL )
# 1354 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
#define _VAL2FLD(field,value) (((uint32_t)(value) << field ## _Pos) & field ## _Msk)







#define _FLD2VAL(field,value) (((uint32_t)(value) & field ## _Msk) >> field ## _Pos)
# 1375 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
#define SCS_BASE (0xE000E000UL)
#define ITM_BASE (0xE0000000UL)
#define DWT_BASE (0xE0001000UL)
#define TPI_BASE (0xE0040000UL)
#define CoreDebug_BASE (0xE000EDF0UL)
#define SysTick_BASE (SCS_BASE + 0x0010UL)
#define NVIC_BASE (SCS_BASE + 0x0100UL)
#define SCB_BASE (SCS_BASE + 0x0D00UL)

#define SCnSCB ((SCnSCB_Type *) SCS_BASE )
#define SCB ((SCB_Type *) SCB_BASE )
#define SysTick ((SysTick_Type *) SysTick_BASE )
#define NVIC ((NVIC_Type *) NVIC_BASE )
#define ITM ((ITM_Type *) ITM_BASE )
#define DWT ((DWT_Type *) DWT_BASE )
#define TPI ((TPI_Type *) TPI_BASE )
#define CoreDebug ((CoreDebug_Type *) CoreDebug_BASE)
# 1430 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
#define NVIC_SetPriorityGrouping __NVIC_SetPriorityGrouping
#define NVIC_GetPriorityGrouping __NVIC_GetPriorityGrouping
#define NVIC_EnableIRQ __NVIC_EnableIRQ
#define NVIC_GetEnableIRQ __NVIC_GetEnableIRQ
#define NVIC_DisableIRQ __NVIC_DisableIRQ
#define NVIC_GetPendingIRQ __NVIC_GetPendingIRQ
#define NVIC_SetPendingIRQ __NVIC_SetPendingIRQ
#define NVIC_ClearPendingIRQ __NVIC_ClearPendingIRQ
#define NVIC_GetActive __NVIC_GetActive
#define NVIC_SetPriority __NVIC_SetPriority
#define NVIC_GetPriority __NVIC_GetPriority
#define NVIC_SystemReset __NVIC_SystemReset
# 1450 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
#define NVIC_SetVector __NVIC_SetVector
#define NVIC_GetVector __NVIC_GetVector


#define NVIC_USER_IRQ_OFFSET 16



#define EXC_RETURN_HANDLER (0xFFFFFFF1UL)
#define EXC_RETURN_THREAD_MSP (0xFFFFFFF9UL)
#define EXC_RETURN_THREAD_PSP (0xFFFFFFFDUL)
# 1472 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline void __NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);

  reg_value = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));
  reg_value = (reg_value |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U) );
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = reg_value;
}







static inline uint32_t __NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}
# 1503 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline void __NVIC_EnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1520 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline uint32_t __NVIC_GetEnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1539 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline void __NVIC_DisableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __DSB();
    __ISB();
  }
}
# 1558 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline uint32_t __NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1577 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1592 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline void __NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1609 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline uint32_t __NVIC_GetActive(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1631 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline void __NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] = (uint8_t)((priority << (8U - 4U)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 4U)) & (uint32_t)0xFFUL);
  }
}
# 1653 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline uint32_t __NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) >= 0)
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] >> (8U - 4U)));
  }
  else
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] >> (8U - 4U)));
  }
}
# 1678 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4U)) ? (uint32_t)(4U) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4U)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4U));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority & (uint32_t)((1UL << (SubPriorityBits )) - 1UL)))
         );
}
# 1705 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4U)) ? (uint32_t)(4U) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4U)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4U));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority = (Priority ) & (uint32_t)((1UL << (SubPriorityBits )) - 1UL);
}
# 1728 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector)
{
  uint32_t vectors = (uint32_t )((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  (* (int *) (vectors + ((int32_t)IRQn + 16) * 4)) = vector;
}
# 1743 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline uint32_t __NVIC_GetVector(IRQn_Type IRQn)
{
  uint32_t vectors = (uint32_t )((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  return (uint32_t)(* (int *) (vectors + ((int32_t)IRQn + 16) * 4));
}






__attribute__((__noreturn__)) static inline void __NVIC_SystemReset(void)
{
  __DSB();

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = (uint32_t)((0x5FAUL << 16U) |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U) );
  __DSB();

  for(;;)
  {
    __asm volatile ("nop");
  }
}
# 1796 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline uint32_t SCB_GetFPUType(void)
{
    return 0U;
}
# 1827 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
  __NVIC_SetPriority (SysTick_IRQn, (1UL << 4U) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL << 1U) |
                   (1UL );
  return (0UL);
}
# 1857 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
extern volatile int32_t ITM_RxBuffer;
#define ITM_RXBUFFER_EMPTY ((int32_t)0x5AA55AA5U)
# 1869 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL ) != 0UL) )
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __asm volatile ("nop");
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}
# 1890 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;

  if (ITM_RxBuffer != ((int32_t)0x5AA55AA5U))
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = ((int32_t)0x5AA55AA5U);
  }

  return (ch);
}
# 1910 "repos/apache-mynewt-core/hw/cmsis-core/src/ext/core_cm3.h"
static inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == ((int32_t)0x5AA55AA5U))
  {
    return (0);
  }
  else
  {
    return (1);
  }
}
# 151 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h" 2
# 1 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/system_stm32f1xx.h" 1
# 50 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/system_stm32f1xx.h"
#define __SYSTEM_STM32F10X_H 
# 69 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/system_stm32f1xx.h"
extern uint32_t SystemCoreClock;
extern const uint8_t AHBPrescTable[16U];
extern const uint8_t APBPrescTable[8U];
# 97 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/system_stm32f1xx.h"
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);
# 152 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h" 2
# 162 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
typedef struct
{
  volatile uint32_t SR;
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SMPR1;
  volatile uint32_t SMPR2;
  volatile uint32_t JOFR1;
  volatile uint32_t JOFR2;
  volatile uint32_t JOFR3;
  volatile uint32_t JOFR4;
  volatile uint32_t HTR;
  volatile uint32_t LTR;
  volatile uint32_t SQR1;
  volatile uint32_t SQR2;
  volatile uint32_t SQR3;
  volatile uint32_t JSQR;
  volatile uint32_t JDR1;
  volatile uint32_t JDR2;
  volatile uint32_t JDR3;
  volatile uint32_t JDR4;
  volatile uint32_t DR;
} ADC_TypeDef;

typedef struct
{
  volatile uint32_t SR;
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  uint32_t RESERVED[16];
  volatile uint32_t DR;
} ADC_Common_TypeDef;





typedef struct
{
  uint32_t RESERVED0;
  volatile uint32_t DR1;
  volatile uint32_t DR2;
  volatile uint32_t DR3;
  volatile uint32_t DR4;
  volatile uint32_t DR5;
  volatile uint32_t DR6;
  volatile uint32_t DR7;
  volatile uint32_t DR8;
  volatile uint32_t DR9;
  volatile uint32_t DR10;
  volatile uint32_t RTCCR;
  volatile uint32_t CR;
  volatile uint32_t CSR;
} BKP_TypeDef;





typedef struct
{
  volatile uint32_t TIR;
  volatile uint32_t TDTR;
  volatile uint32_t TDLR;
  volatile uint32_t TDHR;
} CAN_TxMailBox_TypeDef;





typedef struct
{
  volatile uint32_t RIR;
  volatile uint32_t RDTR;
  volatile uint32_t RDLR;
  volatile uint32_t RDHR;
} CAN_FIFOMailBox_TypeDef;





typedef struct
{
  volatile uint32_t FR1;
  volatile uint32_t FR2;
} CAN_FilterRegister_TypeDef;





typedef struct
{
  volatile uint32_t MCR;
  volatile uint32_t MSR;
  volatile uint32_t TSR;
  volatile uint32_t RF0R;
  volatile uint32_t RF1R;
  volatile uint32_t IER;
  volatile uint32_t ESR;
  volatile uint32_t BTR;
  uint32_t RESERVED0[88];
  CAN_TxMailBox_TypeDef sTxMailBox[3];
  CAN_FIFOMailBox_TypeDef sFIFOMailBox[2];
  uint32_t RESERVED1[12];
  volatile uint32_t FMR;
  volatile uint32_t FM1R;
  uint32_t RESERVED2;
  volatile uint32_t FS1R;
  uint32_t RESERVED3;
  volatile uint32_t FFA1R;
  uint32_t RESERVED4;
  volatile uint32_t FA1R;
  uint32_t RESERVED5[8];
  CAN_FilterRegister_TypeDef sFilterRegister[14];
} CAN_TypeDef;





typedef struct
{
  volatile uint32_t DR;
  volatile uint8_t IDR;
  uint8_t RESERVED0;
  uint16_t RESERVED1;
  volatile uint32_t CR;
} CRC_TypeDef;






typedef struct
{
  volatile uint32_t IDCODE;
  volatile uint32_t CR;
}DBGMCU_TypeDef;





typedef struct
{
  volatile uint32_t CCR;
  volatile uint32_t CNDTR;
  volatile uint32_t CPAR;
  volatile uint32_t CMAR;
} DMA_Channel_TypeDef;

typedef struct
{
  volatile uint32_t ISR;
  volatile uint32_t IFCR;
} DMA_TypeDef;







typedef struct
{
  volatile uint32_t IMR;
  volatile uint32_t EMR;
  volatile uint32_t RTSR;
  volatile uint32_t FTSR;
  volatile uint32_t SWIER;
  volatile uint32_t PR;
} EXTI_TypeDef;





typedef struct
{
  volatile uint32_t ACR;
  volatile uint32_t KEYR;
  volatile uint32_t OPTKEYR;
  volatile uint32_t SR;
  volatile uint32_t CR;
  volatile uint32_t AR;
  volatile uint32_t RESERVED;
  volatile uint32_t OBR;
  volatile uint32_t WRPR;
} FLASH_TypeDef;





typedef struct
{
  volatile uint16_t RDP;
  volatile uint16_t USER;
  volatile uint16_t Data0;
  volatile uint16_t Data1;
  volatile uint16_t WRP0;
  volatile uint16_t WRP1;
  volatile uint16_t WRP2;
  volatile uint16_t WRP3;
} OB_TypeDef;





typedef struct
{
  volatile uint32_t CRL;
  volatile uint32_t CRH;
  volatile uint32_t IDR;
  volatile uint32_t ODR;
  volatile uint32_t BSRR;
  volatile uint32_t BRR;
  volatile uint32_t LCKR;
} GPIO_TypeDef;





typedef struct
{
  volatile uint32_t EVCR;
  volatile uint32_t MAPR;
  volatile uint32_t EXTICR[4];
  uint32_t RESERVED0;
  volatile uint32_t MAPR2;
} AFIO_TypeDef;




typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t OAR1;
  volatile uint32_t OAR2;
  volatile uint32_t DR;
  volatile uint32_t SR1;
  volatile uint32_t SR2;
  volatile uint32_t CCR;
  volatile uint32_t TRISE;
} I2C_TypeDef;





typedef struct
{
  volatile uint32_t KR;
  volatile uint32_t PR;
  volatile uint32_t RLR;
  volatile uint32_t SR;
} IWDG_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CSR;
} PWR_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFGR;
  volatile uint32_t CIR;
  volatile uint32_t APB2RSTR;
  volatile uint32_t APB1RSTR;
  volatile uint32_t AHBENR;
  volatile uint32_t APB2ENR;
  volatile uint32_t APB1ENR;
  volatile uint32_t BDCR;
  volatile uint32_t CSR;


} RCC_TypeDef;





typedef struct
{
  volatile uint32_t CRH;
  volatile uint32_t CRL;
  volatile uint32_t PRLH;
  volatile uint32_t PRLL;
  volatile uint32_t DIVH;
  volatile uint32_t DIVL;
  volatile uint32_t CNTH;
  volatile uint32_t CNTL;
  volatile uint32_t ALRH;
  volatile uint32_t ALRL;
} RTC_TypeDef;





typedef struct
{
  volatile uint32_t POWER;
  volatile uint32_t CLKCR;
  volatile uint32_t ARG;
  volatile uint32_t CMD;
  volatile const uint32_t RESPCMD;
  volatile const uint32_t RESP1;
  volatile const uint32_t RESP2;
  volatile const uint32_t RESP3;
  volatile const uint32_t RESP4;
  volatile uint32_t DTIMER;
  volatile uint32_t DLEN;
  volatile uint32_t DCTRL;
  volatile const uint32_t DCOUNT;
  volatile const uint32_t STA;
  volatile uint32_t ICR;
  volatile uint32_t MASK;
  uint32_t RESERVED0[2];
  volatile const uint32_t FIFOCNT;
  uint32_t RESERVED1[13];
  volatile uint32_t FIFO;
} SDIO_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SR;
  volatile uint32_t DR;
  volatile uint32_t CRCPR;
  volatile uint32_t RXCRCR;
  volatile uint32_t TXCRCR;
  volatile uint32_t I2SCFGR;
} SPI_TypeDef;




typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SMCR;
  volatile uint32_t DIER;
  volatile uint32_t SR;
  volatile uint32_t EGR;
  volatile uint32_t CCMR1;
  volatile uint32_t CCMR2;
  volatile uint32_t CCER;
  volatile uint32_t CNT;
  volatile uint32_t PSC;
  volatile uint32_t ARR;
  volatile uint32_t RCR;
  volatile uint32_t CCR1;
  volatile uint32_t CCR2;
  volatile uint32_t CCR3;
  volatile uint32_t CCR4;
  volatile uint32_t BDTR;
  volatile uint32_t DCR;
  volatile uint32_t DMAR;
  volatile uint32_t OR;
}TIM_TypeDef;






typedef struct
{
  volatile uint32_t SR;
  volatile uint32_t DR;
  volatile uint32_t BRR;
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t CR3;
  volatile uint32_t GTPR;
} USART_TypeDef;





typedef struct
{
  volatile uint16_t EP0R;
  volatile uint16_t RESERVED0;
  volatile uint16_t EP1R;
  volatile uint16_t RESERVED1;
  volatile uint16_t EP2R;
  volatile uint16_t RESERVED2;
  volatile uint16_t EP3R;
  volatile uint16_t RESERVED3;
  volatile uint16_t EP4R;
  volatile uint16_t RESERVED4;
  volatile uint16_t EP5R;
  volatile uint16_t RESERVED5;
  volatile uint16_t EP6R;
  volatile uint16_t RESERVED6;
  volatile uint16_t EP7R;
  volatile uint16_t RESERVED7[17];
  volatile uint16_t CNTR;
  volatile uint16_t RESERVED8;
  volatile uint16_t ISTR;
  volatile uint16_t RESERVED9;
  volatile uint16_t FNR;
  volatile uint16_t RESERVEDA;
  volatile uint16_t DADDR;
  volatile uint16_t RESERVEDB;
  volatile uint16_t BTABLE;
  volatile uint16_t RESERVEDC;
} USB_TypeDef;






typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFR;
  volatile uint32_t SR;
} WWDG_TypeDef;
# 619 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define FLASH_BASE 0x08000000U
#define FLASH_BANK1_END 0x0801FFFFU
#define SRAM_BASE 0x20000000U
#define PERIPH_BASE 0x40000000U

#define SRAM_BB_BASE 0x22000000U
#define PERIPH_BB_BASE 0x42000000U



#define APB1PERIPH_BASE PERIPH_BASE
#define APB2PERIPH_BASE (PERIPH_BASE + 0x00010000U)
#define AHBPERIPH_BASE (PERIPH_BASE + 0x00020000U)

#define TIM2_BASE (APB1PERIPH_BASE + 0x00000000U)
#define TIM3_BASE (APB1PERIPH_BASE + 0x00000400U)
#define TIM4_BASE (APB1PERIPH_BASE + 0x00000800U)
#define RTC_BASE (APB1PERIPH_BASE + 0x00002800U)
#define WWDG_BASE (APB1PERIPH_BASE + 0x00002C00U)
#define IWDG_BASE (APB1PERIPH_BASE + 0x00003000U)
#define SPI2_BASE (APB1PERIPH_BASE + 0x00003800U)
#define USART2_BASE (APB1PERIPH_BASE + 0x00004400U)
#define USART3_BASE (APB1PERIPH_BASE + 0x00004800U)
#define I2C1_BASE (APB1PERIPH_BASE + 0x00005400U)
#define I2C2_BASE (APB1PERIPH_BASE + 0x5800)
#define CAN1_BASE (APB1PERIPH_BASE + 0x00006400U)
#define BKP_BASE (APB1PERIPH_BASE + 0x00006C00U)
#define PWR_BASE (APB1PERIPH_BASE + 0x00007000U)
#define AFIO_BASE (APB2PERIPH_BASE + 0x00000000U)
#define EXTI_BASE (APB2PERIPH_BASE + 0x00000400U)
#define GPIOA_BASE (APB2PERIPH_BASE + 0x00000800U)
#define GPIOB_BASE (APB2PERIPH_BASE + 0x00000C00U)
#define GPIOC_BASE (APB2PERIPH_BASE + 0x00001000U)
#define GPIOD_BASE (APB2PERIPH_BASE + 0x00001400U)
#define GPIOE_BASE (APB2PERIPH_BASE + 0x00001800U)
#define ADC1_BASE (APB2PERIPH_BASE + 0x00002400U)
#define ADC2_BASE (APB2PERIPH_BASE + 0x00002800U)
#define TIM1_BASE (APB2PERIPH_BASE + 0x00002C00U)
#define SPI1_BASE (APB2PERIPH_BASE + 0x00003000U)
#define USART1_BASE (APB2PERIPH_BASE + 0x00003800U)

#define SDIO_BASE (PERIPH_BASE + 0x00018000U)

#define DMA1_BASE (AHBPERIPH_BASE + 0x00000000U)
#define DMA1_Channel1_BASE (AHBPERIPH_BASE + 0x00000008U)
#define DMA1_Channel2_BASE (AHBPERIPH_BASE + 0x0000001CU)
#define DMA1_Channel3_BASE (AHBPERIPH_BASE + 0x00000030U)
#define DMA1_Channel4_BASE (AHBPERIPH_BASE + 0x00000044U)
#define DMA1_Channel5_BASE (AHBPERIPH_BASE + 0x00000058U)
#define DMA1_Channel6_BASE (AHBPERIPH_BASE + 0x0000006CU)
#define DMA1_Channel7_BASE (AHBPERIPH_BASE + 0x00000080U)
#define RCC_BASE (AHBPERIPH_BASE + 0x00001000U)
#define CRC_BASE (AHBPERIPH_BASE + 0x00003000U)

#define FLASH_R_BASE (AHBPERIPH_BASE + 0x00002000U)
#define FLASHSIZE_BASE 0x1FFFF7E0U
#define UID_BASE 0x1FFFF7E8U
#define OB_BASE 0x1FFFF800U



#define DBGMCU_BASE 0xE0042000U


#define USB_BASE (APB1PERIPH_BASE + 0x00005C00U)
#define USB_PMAADDR (APB1PERIPH_BASE + 0x00006000U)
# 695 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define TIM2 ((TIM_TypeDef *)TIM2_BASE)
#define TIM3 ((TIM_TypeDef *)TIM3_BASE)
#define TIM4 ((TIM_TypeDef *)TIM4_BASE)
#define RTC ((RTC_TypeDef *)RTC_BASE)
#define WWDG ((WWDG_TypeDef *)WWDG_BASE)
#define IWDG ((IWDG_TypeDef *)IWDG_BASE)
#define SPI2 ((SPI_TypeDef *)SPI2_BASE)
#define USART2 ((USART_TypeDef *)USART2_BASE)
#define USART3 ((USART_TypeDef *)USART3_BASE)
#define I2C1 ((I2C_TypeDef *)I2C1_BASE)
#define I2C2 ((I2C_TypeDef *)I2C2_BASE)
#define USB ((USB_TypeDef *)USB_BASE)
#define CAN1 ((CAN_TypeDef *)CAN1_BASE)
#define BKP ((BKP_TypeDef *)BKP_BASE)
#define PWR ((PWR_TypeDef *)PWR_BASE)
#define AFIO ((AFIO_TypeDef *)AFIO_BASE)
#define EXTI ((EXTI_TypeDef *)EXTI_BASE)
#define GPIOA ((GPIO_TypeDef *)GPIOA_BASE)
#define GPIOB ((GPIO_TypeDef *)GPIOB_BASE)
#define GPIOC ((GPIO_TypeDef *)GPIOC_BASE)
#define GPIOD ((GPIO_TypeDef *)GPIOD_BASE)
#define GPIOE ((GPIO_TypeDef *)GPIOE_BASE)
#define ADC1 ((ADC_TypeDef *)ADC1_BASE)
#define ADC2 ((ADC_TypeDef *)ADC2_BASE)
#define ADC12_COMMON ((ADC_Common_TypeDef *)ADC1_BASE)
#define TIM1 ((TIM_TypeDef *)TIM1_BASE)
#define SPI1 ((SPI_TypeDef *)SPI1_BASE)
#define USART1 ((USART_TypeDef *)USART1_BASE)
#define SDIO ((SDIO_TypeDef *)SDIO_BASE)
#define DMA1 ((DMA_TypeDef *)DMA1_BASE)
#define DMA1_Channel1 ((DMA_Channel_TypeDef *)DMA1_Channel1_BASE)
#define DMA1_Channel2 ((DMA_Channel_TypeDef *)DMA1_Channel2_BASE)
#define DMA1_Channel3 ((DMA_Channel_TypeDef *)DMA1_Channel3_BASE)
#define DMA1_Channel4 ((DMA_Channel_TypeDef *)DMA1_Channel4_BASE)
#define DMA1_Channel5 ((DMA_Channel_TypeDef *)DMA1_Channel5_BASE)
#define DMA1_Channel6 ((DMA_Channel_TypeDef *)DMA1_Channel6_BASE)
#define DMA1_Channel7 ((DMA_Channel_TypeDef *)DMA1_Channel7_BASE)
#define RCC ((RCC_TypeDef *)RCC_BASE)
#define CRC ((CRC_TypeDef *)CRC_BASE)
#define FLASH ((FLASH_TypeDef *)FLASH_R_BASE)
#define OB ((OB_TypeDef *)OB_BASE)
#define DBGMCU ((DBGMCU_TypeDef *)DBGMCU_BASE)
# 762 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define CRC_DR_DR_Pos (0U)
#define CRC_DR_DR_Msk (0xFFFFFFFFU << CRC_DR_DR_Pos)
#define CRC_DR_DR CRC_DR_DR_Msk


#define CRC_IDR_IDR_Pos (0U)
#define CRC_IDR_IDR_Msk (0xFFU << CRC_IDR_IDR_Pos)
#define CRC_IDR_IDR CRC_IDR_IDR_Msk


#define CRC_CR_RESET_Pos (0U)
#define CRC_CR_RESET_Msk (0x1U << CRC_CR_RESET_Pos)
#define CRC_CR_RESET CRC_CR_RESET_Msk
# 783 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define PWR_CR_LPDS_Pos (0U)
#define PWR_CR_LPDS_Msk (0x1U << PWR_CR_LPDS_Pos)
#define PWR_CR_LPDS PWR_CR_LPDS_Msk
#define PWR_CR_PDDS_Pos (1U)
#define PWR_CR_PDDS_Msk (0x1U << PWR_CR_PDDS_Pos)
#define PWR_CR_PDDS PWR_CR_PDDS_Msk
#define PWR_CR_CWUF_Pos (2U)
#define PWR_CR_CWUF_Msk (0x1U << PWR_CR_CWUF_Pos)
#define PWR_CR_CWUF PWR_CR_CWUF_Msk
#define PWR_CR_CSBF_Pos (3U)
#define PWR_CR_CSBF_Msk (0x1U << PWR_CR_CSBF_Pos)
#define PWR_CR_CSBF PWR_CR_CSBF_Msk
#define PWR_CR_PVDE_Pos (4U)
#define PWR_CR_PVDE_Msk (0x1U << PWR_CR_PVDE_Pos)
#define PWR_CR_PVDE PWR_CR_PVDE_Msk

#define PWR_CR_PLS_Pos (5U)
#define PWR_CR_PLS_Msk (0x7U << PWR_CR_PLS_Pos)
#define PWR_CR_PLS PWR_CR_PLS_Msk
#define PWR_CR_PLS_0 (0x1U << PWR_CR_PLS_Pos)
#define PWR_CR_PLS_1 (0x2U << PWR_CR_PLS_Pos)
#define PWR_CR_PLS_2 (0x4U << PWR_CR_PLS_Pos)


#define PWR_CR_PLS_LEV0 0x00000000U
#define PWR_CR_PLS_LEV1 0x00000020U
#define PWR_CR_PLS_LEV2 0x00000040U
#define PWR_CR_PLS_LEV3 0x00000060U
#define PWR_CR_PLS_LEV4 0x00000080U
#define PWR_CR_PLS_LEV5 0x000000A0U
#define PWR_CR_PLS_LEV6 0x000000C0U
#define PWR_CR_PLS_LEV7 0x000000E0U


#define PWR_CR_PLS_2V2 PWR_CR_PLS_LEV0
#define PWR_CR_PLS_2V3 PWR_CR_PLS_LEV1
#define PWR_CR_PLS_2V4 PWR_CR_PLS_LEV2
#define PWR_CR_PLS_2V5 PWR_CR_PLS_LEV3
#define PWR_CR_PLS_2V6 PWR_CR_PLS_LEV4
#define PWR_CR_PLS_2V7 PWR_CR_PLS_LEV5
#define PWR_CR_PLS_2V8 PWR_CR_PLS_LEV6
#define PWR_CR_PLS_2V9 PWR_CR_PLS_LEV7

#define PWR_CR_DBP_Pos (8U)
#define PWR_CR_DBP_Msk (0x1U << PWR_CR_DBP_Pos)
#define PWR_CR_DBP PWR_CR_DBP_Msk



#define PWR_CSR_WUF_Pos (0U)
#define PWR_CSR_WUF_Msk (0x1U << PWR_CSR_WUF_Pos)
#define PWR_CSR_WUF PWR_CSR_WUF_Msk
#define PWR_CSR_SBF_Pos (1U)
#define PWR_CSR_SBF_Msk (0x1U << PWR_CSR_SBF_Pos)
#define PWR_CSR_SBF PWR_CSR_SBF_Msk
#define PWR_CSR_PVDO_Pos (2U)
#define PWR_CSR_PVDO_Msk (0x1U << PWR_CSR_PVDO_Pos)
#define PWR_CSR_PVDO PWR_CSR_PVDO_Msk
#define PWR_CSR_EWUP_Pos (8U)
#define PWR_CSR_EWUP_Msk (0x1U << PWR_CSR_EWUP_Pos)
#define PWR_CSR_EWUP PWR_CSR_EWUP_Msk
# 852 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define BKP_DR1_D_Pos (0U)
#define BKP_DR1_D_Msk (0xFFFFU << BKP_DR1_D_Pos)
#define BKP_DR1_D BKP_DR1_D_Msk


#define BKP_DR2_D_Pos (0U)
#define BKP_DR2_D_Msk (0xFFFFU << BKP_DR2_D_Pos)
#define BKP_DR2_D BKP_DR2_D_Msk


#define BKP_DR3_D_Pos (0U)
#define BKP_DR3_D_Msk (0xFFFFU << BKP_DR3_D_Pos)
#define BKP_DR3_D BKP_DR3_D_Msk


#define BKP_DR4_D_Pos (0U)
#define BKP_DR4_D_Msk (0xFFFFU << BKP_DR4_D_Pos)
#define BKP_DR4_D BKP_DR4_D_Msk


#define BKP_DR5_D_Pos (0U)
#define BKP_DR5_D_Msk (0xFFFFU << BKP_DR5_D_Pos)
#define BKP_DR5_D BKP_DR5_D_Msk


#define BKP_DR6_D_Pos (0U)
#define BKP_DR6_D_Msk (0xFFFFU << BKP_DR6_D_Pos)
#define BKP_DR6_D BKP_DR6_D_Msk


#define BKP_DR7_D_Pos (0U)
#define BKP_DR7_D_Msk (0xFFFFU << BKP_DR7_D_Pos)
#define BKP_DR7_D BKP_DR7_D_Msk


#define BKP_DR8_D_Pos (0U)
#define BKP_DR8_D_Msk (0xFFFFU << BKP_DR8_D_Pos)
#define BKP_DR8_D BKP_DR8_D_Msk


#define BKP_DR9_D_Pos (0U)
#define BKP_DR9_D_Msk (0xFFFFU << BKP_DR9_D_Pos)
#define BKP_DR9_D BKP_DR9_D_Msk


#define BKP_DR10_D_Pos (0U)
#define BKP_DR10_D_Msk (0xFFFFU << BKP_DR10_D_Pos)
#define BKP_DR10_D BKP_DR10_D_Msk

#define RTC_BKP_NUMBER 10


#define BKP_RTCCR_CAL_Pos (0U)
#define BKP_RTCCR_CAL_Msk (0x7FU << BKP_RTCCR_CAL_Pos)
#define BKP_RTCCR_CAL BKP_RTCCR_CAL_Msk
#define BKP_RTCCR_CCO_Pos (7U)
#define BKP_RTCCR_CCO_Msk (0x1U << BKP_RTCCR_CCO_Pos)
#define BKP_RTCCR_CCO BKP_RTCCR_CCO_Msk
#define BKP_RTCCR_ASOE_Pos (8U)
#define BKP_RTCCR_ASOE_Msk (0x1U << BKP_RTCCR_ASOE_Pos)
#define BKP_RTCCR_ASOE BKP_RTCCR_ASOE_Msk
#define BKP_RTCCR_ASOS_Pos (9U)
#define BKP_RTCCR_ASOS_Msk (0x1U << BKP_RTCCR_ASOS_Pos)
#define BKP_RTCCR_ASOS BKP_RTCCR_ASOS_Msk


#define BKP_CR_TPE_Pos (0U)
#define BKP_CR_TPE_Msk (0x1U << BKP_CR_TPE_Pos)
#define BKP_CR_TPE BKP_CR_TPE_Msk
#define BKP_CR_TPAL_Pos (1U)
#define BKP_CR_TPAL_Msk (0x1U << BKP_CR_TPAL_Pos)
#define BKP_CR_TPAL BKP_CR_TPAL_Msk


#define BKP_CSR_CTE_Pos (0U)
#define BKP_CSR_CTE_Msk (0x1U << BKP_CSR_CTE_Pos)
#define BKP_CSR_CTE BKP_CSR_CTE_Msk
#define BKP_CSR_CTI_Pos (1U)
#define BKP_CSR_CTI_Msk (0x1U << BKP_CSR_CTI_Pos)
#define BKP_CSR_CTI BKP_CSR_CTI_Msk
#define BKP_CSR_TPIE_Pos (2U)
#define BKP_CSR_TPIE_Msk (0x1U << BKP_CSR_TPIE_Pos)
#define BKP_CSR_TPIE BKP_CSR_TPIE_Msk
#define BKP_CSR_TEF_Pos (8U)
#define BKP_CSR_TEF_Msk (0x1U << BKP_CSR_TEF_Pos)
#define BKP_CSR_TEF BKP_CSR_TEF_Msk
#define BKP_CSR_TIF_Pos (9U)
#define BKP_CSR_TIF_Msk (0x1U << BKP_CSR_TIF_Pos)
#define BKP_CSR_TIF BKP_CSR_TIF_Msk
# 949 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define RCC_CR_HSION_Pos (0U)
#define RCC_CR_HSION_Msk (0x1U << RCC_CR_HSION_Pos)
#define RCC_CR_HSION RCC_CR_HSION_Msk
#define RCC_CR_HSIRDY_Pos (1U)
#define RCC_CR_HSIRDY_Msk (0x1U << RCC_CR_HSIRDY_Pos)
#define RCC_CR_HSIRDY RCC_CR_HSIRDY_Msk
#define RCC_CR_HSITRIM_Pos (3U)
#define RCC_CR_HSITRIM_Msk (0x1FU << RCC_CR_HSITRIM_Pos)
#define RCC_CR_HSITRIM RCC_CR_HSITRIM_Msk
#define RCC_CR_HSICAL_Pos (8U)
#define RCC_CR_HSICAL_Msk (0xFFU << RCC_CR_HSICAL_Pos)
#define RCC_CR_HSICAL RCC_CR_HSICAL_Msk
#define RCC_CR_HSEON_Pos (16U)
#define RCC_CR_HSEON_Msk (0x1U << RCC_CR_HSEON_Pos)
#define RCC_CR_HSEON RCC_CR_HSEON_Msk
#define RCC_CR_HSERDY_Pos (17U)
#define RCC_CR_HSERDY_Msk (0x1U << RCC_CR_HSERDY_Pos)
#define RCC_CR_HSERDY RCC_CR_HSERDY_Msk
#define RCC_CR_HSEBYP_Pos (18U)
#define RCC_CR_HSEBYP_Msk (0x1U << RCC_CR_HSEBYP_Pos)
#define RCC_CR_HSEBYP RCC_CR_HSEBYP_Msk
#define RCC_CR_CSSON_Pos (19U)
#define RCC_CR_CSSON_Msk (0x1U << RCC_CR_CSSON_Pos)
#define RCC_CR_CSSON RCC_CR_CSSON_Msk
#define RCC_CR_PLLON_Pos (24U)
#define RCC_CR_PLLON_Msk (0x1U << RCC_CR_PLLON_Pos)
#define RCC_CR_PLLON RCC_CR_PLLON_Msk
#define RCC_CR_PLLRDY_Pos (25U)
#define RCC_CR_PLLRDY_Msk (0x1U << RCC_CR_PLLRDY_Pos)
#define RCC_CR_PLLRDY RCC_CR_PLLRDY_Msk




#define RCC_CFGR_SW_Pos (0U)
#define RCC_CFGR_SW_Msk (0x3U << RCC_CFGR_SW_Pos)
#define RCC_CFGR_SW RCC_CFGR_SW_Msk
#define RCC_CFGR_SW_0 (0x1U << RCC_CFGR_SW_Pos)
#define RCC_CFGR_SW_1 (0x2U << RCC_CFGR_SW_Pos)

#define RCC_CFGR_SW_HSI 0x00000000U
#define RCC_CFGR_SW_HSE 0x00000001U
#define RCC_CFGR_SW_PLL 0x00000002U


#define RCC_CFGR_SWS_Pos (2U)
#define RCC_CFGR_SWS_Msk (0x3U << RCC_CFGR_SWS_Pos)
#define RCC_CFGR_SWS RCC_CFGR_SWS_Msk
#define RCC_CFGR_SWS_0 (0x1U << RCC_CFGR_SWS_Pos)
#define RCC_CFGR_SWS_1 (0x2U << RCC_CFGR_SWS_Pos)

#define RCC_CFGR_SWS_HSI 0x00000000U
#define RCC_CFGR_SWS_HSE 0x00000004U
#define RCC_CFGR_SWS_PLL 0x00000008U


#define RCC_CFGR_HPRE_Pos (4U)
#define RCC_CFGR_HPRE_Msk (0xFU << RCC_CFGR_HPRE_Pos)
#define RCC_CFGR_HPRE RCC_CFGR_HPRE_Msk
#define RCC_CFGR_HPRE_0 (0x1U << RCC_CFGR_HPRE_Pos)
#define RCC_CFGR_HPRE_1 (0x2U << RCC_CFGR_HPRE_Pos)
#define RCC_CFGR_HPRE_2 (0x4U << RCC_CFGR_HPRE_Pos)
#define RCC_CFGR_HPRE_3 (0x8U << RCC_CFGR_HPRE_Pos)

#define RCC_CFGR_HPRE_DIV1 0x00000000U
#define RCC_CFGR_HPRE_DIV2 0x00000080U
#define RCC_CFGR_HPRE_DIV4 0x00000090U
#define RCC_CFGR_HPRE_DIV8 0x000000A0U
#define RCC_CFGR_HPRE_DIV16 0x000000B0U
#define RCC_CFGR_HPRE_DIV64 0x000000C0U
#define RCC_CFGR_HPRE_DIV128 0x000000D0U
#define RCC_CFGR_HPRE_DIV256 0x000000E0U
#define RCC_CFGR_HPRE_DIV512 0x000000F0U


#define RCC_CFGR_PPRE1_Pos (8U)
#define RCC_CFGR_PPRE1_Msk (0x7U << RCC_CFGR_PPRE1_Pos)
#define RCC_CFGR_PPRE1 RCC_CFGR_PPRE1_Msk
#define RCC_CFGR_PPRE1_0 (0x1U << RCC_CFGR_PPRE1_Pos)
#define RCC_CFGR_PPRE1_1 (0x2U << RCC_CFGR_PPRE1_Pos)
#define RCC_CFGR_PPRE1_2 (0x4U << RCC_CFGR_PPRE1_Pos)

#define RCC_CFGR_PPRE1_DIV1 0x00000000U
#define RCC_CFGR_PPRE1_DIV2 0x00000400U
#define RCC_CFGR_PPRE1_DIV4 0x00000500U
#define RCC_CFGR_PPRE1_DIV8 0x00000600U
#define RCC_CFGR_PPRE1_DIV16 0x00000700U


#define RCC_CFGR_PPRE2_Pos (11U)
#define RCC_CFGR_PPRE2_Msk (0x7U << RCC_CFGR_PPRE2_Pos)
#define RCC_CFGR_PPRE2 RCC_CFGR_PPRE2_Msk
#define RCC_CFGR_PPRE2_0 (0x1U << RCC_CFGR_PPRE2_Pos)
#define RCC_CFGR_PPRE2_1 (0x2U << RCC_CFGR_PPRE2_Pos)
#define RCC_CFGR_PPRE2_2 (0x4U << RCC_CFGR_PPRE2_Pos)

#define RCC_CFGR_PPRE2_DIV1 0x00000000U
#define RCC_CFGR_PPRE2_DIV2 0x00002000U
#define RCC_CFGR_PPRE2_DIV4 0x00002800U
#define RCC_CFGR_PPRE2_DIV8 0x00003000U
#define RCC_CFGR_PPRE2_DIV16 0x00003800U


#define RCC_CFGR_ADCPRE_Pos (14U)
#define RCC_CFGR_ADCPRE_Msk (0x3U << RCC_CFGR_ADCPRE_Pos)
#define RCC_CFGR_ADCPRE RCC_CFGR_ADCPRE_Msk
#define RCC_CFGR_ADCPRE_0 (0x1U << RCC_CFGR_ADCPRE_Pos)
#define RCC_CFGR_ADCPRE_1 (0x2U << RCC_CFGR_ADCPRE_Pos)

#define RCC_CFGR_ADCPRE_DIV2 0x00000000U
#define RCC_CFGR_ADCPRE_DIV4 0x00004000U
#define RCC_CFGR_ADCPRE_DIV6 0x00008000U
#define RCC_CFGR_ADCPRE_DIV8 0x0000C000U

#define RCC_CFGR_PLLSRC_Pos (16U)
#define RCC_CFGR_PLLSRC_Msk (0x1U << RCC_CFGR_PLLSRC_Pos)
#define RCC_CFGR_PLLSRC RCC_CFGR_PLLSRC_Msk

#define RCC_CFGR_PLLXTPRE_Pos (17U)
#define RCC_CFGR_PLLXTPRE_Msk (0x1U << RCC_CFGR_PLLXTPRE_Pos)
#define RCC_CFGR_PLLXTPRE RCC_CFGR_PLLXTPRE_Msk


#define RCC_CFGR_PLLMULL_Pos (18U)
#define RCC_CFGR_PLLMULL_Msk (0xFU << RCC_CFGR_PLLMULL_Pos)
#define RCC_CFGR_PLLMULL RCC_CFGR_PLLMULL_Msk
#define RCC_CFGR_PLLMULL_0 (0x1U << RCC_CFGR_PLLMULL_Pos)
#define RCC_CFGR_PLLMULL_1 (0x2U << RCC_CFGR_PLLMULL_Pos)
#define RCC_CFGR_PLLMULL_2 (0x4U << RCC_CFGR_PLLMULL_Pos)
#define RCC_CFGR_PLLMULL_3 (0x8U << RCC_CFGR_PLLMULL_Pos)

#define RCC_CFGR_PLLXTPRE_HSE 0x00000000U
#define RCC_CFGR_PLLXTPRE_HSE_DIV2 0x00020000U

#define RCC_CFGR_PLLMULL2 0x00000000U
#define RCC_CFGR_PLLMULL3_Pos (18U)
#define RCC_CFGR_PLLMULL3_Msk (0x1U << RCC_CFGR_PLLMULL3_Pos)
#define RCC_CFGR_PLLMULL3 RCC_CFGR_PLLMULL3_Msk
#define RCC_CFGR_PLLMULL4_Pos (19U)
#define RCC_CFGR_PLLMULL4_Msk (0x1U << RCC_CFGR_PLLMULL4_Pos)
#define RCC_CFGR_PLLMULL4 RCC_CFGR_PLLMULL4_Msk
#define RCC_CFGR_PLLMULL5_Pos (18U)
#define RCC_CFGR_PLLMULL5_Msk (0x3U << RCC_CFGR_PLLMULL5_Pos)
#define RCC_CFGR_PLLMULL5 RCC_CFGR_PLLMULL5_Msk
#define RCC_CFGR_PLLMULL6_Pos (20U)
#define RCC_CFGR_PLLMULL6_Msk (0x1U << RCC_CFGR_PLLMULL6_Pos)
#define RCC_CFGR_PLLMULL6 RCC_CFGR_PLLMULL6_Msk
#define RCC_CFGR_PLLMULL7_Pos (18U)
#define RCC_CFGR_PLLMULL7_Msk (0x5U << RCC_CFGR_PLLMULL7_Pos)
#define RCC_CFGR_PLLMULL7 RCC_CFGR_PLLMULL7_Msk
#define RCC_CFGR_PLLMULL8_Pos (19U)
#define RCC_CFGR_PLLMULL8_Msk (0x3U << RCC_CFGR_PLLMULL8_Pos)
#define RCC_CFGR_PLLMULL8 RCC_CFGR_PLLMULL8_Msk
#define RCC_CFGR_PLLMULL9_Pos (18U)
#define RCC_CFGR_PLLMULL9_Msk (0x7U << RCC_CFGR_PLLMULL9_Pos)
#define RCC_CFGR_PLLMULL9 RCC_CFGR_PLLMULL9_Msk
#define RCC_CFGR_PLLMULL10_Pos (21U)
#define RCC_CFGR_PLLMULL10_Msk (0x1U << RCC_CFGR_PLLMULL10_Pos)
#define RCC_CFGR_PLLMULL10 RCC_CFGR_PLLMULL10_Msk
#define RCC_CFGR_PLLMULL11_Pos (18U)
#define RCC_CFGR_PLLMULL11_Msk (0x9U << RCC_CFGR_PLLMULL11_Pos)
#define RCC_CFGR_PLLMULL11 RCC_CFGR_PLLMULL11_Msk
#define RCC_CFGR_PLLMULL12_Pos (19U)
#define RCC_CFGR_PLLMULL12_Msk (0x5U << RCC_CFGR_PLLMULL12_Pos)
#define RCC_CFGR_PLLMULL12 RCC_CFGR_PLLMULL12_Msk
#define RCC_CFGR_PLLMULL13_Pos (18U)
#define RCC_CFGR_PLLMULL13_Msk (0xBU << RCC_CFGR_PLLMULL13_Pos)
#define RCC_CFGR_PLLMULL13 RCC_CFGR_PLLMULL13_Msk
#define RCC_CFGR_PLLMULL14_Pos (20U)
#define RCC_CFGR_PLLMULL14_Msk (0x3U << RCC_CFGR_PLLMULL14_Pos)
#define RCC_CFGR_PLLMULL14 RCC_CFGR_PLLMULL14_Msk
#define RCC_CFGR_PLLMULL15_Pos (18U)
#define RCC_CFGR_PLLMULL15_Msk (0xDU << RCC_CFGR_PLLMULL15_Pos)
#define RCC_CFGR_PLLMULL15 RCC_CFGR_PLLMULL15_Msk
#define RCC_CFGR_PLLMULL16_Pos (19U)
#define RCC_CFGR_PLLMULL16_Msk (0x7U << RCC_CFGR_PLLMULL16_Pos)
#define RCC_CFGR_PLLMULL16 RCC_CFGR_PLLMULL16_Msk
#define RCC_CFGR_USBPRE_Pos (22U)
#define RCC_CFGR_USBPRE_Msk (0x1U << RCC_CFGR_USBPRE_Pos)
#define RCC_CFGR_USBPRE RCC_CFGR_USBPRE_Msk


#define RCC_CFGR_MCO_Pos (24U)
#define RCC_CFGR_MCO_Msk (0x7U << RCC_CFGR_MCO_Pos)
#define RCC_CFGR_MCO RCC_CFGR_MCO_Msk
#define RCC_CFGR_MCO_0 (0x1U << RCC_CFGR_MCO_Pos)
#define RCC_CFGR_MCO_1 (0x2U << RCC_CFGR_MCO_Pos)
#define RCC_CFGR_MCO_2 (0x4U << RCC_CFGR_MCO_Pos)

#define RCC_CFGR_MCO_NOCLOCK 0x00000000U
#define RCC_CFGR_MCO_SYSCLK 0x04000000U
#define RCC_CFGR_MCO_HSI 0x05000000U
#define RCC_CFGR_MCO_HSE 0x06000000U
#define RCC_CFGR_MCO_PLLCLK_DIV2 0x07000000U


#define RCC_CFGR_MCOSEL RCC_CFGR_MCO
#define RCC_CFGR_MCOSEL_0 RCC_CFGR_MCO_0
#define RCC_CFGR_MCOSEL_1 RCC_CFGR_MCO_1
#define RCC_CFGR_MCOSEL_2 RCC_CFGR_MCO_2
#define RCC_CFGR_MCOSEL_NOCLOCK RCC_CFGR_MCO_NOCLOCK
#define RCC_CFGR_MCOSEL_SYSCLK RCC_CFGR_MCO_SYSCLK
#define RCC_CFGR_MCOSEL_HSI RCC_CFGR_MCO_HSI
#define RCC_CFGR_MCOSEL_HSE RCC_CFGR_MCO_HSE
#define RCC_CFGR_MCOSEL_PLL_DIV2 RCC_CFGR_MCO_PLLCLK_DIV2


#define RCC_CIR_LSIRDYF_Pos (0U)
#define RCC_CIR_LSIRDYF_Msk (0x1U << RCC_CIR_LSIRDYF_Pos)
#define RCC_CIR_LSIRDYF RCC_CIR_LSIRDYF_Msk
#define RCC_CIR_LSERDYF_Pos (1U)
#define RCC_CIR_LSERDYF_Msk (0x1U << RCC_CIR_LSERDYF_Pos)
#define RCC_CIR_LSERDYF RCC_CIR_LSERDYF_Msk
#define RCC_CIR_HSIRDYF_Pos (2U)
#define RCC_CIR_HSIRDYF_Msk (0x1U << RCC_CIR_HSIRDYF_Pos)
#define RCC_CIR_HSIRDYF RCC_CIR_HSIRDYF_Msk
#define RCC_CIR_HSERDYF_Pos (3U)
#define RCC_CIR_HSERDYF_Msk (0x1U << RCC_CIR_HSERDYF_Pos)
#define RCC_CIR_HSERDYF RCC_CIR_HSERDYF_Msk
#define RCC_CIR_PLLRDYF_Pos (4U)
#define RCC_CIR_PLLRDYF_Msk (0x1U << RCC_CIR_PLLRDYF_Pos)
#define RCC_CIR_PLLRDYF RCC_CIR_PLLRDYF_Msk
#define RCC_CIR_CSSF_Pos (7U)
#define RCC_CIR_CSSF_Msk (0x1U << RCC_CIR_CSSF_Pos)
#define RCC_CIR_CSSF RCC_CIR_CSSF_Msk
#define RCC_CIR_LSIRDYIE_Pos (8U)
#define RCC_CIR_LSIRDYIE_Msk (0x1U << RCC_CIR_LSIRDYIE_Pos)
#define RCC_CIR_LSIRDYIE RCC_CIR_LSIRDYIE_Msk
#define RCC_CIR_LSERDYIE_Pos (9U)
#define RCC_CIR_LSERDYIE_Msk (0x1U << RCC_CIR_LSERDYIE_Pos)
#define RCC_CIR_LSERDYIE RCC_CIR_LSERDYIE_Msk
#define RCC_CIR_HSIRDYIE_Pos (10U)
#define RCC_CIR_HSIRDYIE_Msk (0x1U << RCC_CIR_HSIRDYIE_Pos)
#define RCC_CIR_HSIRDYIE RCC_CIR_HSIRDYIE_Msk
#define RCC_CIR_HSERDYIE_Pos (11U)
#define RCC_CIR_HSERDYIE_Msk (0x1U << RCC_CIR_HSERDYIE_Pos)
#define RCC_CIR_HSERDYIE RCC_CIR_HSERDYIE_Msk
#define RCC_CIR_PLLRDYIE_Pos (12U)
#define RCC_CIR_PLLRDYIE_Msk (0x1U << RCC_CIR_PLLRDYIE_Pos)
#define RCC_CIR_PLLRDYIE RCC_CIR_PLLRDYIE_Msk
#define RCC_CIR_LSIRDYC_Pos (16U)
#define RCC_CIR_LSIRDYC_Msk (0x1U << RCC_CIR_LSIRDYC_Pos)
#define RCC_CIR_LSIRDYC RCC_CIR_LSIRDYC_Msk
#define RCC_CIR_LSERDYC_Pos (17U)
#define RCC_CIR_LSERDYC_Msk (0x1U << RCC_CIR_LSERDYC_Pos)
#define RCC_CIR_LSERDYC RCC_CIR_LSERDYC_Msk
#define RCC_CIR_HSIRDYC_Pos (18U)
#define RCC_CIR_HSIRDYC_Msk (0x1U << RCC_CIR_HSIRDYC_Pos)
#define RCC_CIR_HSIRDYC RCC_CIR_HSIRDYC_Msk
#define RCC_CIR_HSERDYC_Pos (19U)
#define RCC_CIR_HSERDYC_Msk (0x1U << RCC_CIR_HSERDYC_Pos)
#define RCC_CIR_HSERDYC RCC_CIR_HSERDYC_Msk
#define RCC_CIR_PLLRDYC_Pos (20U)
#define RCC_CIR_PLLRDYC_Msk (0x1U << RCC_CIR_PLLRDYC_Pos)
#define RCC_CIR_PLLRDYC RCC_CIR_PLLRDYC_Msk
#define RCC_CIR_CSSC_Pos (23U)
#define RCC_CIR_CSSC_Msk (0x1U << RCC_CIR_CSSC_Pos)
#define RCC_CIR_CSSC RCC_CIR_CSSC_Msk



#define RCC_APB2RSTR_AFIORST_Pos (0U)
#define RCC_APB2RSTR_AFIORST_Msk (0x1U << RCC_APB2RSTR_AFIORST_Pos)
#define RCC_APB2RSTR_AFIORST RCC_APB2RSTR_AFIORST_Msk
#define RCC_APB2RSTR_IOPARST_Pos (2U)
#define RCC_APB2RSTR_IOPARST_Msk (0x1U << RCC_APB2RSTR_IOPARST_Pos)
#define RCC_APB2RSTR_IOPARST RCC_APB2RSTR_IOPARST_Msk
#define RCC_APB2RSTR_IOPBRST_Pos (3U)
#define RCC_APB2RSTR_IOPBRST_Msk (0x1U << RCC_APB2RSTR_IOPBRST_Pos)
#define RCC_APB2RSTR_IOPBRST RCC_APB2RSTR_IOPBRST_Msk
#define RCC_APB2RSTR_IOPCRST_Pos (4U)
#define RCC_APB2RSTR_IOPCRST_Msk (0x1U << RCC_APB2RSTR_IOPCRST_Pos)
#define RCC_APB2RSTR_IOPCRST RCC_APB2RSTR_IOPCRST_Msk
#define RCC_APB2RSTR_IOPDRST_Pos (5U)
#define RCC_APB2RSTR_IOPDRST_Msk (0x1U << RCC_APB2RSTR_IOPDRST_Pos)
#define RCC_APB2RSTR_IOPDRST RCC_APB2RSTR_IOPDRST_Msk
#define RCC_APB2RSTR_ADC1RST_Pos (9U)
#define RCC_APB2RSTR_ADC1RST_Msk (0x1U << RCC_APB2RSTR_ADC1RST_Pos)
#define RCC_APB2RSTR_ADC1RST RCC_APB2RSTR_ADC1RST_Msk

#define RCC_APB2RSTR_ADC2RST_Pos (10U)
#define RCC_APB2RSTR_ADC2RST_Msk (0x1U << RCC_APB2RSTR_ADC2RST_Pos)
#define RCC_APB2RSTR_ADC2RST RCC_APB2RSTR_ADC2RST_Msk

#define RCC_APB2RSTR_TIM1RST_Pos (11U)
#define RCC_APB2RSTR_TIM1RST_Msk (0x1U << RCC_APB2RSTR_TIM1RST_Pos)
#define RCC_APB2RSTR_TIM1RST RCC_APB2RSTR_TIM1RST_Msk
#define RCC_APB2RSTR_SPI1RST_Pos (12U)
#define RCC_APB2RSTR_SPI1RST_Msk (0x1U << RCC_APB2RSTR_SPI1RST_Pos)
#define RCC_APB2RSTR_SPI1RST RCC_APB2RSTR_SPI1RST_Msk
#define RCC_APB2RSTR_USART1RST_Pos (14U)
#define RCC_APB2RSTR_USART1RST_Msk (0x1U << RCC_APB2RSTR_USART1RST_Pos)
#define RCC_APB2RSTR_USART1RST RCC_APB2RSTR_USART1RST_Msk


#define RCC_APB2RSTR_IOPERST_Pos (6U)
#define RCC_APB2RSTR_IOPERST_Msk (0x1U << RCC_APB2RSTR_IOPERST_Pos)
#define RCC_APB2RSTR_IOPERST RCC_APB2RSTR_IOPERST_Msk





#define RCC_APB1RSTR_TIM2RST_Pos (0U)
#define RCC_APB1RSTR_TIM2RST_Msk (0x1U << RCC_APB1RSTR_TIM2RST_Pos)
#define RCC_APB1RSTR_TIM2RST RCC_APB1RSTR_TIM2RST_Msk
#define RCC_APB1RSTR_TIM3RST_Pos (1U)
#define RCC_APB1RSTR_TIM3RST_Msk (0x1U << RCC_APB1RSTR_TIM3RST_Pos)
#define RCC_APB1RSTR_TIM3RST RCC_APB1RSTR_TIM3RST_Msk
#define RCC_APB1RSTR_WWDGRST_Pos (11U)
#define RCC_APB1RSTR_WWDGRST_Msk (0x1U << RCC_APB1RSTR_WWDGRST_Pos)
#define RCC_APB1RSTR_WWDGRST RCC_APB1RSTR_WWDGRST_Msk
#define RCC_APB1RSTR_USART2RST_Pos (17U)
#define RCC_APB1RSTR_USART2RST_Msk (0x1U << RCC_APB1RSTR_USART2RST_Pos)
#define RCC_APB1RSTR_USART2RST RCC_APB1RSTR_USART2RST_Msk
#define RCC_APB1RSTR_I2C1RST_Pos (21U)
#define RCC_APB1RSTR_I2C1RST_Msk (0x1U << RCC_APB1RSTR_I2C1RST_Pos)
#define RCC_APB1RSTR_I2C1RST RCC_APB1RSTR_I2C1RST_Msk

#define RCC_APB1RSTR_CAN1RST_Pos (25U)
#define RCC_APB1RSTR_CAN1RST_Msk (0x1U << RCC_APB1RSTR_CAN1RST_Pos)
#define RCC_APB1RSTR_CAN1RST RCC_APB1RSTR_CAN1RST_Msk

#define RCC_APB1RSTR_BKPRST_Pos (27U)
#define RCC_APB1RSTR_BKPRST_Msk (0x1U << RCC_APB1RSTR_BKPRST_Pos)
#define RCC_APB1RSTR_BKPRST RCC_APB1RSTR_BKPRST_Msk
#define RCC_APB1RSTR_PWRRST_Pos (28U)
#define RCC_APB1RSTR_PWRRST_Msk (0x1U << RCC_APB1RSTR_PWRRST_Pos)
#define RCC_APB1RSTR_PWRRST RCC_APB1RSTR_PWRRST_Msk

#define RCC_APB1RSTR_TIM4RST_Pos (2U)
#define RCC_APB1RSTR_TIM4RST_Msk (0x1U << RCC_APB1RSTR_TIM4RST_Pos)
#define RCC_APB1RSTR_TIM4RST RCC_APB1RSTR_TIM4RST_Msk
#define RCC_APB1RSTR_SPI2RST_Pos (14U)
#define RCC_APB1RSTR_SPI2RST_Msk (0x1U << RCC_APB1RSTR_SPI2RST_Pos)
#define RCC_APB1RSTR_SPI2RST RCC_APB1RSTR_SPI2RST_Msk
#define RCC_APB1RSTR_USART3RST_Pos (18U)
#define RCC_APB1RSTR_USART3RST_Msk (0x1U << RCC_APB1RSTR_USART3RST_Pos)
#define RCC_APB1RSTR_USART3RST RCC_APB1RSTR_USART3RST_Msk
#define RCC_APB1RSTR_I2C2RST_Pos (22U)
#define RCC_APB1RSTR_I2C2RST_Msk (0x1U << RCC_APB1RSTR_I2C2RST_Pos)
#define RCC_APB1RSTR_I2C2RST RCC_APB1RSTR_I2C2RST_Msk

#define RCC_APB1RSTR_USBRST_Pos (23U)
#define RCC_APB1RSTR_USBRST_Msk (0x1U << RCC_APB1RSTR_USBRST_Pos)
#define RCC_APB1RSTR_USBRST RCC_APB1RSTR_USBRST_Msk







#define RCC_AHBENR_DMA1EN_Pos (0U)
#define RCC_AHBENR_DMA1EN_Msk (0x1U << RCC_AHBENR_DMA1EN_Pos)
#define RCC_AHBENR_DMA1EN RCC_AHBENR_DMA1EN_Msk
#define RCC_AHBENR_SRAMEN_Pos (2U)
#define RCC_AHBENR_SRAMEN_Msk (0x1U << RCC_AHBENR_SRAMEN_Pos)
#define RCC_AHBENR_SRAMEN RCC_AHBENR_SRAMEN_Msk
#define RCC_AHBENR_FLITFEN_Pos (4U)
#define RCC_AHBENR_FLITFEN_Msk (0x1U << RCC_AHBENR_FLITFEN_Pos)
#define RCC_AHBENR_FLITFEN RCC_AHBENR_FLITFEN_Msk
#define RCC_AHBENR_CRCEN_Pos (6U)
#define RCC_AHBENR_CRCEN_Msk (0x1U << RCC_AHBENR_CRCEN_Pos)
#define RCC_AHBENR_CRCEN RCC_AHBENR_CRCEN_Msk





#define RCC_APB2ENR_AFIOEN_Pos (0U)
#define RCC_APB2ENR_AFIOEN_Msk (0x1U << RCC_APB2ENR_AFIOEN_Pos)
#define RCC_APB2ENR_AFIOEN RCC_APB2ENR_AFIOEN_Msk
#define RCC_APB2ENR_IOPAEN_Pos (2U)
#define RCC_APB2ENR_IOPAEN_Msk (0x1U << RCC_APB2ENR_IOPAEN_Pos)
#define RCC_APB2ENR_IOPAEN RCC_APB2ENR_IOPAEN_Msk
#define RCC_APB2ENR_IOPBEN_Pos (3U)
#define RCC_APB2ENR_IOPBEN_Msk (0x1U << RCC_APB2ENR_IOPBEN_Pos)
#define RCC_APB2ENR_IOPBEN RCC_APB2ENR_IOPBEN_Msk
#define RCC_APB2ENR_IOPCEN_Pos (4U)
#define RCC_APB2ENR_IOPCEN_Msk (0x1U << RCC_APB2ENR_IOPCEN_Pos)
#define RCC_APB2ENR_IOPCEN RCC_APB2ENR_IOPCEN_Msk
#define RCC_APB2ENR_IOPDEN_Pos (5U)
#define RCC_APB2ENR_IOPDEN_Msk (0x1U << RCC_APB2ENR_IOPDEN_Pos)
#define RCC_APB2ENR_IOPDEN RCC_APB2ENR_IOPDEN_Msk
#define RCC_APB2ENR_ADC1EN_Pos (9U)
#define RCC_APB2ENR_ADC1EN_Msk (0x1U << RCC_APB2ENR_ADC1EN_Pos)
#define RCC_APB2ENR_ADC1EN RCC_APB2ENR_ADC1EN_Msk

#define RCC_APB2ENR_ADC2EN_Pos (10U)
#define RCC_APB2ENR_ADC2EN_Msk (0x1U << RCC_APB2ENR_ADC2EN_Pos)
#define RCC_APB2ENR_ADC2EN RCC_APB2ENR_ADC2EN_Msk

#define RCC_APB2ENR_TIM1EN_Pos (11U)
#define RCC_APB2ENR_TIM1EN_Msk (0x1U << RCC_APB2ENR_TIM1EN_Pos)
#define RCC_APB2ENR_TIM1EN RCC_APB2ENR_TIM1EN_Msk
#define RCC_APB2ENR_SPI1EN_Pos (12U)
#define RCC_APB2ENR_SPI1EN_Msk (0x1U << RCC_APB2ENR_SPI1EN_Pos)
#define RCC_APB2ENR_SPI1EN RCC_APB2ENR_SPI1EN_Msk
#define RCC_APB2ENR_USART1EN_Pos (14U)
#define RCC_APB2ENR_USART1EN_Msk (0x1U << RCC_APB2ENR_USART1EN_Pos)
#define RCC_APB2ENR_USART1EN RCC_APB2ENR_USART1EN_Msk


#define RCC_APB2ENR_IOPEEN_Pos (6U)
#define RCC_APB2ENR_IOPEEN_Msk (0x1U << RCC_APB2ENR_IOPEEN_Pos)
#define RCC_APB2ENR_IOPEEN RCC_APB2ENR_IOPEEN_Msk





#define RCC_APB1ENR_TIM2EN_Pos (0U)
#define RCC_APB1ENR_TIM2EN_Msk (0x1U << RCC_APB1ENR_TIM2EN_Pos)
#define RCC_APB1ENR_TIM2EN RCC_APB1ENR_TIM2EN_Msk
#define RCC_APB1ENR_TIM3EN_Pos (1U)
#define RCC_APB1ENR_TIM3EN_Msk (0x1U << RCC_APB1ENR_TIM3EN_Pos)
#define RCC_APB1ENR_TIM3EN RCC_APB1ENR_TIM3EN_Msk
#define RCC_APB1ENR_WWDGEN_Pos (11U)
#define RCC_APB1ENR_WWDGEN_Msk (0x1U << RCC_APB1ENR_WWDGEN_Pos)
#define RCC_APB1ENR_WWDGEN RCC_APB1ENR_WWDGEN_Msk
#define RCC_APB1ENR_USART2EN_Pos (17U)
#define RCC_APB1ENR_USART2EN_Msk (0x1U << RCC_APB1ENR_USART2EN_Pos)
#define RCC_APB1ENR_USART2EN RCC_APB1ENR_USART2EN_Msk
#define RCC_APB1ENR_I2C1EN_Pos (21U)
#define RCC_APB1ENR_I2C1EN_Msk (0x1U << RCC_APB1ENR_I2C1EN_Pos)
#define RCC_APB1ENR_I2C1EN RCC_APB1ENR_I2C1EN_Msk

#define RCC_APB1ENR_CAN1EN_Pos (25U)
#define RCC_APB1ENR_CAN1EN_Msk (0x1U << RCC_APB1ENR_CAN1EN_Pos)
#define RCC_APB1ENR_CAN1EN RCC_APB1ENR_CAN1EN_Msk

#define RCC_APB1ENR_BKPEN_Pos (27U)
#define RCC_APB1ENR_BKPEN_Msk (0x1U << RCC_APB1ENR_BKPEN_Pos)
#define RCC_APB1ENR_BKPEN RCC_APB1ENR_BKPEN_Msk
#define RCC_APB1ENR_PWREN_Pos (28U)
#define RCC_APB1ENR_PWREN_Msk (0x1U << RCC_APB1ENR_PWREN_Pos)
#define RCC_APB1ENR_PWREN RCC_APB1ENR_PWREN_Msk

#define RCC_APB1ENR_TIM4EN_Pos (2U)
#define RCC_APB1ENR_TIM4EN_Msk (0x1U << RCC_APB1ENR_TIM4EN_Pos)
#define RCC_APB1ENR_TIM4EN RCC_APB1ENR_TIM4EN_Msk
#define RCC_APB1ENR_SPI2EN_Pos (14U)
#define RCC_APB1ENR_SPI2EN_Msk (0x1U << RCC_APB1ENR_SPI2EN_Pos)
#define RCC_APB1ENR_SPI2EN RCC_APB1ENR_SPI2EN_Msk
#define RCC_APB1ENR_USART3EN_Pos (18U)
#define RCC_APB1ENR_USART3EN_Msk (0x1U << RCC_APB1ENR_USART3EN_Pos)
#define RCC_APB1ENR_USART3EN RCC_APB1ENR_USART3EN_Msk
#define RCC_APB1ENR_I2C2EN_Pos (22U)
#define RCC_APB1ENR_I2C2EN_Msk (0x1U << RCC_APB1ENR_I2C2EN_Pos)
#define RCC_APB1ENR_I2C2EN RCC_APB1ENR_I2C2EN_Msk

#define RCC_APB1ENR_USBEN_Pos (23U)
#define RCC_APB1ENR_USBEN_Msk (0x1U << RCC_APB1ENR_USBEN_Pos)
#define RCC_APB1ENR_USBEN RCC_APB1ENR_USBEN_Msk







#define RCC_BDCR_LSEON_Pos (0U)
#define RCC_BDCR_LSEON_Msk (0x1U << RCC_BDCR_LSEON_Pos)
#define RCC_BDCR_LSEON RCC_BDCR_LSEON_Msk
#define RCC_BDCR_LSERDY_Pos (1U)
#define RCC_BDCR_LSERDY_Msk (0x1U << RCC_BDCR_LSERDY_Pos)
#define RCC_BDCR_LSERDY RCC_BDCR_LSERDY_Msk
#define RCC_BDCR_LSEBYP_Pos (2U)
#define RCC_BDCR_LSEBYP_Msk (0x1U << RCC_BDCR_LSEBYP_Pos)
#define RCC_BDCR_LSEBYP RCC_BDCR_LSEBYP_Msk

#define RCC_BDCR_RTCSEL_Pos (8U)
#define RCC_BDCR_RTCSEL_Msk (0x3U << RCC_BDCR_RTCSEL_Pos)
#define RCC_BDCR_RTCSEL RCC_BDCR_RTCSEL_Msk
#define RCC_BDCR_RTCSEL_0 (0x1U << RCC_BDCR_RTCSEL_Pos)
#define RCC_BDCR_RTCSEL_1 (0x2U << RCC_BDCR_RTCSEL_Pos)


#define RCC_BDCR_RTCSEL_NOCLOCK 0x00000000U
#define RCC_BDCR_RTCSEL_LSE 0x00000100U
#define RCC_BDCR_RTCSEL_LSI 0x00000200U
#define RCC_BDCR_RTCSEL_HSE 0x00000300U

#define RCC_BDCR_RTCEN_Pos (15U)
#define RCC_BDCR_RTCEN_Msk (0x1U << RCC_BDCR_RTCEN_Pos)
#define RCC_BDCR_RTCEN RCC_BDCR_RTCEN_Msk
#define RCC_BDCR_BDRST_Pos (16U)
#define RCC_BDCR_BDRST_Msk (0x1U << RCC_BDCR_BDRST_Pos)
#define RCC_BDCR_BDRST RCC_BDCR_BDRST_Msk


#define RCC_CSR_LSION_Pos (0U)
#define RCC_CSR_LSION_Msk (0x1U << RCC_CSR_LSION_Pos)
#define RCC_CSR_LSION RCC_CSR_LSION_Msk
#define RCC_CSR_LSIRDY_Pos (1U)
#define RCC_CSR_LSIRDY_Msk (0x1U << RCC_CSR_LSIRDY_Pos)
#define RCC_CSR_LSIRDY RCC_CSR_LSIRDY_Msk
#define RCC_CSR_RMVF_Pos (24U)
#define RCC_CSR_RMVF_Msk (0x1U << RCC_CSR_RMVF_Pos)
#define RCC_CSR_RMVF RCC_CSR_RMVF_Msk
#define RCC_CSR_PINRSTF_Pos (26U)
#define RCC_CSR_PINRSTF_Msk (0x1U << RCC_CSR_PINRSTF_Pos)
#define RCC_CSR_PINRSTF RCC_CSR_PINRSTF_Msk
#define RCC_CSR_PORRSTF_Pos (27U)
#define RCC_CSR_PORRSTF_Msk (0x1U << RCC_CSR_PORRSTF_Pos)
#define RCC_CSR_PORRSTF RCC_CSR_PORRSTF_Msk
#define RCC_CSR_SFTRSTF_Pos (28U)
#define RCC_CSR_SFTRSTF_Msk (0x1U << RCC_CSR_SFTRSTF_Pos)
#define RCC_CSR_SFTRSTF RCC_CSR_SFTRSTF_Msk
#define RCC_CSR_IWDGRSTF_Pos (29U)
#define RCC_CSR_IWDGRSTF_Msk (0x1U << RCC_CSR_IWDGRSTF_Pos)
#define RCC_CSR_IWDGRSTF RCC_CSR_IWDGRSTF_Msk
#define RCC_CSR_WWDGRSTF_Pos (30U)
#define RCC_CSR_WWDGRSTF_Msk (0x1U << RCC_CSR_WWDGRSTF_Pos)
#define RCC_CSR_WWDGRSTF RCC_CSR_WWDGRSTF_Msk
#define RCC_CSR_LPWRRSTF_Pos (31U)
#define RCC_CSR_LPWRRSTF_Msk (0x1U << RCC_CSR_LPWRRSTF_Pos)
#define RCC_CSR_LPWRRSTF RCC_CSR_LPWRRSTF_Msk
# 1478 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define GPIO_CRL_MODE_Pos (0U)
#define GPIO_CRL_MODE_Msk (0x33333333U << GPIO_CRL_MODE_Pos)
#define GPIO_CRL_MODE GPIO_CRL_MODE_Msk

#define GPIO_CRL_MODE0_Pos (0U)
#define GPIO_CRL_MODE0_Msk (0x3U << GPIO_CRL_MODE0_Pos)
#define GPIO_CRL_MODE0 GPIO_CRL_MODE0_Msk
#define GPIO_CRL_MODE0_0 (0x1U << GPIO_CRL_MODE0_Pos)
#define GPIO_CRL_MODE0_1 (0x2U << GPIO_CRL_MODE0_Pos)

#define GPIO_CRL_MODE1_Pos (4U)
#define GPIO_CRL_MODE1_Msk (0x3U << GPIO_CRL_MODE1_Pos)
#define GPIO_CRL_MODE1 GPIO_CRL_MODE1_Msk
#define GPIO_CRL_MODE1_0 (0x1U << GPIO_CRL_MODE1_Pos)
#define GPIO_CRL_MODE1_1 (0x2U << GPIO_CRL_MODE1_Pos)

#define GPIO_CRL_MODE2_Pos (8U)
#define GPIO_CRL_MODE2_Msk (0x3U << GPIO_CRL_MODE2_Pos)
#define GPIO_CRL_MODE2 GPIO_CRL_MODE2_Msk
#define GPIO_CRL_MODE2_0 (0x1U << GPIO_CRL_MODE2_Pos)
#define GPIO_CRL_MODE2_1 (0x2U << GPIO_CRL_MODE2_Pos)

#define GPIO_CRL_MODE3_Pos (12U)
#define GPIO_CRL_MODE3_Msk (0x3U << GPIO_CRL_MODE3_Pos)
#define GPIO_CRL_MODE3 GPIO_CRL_MODE3_Msk
#define GPIO_CRL_MODE3_0 (0x1U << GPIO_CRL_MODE3_Pos)
#define GPIO_CRL_MODE3_1 (0x2U << GPIO_CRL_MODE3_Pos)

#define GPIO_CRL_MODE4_Pos (16U)
#define GPIO_CRL_MODE4_Msk (0x3U << GPIO_CRL_MODE4_Pos)
#define GPIO_CRL_MODE4 GPIO_CRL_MODE4_Msk
#define GPIO_CRL_MODE4_0 (0x1U << GPIO_CRL_MODE4_Pos)
#define GPIO_CRL_MODE4_1 (0x2U << GPIO_CRL_MODE4_Pos)

#define GPIO_CRL_MODE5_Pos (20U)
#define GPIO_CRL_MODE5_Msk (0x3U << GPIO_CRL_MODE5_Pos)
#define GPIO_CRL_MODE5 GPIO_CRL_MODE5_Msk
#define GPIO_CRL_MODE5_0 (0x1U << GPIO_CRL_MODE5_Pos)
#define GPIO_CRL_MODE5_1 (0x2U << GPIO_CRL_MODE5_Pos)

#define GPIO_CRL_MODE6_Pos (24U)
#define GPIO_CRL_MODE6_Msk (0x3U << GPIO_CRL_MODE6_Pos)
#define GPIO_CRL_MODE6 GPIO_CRL_MODE6_Msk
#define GPIO_CRL_MODE6_0 (0x1U << GPIO_CRL_MODE6_Pos)
#define GPIO_CRL_MODE6_1 (0x2U << GPIO_CRL_MODE6_Pos)

#define GPIO_CRL_MODE7_Pos (28U)
#define GPIO_CRL_MODE7_Msk (0x3U << GPIO_CRL_MODE7_Pos)
#define GPIO_CRL_MODE7 GPIO_CRL_MODE7_Msk
#define GPIO_CRL_MODE7_0 (0x1U << GPIO_CRL_MODE7_Pos)
#define GPIO_CRL_MODE7_1 (0x2U << GPIO_CRL_MODE7_Pos)

#define GPIO_CRL_CNF_Pos (2U)
#define GPIO_CRL_CNF_Msk (0x33333333U << GPIO_CRL_CNF_Pos)
#define GPIO_CRL_CNF GPIO_CRL_CNF_Msk

#define GPIO_CRL_CNF0_Pos (2U)
#define GPIO_CRL_CNF0_Msk (0x3U << GPIO_CRL_CNF0_Pos)
#define GPIO_CRL_CNF0 GPIO_CRL_CNF0_Msk
#define GPIO_CRL_CNF0_0 (0x1U << GPIO_CRL_CNF0_Pos)
#define GPIO_CRL_CNF0_1 (0x2U << GPIO_CRL_CNF0_Pos)

#define GPIO_CRL_CNF1_Pos (6U)
#define GPIO_CRL_CNF1_Msk (0x3U << GPIO_CRL_CNF1_Pos)
#define GPIO_CRL_CNF1 GPIO_CRL_CNF1_Msk
#define GPIO_CRL_CNF1_0 (0x1U << GPIO_CRL_CNF1_Pos)
#define GPIO_CRL_CNF1_1 (0x2U << GPIO_CRL_CNF1_Pos)

#define GPIO_CRL_CNF2_Pos (10U)
#define GPIO_CRL_CNF2_Msk (0x3U << GPIO_CRL_CNF2_Pos)
#define GPIO_CRL_CNF2 GPIO_CRL_CNF2_Msk
#define GPIO_CRL_CNF2_0 (0x1U << GPIO_CRL_CNF2_Pos)
#define GPIO_CRL_CNF2_1 (0x2U << GPIO_CRL_CNF2_Pos)

#define GPIO_CRL_CNF3_Pos (14U)
#define GPIO_CRL_CNF3_Msk (0x3U << GPIO_CRL_CNF3_Pos)
#define GPIO_CRL_CNF3 GPIO_CRL_CNF3_Msk
#define GPIO_CRL_CNF3_0 (0x1U << GPIO_CRL_CNF3_Pos)
#define GPIO_CRL_CNF3_1 (0x2U << GPIO_CRL_CNF3_Pos)

#define GPIO_CRL_CNF4_Pos (18U)
#define GPIO_CRL_CNF4_Msk (0x3U << GPIO_CRL_CNF4_Pos)
#define GPIO_CRL_CNF4 GPIO_CRL_CNF4_Msk
#define GPIO_CRL_CNF4_0 (0x1U << GPIO_CRL_CNF4_Pos)
#define GPIO_CRL_CNF4_1 (0x2U << GPIO_CRL_CNF4_Pos)

#define GPIO_CRL_CNF5_Pos (22U)
#define GPIO_CRL_CNF5_Msk (0x3U << GPIO_CRL_CNF5_Pos)
#define GPIO_CRL_CNF5 GPIO_CRL_CNF5_Msk
#define GPIO_CRL_CNF5_0 (0x1U << GPIO_CRL_CNF5_Pos)
#define GPIO_CRL_CNF5_1 (0x2U << GPIO_CRL_CNF5_Pos)

#define GPIO_CRL_CNF6_Pos (26U)
#define GPIO_CRL_CNF6_Msk (0x3U << GPIO_CRL_CNF6_Pos)
#define GPIO_CRL_CNF6 GPIO_CRL_CNF6_Msk
#define GPIO_CRL_CNF6_0 (0x1U << GPIO_CRL_CNF6_Pos)
#define GPIO_CRL_CNF6_1 (0x2U << GPIO_CRL_CNF6_Pos)

#define GPIO_CRL_CNF7_Pos (30U)
#define GPIO_CRL_CNF7_Msk (0x3U << GPIO_CRL_CNF7_Pos)
#define GPIO_CRL_CNF7 GPIO_CRL_CNF7_Msk
#define GPIO_CRL_CNF7_0 (0x1U << GPIO_CRL_CNF7_Pos)
#define GPIO_CRL_CNF7_1 (0x2U << GPIO_CRL_CNF7_Pos)


#define GPIO_CRH_MODE_Pos (0U)
#define GPIO_CRH_MODE_Msk (0x33333333U << GPIO_CRH_MODE_Pos)
#define GPIO_CRH_MODE GPIO_CRH_MODE_Msk

#define GPIO_CRH_MODE8_Pos (0U)
#define GPIO_CRH_MODE8_Msk (0x3U << GPIO_CRH_MODE8_Pos)
#define GPIO_CRH_MODE8 GPIO_CRH_MODE8_Msk
#define GPIO_CRH_MODE8_0 (0x1U << GPIO_CRH_MODE8_Pos)
#define GPIO_CRH_MODE8_1 (0x2U << GPIO_CRH_MODE8_Pos)

#define GPIO_CRH_MODE9_Pos (4U)
#define GPIO_CRH_MODE9_Msk (0x3U << GPIO_CRH_MODE9_Pos)
#define GPIO_CRH_MODE9 GPIO_CRH_MODE9_Msk
#define GPIO_CRH_MODE9_0 (0x1U << GPIO_CRH_MODE9_Pos)
#define GPIO_CRH_MODE9_1 (0x2U << GPIO_CRH_MODE9_Pos)

#define GPIO_CRH_MODE10_Pos (8U)
#define GPIO_CRH_MODE10_Msk (0x3U << GPIO_CRH_MODE10_Pos)
#define GPIO_CRH_MODE10 GPIO_CRH_MODE10_Msk
#define GPIO_CRH_MODE10_0 (0x1U << GPIO_CRH_MODE10_Pos)
#define GPIO_CRH_MODE10_1 (0x2U << GPIO_CRH_MODE10_Pos)

#define GPIO_CRH_MODE11_Pos (12U)
#define GPIO_CRH_MODE11_Msk (0x3U << GPIO_CRH_MODE11_Pos)
#define GPIO_CRH_MODE11 GPIO_CRH_MODE11_Msk
#define GPIO_CRH_MODE11_0 (0x1U << GPIO_CRH_MODE11_Pos)
#define GPIO_CRH_MODE11_1 (0x2U << GPIO_CRH_MODE11_Pos)

#define GPIO_CRH_MODE12_Pos (16U)
#define GPIO_CRH_MODE12_Msk (0x3U << GPIO_CRH_MODE12_Pos)
#define GPIO_CRH_MODE12 GPIO_CRH_MODE12_Msk
#define GPIO_CRH_MODE12_0 (0x1U << GPIO_CRH_MODE12_Pos)
#define GPIO_CRH_MODE12_1 (0x2U << GPIO_CRH_MODE12_Pos)

#define GPIO_CRH_MODE13_Pos (20U)
#define GPIO_CRH_MODE13_Msk (0x3U << GPIO_CRH_MODE13_Pos)
#define GPIO_CRH_MODE13 GPIO_CRH_MODE13_Msk
#define GPIO_CRH_MODE13_0 (0x1U << GPIO_CRH_MODE13_Pos)
#define GPIO_CRH_MODE13_1 (0x2U << GPIO_CRH_MODE13_Pos)

#define GPIO_CRH_MODE14_Pos (24U)
#define GPIO_CRH_MODE14_Msk (0x3U << GPIO_CRH_MODE14_Pos)
#define GPIO_CRH_MODE14 GPIO_CRH_MODE14_Msk
#define GPIO_CRH_MODE14_0 (0x1U << GPIO_CRH_MODE14_Pos)
#define GPIO_CRH_MODE14_1 (0x2U << GPIO_CRH_MODE14_Pos)

#define GPIO_CRH_MODE15_Pos (28U)
#define GPIO_CRH_MODE15_Msk (0x3U << GPIO_CRH_MODE15_Pos)
#define GPIO_CRH_MODE15 GPIO_CRH_MODE15_Msk
#define GPIO_CRH_MODE15_0 (0x1U << GPIO_CRH_MODE15_Pos)
#define GPIO_CRH_MODE15_1 (0x2U << GPIO_CRH_MODE15_Pos)

#define GPIO_CRH_CNF_Pos (2U)
#define GPIO_CRH_CNF_Msk (0x33333333U << GPIO_CRH_CNF_Pos)
#define GPIO_CRH_CNF GPIO_CRH_CNF_Msk

#define GPIO_CRH_CNF8_Pos (2U)
#define GPIO_CRH_CNF8_Msk (0x3U << GPIO_CRH_CNF8_Pos)
#define GPIO_CRH_CNF8 GPIO_CRH_CNF8_Msk
#define GPIO_CRH_CNF8_0 (0x1U << GPIO_CRH_CNF8_Pos)
#define GPIO_CRH_CNF8_1 (0x2U << GPIO_CRH_CNF8_Pos)

#define GPIO_CRH_CNF9_Pos (6U)
#define GPIO_CRH_CNF9_Msk (0x3U << GPIO_CRH_CNF9_Pos)
#define GPIO_CRH_CNF9 GPIO_CRH_CNF9_Msk
#define GPIO_CRH_CNF9_0 (0x1U << GPIO_CRH_CNF9_Pos)
#define GPIO_CRH_CNF9_1 (0x2U << GPIO_CRH_CNF9_Pos)

#define GPIO_CRH_CNF10_Pos (10U)
#define GPIO_CRH_CNF10_Msk (0x3U << GPIO_CRH_CNF10_Pos)
#define GPIO_CRH_CNF10 GPIO_CRH_CNF10_Msk
#define GPIO_CRH_CNF10_0 (0x1U << GPIO_CRH_CNF10_Pos)
#define GPIO_CRH_CNF10_1 (0x2U << GPIO_CRH_CNF10_Pos)

#define GPIO_CRH_CNF11_Pos (14U)
#define GPIO_CRH_CNF11_Msk (0x3U << GPIO_CRH_CNF11_Pos)
#define GPIO_CRH_CNF11 GPIO_CRH_CNF11_Msk
#define GPIO_CRH_CNF11_0 (0x1U << GPIO_CRH_CNF11_Pos)
#define GPIO_CRH_CNF11_1 (0x2U << GPIO_CRH_CNF11_Pos)

#define GPIO_CRH_CNF12_Pos (18U)
#define GPIO_CRH_CNF12_Msk (0x3U << GPIO_CRH_CNF12_Pos)
#define GPIO_CRH_CNF12 GPIO_CRH_CNF12_Msk
#define GPIO_CRH_CNF12_0 (0x1U << GPIO_CRH_CNF12_Pos)
#define GPIO_CRH_CNF12_1 (0x2U << GPIO_CRH_CNF12_Pos)

#define GPIO_CRH_CNF13_Pos (22U)
#define GPIO_CRH_CNF13_Msk (0x3U << GPIO_CRH_CNF13_Pos)
#define GPIO_CRH_CNF13 GPIO_CRH_CNF13_Msk
#define GPIO_CRH_CNF13_0 (0x1U << GPIO_CRH_CNF13_Pos)
#define GPIO_CRH_CNF13_1 (0x2U << GPIO_CRH_CNF13_Pos)

#define GPIO_CRH_CNF14_Pos (26U)
#define GPIO_CRH_CNF14_Msk (0x3U << GPIO_CRH_CNF14_Pos)
#define GPIO_CRH_CNF14 GPIO_CRH_CNF14_Msk
#define GPIO_CRH_CNF14_0 (0x1U << GPIO_CRH_CNF14_Pos)
#define GPIO_CRH_CNF14_1 (0x2U << GPIO_CRH_CNF14_Pos)

#define GPIO_CRH_CNF15_Pos (30U)
#define GPIO_CRH_CNF15_Msk (0x3U << GPIO_CRH_CNF15_Pos)
#define GPIO_CRH_CNF15 GPIO_CRH_CNF15_Msk
#define GPIO_CRH_CNF15_0 (0x1U << GPIO_CRH_CNF15_Pos)
#define GPIO_CRH_CNF15_1 (0x2U << GPIO_CRH_CNF15_Pos)


#define GPIO_IDR_IDR0_Pos (0U)
#define GPIO_IDR_IDR0_Msk (0x1U << GPIO_IDR_IDR0_Pos)
#define GPIO_IDR_IDR0 GPIO_IDR_IDR0_Msk
#define GPIO_IDR_IDR1_Pos (1U)
#define GPIO_IDR_IDR1_Msk (0x1U << GPIO_IDR_IDR1_Pos)
#define GPIO_IDR_IDR1 GPIO_IDR_IDR1_Msk
#define GPIO_IDR_IDR2_Pos (2U)
#define GPIO_IDR_IDR2_Msk (0x1U << GPIO_IDR_IDR2_Pos)
#define GPIO_IDR_IDR2 GPIO_IDR_IDR2_Msk
#define GPIO_IDR_IDR3_Pos (3U)
#define GPIO_IDR_IDR3_Msk (0x1U << GPIO_IDR_IDR3_Pos)
#define GPIO_IDR_IDR3 GPIO_IDR_IDR3_Msk
#define GPIO_IDR_IDR4_Pos (4U)
#define GPIO_IDR_IDR4_Msk (0x1U << GPIO_IDR_IDR4_Pos)
#define GPIO_IDR_IDR4 GPIO_IDR_IDR4_Msk
#define GPIO_IDR_IDR5_Pos (5U)
#define GPIO_IDR_IDR5_Msk (0x1U << GPIO_IDR_IDR5_Pos)
#define GPIO_IDR_IDR5 GPIO_IDR_IDR5_Msk
#define GPIO_IDR_IDR6_Pos (6U)
#define GPIO_IDR_IDR6_Msk (0x1U << GPIO_IDR_IDR6_Pos)
#define GPIO_IDR_IDR6 GPIO_IDR_IDR6_Msk
#define GPIO_IDR_IDR7_Pos (7U)
#define GPIO_IDR_IDR7_Msk (0x1U << GPIO_IDR_IDR7_Pos)
#define GPIO_IDR_IDR7 GPIO_IDR_IDR7_Msk
#define GPIO_IDR_IDR8_Pos (8U)
#define GPIO_IDR_IDR8_Msk (0x1U << GPIO_IDR_IDR8_Pos)
#define GPIO_IDR_IDR8 GPIO_IDR_IDR8_Msk
#define GPIO_IDR_IDR9_Pos (9U)
#define GPIO_IDR_IDR9_Msk (0x1U << GPIO_IDR_IDR9_Pos)
#define GPIO_IDR_IDR9 GPIO_IDR_IDR9_Msk
#define GPIO_IDR_IDR10_Pos (10U)
#define GPIO_IDR_IDR10_Msk (0x1U << GPIO_IDR_IDR10_Pos)
#define GPIO_IDR_IDR10 GPIO_IDR_IDR10_Msk
#define GPIO_IDR_IDR11_Pos (11U)
#define GPIO_IDR_IDR11_Msk (0x1U << GPIO_IDR_IDR11_Pos)
#define GPIO_IDR_IDR11 GPIO_IDR_IDR11_Msk
#define GPIO_IDR_IDR12_Pos (12U)
#define GPIO_IDR_IDR12_Msk (0x1U << GPIO_IDR_IDR12_Pos)
#define GPIO_IDR_IDR12 GPIO_IDR_IDR12_Msk
#define GPIO_IDR_IDR13_Pos (13U)
#define GPIO_IDR_IDR13_Msk (0x1U << GPIO_IDR_IDR13_Pos)
#define GPIO_IDR_IDR13 GPIO_IDR_IDR13_Msk
#define GPIO_IDR_IDR14_Pos (14U)
#define GPIO_IDR_IDR14_Msk (0x1U << GPIO_IDR_IDR14_Pos)
#define GPIO_IDR_IDR14 GPIO_IDR_IDR14_Msk
#define GPIO_IDR_IDR15_Pos (15U)
#define GPIO_IDR_IDR15_Msk (0x1U << GPIO_IDR_IDR15_Pos)
#define GPIO_IDR_IDR15 GPIO_IDR_IDR15_Msk


#define GPIO_ODR_ODR0_Pos (0U)
#define GPIO_ODR_ODR0_Msk (0x1U << GPIO_ODR_ODR0_Pos)
#define GPIO_ODR_ODR0 GPIO_ODR_ODR0_Msk
#define GPIO_ODR_ODR1_Pos (1U)
#define GPIO_ODR_ODR1_Msk (0x1U << GPIO_ODR_ODR1_Pos)
#define GPIO_ODR_ODR1 GPIO_ODR_ODR1_Msk
#define GPIO_ODR_ODR2_Pos (2U)
#define GPIO_ODR_ODR2_Msk (0x1U << GPIO_ODR_ODR2_Pos)
#define GPIO_ODR_ODR2 GPIO_ODR_ODR2_Msk
#define GPIO_ODR_ODR3_Pos (3U)
#define GPIO_ODR_ODR3_Msk (0x1U << GPIO_ODR_ODR3_Pos)
#define GPIO_ODR_ODR3 GPIO_ODR_ODR3_Msk
#define GPIO_ODR_ODR4_Pos (4U)
#define GPIO_ODR_ODR4_Msk (0x1U << GPIO_ODR_ODR4_Pos)
#define GPIO_ODR_ODR4 GPIO_ODR_ODR4_Msk
#define GPIO_ODR_ODR5_Pos (5U)
#define GPIO_ODR_ODR5_Msk (0x1U << GPIO_ODR_ODR5_Pos)
#define GPIO_ODR_ODR5 GPIO_ODR_ODR5_Msk
#define GPIO_ODR_ODR6_Pos (6U)
#define GPIO_ODR_ODR6_Msk (0x1U << GPIO_ODR_ODR6_Pos)
#define GPIO_ODR_ODR6 GPIO_ODR_ODR6_Msk
#define GPIO_ODR_ODR7_Pos (7U)
#define GPIO_ODR_ODR7_Msk (0x1U << GPIO_ODR_ODR7_Pos)
#define GPIO_ODR_ODR7 GPIO_ODR_ODR7_Msk
#define GPIO_ODR_ODR8_Pos (8U)
#define GPIO_ODR_ODR8_Msk (0x1U << GPIO_ODR_ODR8_Pos)
#define GPIO_ODR_ODR8 GPIO_ODR_ODR8_Msk
#define GPIO_ODR_ODR9_Pos (9U)
#define GPIO_ODR_ODR9_Msk (0x1U << GPIO_ODR_ODR9_Pos)
#define GPIO_ODR_ODR9 GPIO_ODR_ODR9_Msk
#define GPIO_ODR_ODR10_Pos (10U)
#define GPIO_ODR_ODR10_Msk (0x1U << GPIO_ODR_ODR10_Pos)
#define GPIO_ODR_ODR10 GPIO_ODR_ODR10_Msk
#define GPIO_ODR_ODR11_Pos (11U)
#define GPIO_ODR_ODR11_Msk (0x1U << GPIO_ODR_ODR11_Pos)
#define GPIO_ODR_ODR11 GPIO_ODR_ODR11_Msk
#define GPIO_ODR_ODR12_Pos (12U)
#define GPIO_ODR_ODR12_Msk (0x1U << GPIO_ODR_ODR12_Pos)
#define GPIO_ODR_ODR12 GPIO_ODR_ODR12_Msk
#define GPIO_ODR_ODR13_Pos (13U)
#define GPIO_ODR_ODR13_Msk (0x1U << GPIO_ODR_ODR13_Pos)
#define GPIO_ODR_ODR13 GPIO_ODR_ODR13_Msk
#define GPIO_ODR_ODR14_Pos (14U)
#define GPIO_ODR_ODR14_Msk (0x1U << GPIO_ODR_ODR14_Pos)
#define GPIO_ODR_ODR14 GPIO_ODR_ODR14_Msk
#define GPIO_ODR_ODR15_Pos (15U)
#define GPIO_ODR_ODR15_Msk (0x1U << GPIO_ODR_ODR15_Pos)
#define GPIO_ODR_ODR15 GPIO_ODR_ODR15_Msk


#define GPIO_BSRR_BS0_Pos (0U)
#define GPIO_BSRR_BS0_Msk (0x1U << GPIO_BSRR_BS0_Pos)
#define GPIO_BSRR_BS0 GPIO_BSRR_BS0_Msk
#define GPIO_BSRR_BS1_Pos (1U)
#define GPIO_BSRR_BS1_Msk (0x1U << GPIO_BSRR_BS1_Pos)
#define GPIO_BSRR_BS1 GPIO_BSRR_BS1_Msk
#define GPIO_BSRR_BS2_Pos (2U)
#define GPIO_BSRR_BS2_Msk (0x1U << GPIO_BSRR_BS2_Pos)
#define GPIO_BSRR_BS2 GPIO_BSRR_BS2_Msk
#define GPIO_BSRR_BS3_Pos (3U)
#define GPIO_BSRR_BS3_Msk (0x1U << GPIO_BSRR_BS3_Pos)
#define GPIO_BSRR_BS3 GPIO_BSRR_BS3_Msk
#define GPIO_BSRR_BS4_Pos (4U)
#define GPIO_BSRR_BS4_Msk (0x1U << GPIO_BSRR_BS4_Pos)
#define GPIO_BSRR_BS4 GPIO_BSRR_BS4_Msk
#define GPIO_BSRR_BS5_Pos (5U)
#define GPIO_BSRR_BS5_Msk (0x1U << GPIO_BSRR_BS5_Pos)
#define GPIO_BSRR_BS5 GPIO_BSRR_BS5_Msk
#define GPIO_BSRR_BS6_Pos (6U)
#define GPIO_BSRR_BS6_Msk (0x1U << GPIO_BSRR_BS6_Pos)
#define GPIO_BSRR_BS6 GPIO_BSRR_BS6_Msk
#define GPIO_BSRR_BS7_Pos (7U)
#define GPIO_BSRR_BS7_Msk (0x1U << GPIO_BSRR_BS7_Pos)
#define GPIO_BSRR_BS7 GPIO_BSRR_BS7_Msk
#define GPIO_BSRR_BS8_Pos (8U)
#define GPIO_BSRR_BS8_Msk (0x1U << GPIO_BSRR_BS8_Pos)
#define GPIO_BSRR_BS8 GPIO_BSRR_BS8_Msk
#define GPIO_BSRR_BS9_Pos (9U)
#define GPIO_BSRR_BS9_Msk (0x1U << GPIO_BSRR_BS9_Pos)
#define GPIO_BSRR_BS9 GPIO_BSRR_BS9_Msk
#define GPIO_BSRR_BS10_Pos (10U)
#define GPIO_BSRR_BS10_Msk (0x1U << GPIO_BSRR_BS10_Pos)
#define GPIO_BSRR_BS10 GPIO_BSRR_BS10_Msk
#define GPIO_BSRR_BS11_Pos (11U)
#define GPIO_BSRR_BS11_Msk (0x1U << GPIO_BSRR_BS11_Pos)
#define GPIO_BSRR_BS11 GPIO_BSRR_BS11_Msk
#define GPIO_BSRR_BS12_Pos (12U)
#define GPIO_BSRR_BS12_Msk (0x1U << GPIO_BSRR_BS12_Pos)
#define GPIO_BSRR_BS12 GPIO_BSRR_BS12_Msk
#define GPIO_BSRR_BS13_Pos (13U)
#define GPIO_BSRR_BS13_Msk (0x1U << GPIO_BSRR_BS13_Pos)
#define GPIO_BSRR_BS13 GPIO_BSRR_BS13_Msk
#define GPIO_BSRR_BS14_Pos (14U)
#define GPIO_BSRR_BS14_Msk (0x1U << GPIO_BSRR_BS14_Pos)
#define GPIO_BSRR_BS14 GPIO_BSRR_BS14_Msk
#define GPIO_BSRR_BS15_Pos (15U)
#define GPIO_BSRR_BS15_Msk (0x1U << GPIO_BSRR_BS15_Pos)
#define GPIO_BSRR_BS15 GPIO_BSRR_BS15_Msk

#define GPIO_BSRR_BR0_Pos (16U)
#define GPIO_BSRR_BR0_Msk (0x1U << GPIO_BSRR_BR0_Pos)
#define GPIO_BSRR_BR0 GPIO_BSRR_BR0_Msk
#define GPIO_BSRR_BR1_Pos (17U)
#define GPIO_BSRR_BR1_Msk (0x1U << GPIO_BSRR_BR1_Pos)
#define GPIO_BSRR_BR1 GPIO_BSRR_BR1_Msk
#define GPIO_BSRR_BR2_Pos (18U)
#define GPIO_BSRR_BR2_Msk (0x1U << GPIO_BSRR_BR2_Pos)
#define GPIO_BSRR_BR2 GPIO_BSRR_BR2_Msk
#define GPIO_BSRR_BR3_Pos (19U)
#define GPIO_BSRR_BR3_Msk (0x1U << GPIO_BSRR_BR3_Pos)
#define GPIO_BSRR_BR3 GPIO_BSRR_BR3_Msk
#define GPIO_BSRR_BR4_Pos (20U)
#define GPIO_BSRR_BR4_Msk (0x1U << GPIO_BSRR_BR4_Pos)
#define GPIO_BSRR_BR4 GPIO_BSRR_BR4_Msk
#define GPIO_BSRR_BR5_Pos (21U)
#define GPIO_BSRR_BR5_Msk (0x1U << GPIO_BSRR_BR5_Pos)
#define GPIO_BSRR_BR5 GPIO_BSRR_BR5_Msk
#define GPIO_BSRR_BR6_Pos (22U)
#define GPIO_BSRR_BR6_Msk (0x1U << GPIO_BSRR_BR6_Pos)
#define GPIO_BSRR_BR6 GPIO_BSRR_BR6_Msk
#define GPIO_BSRR_BR7_Pos (23U)
#define GPIO_BSRR_BR7_Msk (0x1U << GPIO_BSRR_BR7_Pos)
#define GPIO_BSRR_BR7 GPIO_BSRR_BR7_Msk
#define GPIO_BSRR_BR8_Pos (24U)
#define GPIO_BSRR_BR8_Msk (0x1U << GPIO_BSRR_BR8_Pos)
#define GPIO_BSRR_BR8 GPIO_BSRR_BR8_Msk
#define GPIO_BSRR_BR9_Pos (25U)
#define GPIO_BSRR_BR9_Msk (0x1U << GPIO_BSRR_BR9_Pos)
#define GPIO_BSRR_BR9 GPIO_BSRR_BR9_Msk
#define GPIO_BSRR_BR10_Pos (26U)
#define GPIO_BSRR_BR10_Msk (0x1U << GPIO_BSRR_BR10_Pos)
#define GPIO_BSRR_BR10 GPIO_BSRR_BR10_Msk
#define GPIO_BSRR_BR11_Pos (27U)
#define GPIO_BSRR_BR11_Msk (0x1U << GPIO_BSRR_BR11_Pos)
#define GPIO_BSRR_BR11 GPIO_BSRR_BR11_Msk
#define GPIO_BSRR_BR12_Pos (28U)
#define GPIO_BSRR_BR12_Msk (0x1U << GPIO_BSRR_BR12_Pos)
#define GPIO_BSRR_BR12 GPIO_BSRR_BR12_Msk
#define GPIO_BSRR_BR13_Pos (29U)
#define GPIO_BSRR_BR13_Msk (0x1U << GPIO_BSRR_BR13_Pos)
#define GPIO_BSRR_BR13 GPIO_BSRR_BR13_Msk
#define GPIO_BSRR_BR14_Pos (30U)
#define GPIO_BSRR_BR14_Msk (0x1U << GPIO_BSRR_BR14_Pos)
#define GPIO_BSRR_BR14 GPIO_BSRR_BR14_Msk
#define GPIO_BSRR_BR15_Pos (31U)
#define GPIO_BSRR_BR15_Msk (0x1U << GPIO_BSRR_BR15_Pos)
#define GPIO_BSRR_BR15 GPIO_BSRR_BR15_Msk


#define GPIO_BRR_BR0_Pos (0U)
#define GPIO_BRR_BR0_Msk (0x1U << GPIO_BRR_BR0_Pos)
#define GPIO_BRR_BR0 GPIO_BRR_BR0_Msk
#define GPIO_BRR_BR1_Pos (1U)
#define GPIO_BRR_BR1_Msk (0x1U << GPIO_BRR_BR1_Pos)
#define GPIO_BRR_BR1 GPIO_BRR_BR1_Msk
#define GPIO_BRR_BR2_Pos (2U)
#define GPIO_BRR_BR2_Msk (0x1U << GPIO_BRR_BR2_Pos)
#define GPIO_BRR_BR2 GPIO_BRR_BR2_Msk
#define GPIO_BRR_BR3_Pos (3U)
#define GPIO_BRR_BR3_Msk (0x1U << GPIO_BRR_BR3_Pos)
#define GPIO_BRR_BR3 GPIO_BRR_BR3_Msk
#define GPIO_BRR_BR4_Pos (4U)
#define GPIO_BRR_BR4_Msk (0x1U << GPIO_BRR_BR4_Pos)
#define GPIO_BRR_BR4 GPIO_BRR_BR4_Msk
#define GPIO_BRR_BR5_Pos (5U)
#define GPIO_BRR_BR5_Msk (0x1U << GPIO_BRR_BR5_Pos)
#define GPIO_BRR_BR5 GPIO_BRR_BR5_Msk
#define GPIO_BRR_BR6_Pos (6U)
#define GPIO_BRR_BR6_Msk (0x1U << GPIO_BRR_BR6_Pos)
#define GPIO_BRR_BR6 GPIO_BRR_BR6_Msk
#define GPIO_BRR_BR7_Pos (7U)
#define GPIO_BRR_BR7_Msk (0x1U << GPIO_BRR_BR7_Pos)
#define GPIO_BRR_BR7 GPIO_BRR_BR7_Msk
#define GPIO_BRR_BR8_Pos (8U)
#define GPIO_BRR_BR8_Msk (0x1U << GPIO_BRR_BR8_Pos)
#define GPIO_BRR_BR8 GPIO_BRR_BR8_Msk
#define GPIO_BRR_BR9_Pos (9U)
#define GPIO_BRR_BR9_Msk (0x1U << GPIO_BRR_BR9_Pos)
#define GPIO_BRR_BR9 GPIO_BRR_BR9_Msk
#define GPIO_BRR_BR10_Pos (10U)
#define GPIO_BRR_BR10_Msk (0x1U << GPIO_BRR_BR10_Pos)
#define GPIO_BRR_BR10 GPIO_BRR_BR10_Msk
#define GPIO_BRR_BR11_Pos (11U)
#define GPIO_BRR_BR11_Msk (0x1U << GPIO_BRR_BR11_Pos)
#define GPIO_BRR_BR11 GPIO_BRR_BR11_Msk
#define GPIO_BRR_BR12_Pos (12U)
#define GPIO_BRR_BR12_Msk (0x1U << GPIO_BRR_BR12_Pos)
#define GPIO_BRR_BR12 GPIO_BRR_BR12_Msk
#define GPIO_BRR_BR13_Pos (13U)
#define GPIO_BRR_BR13_Msk (0x1U << GPIO_BRR_BR13_Pos)
#define GPIO_BRR_BR13 GPIO_BRR_BR13_Msk
#define GPIO_BRR_BR14_Pos (14U)
#define GPIO_BRR_BR14_Msk (0x1U << GPIO_BRR_BR14_Pos)
#define GPIO_BRR_BR14 GPIO_BRR_BR14_Msk
#define GPIO_BRR_BR15_Pos (15U)
#define GPIO_BRR_BR15_Msk (0x1U << GPIO_BRR_BR15_Pos)
#define GPIO_BRR_BR15 GPIO_BRR_BR15_Msk


#define GPIO_LCKR_LCK0_Pos (0U)
#define GPIO_LCKR_LCK0_Msk (0x1U << GPIO_LCKR_LCK0_Pos)
#define GPIO_LCKR_LCK0 GPIO_LCKR_LCK0_Msk
#define GPIO_LCKR_LCK1_Pos (1U)
#define GPIO_LCKR_LCK1_Msk (0x1U << GPIO_LCKR_LCK1_Pos)
#define GPIO_LCKR_LCK1 GPIO_LCKR_LCK1_Msk
#define GPIO_LCKR_LCK2_Pos (2U)
#define GPIO_LCKR_LCK2_Msk (0x1U << GPIO_LCKR_LCK2_Pos)
#define GPIO_LCKR_LCK2 GPIO_LCKR_LCK2_Msk
#define GPIO_LCKR_LCK3_Pos (3U)
#define GPIO_LCKR_LCK3_Msk (0x1U << GPIO_LCKR_LCK3_Pos)
#define GPIO_LCKR_LCK3 GPIO_LCKR_LCK3_Msk
#define GPIO_LCKR_LCK4_Pos (4U)
#define GPIO_LCKR_LCK4_Msk (0x1U << GPIO_LCKR_LCK4_Pos)
#define GPIO_LCKR_LCK4 GPIO_LCKR_LCK4_Msk
#define GPIO_LCKR_LCK5_Pos (5U)
#define GPIO_LCKR_LCK5_Msk (0x1U << GPIO_LCKR_LCK5_Pos)
#define GPIO_LCKR_LCK5 GPIO_LCKR_LCK5_Msk
#define GPIO_LCKR_LCK6_Pos (6U)
#define GPIO_LCKR_LCK6_Msk (0x1U << GPIO_LCKR_LCK6_Pos)
#define GPIO_LCKR_LCK6 GPIO_LCKR_LCK6_Msk
#define GPIO_LCKR_LCK7_Pos (7U)
#define GPIO_LCKR_LCK7_Msk (0x1U << GPIO_LCKR_LCK7_Pos)
#define GPIO_LCKR_LCK7 GPIO_LCKR_LCK7_Msk
#define GPIO_LCKR_LCK8_Pos (8U)
#define GPIO_LCKR_LCK8_Msk (0x1U << GPIO_LCKR_LCK8_Pos)
#define GPIO_LCKR_LCK8 GPIO_LCKR_LCK8_Msk
#define GPIO_LCKR_LCK9_Pos (9U)
#define GPIO_LCKR_LCK9_Msk (0x1U << GPIO_LCKR_LCK9_Pos)
#define GPIO_LCKR_LCK9 GPIO_LCKR_LCK9_Msk
#define GPIO_LCKR_LCK10_Pos (10U)
#define GPIO_LCKR_LCK10_Msk (0x1U << GPIO_LCKR_LCK10_Pos)
#define GPIO_LCKR_LCK10 GPIO_LCKR_LCK10_Msk
#define GPIO_LCKR_LCK11_Pos (11U)
#define GPIO_LCKR_LCK11_Msk (0x1U << GPIO_LCKR_LCK11_Pos)
#define GPIO_LCKR_LCK11 GPIO_LCKR_LCK11_Msk
#define GPIO_LCKR_LCK12_Pos (12U)
#define GPIO_LCKR_LCK12_Msk (0x1U << GPIO_LCKR_LCK12_Pos)
#define GPIO_LCKR_LCK12 GPIO_LCKR_LCK12_Msk
#define GPIO_LCKR_LCK13_Pos (13U)
#define GPIO_LCKR_LCK13_Msk (0x1U << GPIO_LCKR_LCK13_Pos)
#define GPIO_LCKR_LCK13 GPIO_LCKR_LCK13_Msk
#define GPIO_LCKR_LCK14_Pos (14U)
#define GPIO_LCKR_LCK14_Msk (0x1U << GPIO_LCKR_LCK14_Pos)
#define GPIO_LCKR_LCK14 GPIO_LCKR_LCK14_Msk
#define GPIO_LCKR_LCK15_Pos (15U)
#define GPIO_LCKR_LCK15_Msk (0x1U << GPIO_LCKR_LCK15_Pos)
#define GPIO_LCKR_LCK15 GPIO_LCKR_LCK15_Msk
#define GPIO_LCKR_LCKK_Pos (16U)
#define GPIO_LCKR_LCKK_Msk (0x1U << GPIO_LCKR_LCKK_Pos)
#define GPIO_LCKR_LCKK GPIO_LCKR_LCKK_Msk




#define AFIO_EVCR_PIN_Pos (0U)
#define AFIO_EVCR_PIN_Msk (0xFU << AFIO_EVCR_PIN_Pos)
#define AFIO_EVCR_PIN AFIO_EVCR_PIN_Msk
#define AFIO_EVCR_PIN_0 (0x1U << AFIO_EVCR_PIN_Pos)
#define AFIO_EVCR_PIN_1 (0x2U << AFIO_EVCR_PIN_Pos)
#define AFIO_EVCR_PIN_2 (0x4U << AFIO_EVCR_PIN_Pos)
#define AFIO_EVCR_PIN_3 (0x8U << AFIO_EVCR_PIN_Pos)


#define AFIO_EVCR_PIN_PX0 0x00000000U
#define AFIO_EVCR_PIN_PX1_Pos (0U)
#define AFIO_EVCR_PIN_PX1_Msk (0x1U << AFIO_EVCR_PIN_PX1_Pos)
#define AFIO_EVCR_PIN_PX1 AFIO_EVCR_PIN_PX1_Msk
#define AFIO_EVCR_PIN_PX2_Pos (1U)
#define AFIO_EVCR_PIN_PX2_Msk (0x1U << AFIO_EVCR_PIN_PX2_Pos)
#define AFIO_EVCR_PIN_PX2 AFIO_EVCR_PIN_PX2_Msk
#define AFIO_EVCR_PIN_PX3_Pos (0U)
#define AFIO_EVCR_PIN_PX3_Msk (0x3U << AFIO_EVCR_PIN_PX3_Pos)
#define AFIO_EVCR_PIN_PX3 AFIO_EVCR_PIN_PX3_Msk
#define AFIO_EVCR_PIN_PX4_Pos (2U)
#define AFIO_EVCR_PIN_PX4_Msk (0x1U << AFIO_EVCR_PIN_PX4_Pos)
#define AFIO_EVCR_PIN_PX4 AFIO_EVCR_PIN_PX4_Msk
#define AFIO_EVCR_PIN_PX5_Pos (0U)
#define AFIO_EVCR_PIN_PX5_Msk (0x5U << AFIO_EVCR_PIN_PX5_Pos)
#define AFIO_EVCR_PIN_PX5 AFIO_EVCR_PIN_PX5_Msk
#define AFIO_EVCR_PIN_PX6_Pos (1U)
#define AFIO_EVCR_PIN_PX6_Msk (0x3U << AFIO_EVCR_PIN_PX6_Pos)
#define AFIO_EVCR_PIN_PX6 AFIO_EVCR_PIN_PX6_Msk
#define AFIO_EVCR_PIN_PX7_Pos (0U)
#define AFIO_EVCR_PIN_PX7_Msk (0x7U << AFIO_EVCR_PIN_PX7_Pos)
#define AFIO_EVCR_PIN_PX7 AFIO_EVCR_PIN_PX7_Msk
#define AFIO_EVCR_PIN_PX8_Pos (3U)
#define AFIO_EVCR_PIN_PX8_Msk (0x1U << AFIO_EVCR_PIN_PX8_Pos)
#define AFIO_EVCR_PIN_PX8 AFIO_EVCR_PIN_PX8_Msk
#define AFIO_EVCR_PIN_PX9_Pos (0U)
#define AFIO_EVCR_PIN_PX9_Msk (0x9U << AFIO_EVCR_PIN_PX9_Pos)
#define AFIO_EVCR_PIN_PX9 AFIO_EVCR_PIN_PX9_Msk
#define AFIO_EVCR_PIN_PX10_Pos (1U)
#define AFIO_EVCR_PIN_PX10_Msk (0x5U << AFIO_EVCR_PIN_PX10_Pos)
#define AFIO_EVCR_PIN_PX10 AFIO_EVCR_PIN_PX10_Msk
#define AFIO_EVCR_PIN_PX11_Pos (0U)
#define AFIO_EVCR_PIN_PX11_Msk (0xBU << AFIO_EVCR_PIN_PX11_Pos)
#define AFIO_EVCR_PIN_PX11 AFIO_EVCR_PIN_PX11_Msk
#define AFIO_EVCR_PIN_PX12_Pos (2U)
#define AFIO_EVCR_PIN_PX12_Msk (0x3U << AFIO_EVCR_PIN_PX12_Pos)
#define AFIO_EVCR_PIN_PX12 AFIO_EVCR_PIN_PX12_Msk
#define AFIO_EVCR_PIN_PX13_Pos (0U)
#define AFIO_EVCR_PIN_PX13_Msk (0xDU << AFIO_EVCR_PIN_PX13_Pos)
#define AFIO_EVCR_PIN_PX13 AFIO_EVCR_PIN_PX13_Msk
#define AFIO_EVCR_PIN_PX14_Pos (1U)
#define AFIO_EVCR_PIN_PX14_Msk (0x7U << AFIO_EVCR_PIN_PX14_Pos)
#define AFIO_EVCR_PIN_PX14 AFIO_EVCR_PIN_PX14_Msk
#define AFIO_EVCR_PIN_PX15_Pos (0U)
#define AFIO_EVCR_PIN_PX15_Msk (0xFU << AFIO_EVCR_PIN_PX15_Pos)
#define AFIO_EVCR_PIN_PX15 AFIO_EVCR_PIN_PX15_Msk

#define AFIO_EVCR_PORT_Pos (4U)
#define AFIO_EVCR_PORT_Msk (0x7U << AFIO_EVCR_PORT_Pos)
#define AFIO_EVCR_PORT AFIO_EVCR_PORT_Msk
#define AFIO_EVCR_PORT_0 (0x1U << AFIO_EVCR_PORT_Pos)
#define AFIO_EVCR_PORT_1 (0x2U << AFIO_EVCR_PORT_Pos)
#define AFIO_EVCR_PORT_2 (0x4U << AFIO_EVCR_PORT_Pos)


#define AFIO_EVCR_PORT_PA 0x00000000
#define AFIO_EVCR_PORT_PB_Pos (4U)
#define AFIO_EVCR_PORT_PB_Msk (0x1U << AFIO_EVCR_PORT_PB_Pos)
#define AFIO_EVCR_PORT_PB AFIO_EVCR_PORT_PB_Msk
#define AFIO_EVCR_PORT_PC_Pos (5U)
#define AFIO_EVCR_PORT_PC_Msk (0x1U << AFIO_EVCR_PORT_PC_Pos)
#define AFIO_EVCR_PORT_PC AFIO_EVCR_PORT_PC_Msk
#define AFIO_EVCR_PORT_PD_Pos (4U)
#define AFIO_EVCR_PORT_PD_Msk (0x3U << AFIO_EVCR_PORT_PD_Pos)
#define AFIO_EVCR_PORT_PD AFIO_EVCR_PORT_PD_Msk
#define AFIO_EVCR_PORT_PE_Pos (6U)
#define AFIO_EVCR_PORT_PE_Msk (0x1U << AFIO_EVCR_PORT_PE_Pos)
#define AFIO_EVCR_PORT_PE AFIO_EVCR_PORT_PE_Msk

#define AFIO_EVCR_EVOE_Pos (7U)
#define AFIO_EVCR_EVOE_Msk (0x1U << AFIO_EVCR_EVOE_Pos)
#define AFIO_EVCR_EVOE AFIO_EVCR_EVOE_Msk


#define AFIO_MAPR_SPI1_REMAP_Pos (0U)
#define AFIO_MAPR_SPI1_REMAP_Msk (0x1U << AFIO_MAPR_SPI1_REMAP_Pos)
#define AFIO_MAPR_SPI1_REMAP AFIO_MAPR_SPI1_REMAP_Msk
#define AFIO_MAPR_I2C1_REMAP_Pos (1U)
#define AFIO_MAPR_I2C1_REMAP_Msk (0x1U << AFIO_MAPR_I2C1_REMAP_Pos)
#define AFIO_MAPR_I2C1_REMAP AFIO_MAPR_I2C1_REMAP_Msk
#define AFIO_MAPR_USART1_REMAP_Pos (2U)
#define AFIO_MAPR_USART1_REMAP_Msk (0x1U << AFIO_MAPR_USART1_REMAP_Pos)
#define AFIO_MAPR_USART1_REMAP AFIO_MAPR_USART1_REMAP_Msk
#define AFIO_MAPR_USART2_REMAP_Pos (3U)
#define AFIO_MAPR_USART2_REMAP_Msk (0x1U << AFIO_MAPR_USART2_REMAP_Pos)
#define AFIO_MAPR_USART2_REMAP AFIO_MAPR_USART2_REMAP_Msk

#define AFIO_MAPR_USART3_REMAP_Pos (4U)
#define AFIO_MAPR_USART3_REMAP_Msk (0x3U << AFIO_MAPR_USART3_REMAP_Pos)
#define AFIO_MAPR_USART3_REMAP AFIO_MAPR_USART3_REMAP_Msk
#define AFIO_MAPR_USART3_REMAP_0 (0x1U << AFIO_MAPR_USART3_REMAP_Pos)
#define AFIO_MAPR_USART3_REMAP_1 (0x2U << AFIO_MAPR_USART3_REMAP_Pos)


#define AFIO_MAPR_USART3_REMAP_NOREMAP 0x00000000U
#define AFIO_MAPR_USART3_REMAP_PARTIALREMAP_Pos (4U)
#define AFIO_MAPR_USART3_REMAP_PARTIALREMAP_Msk (0x1U << AFIO_MAPR_USART3_REMAP_PARTIALREMAP_Pos)
#define AFIO_MAPR_USART3_REMAP_PARTIALREMAP AFIO_MAPR_USART3_REMAP_PARTIALREMAP_Msk
#define AFIO_MAPR_USART3_REMAP_FULLREMAP_Pos (4U)
#define AFIO_MAPR_USART3_REMAP_FULLREMAP_Msk (0x3U << AFIO_MAPR_USART3_REMAP_FULLREMAP_Pos)
#define AFIO_MAPR_USART3_REMAP_FULLREMAP AFIO_MAPR_USART3_REMAP_FULLREMAP_Msk

#define AFIO_MAPR_TIM1_REMAP_Pos (6U)
#define AFIO_MAPR_TIM1_REMAP_Msk (0x3U << AFIO_MAPR_TIM1_REMAP_Pos)
#define AFIO_MAPR_TIM1_REMAP AFIO_MAPR_TIM1_REMAP_Msk
#define AFIO_MAPR_TIM1_REMAP_0 (0x1U << AFIO_MAPR_TIM1_REMAP_Pos)
#define AFIO_MAPR_TIM1_REMAP_1 (0x2U << AFIO_MAPR_TIM1_REMAP_Pos)


#define AFIO_MAPR_TIM1_REMAP_NOREMAP 0x00000000U
#define AFIO_MAPR_TIM1_REMAP_PARTIALREMAP_Pos (6U)
#define AFIO_MAPR_TIM1_REMAP_PARTIALREMAP_Msk (0x1U << AFIO_MAPR_TIM1_REMAP_PARTIALREMAP_Pos)
#define AFIO_MAPR_TIM1_REMAP_PARTIALREMAP AFIO_MAPR_TIM1_REMAP_PARTIALREMAP_Msk
#define AFIO_MAPR_TIM1_REMAP_FULLREMAP_Pos (6U)
#define AFIO_MAPR_TIM1_REMAP_FULLREMAP_Msk (0x3U << AFIO_MAPR_TIM1_REMAP_FULLREMAP_Pos)
#define AFIO_MAPR_TIM1_REMAP_FULLREMAP AFIO_MAPR_TIM1_REMAP_FULLREMAP_Msk

#define AFIO_MAPR_TIM2_REMAP_Pos (8U)
#define AFIO_MAPR_TIM2_REMAP_Msk (0x3U << AFIO_MAPR_TIM2_REMAP_Pos)
#define AFIO_MAPR_TIM2_REMAP AFIO_MAPR_TIM2_REMAP_Msk
#define AFIO_MAPR_TIM2_REMAP_0 (0x1U << AFIO_MAPR_TIM2_REMAP_Pos)
#define AFIO_MAPR_TIM2_REMAP_1 (0x2U << AFIO_MAPR_TIM2_REMAP_Pos)


#define AFIO_MAPR_TIM2_REMAP_NOREMAP 0x00000000U
#define AFIO_MAPR_TIM2_REMAP_PARTIALREMAP1_Pos (8U)
#define AFIO_MAPR_TIM2_REMAP_PARTIALREMAP1_Msk (0x1U << AFIO_MAPR_TIM2_REMAP_PARTIALREMAP1_Pos)
#define AFIO_MAPR_TIM2_REMAP_PARTIALREMAP1 AFIO_MAPR_TIM2_REMAP_PARTIALREMAP1_Msk
#define AFIO_MAPR_TIM2_REMAP_PARTIALREMAP2_Pos (9U)
#define AFIO_MAPR_TIM2_REMAP_PARTIALREMAP2_Msk (0x1U << AFIO_MAPR_TIM2_REMAP_PARTIALREMAP2_Pos)
#define AFIO_MAPR_TIM2_REMAP_PARTIALREMAP2 AFIO_MAPR_TIM2_REMAP_PARTIALREMAP2_Msk
#define AFIO_MAPR_TIM2_REMAP_FULLREMAP_Pos (8U)
#define AFIO_MAPR_TIM2_REMAP_FULLREMAP_Msk (0x3U << AFIO_MAPR_TIM2_REMAP_FULLREMAP_Pos)
#define AFIO_MAPR_TIM2_REMAP_FULLREMAP AFIO_MAPR_TIM2_REMAP_FULLREMAP_Msk

#define AFIO_MAPR_TIM3_REMAP_Pos (10U)
#define AFIO_MAPR_TIM3_REMAP_Msk (0x3U << AFIO_MAPR_TIM3_REMAP_Pos)
#define AFIO_MAPR_TIM3_REMAP AFIO_MAPR_TIM3_REMAP_Msk
#define AFIO_MAPR_TIM3_REMAP_0 (0x1U << AFIO_MAPR_TIM3_REMAP_Pos)
#define AFIO_MAPR_TIM3_REMAP_1 (0x2U << AFIO_MAPR_TIM3_REMAP_Pos)


#define AFIO_MAPR_TIM3_REMAP_NOREMAP 0x00000000U
#define AFIO_MAPR_TIM3_REMAP_PARTIALREMAP_Pos (11U)
#define AFIO_MAPR_TIM3_REMAP_PARTIALREMAP_Msk (0x1U << AFIO_MAPR_TIM3_REMAP_PARTIALREMAP_Pos)
#define AFIO_MAPR_TIM3_REMAP_PARTIALREMAP AFIO_MAPR_TIM3_REMAP_PARTIALREMAP_Msk
#define AFIO_MAPR_TIM3_REMAP_FULLREMAP_Pos (10U)
#define AFIO_MAPR_TIM3_REMAP_FULLREMAP_Msk (0x3U << AFIO_MAPR_TIM3_REMAP_FULLREMAP_Pos)
#define AFIO_MAPR_TIM3_REMAP_FULLREMAP AFIO_MAPR_TIM3_REMAP_FULLREMAP_Msk

#define AFIO_MAPR_TIM4_REMAP_Pos (12U)
#define AFIO_MAPR_TIM4_REMAP_Msk (0x1U << AFIO_MAPR_TIM4_REMAP_Pos)
#define AFIO_MAPR_TIM4_REMAP AFIO_MAPR_TIM4_REMAP_Msk

#define AFIO_MAPR_CAN_REMAP_Pos (13U)
#define AFIO_MAPR_CAN_REMAP_Msk (0x3U << AFIO_MAPR_CAN_REMAP_Pos)
#define AFIO_MAPR_CAN_REMAP AFIO_MAPR_CAN_REMAP_Msk
#define AFIO_MAPR_CAN_REMAP_0 (0x1U << AFIO_MAPR_CAN_REMAP_Pos)
#define AFIO_MAPR_CAN_REMAP_1 (0x2U << AFIO_MAPR_CAN_REMAP_Pos)


#define AFIO_MAPR_CAN_REMAP_REMAP1 0x00000000U
#define AFIO_MAPR_CAN_REMAP_REMAP2_Pos (14U)
#define AFIO_MAPR_CAN_REMAP_REMAP2_Msk (0x1U << AFIO_MAPR_CAN_REMAP_REMAP2_Pos)
#define AFIO_MAPR_CAN_REMAP_REMAP2 AFIO_MAPR_CAN_REMAP_REMAP2_Msk
#define AFIO_MAPR_CAN_REMAP_REMAP3_Pos (13U)
#define AFIO_MAPR_CAN_REMAP_REMAP3_Msk (0x3U << AFIO_MAPR_CAN_REMAP_REMAP3_Pos)
#define AFIO_MAPR_CAN_REMAP_REMAP3 AFIO_MAPR_CAN_REMAP_REMAP3_Msk

#define AFIO_MAPR_PD01_REMAP_Pos (15U)
#define AFIO_MAPR_PD01_REMAP_Msk (0x1U << AFIO_MAPR_PD01_REMAP_Pos)
#define AFIO_MAPR_PD01_REMAP AFIO_MAPR_PD01_REMAP_Msk


#define AFIO_MAPR_SWJ_CFG_Pos (24U)
#define AFIO_MAPR_SWJ_CFG_Msk (0x7U << AFIO_MAPR_SWJ_CFG_Pos)
#define AFIO_MAPR_SWJ_CFG AFIO_MAPR_SWJ_CFG_Msk
#define AFIO_MAPR_SWJ_CFG_0 (0x1U << AFIO_MAPR_SWJ_CFG_Pos)
#define AFIO_MAPR_SWJ_CFG_1 (0x2U << AFIO_MAPR_SWJ_CFG_Pos)
#define AFIO_MAPR_SWJ_CFG_2 (0x4U << AFIO_MAPR_SWJ_CFG_Pos)

#define AFIO_MAPR_SWJ_CFG_RESET 0x00000000U
#define AFIO_MAPR_SWJ_CFG_NOJNTRST_Pos (24U)
#define AFIO_MAPR_SWJ_CFG_NOJNTRST_Msk (0x1U << AFIO_MAPR_SWJ_CFG_NOJNTRST_Pos)
#define AFIO_MAPR_SWJ_CFG_NOJNTRST AFIO_MAPR_SWJ_CFG_NOJNTRST_Msk
#define AFIO_MAPR_SWJ_CFG_JTAGDISABLE_Pos (25U)
#define AFIO_MAPR_SWJ_CFG_JTAGDISABLE_Msk (0x1U << AFIO_MAPR_SWJ_CFG_JTAGDISABLE_Pos)
#define AFIO_MAPR_SWJ_CFG_JTAGDISABLE AFIO_MAPR_SWJ_CFG_JTAGDISABLE_Msk
#define AFIO_MAPR_SWJ_CFG_DISABLE_Pos (26U)
#define AFIO_MAPR_SWJ_CFG_DISABLE_Msk (0x1U << AFIO_MAPR_SWJ_CFG_DISABLE_Pos)
#define AFIO_MAPR_SWJ_CFG_DISABLE AFIO_MAPR_SWJ_CFG_DISABLE_Msk



#define AFIO_EXTICR1_EXTI0_Pos (0U)
#define AFIO_EXTICR1_EXTI0_Msk (0xFU << AFIO_EXTICR1_EXTI0_Pos)
#define AFIO_EXTICR1_EXTI0 AFIO_EXTICR1_EXTI0_Msk
#define AFIO_EXTICR1_EXTI1_Pos (4U)
#define AFIO_EXTICR1_EXTI1_Msk (0xFU << AFIO_EXTICR1_EXTI1_Pos)
#define AFIO_EXTICR1_EXTI1 AFIO_EXTICR1_EXTI1_Msk
#define AFIO_EXTICR1_EXTI2_Pos (8U)
#define AFIO_EXTICR1_EXTI2_Msk (0xFU << AFIO_EXTICR1_EXTI2_Pos)
#define AFIO_EXTICR1_EXTI2 AFIO_EXTICR1_EXTI2_Msk
#define AFIO_EXTICR1_EXTI3_Pos (12U)
#define AFIO_EXTICR1_EXTI3_Msk (0xFU << AFIO_EXTICR1_EXTI3_Pos)
#define AFIO_EXTICR1_EXTI3 AFIO_EXTICR1_EXTI3_Msk


#define AFIO_EXTICR1_EXTI0_PA 0x00000000U
#define AFIO_EXTICR1_EXTI0_PB_Pos (0U)
#define AFIO_EXTICR1_EXTI0_PB_Msk (0x1U << AFIO_EXTICR1_EXTI0_PB_Pos)
#define AFIO_EXTICR1_EXTI0_PB AFIO_EXTICR1_EXTI0_PB_Msk
#define AFIO_EXTICR1_EXTI0_PC_Pos (1U)
#define AFIO_EXTICR1_EXTI0_PC_Msk (0x1U << AFIO_EXTICR1_EXTI0_PC_Pos)
#define AFIO_EXTICR1_EXTI0_PC AFIO_EXTICR1_EXTI0_PC_Msk
#define AFIO_EXTICR1_EXTI0_PD_Pos (0U)
#define AFIO_EXTICR1_EXTI0_PD_Msk (0x3U << AFIO_EXTICR1_EXTI0_PD_Pos)
#define AFIO_EXTICR1_EXTI0_PD AFIO_EXTICR1_EXTI0_PD_Msk
#define AFIO_EXTICR1_EXTI0_PE_Pos (2U)
#define AFIO_EXTICR1_EXTI0_PE_Msk (0x1U << AFIO_EXTICR1_EXTI0_PE_Pos)
#define AFIO_EXTICR1_EXTI0_PE AFIO_EXTICR1_EXTI0_PE_Msk
#define AFIO_EXTICR1_EXTI0_PF_Pos (0U)
#define AFIO_EXTICR1_EXTI0_PF_Msk (0x5U << AFIO_EXTICR1_EXTI0_PF_Pos)
#define AFIO_EXTICR1_EXTI0_PF AFIO_EXTICR1_EXTI0_PF_Msk
#define AFIO_EXTICR1_EXTI0_PG_Pos (1U)
#define AFIO_EXTICR1_EXTI0_PG_Msk (0x3U << AFIO_EXTICR1_EXTI0_PG_Pos)
#define AFIO_EXTICR1_EXTI0_PG AFIO_EXTICR1_EXTI0_PG_Msk


#define AFIO_EXTICR1_EXTI1_PA 0x00000000U
#define AFIO_EXTICR1_EXTI1_PB_Pos (4U)
#define AFIO_EXTICR1_EXTI1_PB_Msk (0x1U << AFIO_EXTICR1_EXTI1_PB_Pos)
#define AFIO_EXTICR1_EXTI1_PB AFIO_EXTICR1_EXTI1_PB_Msk
#define AFIO_EXTICR1_EXTI1_PC_Pos (5U)
#define AFIO_EXTICR1_EXTI1_PC_Msk (0x1U << AFIO_EXTICR1_EXTI1_PC_Pos)
#define AFIO_EXTICR1_EXTI1_PC AFIO_EXTICR1_EXTI1_PC_Msk
#define AFIO_EXTICR1_EXTI1_PD_Pos (4U)
#define AFIO_EXTICR1_EXTI1_PD_Msk (0x3U << AFIO_EXTICR1_EXTI1_PD_Pos)
#define AFIO_EXTICR1_EXTI1_PD AFIO_EXTICR1_EXTI1_PD_Msk
#define AFIO_EXTICR1_EXTI1_PE_Pos (6U)
#define AFIO_EXTICR1_EXTI1_PE_Msk (0x1U << AFIO_EXTICR1_EXTI1_PE_Pos)
#define AFIO_EXTICR1_EXTI1_PE AFIO_EXTICR1_EXTI1_PE_Msk
#define AFIO_EXTICR1_EXTI1_PF_Pos (4U)
#define AFIO_EXTICR1_EXTI1_PF_Msk (0x5U << AFIO_EXTICR1_EXTI1_PF_Pos)
#define AFIO_EXTICR1_EXTI1_PF AFIO_EXTICR1_EXTI1_PF_Msk
#define AFIO_EXTICR1_EXTI1_PG_Pos (5U)
#define AFIO_EXTICR1_EXTI1_PG_Msk (0x3U << AFIO_EXTICR1_EXTI1_PG_Pos)
#define AFIO_EXTICR1_EXTI1_PG AFIO_EXTICR1_EXTI1_PG_Msk


#define AFIO_EXTICR1_EXTI2_PA 0x00000000U
#define AFIO_EXTICR1_EXTI2_PB_Pos (8U)
#define AFIO_EXTICR1_EXTI2_PB_Msk (0x1U << AFIO_EXTICR1_EXTI2_PB_Pos)
#define AFIO_EXTICR1_EXTI2_PB AFIO_EXTICR1_EXTI2_PB_Msk
#define AFIO_EXTICR1_EXTI2_PC_Pos (9U)
#define AFIO_EXTICR1_EXTI2_PC_Msk (0x1U << AFIO_EXTICR1_EXTI2_PC_Pos)
#define AFIO_EXTICR1_EXTI2_PC AFIO_EXTICR1_EXTI2_PC_Msk
#define AFIO_EXTICR1_EXTI2_PD_Pos (8U)
#define AFIO_EXTICR1_EXTI2_PD_Msk (0x3U << AFIO_EXTICR1_EXTI2_PD_Pos)
#define AFIO_EXTICR1_EXTI2_PD AFIO_EXTICR1_EXTI2_PD_Msk
#define AFIO_EXTICR1_EXTI2_PE_Pos (10U)
#define AFIO_EXTICR1_EXTI2_PE_Msk (0x1U << AFIO_EXTICR1_EXTI2_PE_Pos)
#define AFIO_EXTICR1_EXTI2_PE AFIO_EXTICR1_EXTI2_PE_Msk
#define AFIO_EXTICR1_EXTI2_PF_Pos (8U)
#define AFIO_EXTICR1_EXTI2_PF_Msk (0x5U << AFIO_EXTICR1_EXTI2_PF_Pos)
#define AFIO_EXTICR1_EXTI2_PF AFIO_EXTICR1_EXTI2_PF_Msk
#define AFIO_EXTICR1_EXTI2_PG_Pos (9U)
#define AFIO_EXTICR1_EXTI2_PG_Msk (0x3U << AFIO_EXTICR1_EXTI2_PG_Pos)
#define AFIO_EXTICR1_EXTI2_PG AFIO_EXTICR1_EXTI2_PG_Msk


#define AFIO_EXTICR1_EXTI3_PA 0x00000000U
#define AFIO_EXTICR1_EXTI3_PB_Pos (12U)
#define AFIO_EXTICR1_EXTI3_PB_Msk (0x1U << AFIO_EXTICR1_EXTI3_PB_Pos)
#define AFIO_EXTICR1_EXTI3_PB AFIO_EXTICR1_EXTI3_PB_Msk
#define AFIO_EXTICR1_EXTI3_PC_Pos (13U)
#define AFIO_EXTICR1_EXTI3_PC_Msk (0x1U << AFIO_EXTICR1_EXTI3_PC_Pos)
#define AFIO_EXTICR1_EXTI3_PC AFIO_EXTICR1_EXTI3_PC_Msk
#define AFIO_EXTICR1_EXTI3_PD_Pos (12U)
#define AFIO_EXTICR1_EXTI3_PD_Msk (0x3U << AFIO_EXTICR1_EXTI3_PD_Pos)
#define AFIO_EXTICR1_EXTI3_PD AFIO_EXTICR1_EXTI3_PD_Msk
#define AFIO_EXTICR1_EXTI3_PE_Pos (14U)
#define AFIO_EXTICR1_EXTI3_PE_Msk (0x1U << AFIO_EXTICR1_EXTI3_PE_Pos)
#define AFIO_EXTICR1_EXTI3_PE AFIO_EXTICR1_EXTI3_PE_Msk
#define AFIO_EXTICR1_EXTI3_PF_Pos (12U)
#define AFIO_EXTICR1_EXTI3_PF_Msk (0x5U << AFIO_EXTICR1_EXTI3_PF_Pos)
#define AFIO_EXTICR1_EXTI3_PF AFIO_EXTICR1_EXTI3_PF_Msk
#define AFIO_EXTICR1_EXTI3_PG_Pos (13U)
#define AFIO_EXTICR1_EXTI3_PG_Msk (0x3U << AFIO_EXTICR1_EXTI3_PG_Pos)
#define AFIO_EXTICR1_EXTI3_PG AFIO_EXTICR1_EXTI3_PG_Msk


#define AFIO_EXTICR2_EXTI4_Pos (0U)
#define AFIO_EXTICR2_EXTI4_Msk (0xFU << AFIO_EXTICR2_EXTI4_Pos)
#define AFIO_EXTICR2_EXTI4 AFIO_EXTICR2_EXTI4_Msk
#define AFIO_EXTICR2_EXTI5_Pos (4U)
#define AFIO_EXTICR2_EXTI5_Msk (0xFU << AFIO_EXTICR2_EXTI5_Pos)
#define AFIO_EXTICR2_EXTI5 AFIO_EXTICR2_EXTI5_Msk
#define AFIO_EXTICR2_EXTI6_Pos (8U)
#define AFIO_EXTICR2_EXTI6_Msk (0xFU << AFIO_EXTICR2_EXTI6_Pos)
#define AFIO_EXTICR2_EXTI6 AFIO_EXTICR2_EXTI6_Msk
#define AFIO_EXTICR2_EXTI7_Pos (12U)
#define AFIO_EXTICR2_EXTI7_Msk (0xFU << AFIO_EXTICR2_EXTI7_Pos)
#define AFIO_EXTICR2_EXTI7 AFIO_EXTICR2_EXTI7_Msk


#define AFIO_EXTICR2_EXTI4_PA 0x00000000U
#define AFIO_EXTICR2_EXTI4_PB_Pos (0U)
#define AFIO_EXTICR2_EXTI4_PB_Msk (0x1U << AFIO_EXTICR2_EXTI4_PB_Pos)
#define AFIO_EXTICR2_EXTI4_PB AFIO_EXTICR2_EXTI4_PB_Msk
#define AFIO_EXTICR2_EXTI4_PC_Pos (1U)
#define AFIO_EXTICR2_EXTI4_PC_Msk (0x1U << AFIO_EXTICR2_EXTI4_PC_Pos)
#define AFIO_EXTICR2_EXTI4_PC AFIO_EXTICR2_EXTI4_PC_Msk
#define AFIO_EXTICR2_EXTI4_PD_Pos (0U)
#define AFIO_EXTICR2_EXTI4_PD_Msk (0x3U << AFIO_EXTICR2_EXTI4_PD_Pos)
#define AFIO_EXTICR2_EXTI4_PD AFIO_EXTICR2_EXTI4_PD_Msk
#define AFIO_EXTICR2_EXTI4_PE_Pos (2U)
#define AFIO_EXTICR2_EXTI4_PE_Msk (0x1U << AFIO_EXTICR2_EXTI4_PE_Pos)
#define AFIO_EXTICR2_EXTI4_PE AFIO_EXTICR2_EXTI4_PE_Msk
#define AFIO_EXTICR2_EXTI4_PF_Pos (0U)
#define AFIO_EXTICR2_EXTI4_PF_Msk (0x5U << AFIO_EXTICR2_EXTI4_PF_Pos)
#define AFIO_EXTICR2_EXTI4_PF AFIO_EXTICR2_EXTI4_PF_Msk
#define AFIO_EXTICR2_EXTI4_PG_Pos (1U)
#define AFIO_EXTICR2_EXTI4_PG_Msk (0x3U << AFIO_EXTICR2_EXTI4_PG_Pos)
#define AFIO_EXTICR2_EXTI4_PG AFIO_EXTICR2_EXTI4_PG_Msk


#define AFIO_EXTICR2_EXTI5_PA 0x00000000U
#define AFIO_EXTICR2_EXTI5_PB_Pos (4U)
#define AFIO_EXTICR2_EXTI5_PB_Msk (0x1U << AFIO_EXTICR2_EXTI5_PB_Pos)
#define AFIO_EXTICR2_EXTI5_PB AFIO_EXTICR2_EXTI5_PB_Msk
#define AFIO_EXTICR2_EXTI5_PC_Pos (5U)
#define AFIO_EXTICR2_EXTI5_PC_Msk (0x1U << AFIO_EXTICR2_EXTI5_PC_Pos)
#define AFIO_EXTICR2_EXTI5_PC AFIO_EXTICR2_EXTI5_PC_Msk
#define AFIO_EXTICR2_EXTI5_PD_Pos (4U)
#define AFIO_EXTICR2_EXTI5_PD_Msk (0x3U << AFIO_EXTICR2_EXTI5_PD_Pos)
#define AFIO_EXTICR2_EXTI5_PD AFIO_EXTICR2_EXTI5_PD_Msk
#define AFIO_EXTICR2_EXTI5_PE_Pos (6U)
#define AFIO_EXTICR2_EXTI5_PE_Msk (0x1U << AFIO_EXTICR2_EXTI5_PE_Pos)
#define AFIO_EXTICR2_EXTI5_PE AFIO_EXTICR2_EXTI5_PE_Msk
#define AFIO_EXTICR2_EXTI5_PF_Pos (4U)
#define AFIO_EXTICR2_EXTI5_PF_Msk (0x5U << AFIO_EXTICR2_EXTI5_PF_Pos)
#define AFIO_EXTICR2_EXTI5_PF AFIO_EXTICR2_EXTI5_PF_Msk
#define AFIO_EXTICR2_EXTI5_PG_Pos (5U)
#define AFIO_EXTICR2_EXTI5_PG_Msk (0x3U << AFIO_EXTICR2_EXTI5_PG_Pos)
#define AFIO_EXTICR2_EXTI5_PG AFIO_EXTICR2_EXTI5_PG_Msk


#define AFIO_EXTICR2_EXTI6_PA 0x00000000U
#define AFIO_EXTICR2_EXTI6_PB_Pos (8U)
#define AFIO_EXTICR2_EXTI6_PB_Msk (0x1U << AFIO_EXTICR2_EXTI6_PB_Pos)
#define AFIO_EXTICR2_EXTI6_PB AFIO_EXTICR2_EXTI6_PB_Msk
#define AFIO_EXTICR2_EXTI6_PC_Pos (9U)
#define AFIO_EXTICR2_EXTI6_PC_Msk (0x1U << AFIO_EXTICR2_EXTI6_PC_Pos)
#define AFIO_EXTICR2_EXTI6_PC AFIO_EXTICR2_EXTI6_PC_Msk
#define AFIO_EXTICR2_EXTI6_PD_Pos (8U)
#define AFIO_EXTICR2_EXTI6_PD_Msk (0x3U << AFIO_EXTICR2_EXTI6_PD_Pos)
#define AFIO_EXTICR2_EXTI6_PD AFIO_EXTICR2_EXTI6_PD_Msk
#define AFIO_EXTICR2_EXTI6_PE_Pos (10U)
#define AFIO_EXTICR2_EXTI6_PE_Msk (0x1U << AFIO_EXTICR2_EXTI6_PE_Pos)
#define AFIO_EXTICR2_EXTI6_PE AFIO_EXTICR2_EXTI6_PE_Msk
#define AFIO_EXTICR2_EXTI6_PF_Pos (8U)
#define AFIO_EXTICR2_EXTI6_PF_Msk (0x5U << AFIO_EXTICR2_EXTI6_PF_Pos)
#define AFIO_EXTICR2_EXTI6_PF AFIO_EXTICR2_EXTI6_PF_Msk
#define AFIO_EXTICR2_EXTI6_PG_Pos (9U)
#define AFIO_EXTICR2_EXTI6_PG_Msk (0x3U << AFIO_EXTICR2_EXTI6_PG_Pos)
#define AFIO_EXTICR2_EXTI6_PG AFIO_EXTICR2_EXTI6_PG_Msk


#define AFIO_EXTICR2_EXTI7_PA 0x00000000U
#define AFIO_EXTICR2_EXTI7_PB_Pos (12U)
#define AFIO_EXTICR2_EXTI7_PB_Msk (0x1U << AFIO_EXTICR2_EXTI7_PB_Pos)
#define AFIO_EXTICR2_EXTI7_PB AFIO_EXTICR2_EXTI7_PB_Msk
#define AFIO_EXTICR2_EXTI7_PC_Pos (13U)
#define AFIO_EXTICR2_EXTI7_PC_Msk (0x1U << AFIO_EXTICR2_EXTI7_PC_Pos)
#define AFIO_EXTICR2_EXTI7_PC AFIO_EXTICR2_EXTI7_PC_Msk
#define AFIO_EXTICR2_EXTI7_PD_Pos (12U)
#define AFIO_EXTICR2_EXTI7_PD_Msk (0x3U << AFIO_EXTICR2_EXTI7_PD_Pos)
#define AFIO_EXTICR2_EXTI7_PD AFIO_EXTICR2_EXTI7_PD_Msk
#define AFIO_EXTICR2_EXTI7_PE_Pos (14U)
#define AFIO_EXTICR2_EXTI7_PE_Msk (0x1U << AFIO_EXTICR2_EXTI7_PE_Pos)
#define AFIO_EXTICR2_EXTI7_PE AFIO_EXTICR2_EXTI7_PE_Msk
#define AFIO_EXTICR2_EXTI7_PF_Pos (12U)
#define AFIO_EXTICR2_EXTI7_PF_Msk (0x5U << AFIO_EXTICR2_EXTI7_PF_Pos)
#define AFIO_EXTICR2_EXTI7_PF AFIO_EXTICR2_EXTI7_PF_Msk
#define AFIO_EXTICR2_EXTI7_PG_Pos (13U)
#define AFIO_EXTICR2_EXTI7_PG_Msk (0x3U << AFIO_EXTICR2_EXTI7_PG_Pos)
#define AFIO_EXTICR2_EXTI7_PG AFIO_EXTICR2_EXTI7_PG_Msk


#define AFIO_EXTICR3_EXTI8_Pos (0U)
#define AFIO_EXTICR3_EXTI8_Msk (0xFU << AFIO_EXTICR3_EXTI8_Pos)
#define AFIO_EXTICR3_EXTI8 AFIO_EXTICR3_EXTI8_Msk
#define AFIO_EXTICR3_EXTI9_Pos (4U)
#define AFIO_EXTICR3_EXTI9_Msk (0xFU << AFIO_EXTICR3_EXTI9_Pos)
#define AFIO_EXTICR3_EXTI9 AFIO_EXTICR3_EXTI9_Msk
#define AFIO_EXTICR3_EXTI10_Pos (8U)
#define AFIO_EXTICR3_EXTI10_Msk (0xFU << AFIO_EXTICR3_EXTI10_Pos)
#define AFIO_EXTICR3_EXTI10 AFIO_EXTICR3_EXTI10_Msk
#define AFIO_EXTICR3_EXTI11_Pos (12U)
#define AFIO_EXTICR3_EXTI11_Msk (0xFU << AFIO_EXTICR3_EXTI11_Pos)
#define AFIO_EXTICR3_EXTI11 AFIO_EXTICR3_EXTI11_Msk


#define AFIO_EXTICR3_EXTI8_PA 0x00000000U
#define AFIO_EXTICR3_EXTI8_PB_Pos (0U)
#define AFIO_EXTICR3_EXTI8_PB_Msk (0x1U << AFIO_EXTICR3_EXTI8_PB_Pos)
#define AFIO_EXTICR3_EXTI8_PB AFIO_EXTICR3_EXTI8_PB_Msk
#define AFIO_EXTICR3_EXTI8_PC_Pos (1U)
#define AFIO_EXTICR3_EXTI8_PC_Msk (0x1U << AFIO_EXTICR3_EXTI8_PC_Pos)
#define AFIO_EXTICR3_EXTI8_PC AFIO_EXTICR3_EXTI8_PC_Msk
#define AFIO_EXTICR3_EXTI8_PD_Pos (0U)
#define AFIO_EXTICR3_EXTI8_PD_Msk (0x3U << AFIO_EXTICR3_EXTI8_PD_Pos)
#define AFIO_EXTICR3_EXTI8_PD AFIO_EXTICR3_EXTI8_PD_Msk
#define AFIO_EXTICR3_EXTI8_PE_Pos (2U)
#define AFIO_EXTICR3_EXTI8_PE_Msk (0x1U << AFIO_EXTICR3_EXTI8_PE_Pos)
#define AFIO_EXTICR3_EXTI8_PE AFIO_EXTICR3_EXTI8_PE_Msk
#define AFIO_EXTICR3_EXTI8_PF_Pos (0U)
#define AFIO_EXTICR3_EXTI8_PF_Msk (0x5U << AFIO_EXTICR3_EXTI8_PF_Pos)
#define AFIO_EXTICR3_EXTI8_PF AFIO_EXTICR3_EXTI8_PF_Msk
#define AFIO_EXTICR3_EXTI8_PG_Pos (1U)
#define AFIO_EXTICR3_EXTI8_PG_Msk (0x3U << AFIO_EXTICR3_EXTI8_PG_Pos)
#define AFIO_EXTICR3_EXTI8_PG AFIO_EXTICR3_EXTI8_PG_Msk


#define AFIO_EXTICR3_EXTI9_PA 0x00000000U
#define AFIO_EXTICR3_EXTI9_PB_Pos (4U)
#define AFIO_EXTICR3_EXTI9_PB_Msk (0x1U << AFIO_EXTICR3_EXTI9_PB_Pos)
#define AFIO_EXTICR3_EXTI9_PB AFIO_EXTICR3_EXTI9_PB_Msk
#define AFIO_EXTICR3_EXTI9_PC_Pos (5U)
#define AFIO_EXTICR3_EXTI9_PC_Msk (0x1U << AFIO_EXTICR3_EXTI9_PC_Pos)
#define AFIO_EXTICR3_EXTI9_PC AFIO_EXTICR3_EXTI9_PC_Msk
#define AFIO_EXTICR3_EXTI9_PD_Pos (4U)
#define AFIO_EXTICR3_EXTI9_PD_Msk (0x3U << AFIO_EXTICR3_EXTI9_PD_Pos)
#define AFIO_EXTICR3_EXTI9_PD AFIO_EXTICR3_EXTI9_PD_Msk
#define AFIO_EXTICR3_EXTI9_PE_Pos (6U)
#define AFIO_EXTICR3_EXTI9_PE_Msk (0x1U << AFIO_EXTICR3_EXTI9_PE_Pos)
#define AFIO_EXTICR3_EXTI9_PE AFIO_EXTICR3_EXTI9_PE_Msk
#define AFIO_EXTICR3_EXTI9_PF_Pos (4U)
#define AFIO_EXTICR3_EXTI9_PF_Msk (0x5U << AFIO_EXTICR3_EXTI9_PF_Pos)
#define AFIO_EXTICR3_EXTI9_PF AFIO_EXTICR3_EXTI9_PF_Msk
#define AFIO_EXTICR3_EXTI9_PG_Pos (5U)
#define AFIO_EXTICR3_EXTI9_PG_Msk (0x3U << AFIO_EXTICR3_EXTI9_PG_Pos)
#define AFIO_EXTICR3_EXTI9_PG AFIO_EXTICR3_EXTI9_PG_Msk


#define AFIO_EXTICR3_EXTI10_PA 0x00000000U
#define AFIO_EXTICR3_EXTI10_PB_Pos (8U)
#define AFIO_EXTICR3_EXTI10_PB_Msk (0x1U << AFIO_EXTICR3_EXTI10_PB_Pos)
#define AFIO_EXTICR3_EXTI10_PB AFIO_EXTICR3_EXTI10_PB_Msk
#define AFIO_EXTICR3_EXTI10_PC_Pos (9U)
#define AFIO_EXTICR3_EXTI10_PC_Msk (0x1U << AFIO_EXTICR3_EXTI10_PC_Pos)
#define AFIO_EXTICR3_EXTI10_PC AFIO_EXTICR3_EXTI10_PC_Msk
#define AFIO_EXTICR3_EXTI10_PD_Pos (8U)
#define AFIO_EXTICR3_EXTI10_PD_Msk (0x3U << AFIO_EXTICR3_EXTI10_PD_Pos)
#define AFIO_EXTICR3_EXTI10_PD AFIO_EXTICR3_EXTI10_PD_Msk
#define AFIO_EXTICR3_EXTI10_PE_Pos (10U)
#define AFIO_EXTICR3_EXTI10_PE_Msk (0x1U << AFIO_EXTICR3_EXTI10_PE_Pos)
#define AFIO_EXTICR3_EXTI10_PE AFIO_EXTICR3_EXTI10_PE_Msk
#define AFIO_EXTICR3_EXTI10_PF_Pos (8U)
#define AFIO_EXTICR3_EXTI10_PF_Msk (0x5U << AFIO_EXTICR3_EXTI10_PF_Pos)
#define AFIO_EXTICR3_EXTI10_PF AFIO_EXTICR3_EXTI10_PF_Msk
#define AFIO_EXTICR3_EXTI10_PG_Pos (9U)
#define AFIO_EXTICR3_EXTI10_PG_Msk (0x3U << AFIO_EXTICR3_EXTI10_PG_Pos)
#define AFIO_EXTICR3_EXTI10_PG AFIO_EXTICR3_EXTI10_PG_Msk


#define AFIO_EXTICR3_EXTI11_PA 0x00000000U
#define AFIO_EXTICR3_EXTI11_PB_Pos (12U)
#define AFIO_EXTICR3_EXTI11_PB_Msk (0x1U << AFIO_EXTICR3_EXTI11_PB_Pos)
#define AFIO_EXTICR3_EXTI11_PB AFIO_EXTICR3_EXTI11_PB_Msk
#define AFIO_EXTICR3_EXTI11_PC_Pos (13U)
#define AFIO_EXTICR3_EXTI11_PC_Msk (0x1U << AFIO_EXTICR3_EXTI11_PC_Pos)
#define AFIO_EXTICR3_EXTI11_PC AFIO_EXTICR3_EXTI11_PC_Msk
#define AFIO_EXTICR3_EXTI11_PD_Pos (12U)
#define AFIO_EXTICR3_EXTI11_PD_Msk (0x3U << AFIO_EXTICR3_EXTI11_PD_Pos)
#define AFIO_EXTICR3_EXTI11_PD AFIO_EXTICR3_EXTI11_PD_Msk
#define AFIO_EXTICR3_EXTI11_PE_Pos (14U)
#define AFIO_EXTICR3_EXTI11_PE_Msk (0x1U << AFIO_EXTICR3_EXTI11_PE_Pos)
#define AFIO_EXTICR3_EXTI11_PE AFIO_EXTICR3_EXTI11_PE_Msk
#define AFIO_EXTICR3_EXTI11_PF_Pos (12U)
#define AFIO_EXTICR3_EXTI11_PF_Msk (0x5U << AFIO_EXTICR3_EXTI11_PF_Pos)
#define AFIO_EXTICR3_EXTI11_PF AFIO_EXTICR3_EXTI11_PF_Msk
#define AFIO_EXTICR3_EXTI11_PG_Pos (13U)
#define AFIO_EXTICR3_EXTI11_PG_Msk (0x3U << AFIO_EXTICR3_EXTI11_PG_Pos)
#define AFIO_EXTICR3_EXTI11_PG AFIO_EXTICR3_EXTI11_PG_Msk


#define AFIO_EXTICR4_EXTI12_Pos (0U)
#define AFIO_EXTICR4_EXTI12_Msk (0xFU << AFIO_EXTICR4_EXTI12_Pos)
#define AFIO_EXTICR4_EXTI12 AFIO_EXTICR4_EXTI12_Msk
#define AFIO_EXTICR4_EXTI13_Pos (4U)
#define AFIO_EXTICR4_EXTI13_Msk (0xFU << AFIO_EXTICR4_EXTI13_Pos)
#define AFIO_EXTICR4_EXTI13 AFIO_EXTICR4_EXTI13_Msk
#define AFIO_EXTICR4_EXTI14_Pos (8U)
#define AFIO_EXTICR4_EXTI14_Msk (0xFU << AFIO_EXTICR4_EXTI14_Pos)
#define AFIO_EXTICR4_EXTI14 AFIO_EXTICR4_EXTI14_Msk
#define AFIO_EXTICR4_EXTI15_Pos (12U)
#define AFIO_EXTICR4_EXTI15_Msk (0xFU << AFIO_EXTICR4_EXTI15_Pos)
#define AFIO_EXTICR4_EXTI15 AFIO_EXTICR4_EXTI15_Msk


#define AFIO_EXTICR4_EXTI12_PA 0x00000000U
#define AFIO_EXTICR4_EXTI12_PB_Pos (0U)
#define AFIO_EXTICR4_EXTI12_PB_Msk (0x1U << AFIO_EXTICR4_EXTI12_PB_Pos)
#define AFIO_EXTICR4_EXTI12_PB AFIO_EXTICR4_EXTI12_PB_Msk
#define AFIO_EXTICR4_EXTI12_PC_Pos (1U)
#define AFIO_EXTICR4_EXTI12_PC_Msk (0x1U << AFIO_EXTICR4_EXTI12_PC_Pos)
#define AFIO_EXTICR4_EXTI12_PC AFIO_EXTICR4_EXTI12_PC_Msk
#define AFIO_EXTICR4_EXTI12_PD_Pos (0U)
#define AFIO_EXTICR4_EXTI12_PD_Msk (0x3U << AFIO_EXTICR4_EXTI12_PD_Pos)
#define AFIO_EXTICR4_EXTI12_PD AFIO_EXTICR4_EXTI12_PD_Msk
#define AFIO_EXTICR4_EXTI12_PE_Pos (2U)
#define AFIO_EXTICR4_EXTI12_PE_Msk (0x1U << AFIO_EXTICR4_EXTI12_PE_Pos)
#define AFIO_EXTICR4_EXTI12_PE AFIO_EXTICR4_EXTI12_PE_Msk
#define AFIO_EXTICR4_EXTI12_PF_Pos (0U)
#define AFIO_EXTICR4_EXTI12_PF_Msk (0x5U << AFIO_EXTICR4_EXTI12_PF_Pos)
#define AFIO_EXTICR4_EXTI12_PF AFIO_EXTICR4_EXTI12_PF_Msk
#define AFIO_EXTICR4_EXTI12_PG_Pos (1U)
#define AFIO_EXTICR4_EXTI12_PG_Msk (0x3U << AFIO_EXTICR4_EXTI12_PG_Pos)
#define AFIO_EXTICR4_EXTI12_PG AFIO_EXTICR4_EXTI12_PG_Msk


#define AFIO_EXTICR4_EXTI13_PA 0x00000000U
#define AFIO_EXTICR4_EXTI13_PB_Pos (4U)
#define AFIO_EXTICR4_EXTI13_PB_Msk (0x1U << AFIO_EXTICR4_EXTI13_PB_Pos)
#define AFIO_EXTICR4_EXTI13_PB AFIO_EXTICR4_EXTI13_PB_Msk
#define AFIO_EXTICR4_EXTI13_PC_Pos (5U)
#define AFIO_EXTICR4_EXTI13_PC_Msk (0x1U << AFIO_EXTICR4_EXTI13_PC_Pos)
#define AFIO_EXTICR4_EXTI13_PC AFIO_EXTICR4_EXTI13_PC_Msk
#define AFIO_EXTICR4_EXTI13_PD_Pos (4U)
#define AFIO_EXTICR4_EXTI13_PD_Msk (0x3U << AFIO_EXTICR4_EXTI13_PD_Pos)
#define AFIO_EXTICR4_EXTI13_PD AFIO_EXTICR4_EXTI13_PD_Msk
#define AFIO_EXTICR4_EXTI13_PE_Pos (6U)
#define AFIO_EXTICR4_EXTI13_PE_Msk (0x1U << AFIO_EXTICR4_EXTI13_PE_Pos)
#define AFIO_EXTICR4_EXTI13_PE AFIO_EXTICR4_EXTI13_PE_Msk
#define AFIO_EXTICR4_EXTI13_PF_Pos (4U)
#define AFIO_EXTICR4_EXTI13_PF_Msk (0x5U << AFIO_EXTICR4_EXTI13_PF_Pos)
#define AFIO_EXTICR4_EXTI13_PF AFIO_EXTICR4_EXTI13_PF_Msk
#define AFIO_EXTICR4_EXTI13_PG_Pos (5U)
#define AFIO_EXTICR4_EXTI13_PG_Msk (0x3U << AFIO_EXTICR4_EXTI13_PG_Pos)
#define AFIO_EXTICR4_EXTI13_PG AFIO_EXTICR4_EXTI13_PG_Msk


#define AFIO_EXTICR4_EXTI14_PA 0x00000000U
#define AFIO_EXTICR4_EXTI14_PB_Pos (8U)
#define AFIO_EXTICR4_EXTI14_PB_Msk (0x1U << AFIO_EXTICR4_EXTI14_PB_Pos)
#define AFIO_EXTICR4_EXTI14_PB AFIO_EXTICR4_EXTI14_PB_Msk
#define AFIO_EXTICR4_EXTI14_PC_Pos (9U)
#define AFIO_EXTICR4_EXTI14_PC_Msk (0x1U << AFIO_EXTICR4_EXTI14_PC_Pos)
#define AFIO_EXTICR4_EXTI14_PC AFIO_EXTICR4_EXTI14_PC_Msk
#define AFIO_EXTICR4_EXTI14_PD_Pos (8U)
#define AFIO_EXTICR4_EXTI14_PD_Msk (0x3U << AFIO_EXTICR4_EXTI14_PD_Pos)
#define AFIO_EXTICR4_EXTI14_PD AFIO_EXTICR4_EXTI14_PD_Msk
#define AFIO_EXTICR4_EXTI14_PE_Pos (10U)
#define AFIO_EXTICR4_EXTI14_PE_Msk (0x1U << AFIO_EXTICR4_EXTI14_PE_Pos)
#define AFIO_EXTICR4_EXTI14_PE AFIO_EXTICR4_EXTI14_PE_Msk
#define AFIO_EXTICR4_EXTI14_PF_Pos (8U)
#define AFIO_EXTICR4_EXTI14_PF_Msk (0x5U << AFIO_EXTICR4_EXTI14_PF_Pos)
#define AFIO_EXTICR4_EXTI14_PF AFIO_EXTICR4_EXTI14_PF_Msk
#define AFIO_EXTICR4_EXTI14_PG_Pos (9U)
#define AFIO_EXTICR4_EXTI14_PG_Msk (0x3U << AFIO_EXTICR4_EXTI14_PG_Pos)
#define AFIO_EXTICR4_EXTI14_PG AFIO_EXTICR4_EXTI14_PG_Msk


#define AFIO_EXTICR4_EXTI15_PA 0x00000000U
#define AFIO_EXTICR4_EXTI15_PB_Pos (12U)
#define AFIO_EXTICR4_EXTI15_PB_Msk (0x1U << AFIO_EXTICR4_EXTI15_PB_Pos)
#define AFIO_EXTICR4_EXTI15_PB AFIO_EXTICR4_EXTI15_PB_Msk
#define AFIO_EXTICR4_EXTI15_PC_Pos (13U)
#define AFIO_EXTICR4_EXTI15_PC_Msk (0x1U << AFIO_EXTICR4_EXTI15_PC_Pos)
#define AFIO_EXTICR4_EXTI15_PC AFIO_EXTICR4_EXTI15_PC_Msk
#define AFIO_EXTICR4_EXTI15_PD_Pos (12U)
#define AFIO_EXTICR4_EXTI15_PD_Msk (0x3U << AFIO_EXTICR4_EXTI15_PD_Pos)
#define AFIO_EXTICR4_EXTI15_PD AFIO_EXTICR4_EXTI15_PD_Msk
#define AFIO_EXTICR4_EXTI15_PE_Pos (14U)
#define AFIO_EXTICR4_EXTI15_PE_Msk (0x1U << AFIO_EXTICR4_EXTI15_PE_Pos)
#define AFIO_EXTICR4_EXTI15_PE AFIO_EXTICR4_EXTI15_PE_Msk
#define AFIO_EXTICR4_EXTI15_PF_Pos (12U)
#define AFIO_EXTICR4_EXTI15_PF_Msk (0x5U << AFIO_EXTICR4_EXTI15_PF_Pos)
#define AFIO_EXTICR4_EXTI15_PF AFIO_EXTICR4_EXTI15_PF_Msk
#define AFIO_EXTICR4_EXTI15_PG_Pos (13U)
#define AFIO_EXTICR4_EXTI15_PG_Msk (0x3U << AFIO_EXTICR4_EXTI15_PG_Pos)
#define AFIO_EXTICR4_EXTI15_PG AFIO_EXTICR4_EXTI15_PG_Msk
# 2597 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define EXTI_IMR_MR0_Pos (0U)
#define EXTI_IMR_MR0_Msk (0x1U << EXTI_IMR_MR0_Pos)
#define EXTI_IMR_MR0 EXTI_IMR_MR0_Msk
#define EXTI_IMR_MR1_Pos (1U)
#define EXTI_IMR_MR1_Msk (0x1U << EXTI_IMR_MR1_Pos)
#define EXTI_IMR_MR1 EXTI_IMR_MR1_Msk
#define EXTI_IMR_MR2_Pos (2U)
#define EXTI_IMR_MR2_Msk (0x1U << EXTI_IMR_MR2_Pos)
#define EXTI_IMR_MR2 EXTI_IMR_MR2_Msk
#define EXTI_IMR_MR3_Pos (3U)
#define EXTI_IMR_MR3_Msk (0x1U << EXTI_IMR_MR3_Pos)
#define EXTI_IMR_MR3 EXTI_IMR_MR3_Msk
#define EXTI_IMR_MR4_Pos (4U)
#define EXTI_IMR_MR4_Msk (0x1U << EXTI_IMR_MR4_Pos)
#define EXTI_IMR_MR4 EXTI_IMR_MR4_Msk
#define EXTI_IMR_MR5_Pos (5U)
#define EXTI_IMR_MR5_Msk (0x1U << EXTI_IMR_MR5_Pos)
#define EXTI_IMR_MR5 EXTI_IMR_MR5_Msk
#define EXTI_IMR_MR6_Pos (6U)
#define EXTI_IMR_MR6_Msk (0x1U << EXTI_IMR_MR6_Pos)
#define EXTI_IMR_MR6 EXTI_IMR_MR6_Msk
#define EXTI_IMR_MR7_Pos (7U)
#define EXTI_IMR_MR7_Msk (0x1U << EXTI_IMR_MR7_Pos)
#define EXTI_IMR_MR7 EXTI_IMR_MR7_Msk
#define EXTI_IMR_MR8_Pos (8U)
#define EXTI_IMR_MR8_Msk (0x1U << EXTI_IMR_MR8_Pos)
#define EXTI_IMR_MR8 EXTI_IMR_MR8_Msk
#define EXTI_IMR_MR9_Pos (9U)
#define EXTI_IMR_MR9_Msk (0x1U << EXTI_IMR_MR9_Pos)
#define EXTI_IMR_MR9 EXTI_IMR_MR9_Msk
#define EXTI_IMR_MR10_Pos (10U)
#define EXTI_IMR_MR10_Msk (0x1U << EXTI_IMR_MR10_Pos)
#define EXTI_IMR_MR10 EXTI_IMR_MR10_Msk
#define EXTI_IMR_MR11_Pos (11U)
#define EXTI_IMR_MR11_Msk (0x1U << EXTI_IMR_MR11_Pos)
#define EXTI_IMR_MR11 EXTI_IMR_MR11_Msk
#define EXTI_IMR_MR12_Pos (12U)
#define EXTI_IMR_MR12_Msk (0x1U << EXTI_IMR_MR12_Pos)
#define EXTI_IMR_MR12 EXTI_IMR_MR12_Msk
#define EXTI_IMR_MR13_Pos (13U)
#define EXTI_IMR_MR13_Msk (0x1U << EXTI_IMR_MR13_Pos)
#define EXTI_IMR_MR13 EXTI_IMR_MR13_Msk
#define EXTI_IMR_MR14_Pos (14U)
#define EXTI_IMR_MR14_Msk (0x1U << EXTI_IMR_MR14_Pos)
#define EXTI_IMR_MR14 EXTI_IMR_MR14_Msk
#define EXTI_IMR_MR15_Pos (15U)
#define EXTI_IMR_MR15_Msk (0x1U << EXTI_IMR_MR15_Pos)
#define EXTI_IMR_MR15 EXTI_IMR_MR15_Msk
#define EXTI_IMR_MR16_Pos (16U)
#define EXTI_IMR_MR16_Msk (0x1U << EXTI_IMR_MR16_Pos)
#define EXTI_IMR_MR16 EXTI_IMR_MR16_Msk
#define EXTI_IMR_MR17_Pos (17U)
#define EXTI_IMR_MR17_Msk (0x1U << EXTI_IMR_MR17_Pos)
#define EXTI_IMR_MR17 EXTI_IMR_MR17_Msk
#define EXTI_IMR_MR18_Pos (18U)
#define EXTI_IMR_MR18_Msk (0x1U << EXTI_IMR_MR18_Pos)
#define EXTI_IMR_MR18 EXTI_IMR_MR18_Msk


#define EXTI_IMR_IM0 EXTI_IMR_MR0
#define EXTI_IMR_IM1 EXTI_IMR_MR1
#define EXTI_IMR_IM2 EXTI_IMR_MR2
#define EXTI_IMR_IM3 EXTI_IMR_MR3
#define EXTI_IMR_IM4 EXTI_IMR_MR4
#define EXTI_IMR_IM5 EXTI_IMR_MR5
#define EXTI_IMR_IM6 EXTI_IMR_MR6
#define EXTI_IMR_IM7 EXTI_IMR_MR7
#define EXTI_IMR_IM8 EXTI_IMR_MR8
#define EXTI_IMR_IM9 EXTI_IMR_MR9
#define EXTI_IMR_IM10 EXTI_IMR_MR10
#define EXTI_IMR_IM11 EXTI_IMR_MR11
#define EXTI_IMR_IM12 EXTI_IMR_MR12
#define EXTI_IMR_IM13 EXTI_IMR_MR13
#define EXTI_IMR_IM14 EXTI_IMR_MR14
#define EXTI_IMR_IM15 EXTI_IMR_MR15
#define EXTI_IMR_IM16 EXTI_IMR_MR16
#define EXTI_IMR_IM17 EXTI_IMR_MR17
#define EXTI_IMR_IM18 EXTI_IMR_MR18
#define EXTI_IMR_IM 0x0007FFFFU


#define EXTI_EMR_MR0_Pos (0U)
#define EXTI_EMR_MR0_Msk (0x1U << EXTI_EMR_MR0_Pos)
#define EXTI_EMR_MR0 EXTI_EMR_MR0_Msk
#define EXTI_EMR_MR1_Pos (1U)
#define EXTI_EMR_MR1_Msk (0x1U << EXTI_EMR_MR1_Pos)
#define EXTI_EMR_MR1 EXTI_EMR_MR1_Msk
#define EXTI_EMR_MR2_Pos (2U)
#define EXTI_EMR_MR2_Msk (0x1U << EXTI_EMR_MR2_Pos)
#define EXTI_EMR_MR2 EXTI_EMR_MR2_Msk
#define EXTI_EMR_MR3_Pos (3U)
#define EXTI_EMR_MR3_Msk (0x1U << EXTI_EMR_MR3_Pos)
#define EXTI_EMR_MR3 EXTI_EMR_MR3_Msk
#define EXTI_EMR_MR4_Pos (4U)
#define EXTI_EMR_MR4_Msk (0x1U << EXTI_EMR_MR4_Pos)
#define EXTI_EMR_MR4 EXTI_EMR_MR4_Msk
#define EXTI_EMR_MR5_Pos (5U)
#define EXTI_EMR_MR5_Msk (0x1U << EXTI_EMR_MR5_Pos)
#define EXTI_EMR_MR5 EXTI_EMR_MR5_Msk
#define EXTI_EMR_MR6_Pos (6U)
#define EXTI_EMR_MR6_Msk (0x1U << EXTI_EMR_MR6_Pos)
#define EXTI_EMR_MR6 EXTI_EMR_MR6_Msk
#define EXTI_EMR_MR7_Pos (7U)
#define EXTI_EMR_MR7_Msk (0x1U << EXTI_EMR_MR7_Pos)
#define EXTI_EMR_MR7 EXTI_EMR_MR7_Msk
#define EXTI_EMR_MR8_Pos (8U)
#define EXTI_EMR_MR8_Msk (0x1U << EXTI_EMR_MR8_Pos)
#define EXTI_EMR_MR8 EXTI_EMR_MR8_Msk
#define EXTI_EMR_MR9_Pos (9U)
#define EXTI_EMR_MR9_Msk (0x1U << EXTI_EMR_MR9_Pos)
#define EXTI_EMR_MR9 EXTI_EMR_MR9_Msk
#define EXTI_EMR_MR10_Pos (10U)
#define EXTI_EMR_MR10_Msk (0x1U << EXTI_EMR_MR10_Pos)
#define EXTI_EMR_MR10 EXTI_EMR_MR10_Msk
#define EXTI_EMR_MR11_Pos (11U)
#define EXTI_EMR_MR11_Msk (0x1U << EXTI_EMR_MR11_Pos)
#define EXTI_EMR_MR11 EXTI_EMR_MR11_Msk
#define EXTI_EMR_MR12_Pos (12U)
#define EXTI_EMR_MR12_Msk (0x1U << EXTI_EMR_MR12_Pos)
#define EXTI_EMR_MR12 EXTI_EMR_MR12_Msk
#define EXTI_EMR_MR13_Pos (13U)
#define EXTI_EMR_MR13_Msk (0x1U << EXTI_EMR_MR13_Pos)
#define EXTI_EMR_MR13 EXTI_EMR_MR13_Msk
#define EXTI_EMR_MR14_Pos (14U)
#define EXTI_EMR_MR14_Msk (0x1U << EXTI_EMR_MR14_Pos)
#define EXTI_EMR_MR14 EXTI_EMR_MR14_Msk
#define EXTI_EMR_MR15_Pos (15U)
#define EXTI_EMR_MR15_Msk (0x1U << EXTI_EMR_MR15_Pos)
#define EXTI_EMR_MR15 EXTI_EMR_MR15_Msk
#define EXTI_EMR_MR16_Pos (16U)
#define EXTI_EMR_MR16_Msk (0x1U << EXTI_EMR_MR16_Pos)
#define EXTI_EMR_MR16 EXTI_EMR_MR16_Msk
#define EXTI_EMR_MR17_Pos (17U)
#define EXTI_EMR_MR17_Msk (0x1U << EXTI_EMR_MR17_Pos)
#define EXTI_EMR_MR17 EXTI_EMR_MR17_Msk
#define EXTI_EMR_MR18_Pos (18U)
#define EXTI_EMR_MR18_Msk (0x1U << EXTI_EMR_MR18_Pos)
#define EXTI_EMR_MR18 EXTI_EMR_MR18_Msk


#define EXTI_EMR_EM0 EXTI_EMR_MR0
#define EXTI_EMR_EM1 EXTI_EMR_MR1
#define EXTI_EMR_EM2 EXTI_EMR_MR2
#define EXTI_EMR_EM3 EXTI_EMR_MR3
#define EXTI_EMR_EM4 EXTI_EMR_MR4
#define EXTI_EMR_EM5 EXTI_EMR_MR5
#define EXTI_EMR_EM6 EXTI_EMR_MR6
#define EXTI_EMR_EM7 EXTI_EMR_MR7
#define EXTI_EMR_EM8 EXTI_EMR_MR8
#define EXTI_EMR_EM9 EXTI_EMR_MR9
#define EXTI_EMR_EM10 EXTI_EMR_MR10
#define EXTI_EMR_EM11 EXTI_EMR_MR11
#define EXTI_EMR_EM12 EXTI_EMR_MR12
#define EXTI_EMR_EM13 EXTI_EMR_MR13
#define EXTI_EMR_EM14 EXTI_EMR_MR14
#define EXTI_EMR_EM15 EXTI_EMR_MR15
#define EXTI_EMR_EM16 EXTI_EMR_MR16
#define EXTI_EMR_EM17 EXTI_EMR_MR17
#define EXTI_EMR_EM18 EXTI_EMR_MR18


#define EXTI_RTSR_TR0_Pos (0U)
#define EXTI_RTSR_TR0_Msk (0x1U << EXTI_RTSR_TR0_Pos)
#define EXTI_RTSR_TR0 EXTI_RTSR_TR0_Msk
#define EXTI_RTSR_TR1_Pos (1U)
#define EXTI_RTSR_TR1_Msk (0x1U << EXTI_RTSR_TR1_Pos)
#define EXTI_RTSR_TR1 EXTI_RTSR_TR1_Msk
#define EXTI_RTSR_TR2_Pos (2U)
#define EXTI_RTSR_TR2_Msk (0x1U << EXTI_RTSR_TR2_Pos)
#define EXTI_RTSR_TR2 EXTI_RTSR_TR2_Msk
#define EXTI_RTSR_TR3_Pos (3U)
#define EXTI_RTSR_TR3_Msk (0x1U << EXTI_RTSR_TR3_Pos)
#define EXTI_RTSR_TR3 EXTI_RTSR_TR3_Msk
#define EXTI_RTSR_TR4_Pos (4U)
#define EXTI_RTSR_TR4_Msk (0x1U << EXTI_RTSR_TR4_Pos)
#define EXTI_RTSR_TR4 EXTI_RTSR_TR4_Msk
#define EXTI_RTSR_TR5_Pos (5U)
#define EXTI_RTSR_TR5_Msk (0x1U << EXTI_RTSR_TR5_Pos)
#define EXTI_RTSR_TR5 EXTI_RTSR_TR5_Msk
#define EXTI_RTSR_TR6_Pos (6U)
#define EXTI_RTSR_TR6_Msk (0x1U << EXTI_RTSR_TR6_Pos)
#define EXTI_RTSR_TR6 EXTI_RTSR_TR6_Msk
#define EXTI_RTSR_TR7_Pos (7U)
#define EXTI_RTSR_TR7_Msk (0x1U << EXTI_RTSR_TR7_Pos)
#define EXTI_RTSR_TR7 EXTI_RTSR_TR7_Msk
#define EXTI_RTSR_TR8_Pos (8U)
#define EXTI_RTSR_TR8_Msk (0x1U << EXTI_RTSR_TR8_Pos)
#define EXTI_RTSR_TR8 EXTI_RTSR_TR8_Msk
#define EXTI_RTSR_TR9_Pos (9U)
#define EXTI_RTSR_TR9_Msk (0x1U << EXTI_RTSR_TR9_Pos)
#define EXTI_RTSR_TR9 EXTI_RTSR_TR9_Msk
#define EXTI_RTSR_TR10_Pos (10U)
#define EXTI_RTSR_TR10_Msk (0x1U << EXTI_RTSR_TR10_Pos)
#define EXTI_RTSR_TR10 EXTI_RTSR_TR10_Msk
#define EXTI_RTSR_TR11_Pos (11U)
#define EXTI_RTSR_TR11_Msk (0x1U << EXTI_RTSR_TR11_Pos)
#define EXTI_RTSR_TR11 EXTI_RTSR_TR11_Msk
#define EXTI_RTSR_TR12_Pos (12U)
#define EXTI_RTSR_TR12_Msk (0x1U << EXTI_RTSR_TR12_Pos)
#define EXTI_RTSR_TR12 EXTI_RTSR_TR12_Msk
#define EXTI_RTSR_TR13_Pos (13U)
#define EXTI_RTSR_TR13_Msk (0x1U << EXTI_RTSR_TR13_Pos)
#define EXTI_RTSR_TR13 EXTI_RTSR_TR13_Msk
#define EXTI_RTSR_TR14_Pos (14U)
#define EXTI_RTSR_TR14_Msk (0x1U << EXTI_RTSR_TR14_Pos)
#define EXTI_RTSR_TR14 EXTI_RTSR_TR14_Msk
#define EXTI_RTSR_TR15_Pos (15U)
#define EXTI_RTSR_TR15_Msk (0x1U << EXTI_RTSR_TR15_Pos)
#define EXTI_RTSR_TR15 EXTI_RTSR_TR15_Msk
#define EXTI_RTSR_TR16_Pos (16U)
#define EXTI_RTSR_TR16_Msk (0x1U << EXTI_RTSR_TR16_Pos)
#define EXTI_RTSR_TR16 EXTI_RTSR_TR16_Msk
#define EXTI_RTSR_TR17_Pos (17U)
#define EXTI_RTSR_TR17_Msk (0x1U << EXTI_RTSR_TR17_Pos)
#define EXTI_RTSR_TR17 EXTI_RTSR_TR17_Msk
#define EXTI_RTSR_TR18_Pos (18U)
#define EXTI_RTSR_TR18_Msk (0x1U << EXTI_RTSR_TR18_Pos)
#define EXTI_RTSR_TR18 EXTI_RTSR_TR18_Msk


#define EXTI_RTSR_RT0 EXTI_RTSR_TR0
#define EXTI_RTSR_RT1 EXTI_RTSR_TR1
#define EXTI_RTSR_RT2 EXTI_RTSR_TR2
#define EXTI_RTSR_RT3 EXTI_RTSR_TR3
#define EXTI_RTSR_RT4 EXTI_RTSR_TR4
#define EXTI_RTSR_RT5 EXTI_RTSR_TR5
#define EXTI_RTSR_RT6 EXTI_RTSR_TR6
#define EXTI_RTSR_RT7 EXTI_RTSR_TR7
#define EXTI_RTSR_RT8 EXTI_RTSR_TR8
#define EXTI_RTSR_RT9 EXTI_RTSR_TR9
#define EXTI_RTSR_RT10 EXTI_RTSR_TR10
#define EXTI_RTSR_RT11 EXTI_RTSR_TR11
#define EXTI_RTSR_RT12 EXTI_RTSR_TR12
#define EXTI_RTSR_RT13 EXTI_RTSR_TR13
#define EXTI_RTSR_RT14 EXTI_RTSR_TR14
#define EXTI_RTSR_RT15 EXTI_RTSR_TR15
#define EXTI_RTSR_RT16 EXTI_RTSR_TR16
#define EXTI_RTSR_RT17 EXTI_RTSR_TR17
#define EXTI_RTSR_RT18 EXTI_RTSR_TR18


#define EXTI_FTSR_TR0_Pos (0U)
#define EXTI_FTSR_TR0_Msk (0x1U << EXTI_FTSR_TR0_Pos)
#define EXTI_FTSR_TR0 EXTI_FTSR_TR0_Msk
#define EXTI_FTSR_TR1_Pos (1U)
#define EXTI_FTSR_TR1_Msk (0x1U << EXTI_FTSR_TR1_Pos)
#define EXTI_FTSR_TR1 EXTI_FTSR_TR1_Msk
#define EXTI_FTSR_TR2_Pos (2U)
#define EXTI_FTSR_TR2_Msk (0x1U << EXTI_FTSR_TR2_Pos)
#define EXTI_FTSR_TR2 EXTI_FTSR_TR2_Msk
#define EXTI_FTSR_TR3_Pos (3U)
#define EXTI_FTSR_TR3_Msk (0x1U << EXTI_FTSR_TR3_Pos)
#define EXTI_FTSR_TR3 EXTI_FTSR_TR3_Msk
#define EXTI_FTSR_TR4_Pos (4U)
#define EXTI_FTSR_TR4_Msk (0x1U << EXTI_FTSR_TR4_Pos)
#define EXTI_FTSR_TR4 EXTI_FTSR_TR4_Msk
#define EXTI_FTSR_TR5_Pos (5U)
#define EXTI_FTSR_TR5_Msk (0x1U << EXTI_FTSR_TR5_Pos)
#define EXTI_FTSR_TR5 EXTI_FTSR_TR5_Msk
#define EXTI_FTSR_TR6_Pos (6U)
#define EXTI_FTSR_TR6_Msk (0x1U << EXTI_FTSR_TR6_Pos)
#define EXTI_FTSR_TR6 EXTI_FTSR_TR6_Msk
#define EXTI_FTSR_TR7_Pos (7U)
#define EXTI_FTSR_TR7_Msk (0x1U << EXTI_FTSR_TR7_Pos)
#define EXTI_FTSR_TR7 EXTI_FTSR_TR7_Msk
#define EXTI_FTSR_TR8_Pos (8U)
#define EXTI_FTSR_TR8_Msk (0x1U << EXTI_FTSR_TR8_Pos)
#define EXTI_FTSR_TR8 EXTI_FTSR_TR8_Msk
#define EXTI_FTSR_TR9_Pos (9U)
#define EXTI_FTSR_TR9_Msk (0x1U << EXTI_FTSR_TR9_Pos)
#define EXTI_FTSR_TR9 EXTI_FTSR_TR9_Msk
#define EXTI_FTSR_TR10_Pos (10U)
#define EXTI_FTSR_TR10_Msk (0x1U << EXTI_FTSR_TR10_Pos)
#define EXTI_FTSR_TR10 EXTI_FTSR_TR10_Msk
#define EXTI_FTSR_TR11_Pos (11U)
#define EXTI_FTSR_TR11_Msk (0x1U << EXTI_FTSR_TR11_Pos)
#define EXTI_FTSR_TR11 EXTI_FTSR_TR11_Msk
#define EXTI_FTSR_TR12_Pos (12U)
#define EXTI_FTSR_TR12_Msk (0x1U << EXTI_FTSR_TR12_Pos)
#define EXTI_FTSR_TR12 EXTI_FTSR_TR12_Msk
#define EXTI_FTSR_TR13_Pos (13U)
#define EXTI_FTSR_TR13_Msk (0x1U << EXTI_FTSR_TR13_Pos)
#define EXTI_FTSR_TR13 EXTI_FTSR_TR13_Msk
#define EXTI_FTSR_TR14_Pos (14U)
#define EXTI_FTSR_TR14_Msk (0x1U << EXTI_FTSR_TR14_Pos)
#define EXTI_FTSR_TR14 EXTI_FTSR_TR14_Msk
#define EXTI_FTSR_TR15_Pos (15U)
#define EXTI_FTSR_TR15_Msk (0x1U << EXTI_FTSR_TR15_Pos)
#define EXTI_FTSR_TR15 EXTI_FTSR_TR15_Msk
#define EXTI_FTSR_TR16_Pos (16U)
#define EXTI_FTSR_TR16_Msk (0x1U << EXTI_FTSR_TR16_Pos)
#define EXTI_FTSR_TR16 EXTI_FTSR_TR16_Msk
#define EXTI_FTSR_TR17_Pos (17U)
#define EXTI_FTSR_TR17_Msk (0x1U << EXTI_FTSR_TR17_Pos)
#define EXTI_FTSR_TR17 EXTI_FTSR_TR17_Msk
#define EXTI_FTSR_TR18_Pos (18U)
#define EXTI_FTSR_TR18_Msk (0x1U << EXTI_FTSR_TR18_Pos)
#define EXTI_FTSR_TR18 EXTI_FTSR_TR18_Msk


#define EXTI_FTSR_FT0 EXTI_FTSR_TR0
#define EXTI_FTSR_FT1 EXTI_FTSR_TR1
#define EXTI_FTSR_FT2 EXTI_FTSR_TR2
#define EXTI_FTSR_FT3 EXTI_FTSR_TR3
#define EXTI_FTSR_FT4 EXTI_FTSR_TR4
#define EXTI_FTSR_FT5 EXTI_FTSR_TR5
#define EXTI_FTSR_FT6 EXTI_FTSR_TR6
#define EXTI_FTSR_FT7 EXTI_FTSR_TR7
#define EXTI_FTSR_FT8 EXTI_FTSR_TR8
#define EXTI_FTSR_FT9 EXTI_FTSR_TR9
#define EXTI_FTSR_FT10 EXTI_FTSR_TR10
#define EXTI_FTSR_FT11 EXTI_FTSR_TR11
#define EXTI_FTSR_FT12 EXTI_FTSR_TR12
#define EXTI_FTSR_FT13 EXTI_FTSR_TR13
#define EXTI_FTSR_FT14 EXTI_FTSR_TR14
#define EXTI_FTSR_FT15 EXTI_FTSR_TR15
#define EXTI_FTSR_FT16 EXTI_FTSR_TR16
#define EXTI_FTSR_FT17 EXTI_FTSR_TR17
#define EXTI_FTSR_FT18 EXTI_FTSR_TR18


#define EXTI_SWIER_SWIER0_Pos (0U)
#define EXTI_SWIER_SWIER0_Msk (0x1U << EXTI_SWIER_SWIER0_Pos)
#define EXTI_SWIER_SWIER0 EXTI_SWIER_SWIER0_Msk
#define EXTI_SWIER_SWIER1_Pos (1U)
#define EXTI_SWIER_SWIER1_Msk (0x1U << EXTI_SWIER_SWIER1_Pos)
#define EXTI_SWIER_SWIER1 EXTI_SWIER_SWIER1_Msk
#define EXTI_SWIER_SWIER2_Pos (2U)
#define EXTI_SWIER_SWIER2_Msk (0x1U << EXTI_SWIER_SWIER2_Pos)
#define EXTI_SWIER_SWIER2 EXTI_SWIER_SWIER2_Msk
#define EXTI_SWIER_SWIER3_Pos (3U)
#define EXTI_SWIER_SWIER3_Msk (0x1U << EXTI_SWIER_SWIER3_Pos)
#define EXTI_SWIER_SWIER3 EXTI_SWIER_SWIER3_Msk
#define EXTI_SWIER_SWIER4_Pos (4U)
#define EXTI_SWIER_SWIER4_Msk (0x1U << EXTI_SWIER_SWIER4_Pos)
#define EXTI_SWIER_SWIER4 EXTI_SWIER_SWIER4_Msk
#define EXTI_SWIER_SWIER5_Pos (5U)
#define EXTI_SWIER_SWIER5_Msk (0x1U << EXTI_SWIER_SWIER5_Pos)
#define EXTI_SWIER_SWIER5 EXTI_SWIER_SWIER5_Msk
#define EXTI_SWIER_SWIER6_Pos (6U)
#define EXTI_SWIER_SWIER6_Msk (0x1U << EXTI_SWIER_SWIER6_Pos)
#define EXTI_SWIER_SWIER6 EXTI_SWIER_SWIER6_Msk
#define EXTI_SWIER_SWIER7_Pos (7U)
#define EXTI_SWIER_SWIER7_Msk (0x1U << EXTI_SWIER_SWIER7_Pos)
#define EXTI_SWIER_SWIER7 EXTI_SWIER_SWIER7_Msk
#define EXTI_SWIER_SWIER8_Pos (8U)
#define EXTI_SWIER_SWIER8_Msk (0x1U << EXTI_SWIER_SWIER8_Pos)
#define EXTI_SWIER_SWIER8 EXTI_SWIER_SWIER8_Msk
#define EXTI_SWIER_SWIER9_Pos (9U)
#define EXTI_SWIER_SWIER9_Msk (0x1U << EXTI_SWIER_SWIER9_Pos)
#define EXTI_SWIER_SWIER9 EXTI_SWIER_SWIER9_Msk
#define EXTI_SWIER_SWIER10_Pos (10U)
#define EXTI_SWIER_SWIER10_Msk (0x1U << EXTI_SWIER_SWIER10_Pos)
#define EXTI_SWIER_SWIER10 EXTI_SWIER_SWIER10_Msk
#define EXTI_SWIER_SWIER11_Pos (11U)
#define EXTI_SWIER_SWIER11_Msk (0x1U << EXTI_SWIER_SWIER11_Pos)
#define EXTI_SWIER_SWIER11 EXTI_SWIER_SWIER11_Msk
#define EXTI_SWIER_SWIER12_Pos (12U)
#define EXTI_SWIER_SWIER12_Msk (0x1U << EXTI_SWIER_SWIER12_Pos)
#define EXTI_SWIER_SWIER12 EXTI_SWIER_SWIER12_Msk
#define EXTI_SWIER_SWIER13_Pos (13U)
#define EXTI_SWIER_SWIER13_Msk (0x1U << EXTI_SWIER_SWIER13_Pos)
#define EXTI_SWIER_SWIER13 EXTI_SWIER_SWIER13_Msk
#define EXTI_SWIER_SWIER14_Pos (14U)
#define EXTI_SWIER_SWIER14_Msk (0x1U << EXTI_SWIER_SWIER14_Pos)
#define EXTI_SWIER_SWIER14 EXTI_SWIER_SWIER14_Msk
#define EXTI_SWIER_SWIER15_Pos (15U)
#define EXTI_SWIER_SWIER15_Msk (0x1U << EXTI_SWIER_SWIER15_Pos)
#define EXTI_SWIER_SWIER15 EXTI_SWIER_SWIER15_Msk
#define EXTI_SWIER_SWIER16_Pos (16U)
#define EXTI_SWIER_SWIER16_Msk (0x1U << EXTI_SWIER_SWIER16_Pos)
#define EXTI_SWIER_SWIER16 EXTI_SWIER_SWIER16_Msk
#define EXTI_SWIER_SWIER17_Pos (17U)
#define EXTI_SWIER_SWIER17_Msk (0x1U << EXTI_SWIER_SWIER17_Pos)
#define EXTI_SWIER_SWIER17 EXTI_SWIER_SWIER17_Msk
#define EXTI_SWIER_SWIER18_Pos (18U)
#define EXTI_SWIER_SWIER18_Msk (0x1U << EXTI_SWIER_SWIER18_Pos)
#define EXTI_SWIER_SWIER18 EXTI_SWIER_SWIER18_Msk


#define EXTI_SWIER_SWI0 EXTI_SWIER_SWIER0
#define EXTI_SWIER_SWI1 EXTI_SWIER_SWIER1
#define EXTI_SWIER_SWI2 EXTI_SWIER_SWIER2
#define EXTI_SWIER_SWI3 EXTI_SWIER_SWIER3
#define EXTI_SWIER_SWI4 EXTI_SWIER_SWIER4
#define EXTI_SWIER_SWI5 EXTI_SWIER_SWIER5
#define EXTI_SWIER_SWI6 EXTI_SWIER_SWIER6
#define EXTI_SWIER_SWI7 EXTI_SWIER_SWIER7
#define EXTI_SWIER_SWI8 EXTI_SWIER_SWIER8
#define EXTI_SWIER_SWI9 EXTI_SWIER_SWIER9
#define EXTI_SWIER_SWI10 EXTI_SWIER_SWIER10
#define EXTI_SWIER_SWI11 EXTI_SWIER_SWIER11
#define EXTI_SWIER_SWI12 EXTI_SWIER_SWIER12
#define EXTI_SWIER_SWI13 EXTI_SWIER_SWIER13
#define EXTI_SWIER_SWI14 EXTI_SWIER_SWIER14
#define EXTI_SWIER_SWI15 EXTI_SWIER_SWIER15
#define EXTI_SWIER_SWI16 EXTI_SWIER_SWIER16
#define EXTI_SWIER_SWI17 EXTI_SWIER_SWIER17
#define EXTI_SWIER_SWI18 EXTI_SWIER_SWIER18


#define EXTI_PR_PR0_Pos (0U)
#define EXTI_PR_PR0_Msk (0x1U << EXTI_PR_PR0_Pos)
#define EXTI_PR_PR0 EXTI_PR_PR0_Msk
#define EXTI_PR_PR1_Pos (1U)
#define EXTI_PR_PR1_Msk (0x1U << EXTI_PR_PR1_Pos)
#define EXTI_PR_PR1 EXTI_PR_PR1_Msk
#define EXTI_PR_PR2_Pos (2U)
#define EXTI_PR_PR2_Msk (0x1U << EXTI_PR_PR2_Pos)
#define EXTI_PR_PR2 EXTI_PR_PR2_Msk
#define EXTI_PR_PR3_Pos (3U)
#define EXTI_PR_PR3_Msk (0x1U << EXTI_PR_PR3_Pos)
#define EXTI_PR_PR3 EXTI_PR_PR3_Msk
#define EXTI_PR_PR4_Pos (4U)
#define EXTI_PR_PR4_Msk (0x1U << EXTI_PR_PR4_Pos)
#define EXTI_PR_PR4 EXTI_PR_PR4_Msk
#define EXTI_PR_PR5_Pos (5U)
#define EXTI_PR_PR5_Msk (0x1U << EXTI_PR_PR5_Pos)
#define EXTI_PR_PR5 EXTI_PR_PR5_Msk
#define EXTI_PR_PR6_Pos (6U)
#define EXTI_PR_PR6_Msk (0x1U << EXTI_PR_PR6_Pos)
#define EXTI_PR_PR6 EXTI_PR_PR6_Msk
#define EXTI_PR_PR7_Pos (7U)
#define EXTI_PR_PR7_Msk (0x1U << EXTI_PR_PR7_Pos)
#define EXTI_PR_PR7 EXTI_PR_PR7_Msk
#define EXTI_PR_PR8_Pos (8U)
#define EXTI_PR_PR8_Msk (0x1U << EXTI_PR_PR8_Pos)
#define EXTI_PR_PR8 EXTI_PR_PR8_Msk
#define EXTI_PR_PR9_Pos (9U)
#define EXTI_PR_PR9_Msk (0x1U << EXTI_PR_PR9_Pos)
#define EXTI_PR_PR9 EXTI_PR_PR9_Msk
#define EXTI_PR_PR10_Pos (10U)
#define EXTI_PR_PR10_Msk (0x1U << EXTI_PR_PR10_Pos)
#define EXTI_PR_PR10 EXTI_PR_PR10_Msk
#define EXTI_PR_PR11_Pos (11U)
#define EXTI_PR_PR11_Msk (0x1U << EXTI_PR_PR11_Pos)
#define EXTI_PR_PR11 EXTI_PR_PR11_Msk
#define EXTI_PR_PR12_Pos (12U)
#define EXTI_PR_PR12_Msk (0x1U << EXTI_PR_PR12_Pos)
#define EXTI_PR_PR12 EXTI_PR_PR12_Msk
#define EXTI_PR_PR13_Pos (13U)
#define EXTI_PR_PR13_Msk (0x1U << EXTI_PR_PR13_Pos)
#define EXTI_PR_PR13 EXTI_PR_PR13_Msk
#define EXTI_PR_PR14_Pos (14U)
#define EXTI_PR_PR14_Msk (0x1U << EXTI_PR_PR14_Pos)
#define EXTI_PR_PR14 EXTI_PR_PR14_Msk
#define EXTI_PR_PR15_Pos (15U)
#define EXTI_PR_PR15_Msk (0x1U << EXTI_PR_PR15_Pos)
#define EXTI_PR_PR15 EXTI_PR_PR15_Msk
#define EXTI_PR_PR16_Pos (16U)
#define EXTI_PR_PR16_Msk (0x1U << EXTI_PR_PR16_Pos)
#define EXTI_PR_PR16 EXTI_PR_PR16_Msk
#define EXTI_PR_PR17_Pos (17U)
#define EXTI_PR_PR17_Msk (0x1U << EXTI_PR_PR17_Pos)
#define EXTI_PR_PR17 EXTI_PR_PR17_Msk
#define EXTI_PR_PR18_Pos (18U)
#define EXTI_PR_PR18_Msk (0x1U << EXTI_PR_PR18_Pos)
#define EXTI_PR_PR18 EXTI_PR_PR18_Msk


#define EXTI_PR_PIF0 EXTI_PR_PR0
#define EXTI_PR_PIF1 EXTI_PR_PR1
#define EXTI_PR_PIF2 EXTI_PR_PR2
#define EXTI_PR_PIF3 EXTI_PR_PR3
#define EXTI_PR_PIF4 EXTI_PR_PR4
#define EXTI_PR_PIF5 EXTI_PR_PR5
#define EXTI_PR_PIF6 EXTI_PR_PR6
#define EXTI_PR_PIF7 EXTI_PR_PR7
#define EXTI_PR_PIF8 EXTI_PR_PR8
#define EXTI_PR_PIF9 EXTI_PR_PR9
#define EXTI_PR_PIF10 EXTI_PR_PR10
#define EXTI_PR_PIF11 EXTI_PR_PR11
#define EXTI_PR_PIF12 EXTI_PR_PR12
#define EXTI_PR_PIF13 EXTI_PR_PR13
#define EXTI_PR_PIF14 EXTI_PR_PR14
#define EXTI_PR_PIF15 EXTI_PR_PR15
#define EXTI_PR_PIF16 EXTI_PR_PR16
#define EXTI_PR_PIF17 EXTI_PR_PR17
#define EXTI_PR_PIF18 EXTI_PR_PR18
# 3084 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define DMA_ISR_GIF1_Pos (0U)
#define DMA_ISR_GIF1_Msk (0x1U << DMA_ISR_GIF1_Pos)
#define DMA_ISR_GIF1 DMA_ISR_GIF1_Msk
#define DMA_ISR_TCIF1_Pos (1U)
#define DMA_ISR_TCIF1_Msk (0x1U << DMA_ISR_TCIF1_Pos)
#define DMA_ISR_TCIF1 DMA_ISR_TCIF1_Msk
#define DMA_ISR_HTIF1_Pos (2U)
#define DMA_ISR_HTIF1_Msk (0x1U << DMA_ISR_HTIF1_Pos)
#define DMA_ISR_HTIF1 DMA_ISR_HTIF1_Msk
#define DMA_ISR_TEIF1_Pos (3U)
#define DMA_ISR_TEIF1_Msk (0x1U << DMA_ISR_TEIF1_Pos)
#define DMA_ISR_TEIF1 DMA_ISR_TEIF1_Msk
#define DMA_ISR_GIF2_Pos (4U)
#define DMA_ISR_GIF2_Msk (0x1U << DMA_ISR_GIF2_Pos)
#define DMA_ISR_GIF2 DMA_ISR_GIF2_Msk
#define DMA_ISR_TCIF2_Pos (5U)
#define DMA_ISR_TCIF2_Msk (0x1U << DMA_ISR_TCIF2_Pos)
#define DMA_ISR_TCIF2 DMA_ISR_TCIF2_Msk
#define DMA_ISR_HTIF2_Pos (6U)
#define DMA_ISR_HTIF2_Msk (0x1U << DMA_ISR_HTIF2_Pos)
#define DMA_ISR_HTIF2 DMA_ISR_HTIF2_Msk
#define DMA_ISR_TEIF2_Pos (7U)
#define DMA_ISR_TEIF2_Msk (0x1U << DMA_ISR_TEIF2_Pos)
#define DMA_ISR_TEIF2 DMA_ISR_TEIF2_Msk
#define DMA_ISR_GIF3_Pos (8U)
#define DMA_ISR_GIF3_Msk (0x1U << DMA_ISR_GIF3_Pos)
#define DMA_ISR_GIF3 DMA_ISR_GIF3_Msk
#define DMA_ISR_TCIF3_Pos (9U)
#define DMA_ISR_TCIF3_Msk (0x1U << DMA_ISR_TCIF3_Pos)
#define DMA_ISR_TCIF3 DMA_ISR_TCIF3_Msk
#define DMA_ISR_HTIF3_Pos (10U)
#define DMA_ISR_HTIF3_Msk (0x1U << DMA_ISR_HTIF3_Pos)
#define DMA_ISR_HTIF3 DMA_ISR_HTIF3_Msk
#define DMA_ISR_TEIF3_Pos (11U)
#define DMA_ISR_TEIF3_Msk (0x1U << DMA_ISR_TEIF3_Pos)
#define DMA_ISR_TEIF3 DMA_ISR_TEIF3_Msk
#define DMA_ISR_GIF4_Pos (12U)
#define DMA_ISR_GIF4_Msk (0x1U << DMA_ISR_GIF4_Pos)
#define DMA_ISR_GIF4 DMA_ISR_GIF4_Msk
#define DMA_ISR_TCIF4_Pos (13U)
#define DMA_ISR_TCIF4_Msk (0x1U << DMA_ISR_TCIF4_Pos)
#define DMA_ISR_TCIF4 DMA_ISR_TCIF4_Msk
#define DMA_ISR_HTIF4_Pos (14U)
#define DMA_ISR_HTIF4_Msk (0x1U << DMA_ISR_HTIF4_Pos)
#define DMA_ISR_HTIF4 DMA_ISR_HTIF4_Msk
#define DMA_ISR_TEIF4_Pos (15U)
#define DMA_ISR_TEIF4_Msk (0x1U << DMA_ISR_TEIF4_Pos)
#define DMA_ISR_TEIF4 DMA_ISR_TEIF4_Msk
#define DMA_ISR_GIF5_Pos (16U)
#define DMA_ISR_GIF5_Msk (0x1U << DMA_ISR_GIF5_Pos)
#define DMA_ISR_GIF5 DMA_ISR_GIF5_Msk
#define DMA_ISR_TCIF5_Pos (17U)
#define DMA_ISR_TCIF5_Msk (0x1U << DMA_ISR_TCIF5_Pos)
#define DMA_ISR_TCIF5 DMA_ISR_TCIF5_Msk
#define DMA_ISR_HTIF5_Pos (18U)
#define DMA_ISR_HTIF5_Msk (0x1U << DMA_ISR_HTIF5_Pos)
#define DMA_ISR_HTIF5 DMA_ISR_HTIF5_Msk
#define DMA_ISR_TEIF5_Pos (19U)
#define DMA_ISR_TEIF5_Msk (0x1U << DMA_ISR_TEIF5_Pos)
#define DMA_ISR_TEIF5 DMA_ISR_TEIF5_Msk
#define DMA_ISR_GIF6_Pos (20U)
#define DMA_ISR_GIF6_Msk (0x1U << DMA_ISR_GIF6_Pos)
#define DMA_ISR_GIF6 DMA_ISR_GIF6_Msk
#define DMA_ISR_TCIF6_Pos (21U)
#define DMA_ISR_TCIF6_Msk (0x1U << DMA_ISR_TCIF6_Pos)
#define DMA_ISR_TCIF6 DMA_ISR_TCIF6_Msk
#define DMA_ISR_HTIF6_Pos (22U)
#define DMA_ISR_HTIF6_Msk (0x1U << DMA_ISR_HTIF6_Pos)
#define DMA_ISR_HTIF6 DMA_ISR_HTIF6_Msk
#define DMA_ISR_TEIF6_Pos (23U)
#define DMA_ISR_TEIF6_Msk (0x1U << DMA_ISR_TEIF6_Pos)
#define DMA_ISR_TEIF6 DMA_ISR_TEIF6_Msk
#define DMA_ISR_GIF7_Pos (24U)
#define DMA_ISR_GIF7_Msk (0x1U << DMA_ISR_GIF7_Pos)
#define DMA_ISR_GIF7 DMA_ISR_GIF7_Msk
#define DMA_ISR_TCIF7_Pos (25U)
#define DMA_ISR_TCIF7_Msk (0x1U << DMA_ISR_TCIF7_Pos)
#define DMA_ISR_TCIF7 DMA_ISR_TCIF7_Msk
#define DMA_ISR_HTIF7_Pos (26U)
#define DMA_ISR_HTIF7_Msk (0x1U << DMA_ISR_HTIF7_Pos)
#define DMA_ISR_HTIF7 DMA_ISR_HTIF7_Msk
#define DMA_ISR_TEIF7_Pos (27U)
#define DMA_ISR_TEIF7_Msk (0x1U << DMA_ISR_TEIF7_Pos)
#define DMA_ISR_TEIF7 DMA_ISR_TEIF7_Msk


#define DMA_IFCR_CGIF1_Pos (0U)
#define DMA_IFCR_CGIF1_Msk (0x1U << DMA_IFCR_CGIF1_Pos)
#define DMA_IFCR_CGIF1 DMA_IFCR_CGIF1_Msk
#define DMA_IFCR_CTCIF1_Pos (1U)
#define DMA_IFCR_CTCIF1_Msk (0x1U << DMA_IFCR_CTCIF1_Pos)
#define DMA_IFCR_CTCIF1 DMA_IFCR_CTCIF1_Msk
#define DMA_IFCR_CHTIF1_Pos (2U)
#define DMA_IFCR_CHTIF1_Msk (0x1U << DMA_IFCR_CHTIF1_Pos)
#define DMA_IFCR_CHTIF1 DMA_IFCR_CHTIF1_Msk
#define DMA_IFCR_CTEIF1_Pos (3U)
#define DMA_IFCR_CTEIF1_Msk (0x1U << DMA_IFCR_CTEIF1_Pos)
#define DMA_IFCR_CTEIF1 DMA_IFCR_CTEIF1_Msk
#define DMA_IFCR_CGIF2_Pos (4U)
#define DMA_IFCR_CGIF2_Msk (0x1U << DMA_IFCR_CGIF2_Pos)
#define DMA_IFCR_CGIF2 DMA_IFCR_CGIF2_Msk
#define DMA_IFCR_CTCIF2_Pos (5U)
#define DMA_IFCR_CTCIF2_Msk (0x1U << DMA_IFCR_CTCIF2_Pos)
#define DMA_IFCR_CTCIF2 DMA_IFCR_CTCIF2_Msk
#define DMA_IFCR_CHTIF2_Pos (6U)
#define DMA_IFCR_CHTIF2_Msk (0x1U << DMA_IFCR_CHTIF2_Pos)
#define DMA_IFCR_CHTIF2 DMA_IFCR_CHTIF2_Msk
#define DMA_IFCR_CTEIF2_Pos (7U)
#define DMA_IFCR_CTEIF2_Msk (0x1U << DMA_IFCR_CTEIF2_Pos)
#define DMA_IFCR_CTEIF2 DMA_IFCR_CTEIF2_Msk
#define DMA_IFCR_CGIF3_Pos (8U)
#define DMA_IFCR_CGIF3_Msk (0x1U << DMA_IFCR_CGIF3_Pos)
#define DMA_IFCR_CGIF3 DMA_IFCR_CGIF3_Msk
#define DMA_IFCR_CTCIF3_Pos (9U)
#define DMA_IFCR_CTCIF3_Msk (0x1U << DMA_IFCR_CTCIF3_Pos)
#define DMA_IFCR_CTCIF3 DMA_IFCR_CTCIF3_Msk
#define DMA_IFCR_CHTIF3_Pos (10U)
#define DMA_IFCR_CHTIF3_Msk (0x1U << DMA_IFCR_CHTIF3_Pos)
#define DMA_IFCR_CHTIF3 DMA_IFCR_CHTIF3_Msk
#define DMA_IFCR_CTEIF3_Pos (11U)
#define DMA_IFCR_CTEIF3_Msk (0x1U << DMA_IFCR_CTEIF3_Pos)
#define DMA_IFCR_CTEIF3 DMA_IFCR_CTEIF3_Msk
#define DMA_IFCR_CGIF4_Pos (12U)
#define DMA_IFCR_CGIF4_Msk (0x1U << DMA_IFCR_CGIF4_Pos)
#define DMA_IFCR_CGIF4 DMA_IFCR_CGIF4_Msk
#define DMA_IFCR_CTCIF4_Pos (13U)
#define DMA_IFCR_CTCIF4_Msk (0x1U << DMA_IFCR_CTCIF4_Pos)
#define DMA_IFCR_CTCIF4 DMA_IFCR_CTCIF4_Msk
#define DMA_IFCR_CHTIF4_Pos (14U)
#define DMA_IFCR_CHTIF4_Msk (0x1U << DMA_IFCR_CHTIF4_Pos)
#define DMA_IFCR_CHTIF4 DMA_IFCR_CHTIF4_Msk
#define DMA_IFCR_CTEIF4_Pos (15U)
#define DMA_IFCR_CTEIF4_Msk (0x1U << DMA_IFCR_CTEIF4_Pos)
#define DMA_IFCR_CTEIF4 DMA_IFCR_CTEIF4_Msk
#define DMA_IFCR_CGIF5_Pos (16U)
#define DMA_IFCR_CGIF5_Msk (0x1U << DMA_IFCR_CGIF5_Pos)
#define DMA_IFCR_CGIF5 DMA_IFCR_CGIF5_Msk
#define DMA_IFCR_CTCIF5_Pos (17U)
#define DMA_IFCR_CTCIF5_Msk (0x1U << DMA_IFCR_CTCIF5_Pos)
#define DMA_IFCR_CTCIF5 DMA_IFCR_CTCIF5_Msk
#define DMA_IFCR_CHTIF5_Pos (18U)
#define DMA_IFCR_CHTIF5_Msk (0x1U << DMA_IFCR_CHTIF5_Pos)
#define DMA_IFCR_CHTIF5 DMA_IFCR_CHTIF5_Msk
#define DMA_IFCR_CTEIF5_Pos (19U)
#define DMA_IFCR_CTEIF5_Msk (0x1U << DMA_IFCR_CTEIF5_Pos)
#define DMA_IFCR_CTEIF5 DMA_IFCR_CTEIF5_Msk
#define DMA_IFCR_CGIF6_Pos (20U)
#define DMA_IFCR_CGIF6_Msk (0x1U << DMA_IFCR_CGIF6_Pos)
#define DMA_IFCR_CGIF6 DMA_IFCR_CGIF6_Msk
#define DMA_IFCR_CTCIF6_Pos (21U)
#define DMA_IFCR_CTCIF6_Msk (0x1U << DMA_IFCR_CTCIF6_Pos)
#define DMA_IFCR_CTCIF6 DMA_IFCR_CTCIF6_Msk
#define DMA_IFCR_CHTIF6_Pos (22U)
#define DMA_IFCR_CHTIF6_Msk (0x1U << DMA_IFCR_CHTIF6_Pos)
#define DMA_IFCR_CHTIF6 DMA_IFCR_CHTIF6_Msk
#define DMA_IFCR_CTEIF6_Pos (23U)
#define DMA_IFCR_CTEIF6_Msk (0x1U << DMA_IFCR_CTEIF6_Pos)
#define DMA_IFCR_CTEIF6 DMA_IFCR_CTEIF6_Msk
#define DMA_IFCR_CGIF7_Pos (24U)
#define DMA_IFCR_CGIF7_Msk (0x1U << DMA_IFCR_CGIF7_Pos)
#define DMA_IFCR_CGIF7 DMA_IFCR_CGIF7_Msk
#define DMA_IFCR_CTCIF7_Pos (25U)
#define DMA_IFCR_CTCIF7_Msk (0x1U << DMA_IFCR_CTCIF7_Pos)
#define DMA_IFCR_CTCIF7 DMA_IFCR_CTCIF7_Msk
#define DMA_IFCR_CHTIF7_Pos (26U)
#define DMA_IFCR_CHTIF7_Msk (0x1U << DMA_IFCR_CHTIF7_Pos)
#define DMA_IFCR_CHTIF7 DMA_IFCR_CHTIF7_Msk
#define DMA_IFCR_CTEIF7_Pos (27U)
#define DMA_IFCR_CTEIF7_Msk (0x1U << DMA_IFCR_CTEIF7_Pos)
#define DMA_IFCR_CTEIF7 DMA_IFCR_CTEIF7_Msk


#define DMA_CCR_EN_Pos (0U)
#define DMA_CCR_EN_Msk (0x1U << DMA_CCR_EN_Pos)
#define DMA_CCR_EN DMA_CCR_EN_Msk
#define DMA_CCR_TCIE_Pos (1U)
#define DMA_CCR_TCIE_Msk (0x1U << DMA_CCR_TCIE_Pos)
#define DMA_CCR_TCIE DMA_CCR_TCIE_Msk
#define DMA_CCR_HTIE_Pos (2U)
#define DMA_CCR_HTIE_Msk (0x1U << DMA_CCR_HTIE_Pos)
#define DMA_CCR_HTIE DMA_CCR_HTIE_Msk
#define DMA_CCR_TEIE_Pos (3U)
#define DMA_CCR_TEIE_Msk (0x1U << DMA_CCR_TEIE_Pos)
#define DMA_CCR_TEIE DMA_CCR_TEIE_Msk
#define DMA_CCR_DIR_Pos (4U)
#define DMA_CCR_DIR_Msk (0x1U << DMA_CCR_DIR_Pos)
#define DMA_CCR_DIR DMA_CCR_DIR_Msk
#define DMA_CCR_CIRC_Pos (5U)
#define DMA_CCR_CIRC_Msk (0x1U << DMA_CCR_CIRC_Pos)
#define DMA_CCR_CIRC DMA_CCR_CIRC_Msk
#define DMA_CCR_PINC_Pos (6U)
#define DMA_CCR_PINC_Msk (0x1U << DMA_CCR_PINC_Pos)
#define DMA_CCR_PINC DMA_CCR_PINC_Msk
#define DMA_CCR_MINC_Pos (7U)
#define DMA_CCR_MINC_Msk (0x1U << DMA_CCR_MINC_Pos)
#define DMA_CCR_MINC DMA_CCR_MINC_Msk

#define DMA_CCR_PSIZE_Pos (8U)
#define DMA_CCR_PSIZE_Msk (0x3U << DMA_CCR_PSIZE_Pos)
#define DMA_CCR_PSIZE DMA_CCR_PSIZE_Msk
#define DMA_CCR_PSIZE_0 (0x1U << DMA_CCR_PSIZE_Pos)
#define DMA_CCR_PSIZE_1 (0x2U << DMA_CCR_PSIZE_Pos)

#define DMA_CCR_MSIZE_Pos (10U)
#define DMA_CCR_MSIZE_Msk (0x3U << DMA_CCR_MSIZE_Pos)
#define DMA_CCR_MSIZE DMA_CCR_MSIZE_Msk
#define DMA_CCR_MSIZE_0 (0x1U << DMA_CCR_MSIZE_Pos)
#define DMA_CCR_MSIZE_1 (0x2U << DMA_CCR_MSIZE_Pos)

#define DMA_CCR_PL_Pos (12U)
#define DMA_CCR_PL_Msk (0x3U << DMA_CCR_PL_Pos)
#define DMA_CCR_PL DMA_CCR_PL_Msk
#define DMA_CCR_PL_0 (0x1U << DMA_CCR_PL_Pos)
#define DMA_CCR_PL_1 (0x2U << DMA_CCR_PL_Pos)

#define DMA_CCR_MEM2MEM_Pos (14U)
#define DMA_CCR_MEM2MEM_Msk (0x1U << DMA_CCR_MEM2MEM_Pos)
#define DMA_CCR_MEM2MEM DMA_CCR_MEM2MEM_Msk


#define DMA_CNDTR_NDT_Pos (0U)
#define DMA_CNDTR_NDT_Msk (0xFFFFU << DMA_CNDTR_NDT_Pos)
#define DMA_CNDTR_NDT DMA_CNDTR_NDT_Msk


#define DMA_CPAR_PA_Pos (0U)
#define DMA_CPAR_PA_Msk (0xFFFFFFFFU << DMA_CPAR_PA_Pos)
#define DMA_CPAR_PA DMA_CPAR_PA_Msk


#define DMA_CMAR_MA_Pos (0U)
#define DMA_CMAR_MA_Msk (0xFFFFFFFFU << DMA_CMAR_MA_Pos)
#define DMA_CMAR_MA DMA_CMAR_MA_Msk
# 3327 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define ADC_MULTIMODE_SUPPORT 


#define ADC_SR_AWD_Pos (0U)
#define ADC_SR_AWD_Msk (0x1U << ADC_SR_AWD_Pos)
#define ADC_SR_AWD ADC_SR_AWD_Msk
#define ADC_SR_EOS_Pos (1U)
#define ADC_SR_EOS_Msk (0x1U << ADC_SR_EOS_Pos)
#define ADC_SR_EOS ADC_SR_EOS_Msk
#define ADC_SR_JEOS_Pos (2U)
#define ADC_SR_JEOS_Msk (0x1U << ADC_SR_JEOS_Pos)
#define ADC_SR_JEOS ADC_SR_JEOS_Msk
#define ADC_SR_JSTRT_Pos (3U)
#define ADC_SR_JSTRT_Msk (0x1U << ADC_SR_JSTRT_Pos)
#define ADC_SR_JSTRT ADC_SR_JSTRT_Msk
#define ADC_SR_STRT_Pos (4U)
#define ADC_SR_STRT_Msk (0x1U << ADC_SR_STRT_Pos)
#define ADC_SR_STRT ADC_SR_STRT_Msk


#define ADC_SR_EOC (ADC_SR_EOS)
#define ADC_SR_JEOC (ADC_SR_JEOS)


#define ADC_CR1_AWDCH_Pos (0U)
#define ADC_CR1_AWDCH_Msk (0x1FU << ADC_CR1_AWDCH_Pos)
#define ADC_CR1_AWDCH ADC_CR1_AWDCH_Msk
#define ADC_CR1_AWDCH_0 (0x01U << ADC_CR1_AWDCH_Pos)
#define ADC_CR1_AWDCH_1 (0x02U << ADC_CR1_AWDCH_Pos)
#define ADC_CR1_AWDCH_2 (0x04U << ADC_CR1_AWDCH_Pos)
#define ADC_CR1_AWDCH_3 (0x08U << ADC_CR1_AWDCH_Pos)
#define ADC_CR1_AWDCH_4 (0x10U << ADC_CR1_AWDCH_Pos)

#define ADC_CR1_EOSIE_Pos (5U)
#define ADC_CR1_EOSIE_Msk (0x1U << ADC_CR1_EOSIE_Pos)
#define ADC_CR1_EOSIE ADC_CR1_EOSIE_Msk
#define ADC_CR1_AWDIE_Pos (6U)
#define ADC_CR1_AWDIE_Msk (0x1U << ADC_CR1_AWDIE_Pos)
#define ADC_CR1_AWDIE ADC_CR1_AWDIE_Msk
#define ADC_CR1_JEOSIE_Pos (7U)
#define ADC_CR1_JEOSIE_Msk (0x1U << ADC_CR1_JEOSIE_Pos)
#define ADC_CR1_JEOSIE ADC_CR1_JEOSIE_Msk
#define ADC_CR1_SCAN_Pos (8U)
#define ADC_CR1_SCAN_Msk (0x1U << ADC_CR1_SCAN_Pos)
#define ADC_CR1_SCAN ADC_CR1_SCAN_Msk
#define ADC_CR1_AWDSGL_Pos (9U)
#define ADC_CR1_AWDSGL_Msk (0x1U << ADC_CR1_AWDSGL_Pos)
#define ADC_CR1_AWDSGL ADC_CR1_AWDSGL_Msk
#define ADC_CR1_JAUTO_Pos (10U)
#define ADC_CR1_JAUTO_Msk (0x1U << ADC_CR1_JAUTO_Pos)
#define ADC_CR1_JAUTO ADC_CR1_JAUTO_Msk
#define ADC_CR1_DISCEN_Pos (11U)
#define ADC_CR1_DISCEN_Msk (0x1U << ADC_CR1_DISCEN_Pos)
#define ADC_CR1_DISCEN ADC_CR1_DISCEN_Msk
#define ADC_CR1_JDISCEN_Pos (12U)
#define ADC_CR1_JDISCEN_Msk (0x1U << ADC_CR1_JDISCEN_Pos)
#define ADC_CR1_JDISCEN ADC_CR1_JDISCEN_Msk

#define ADC_CR1_DISCNUM_Pos (13U)
#define ADC_CR1_DISCNUM_Msk (0x7U << ADC_CR1_DISCNUM_Pos)
#define ADC_CR1_DISCNUM ADC_CR1_DISCNUM_Msk
#define ADC_CR1_DISCNUM_0 (0x1U << ADC_CR1_DISCNUM_Pos)
#define ADC_CR1_DISCNUM_1 (0x2U << ADC_CR1_DISCNUM_Pos)
#define ADC_CR1_DISCNUM_2 (0x4U << ADC_CR1_DISCNUM_Pos)

#define ADC_CR1_DUALMOD_Pos (16U)
#define ADC_CR1_DUALMOD_Msk (0xFU << ADC_CR1_DUALMOD_Pos)
#define ADC_CR1_DUALMOD ADC_CR1_DUALMOD_Msk
#define ADC_CR1_DUALMOD_0 (0x1U << ADC_CR1_DUALMOD_Pos)
#define ADC_CR1_DUALMOD_1 (0x2U << ADC_CR1_DUALMOD_Pos)
#define ADC_CR1_DUALMOD_2 (0x4U << ADC_CR1_DUALMOD_Pos)
#define ADC_CR1_DUALMOD_3 (0x8U << ADC_CR1_DUALMOD_Pos)

#define ADC_CR1_JAWDEN_Pos (22U)
#define ADC_CR1_JAWDEN_Msk (0x1U << ADC_CR1_JAWDEN_Pos)
#define ADC_CR1_JAWDEN ADC_CR1_JAWDEN_Msk
#define ADC_CR1_AWDEN_Pos (23U)
#define ADC_CR1_AWDEN_Msk (0x1U << ADC_CR1_AWDEN_Pos)
#define ADC_CR1_AWDEN ADC_CR1_AWDEN_Msk


#define ADC_CR1_EOCIE (ADC_CR1_EOSIE)
#define ADC_CR1_JEOCIE (ADC_CR1_JEOSIE)


#define ADC_CR2_ADON_Pos (0U)
#define ADC_CR2_ADON_Msk (0x1U << ADC_CR2_ADON_Pos)
#define ADC_CR2_ADON ADC_CR2_ADON_Msk
#define ADC_CR2_CONT_Pos (1U)
#define ADC_CR2_CONT_Msk (0x1U << ADC_CR2_CONT_Pos)
#define ADC_CR2_CONT ADC_CR2_CONT_Msk
#define ADC_CR2_CAL_Pos (2U)
#define ADC_CR2_CAL_Msk (0x1U << ADC_CR2_CAL_Pos)
#define ADC_CR2_CAL ADC_CR2_CAL_Msk
#define ADC_CR2_RSTCAL_Pos (3U)
#define ADC_CR2_RSTCAL_Msk (0x1U << ADC_CR2_RSTCAL_Pos)
#define ADC_CR2_RSTCAL ADC_CR2_RSTCAL_Msk
#define ADC_CR2_DMA_Pos (8U)
#define ADC_CR2_DMA_Msk (0x1U << ADC_CR2_DMA_Pos)
#define ADC_CR2_DMA ADC_CR2_DMA_Msk
#define ADC_CR2_ALIGN_Pos (11U)
#define ADC_CR2_ALIGN_Msk (0x1U << ADC_CR2_ALIGN_Pos)
#define ADC_CR2_ALIGN ADC_CR2_ALIGN_Msk

#define ADC_CR2_JEXTSEL_Pos (12U)
#define ADC_CR2_JEXTSEL_Msk (0x7U << ADC_CR2_JEXTSEL_Pos)
#define ADC_CR2_JEXTSEL ADC_CR2_JEXTSEL_Msk
#define ADC_CR2_JEXTSEL_0 (0x1U << ADC_CR2_JEXTSEL_Pos)
#define ADC_CR2_JEXTSEL_1 (0x2U << ADC_CR2_JEXTSEL_Pos)
#define ADC_CR2_JEXTSEL_2 (0x4U << ADC_CR2_JEXTSEL_Pos)

#define ADC_CR2_JEXTTRIG_Pos (15U)
#define ADC_CR2_JEXTTRIG_Msk (0x1U << ADC_CR2_JEXTTRIG_Pos)
#define ADC_CR2_JEXTTRIG ADC_CR2_JEXTTRIG_Msk

#define ADC_CR2_EXTSEL_Pos (17U)
#define ADC_CR2_EXTSEL_Msk (0x7U << ADC_CR2_EXTSEL_Pos)
#define ADC_CR2_EXTSEL ADC_CR2_EXTSEL_Msk
#define ADC_CR2_EXTSEL_0 (0x1U << ADC_CR2_EXTSEL_Pos)
#define ADC_CR2_EXTSEL_1 (0x2U << ADC_CR2_EXTSEL_Pos)
#define ADC_CR2_EXTSEL_2 (0x4U << ADC_CR2_EXTSEL_Pos)

#define ADC_CR2_EXTTRIG_Pos (20U)
#define ADC_CR2_EXTTRIG_Msk (0x1U << ADC_CR2_EXTTRIG_Pos)
#define ADC_CR2_EXTTRIG ADC_CR2_EXTTRIG_Msk
#define ADC_CR2_JSWSTART_Pos (21U)
#define ADC_CR2_JSWSTART_Msk (0x1U << ADC_CR2_JSWSTART_Pos)
#define ADC_CR2_JSWSTART ADC_CR2_JSWSTART_Msk
#define ADC_CR2_SWSTART_Pos (22U)
#define ADC_CR2_SWSTART_Msk (0x1U << ADC_CR2_SWSTART_Pos)
#define ADC_CR2_SWSTART ADC_CR2_SWSTART_Msk
#define ADC_CR2_TSVREFE_Pos (23U)
#define ADC_CR2_TSVREFE_Msk (0x1U << ADC_CR2_TSVREFE_Pos)
#define ADC_CR2_TSVREFE ADC_CR2_TSVREFE_Msk


#define ADC_SMPR1_SMP10_Pos (0U)
#define ADC_SMPR1_SMP10_Msk (0x7U << ADC_SMPR1_SMP10_Pos)
#define ADC_SMPR1_SMP10 ADC_SMPR1_SMP10_Msk
#define ADC_SMPR1_SMP10_0 (0x1U << ADC_SMPR1_SMP10_Pos)
#define ADC_SMPR1_SMP10_1 (0x2U << ADC_SMPR1_SMP10_Pos)
#define ADC_SMPR1_SMP10_2 (0x4U << ADC_SMPR1_SMP10_Pos)

#define ADC_SMPR1_SMP11_Pos (3U)
#define ADC_SMPR1_SMP11_Msk (0x7U << ADC_SMPR1_SMP11_Pos)
#define ADC_SMPR1_SMP11 ADC_SMPR1_SMP11_Msk
#define ADC_SMPR1_SMP11_0 (0x1U << ADC_SMPR1_SMP11_Pos)
#define ADC_SMPR1_SMP11_1 (0x2U << ADC_SMPR1_SMP11_Pos)
#define ADC_SMPR1_SMP11_2 (0x4U << ADC_SMPR1_SMP11_Pos)

#define ADC_SMPR1_SMP12_Pos (6U)
#define ADC_SMPR1_SMP12_Msk (0x7U << ADC_SMPR1_SMP12_Pos)
#define ADC_SMPR1_SMP12 ADC_SMPR1_SMP12_Msk
#define ADC_SMPR1_SMP12_0 (0x1U << ADC_SMPR1_SMP12_Pos)
#define ADC_SMPR1_SMP12_1 (0x2U << ADC_SMPR1_SMP12_Pos)
#define ADC_SMPR1_SMP12_2 (0x4U << ADC_SMPR1_SMP12_Pos)

#define ADC_SMPR1_SMP13_Pos (9U)
#define ADC_SMPR1_SMP13_Msk (0x7U << ADC_SMPR1_SMP13_Pos)
#define ADC_SMPR1_SMP13 ADC_SMPR1_SMP13_Msk
#define ADC_SMPR1_SMP13_0 (0x1U << ADC_SMPR1_SMP13_Pos)
#define ADC_SMPR1_SMP13_1 (0x2U << ADC_SMPR1_SMP13_Pos)
#define ADC_SMPR1_SMP13_2 (0x4U << ADC_SMPR1_SMP13_Pos)

#define ADC_SMPR1_SMP14_Pos (12U)
#define ADC_SMPR1_SMP14_Msk (0x7U << ADC_SMPR1_SMP14_Pos)
#define ADC_SMPR1_SMP14 ADC_SMPR1_SMP14_Msk
#define ADC_SMPR1_SMP14_0 (0x1U << ADC_SMPR1_SMP14_Pos)
#define ADC_SMPR1_SMP14_1 (0x2U << ADC_SMPR1_SMP14_Pos)
#define ADC_SMPR1_SMP14_2 (0x4U << ADC_SMPR1_SMP14_Pos)

#define ADC_SMPR1_SMP15_Pos (15U)
#define ADC_SMPR1_SMP15_Msk (0x7U << ADC_SMPR1_SMP15_Pos)
#define ADC_SMPR1_SMP15 ADC_SMPR1_SMP15_Msk
#define ADC_SMPR1_SMP15_0 (0x1U << ADC_SMPR1_SMP15_Pos)
#define ADC_SMPR1_SMP15_1 (0x2U << ADC_SMPR1_SMP15_Pos)
#define ADC_SMPR1_SMP15_2 (0x4U << ADC_SMPR1_SMP15_Pos)

#define ADC_SMPR1_SMP16_Pos (18U)
#define ADC_SMPR1_SMP16_Msk (0x7U << ADC_SMPR1_SMP16_Pos)
#define ADC_SMPR1_SMP16 ADC_SMPR1_SMP16_Msk
#define ADC_SMPR1_SMP16_0 (0x1U << ADC_SMPR1_SMP16_Pos)
#define ADC_SMPR1_SMP16_1 (0x2U << ADC_SMPR1_SMP16_Pos)
#define ADC_SMPR1_SMP16_2 (0x4U << ADC_SMPR1_SMP16_Pos)

#define ADC_SMPR1_SMP17_Pos (21U)
#define ADC_SMPR1_SMP17_Msk (0x7U << ADC_SMPR1_SMP17_Pos)
#define ADC_SMPR1_SMP17 ADC_SMPR1_SMP17_Msk
#define ADC_SMPR1_SMP17_0 (0x1U << ADC_SMPR1_SMP17_Pos)
#define ADC_SMPR1_SMP17_1 (0x2U << ADC_SMPR1_SMP17_Pos)
#define ADC_SMPR1_SMP17_2 (0x4U << ADC_SMPR1_SMP17_Pos)


#define ADC_SMPR2_SMP0_Pos (0U)
#define ADC_SMPR2_SMP0_Msk (0x7U << ADC_SMPR2_SMP0_Pos)
#define ADC_SMPR2_SMP0 ADC_SMPR2_SMP0_Msk
#define ADC_SMPR2_SMP0_0 (0x1U << ADC_SMPR2_SMP0_Pos)
#define ADC_SMPR2_SMP0_1 (0x2U << ADC_SMPR2_SMP0_Pos)
#define ADC_SMPR2_SMP0_2 (0x4U << ADC_SMPR2_SMP0_Pos)

#define ADC_SMPR2_SMP1_Pos (3U)
#define ADC_SMPR2_SMP1_Msk (0x7U << ADC_SMPR2_SMP1_Pos)
#define ADC_SMPR2_SMP1 ADC_SMPR2_SMP1_Msk
#define ADC_SMPR2_SMP1_0 (0x1U << ADC_SMPR2_SMP1_Pos)
#define ADC_SMPR2_SMP1_1 (0x2U << ADC_SMPR2_SMP1_Pos)
#define ADC_SMPR2_SMP1_2 (0x4U << ADC_SMPR2_SMP1_Pos)

#define ADC_SMPR2_SMP2_Pos (6U)
#define ADC_SMPR2_SMP2_Msk (0x7U << ADC_SMPR2_SMP2_Pos)
#define ADC_SMPR2_SMP2 ADC_SMPR2_SMP2_Msk
#define ADC_SMPR2_SMP2_0 (0x1U << ADC_SMPR2_SMP2_Pos)
#define ADC_SMPR2_SMP2_1 (0x2U << ADC_SMPR2_SMP2_Pos)
#define ADC_SMPR2_SMP2_2 (0x4U << ADC_SMPR2_SMP2_Pos)

#define ADC_SMPR2_SMP3_Pos (9U)
#define ADC_SMPR2_SMP3_Msk (0x7U << ADC_SMPR2_SMP3_Pos)
#define ADC_SMPR2_SMP3 ADC_SMPR2_SMP3_Msk
#define ADC_SMPR2_SMP3_0 (0x1U << ADC_SMPR2_SMP3_Pos)
#define ADC_SMPR2_SMP3_1 (0x2U << ADC_SMPR2_SMP3_Pos)
#define ADC_SMPR2_SMP3_2 (0x4U << ADC_SMPR2_SMP3_Pos)

#define ADC_SMPR2_SMP4_Pos (12U)
#define ADC_SMPR2_SMP4_Msk (0x7U << ADC_SMPR2_SMP4_Pos)
#define ADC_SMPR2_SMP4 ADC_SMPR2_SMP4_Msk
#define ADC_SMPR2_SMP4_0 (0x1U << ADC_SMPR2_SMP4_Pos)
#define ADC_SMPR2_SMP4_1 (0x2U << ADC_SMPR2_SMP4_Pos)
#define ADC_SMPR2_SMP4_2 (0x4U << ADC_SMPR2_SMP4_Pos)

#define ADC_SMPR2_SMP5_Pos (15U)
#define ADC_SMPR2_SMP5_Msk (0x7U << ADC_SMPR2_SMP5_Pos)
#define ADC_SMPR2_SMP5 ADC_SMPR2_SMP5_Msk
#define ADC_SMPR2_SMP5_0 (0x1U << ADC_SMPR2_SMP5_Pos)
#define ADC_SMPR2_SMP5_1 (0x2U << ADC_SMPR2_SMP5_Pos)
#define ADC_SMPR2_SMP5_2 (0x4U << ADC_SMPR2_SMP5_Pos)

#define ADC_SMPR2_SMP6_Pos (18U)
#define ADC_SMPR2_SMP6_Msk (0x7U << ADC_SMPR2_SMP6_Pos)
#define ADC_SMPR2_SMP6 ADC_SMPR2_SMP6_Msk
#define ADC_SMPR2_SMP6_0 (0x1U << ADC_SMPR2_SMP6_Pos)
#define ADC_SMPR2_SMP6_1 (0x2U << ADC_SMPR2_SMP6_Pos)
#define ADC_SMPR2_SMP6_2 (0x4U << ADC_SMPR2_SMP6_Pos)

#define ADC_SMPR2_SMP7_Pos (21U)
#define ADC_SMPR2_SMP7_Msk (0x7U << ADC_SMPR2_SMP7_Pos)
#define ADC_SMPR2_SMP7 ADC_SMPR2_SMP7_Msk
#define ADC_SMPR2_SMP7_0 (0x1U << ADC_SMPR2_SMP7_Pos)
#define ADC_SMPR2_SMP7_1 (0x2U << ADC_SMPR2_SMP7_Pos)
#define ADC_SMPR2_SMP7_2 (0x4U << ADC_SMPR2_SMP7_Pos)

#define ADC_SMPR2_SMP8_Pos (24U)
#define ADC_SMPR2_SMP8_Msk (0x7U << ADC_SMPR2_SMP8_Pos)
#define ADC_SMPR2_SMP8 ADC_SMPR2_SMP8_Msk
#define ADC_SMPR2_SMP8_0 (0x1U << ADC_SMPR2_SMP8_Pos)
#define ADC_SMPR2_SMP8_1 (0x2U << ADC_SMPR2_SMP8_Pos)
#define ADC_SMPR2_SMP8_2 (0x4U << ADC_SMPR2_SMP8_Pos)

#define ADC_SMPR2_SMP9_Pos (27U)
#define ADC_SMPR2_SMP9_Msk (0x7U << ADC_SMPR2_SMP9_Pos)
#define ADC_SMPR2_SMP9 ADC_SMPR2_SMP9_Msk
#define ADC_SMPR2_SMP9_0 (0x1U << ADC_SMPR2_SMP9_Pos)
#define ADC_SMPR2_SMP9_1 (0x2U << ADC_SMPR2_SMP9_Pos)
#define ADC_SMPR2_SMP9_2 (0x4U << ADC_SMPR2_SMP9_Pos)


#define ADC_JOFR1_JOFFSET1_Pos (0U)
#define ADC_JOFR1_JOFFSET1_Msk (0xFFFU << ADC_JOFR1_JOFFSET1_Pos)
#define ADC_JOFR1_JOFFSET1 ADC_JOFR1_JOFFSET1_Msk


#define ADC_JOFR2_JOFFSET2_Pos (0U)
#define ADC_JOFR2_JOFFSET2_Msk (0xFFFU << ADC_JOFR2_JOFFSET2_Pos)
#define ADC_JOFR2_JOFFSET2 ADC_JOFR2_JOFFSET2_Msk


#define ADC_JOFR3_JOFFSET3_Pos (0U)
#define ADC_JOFR3_JOFFSET3_Msk (0xFFFU << ADC_JOFR3_JOFFSET3_Pos)
#define ADC_JOFR3_JOFFSET3 ADC_JOFR3_JOFFSET3_Msk


#define ADC_JOFR4_JOFFSET4_Pos (0U)
#define ADC_JOFR4_JOFFSET4_Msk (0xFFFU << ADC_JOFR4_JOFFSET4_Pos)
#define ADC_JOFR4_JOFFSET4 ADC_JOFR4_JOFFSET4_Msk


#define ADC_HTR_HT_Pos (0U)
#define ADC_HTR_HT_Msk (0xFFFU << ADC_HTR_HT_Pos)
#define ADC_HTR_HT ADC_HTR_HT_Msk


#define ADC_LTR_LT_Pos (0U)
#define ADC_LTR_LT_Msk (0xFFFU << ADC_LTR_LT_Pos)
#define ADC_LTR_LT ADC_LTR_LT_Msk


#define ADC_SQR1_SQ13_Pos (0U)
#define ADC_SQR1_SQ13_Msk (0x1FU << ADC_SQR1_SQ13_Pos)
#define ADC_SQR1_SQ13 ADC_SQR1_SQ13_Msk
#define ADC_SQR1_SQ13_0 (0x01U << ADC_SQR1_SQ13_Pos)
#define ADC_SQR1_SQ13_1 (0x02U << ADC_SQR1_SQ13_Pos)
#define ADC_SQR1_SQ13_2 (0x04U << ADC_SQR1_SQ13_Pos)
#define ADC_SQR1_SQ13_3 (0x08U << ADC_SQR1_SQ13_Pos)
#define ADC_SQR1_SQ13_4 (0x10U << ADC_SQR1_SQ13_Pos)

#define ADC_SQR1_SQ14_Pos (5U)
#define ADC_SQR1_SQ14_Msk (0x1FU << ADC_SQR1_SQ14_Pos)
#define ADC_SQR1_SQ14 ADC_SQR1_SQ14_Msk
#define ADC_SQR1_SQ14_0 (0x01U << ADC_SQR1_SQ14_Pos)
#define ADC_SQR1_SQ14_1 (0x02U << ADC_SQR1_SQ14_Pos)
#define ADC_SQR1_SQ14_2 (0x04U << ADC_SQR1_SQ14_Pos)
#define ADC_SQR1_SQ14_3 (0x08U << ADC_SQR1_SQ14_Pos)
#define ADC_SQR1_SQ14_4 (0x10U << ADC_SQR1_SQ14_Pos)

#define ADC_SQR1_SQ15_Pos (10U)
#define ADC_SQR1_SQ15_Msk (0x1FU << ADC_SQR1_SQ15_Pos)
#define ADC_SQR1_SQ15 ADC_SQR1_SQ15_Msk
#define ADC_SQR1_SQ15_0 (0x01U << ADC_SQR1_SQ15_Pos)
#define ADC_SQR1_SQ15_1 (0x02U << ADC_SQR1_SQ15_Pos)
#define ADC_SQR1_SQ15_2 (0x04U << ADC_SQR1_SQ15_Pos)
#define ADC_SQR1_SQ15_3 (0x08U << ADC_SQR1_SQ15_Pos)
#define ADC_SQR1_SQ15_4 (0x10U << ADC_SQR1_SQ15_Pos)

#define ADC_SQR1_SQ16_Pos (15U)
#define ADC_SQR1_SQ16_Msk (0x1FU << ADC_SQR1_SQ16_Pos)
#define ADC_SQR1_SQ16 ADC_SQR1_SQ16_Msk
#define ADC_SQR1_SQ16_0 (0x01U << ADC_SQR1_SQ16_Pos)
#define ADC_SQR1_SQ16_1 (0x02U << ADC_SQR1_SQ16_Pos)
#define ADC_SQR1_SQ16_2 (0x04U << ADC_SQR1_SQ16_Pos)
#define ADC_SQR1_SQ16_3 (0x08U << ADC_SQR1_SQ16_Pos)
#define ADC_SQR1_SQ16_4 (0x10U << ADC_SQR1_SQ16_Pos)

#define ADC_SQR1_L_Pos (20U)
#define ADC_SQR1_L_Msk (0xFU << ADC_SQR1_L_Pos)
#define ADC_SQR1_L ADC_SQR1_L_Msk
#define ADC_SQR1_L_0 (0x1U << ADC_SQR1_L_Pos)
#define ADC_SQR1_L_1 (0x2U << ADC_SQR1_L_Pos)
#define ADC_SQR1_L_2 (0x4U << ADC_SQR1_L_Pos)
#define ADC_SQR1_L_3 (0x8U << ADC_SQR1_L_Pos)


#define ADC_SQR2_SQ7_Pos (0U)
#define ADC_SQR2_SQ7_Msk (0x1FU << ADC_SQR2_SQ7_Pos)
#define ADC_SQR2_SQ7 ADC_SQR2_SQ7_Msk
#define ADC_SQR2_SQ7_0 (0x01U << ADC_SQR2_SQ7_Pos)
#define ADC_SQR2_SQ7_1 (0x02U << ADC_SQR2_SQ7_Pos)
#define ADC_SQR2_SQ7_2 (0x04U << ADC_SQR2_SQ7_Pos)
#define ADC_SQR2_SQ7_3 (0x08U << ADC_SQR2_SQ7_Pos)
#define ADC_SQR2_SQ7_4 (0x10U << ADC_SQR2_SQ7_Pos)

#define ADC_SQR2_SQ8_Pos (5U)
#define ADC_SQR2_SQ8_Msk (0x1FU << ADC_SQR2_SQ8_Pos)
#define ADC_SQR2_SQ8 ADC_SQR2_SQ8_Msk
#define ADC_SQR2_SQ8_0 (0x01U << ADC_SQR2_SQ8_Pos)
#define ADC_SQR2_SQ8_1 (0x02U << ADC_SQR2_SQ8_Pos)
#define ADC_SQR2_SQ8_2 (0x04U << ADC_SQR2_SQ8_Pos)
#define ADC_SQR2_SQ8_3 (0x08U << ADC_SQR2_SQ8_Pos)
#define ADC_SQR2_SQ8_4 (0x10U << ADC_SQR2_SQ8_Pos)

#define ADC_SQR2_SQ9_Pos (10U)
#define ADC_SQR2_SQ9_Msk (0x1FU << ADC_SQR2_SQ9_Pos)
#define ADC_SQR2_SQ9 ADC_SQR2_SQ9_Msk
#define ADC_SQR2_SQ9_0 (0x01U << ADC_SQR2_SQ9_Pos)
#define ADC_SQR2_SQ9_1 (0x02U << ADC_SQR2_SQ9_Pos)
#define ADC_SQR2_SQ9_2 (0x04U << ADC_SQR2_SQ9_Pos)
#define ADC_SQR2_SQ9_3 (0x08U << ADC_SQR2_SQ9_Pos)
#define ADC_SQR2_SQ9_4 (0x10U << ADC_SQR2_SQ9_Pos)

#define ADC_SQR2_SQ10_Pos (15U)
#define ADC_SQR2_SQ10_Msk (0x1FU << ADC_SQR2_SQ10_Pos)
#define ADC_SQR2_SQ10 ADC_SQR2_SQ10_Msk
#define ADC_SQR2_SQ10_0 (0x01U << ADC_SQR2_SQ10_Pos)
#define ADC_SQR2_SQ10_1 (0x02U << ADC_SQR2_SQ10_Pos)
#define ADC_SQR2_SQ10_2 (0x04U << ADC_SQR2_SQ10_Pos)
#define ADC_SQR2_SQ10_3 (0x08U << ADC_SQR2_SQ10_Pos)
#define ADC_SQR2_SQ10_4 (0x10U << ADC_SQR2_SQ10_Pos)

#define ADC_SQR2_SQ11_Pos (20U)
#define ADC_SQR2_SQ11_Msk (0x1FU << ADC_SQR2_SQ11_Pos)
#define ADC_SQR2_SQ11 ADC_SQR2_SQ11_Msk
#define ADC_SQR2_SQ11_0 (0x01U << ADC_SQR2_SQ11_Pos)
#define ADC_SQR2_SQ11_1 (0x02U << ADC_SQR2_SQ11_Pos)
#define ADC_SQR2_SQ11_2 (0x04U << ADC_SQR2_SQ11_Pos)
#define ADC_SQR2_SQ11_3 (0x08U << ADC_SQR2_SQ11_Pos)
#define ADC_SQR2_SQ11_4 (0x10U << ADC_SQR2_SQ11_Pos)

#define ADC_SQR2_SQ12_Pos (25U)
#define ADC_SQR2_SQ12_Msk (0x1FU << ADC_SQR2_SQ12_Pos)
#define ADC_SQR2_SQ12 ADC_SQR2_SQ12_Msk
#define ADC_SQR2_SQ12_0 (0x01U << ADC_SQR2_SQ12_Pos)
#define ADC_SQR2_SQ12_1 (0x02U << ADC_SQR2_SQ12_Pos)
#define ADC_SQR2_SQ12_2 (0x04U << ADC_SQR2_SQ12_Pos)
#define ADC_SQR2_SQ12_3 (0x08U << ADC_SQR2_SQ12_Pos)
#define ADC_SQR2_SQ12_4 (0x10U << ADC_SQR2_SQ12_Pos)


#define ADC_SQR3_SQ1_Pos (0U)
#define ADC_SQR3_SQ1_Msk (0x1FU << ADC_SQR3_SQ1_Pos)
#define ADC_SQR3_SQ1 ADC_SQR3_SQ1_Msk
#define ADC_SQR3_SQ1_0 (0x01U << ADC_SQR3_SQ1_Pos)
#define ADC_SQR3_SQ1_1 (0x02U << ADC_SQR3_SQ1_Pos)
#define ADC_SQR3_SQ1_2 (0x04U << ADC_SQR3_SQ1_Pos)
#define ADC_SQR3_SQ1_3 (0x08U << ADC_SQR3_SQ1_Pos)
#define ADC_SQR3_SQ1_4 (0x10U << ADC_SQR3_SQ1_Pos)

#define ADC_SQR3_SQ2_Pos (5U)
#define ADC_SQR3_SQ2_Msk (0x1FU << ADC_SQR3_SQ2_Pos)
#define ADC_SQR3_SQ2 ADC_SQR3_SQ2_Msk
#define ADC_SQR3_SQ2_0 (0x01U << ADC_SQR3_SQ2_Pos)
#define ADC_SQR3_SQ2_1 (0x02U << ADC_SQR3_SQ2_Pos)
#define ADC_SQR3_SQ2_2 (0x04U << ADC_SQR3_SQ2_Pos)
#define ADC_SQR3_SQ2_3 (0x08U << ADC_SQR3_SQ2_Pos)
#define ADC_SQR3_SQ2_4 (0x10U << ADC_SQR3_SQ2_Pos)

#define ADC_SQR3_SQ3_Pos (10U)
#define ADC_SQR3_SQ3_Msk (0x1FU << ADC_SQR3_SQ3_Pos)
#define ADC_SQR3_SQ3 ADC_SQR3_SQ3_Msk
#define ADC_SQR3_SQ3_0 (0x01U << ADC_SQR3_SQ3_Pos)
#define ADC_SQR3_SQ3_1 (0x02U << ADC_SQR3_SQ3_Pos)
#define ADC_SQR3_SQ3_2 (0x04U << ADC_SQR3_SQ3_Pos)
#define ADC_SQR3_SQ3_3 (0x08U << ADC_SQR3_SQ3_Pos)
#define ADC_SQR3_SQ3_4 (0x10U << ADC_SQR3_SQ3_Pos)

#define ADC_SQR3_SQ4_Pos (15U)
#define ADC_SQR3_SQ4_Msk (0x1FU << ADC_SQR3_SQ4_Pos)
#define ADC_SQR3_SQ4 ADC_SQR3_SQ4_Msk
#define ADC_SQR3_SQ4_0 (0x01U << ADC_SQR3_SQ4_Pos)
#define ADC_SQR3_SQ4_1 (0x02U << ADC_SQR3_SQ4_Pos)
#define ADC_SQR3_SQ4_2 (0x04U << ADC_SQR3_SQ4_Pos)
#define ADC_SQR3_SQ4_3 (0x08U << ADC_SQR3_SQ4_Pos)
#define ADC_SQR3_SQ4_4 (0x10U << ADC_SQR3_SQ4_Pos)

#define ADC_SQR3_SQ5_Pos (20U)
#define ADC_SQR3_SQ5_Msk (0x1FU << ADC_SQR3_SQ5_Pos)
#define ADC_SQR3_SQ5 ADC_SQR3_SQ5_Msk
#define ADC_SQR3_SQ5_0 (0x01U << ADC_SQR3_SQ5_Pos)
#define ADC_SQR3_SQ5_1 (0x02U << ADC_SQR3_SQ5_Pos)
#define ADC_SQR3_SQ5_2 (0x04U << ADC_SQR3_SQ5_Pos)
#define ADC_SQR3_SQ5_3 (0x08U << ADC_SQR3_SQ5_Pos)
#define ADC_SQR3_SQ5_4 (0x10U << ADC_SQR3_SQ5_Pos)

#define ADC_SQR3_SQ6_Pos (25U)
#define ADC_SQR3_SQ6_Msk (0x1FU << ADC_SQR3_SQ6_Pos)
#define ADC_SQR3_SQ6 ADC_SQR3_SQ6_Msk
#define ADC_SQR3_SQ6_0 (0x01U << ADC_SQR3_SQ6_Pos)
#define ADC_SQR3_SQ6_1 (0x02U << ADC_SQR3_SQ6_Pos)
#define ADC_SQR3_SQ6_2 (0x04U << ADC_SQR3_SQ6_Pos)
#define ADC_SQR3_SQ6_3 (0x08U << ADC_SQR3_SQ6_Pos)
#define ADC_SQR3_SQ6_4 (0x10U << ADC_SQR3_SQ6_Pos)


#define ADC_JSQR_JSQ1_Pos (0U)
#define ADC_JSQR_JSQ1_Msk (0x1FU << ADC_JSQR_JSQ1_Pos)
#define ADC_JSQR_JSQ1 ADC_JSQR_JSQ1_Msk
#define ADC_JSQR_JSQ1_0 (0x01U << ADC_JSQR_JSQ1_Pos)
#define ADC_JSQR_JSQ1_1 (0x02U << ADC_JSQR_JSQ1_Pos)
#define ADC_JSQR_JSQ1_2 (0x04U << ADC_JSQR_JSQ1_Pos)
#define ADC_JSQR_JSQ1_3 (0x08U << ADC_JSQR_JSQ1_Pos)
#define ADC_JSQR_JSQ1_4 (0x10U << ADC_JSQR_JSQ1_Pos)

#define ADC_JSQR_JSQ2_Pos (5U)
#define ADC_JSQR_JSQ2_Msk (0x1FU << ADC_JSQR_JSQ2_Pos)
#define ADC_JSQR_JSQ2 ADC_JSQR_JSQ2_Msk
#define ADC_JSQR_JSQ2_0 (0x01U << ADC_JSQR_JSQ2_Pos)
#define ADC_JSQR_JSQ2_1 (0x02U << ADC_JSQR_JSQ2_Pos)
#define ADC_JSQR_JSQ2_2 (0x04U << ADC_JSQR_JSQ2_Pos)
#define ADC_JSQR_JSQ2_3 (0x08U << ADC_JSQR_JSQ2_Pos)
#define ADC_JSQR_JSQ2_4 (0x10U << ADC_JSQR_JSQ2_Pos)

#define ADC_JSQR_JSQ3_Pos (10U)
#define ADC_JSQR_JSQ3_Msk (0x1FU << ADC_JSQR_JSQ3_Pos)
#define ADC_JSQR_JSQ3 ADC_JSQR_JSQ3_Msk
#define ADC_JSQR_JSQ3_0 (0x01U << ADC_JSQR_JSQ3_Pos)
#define ADC_JSQR_JSQ3_1 (0x02U << ADC_JSQR_JSQ3_Pos)
#define ADC_JSQR_JSQ3_2 (0x04U << ADC_JSQR_JSQ3_Pos)
#define ADC_JSQR_JSQ3_3 (0x08U << ADC_JSQR_JSQ3_Pos)
#define ADC_JSQR_JSQ3_4 (0x10U << ADC_JSQR_JSQ3_Pos)

#define ADC_JSQR_JSQ4_Pos (15U)
#define ADC_JSQR_JSQ4_Msk (0x1FU << ADC_JSQR_JSQ4_Pos)
#define ADC_JSQR_JSQ4 ADC_JSQR_JSQ4_Msk
#define ADC_JSQR_JSQ4_0 (0x01U << ADC_JSQR_JSQ4_Pos)
#define ADC_JSQR_JSQ4_1 (0x02U << ADC_JSQR_JSQ4_Pos)
#define ADC_JSQR_JSQ4_2 (0x04U << ADC_JSQR_JSQ4_Pos)
#define ADC_JSQR_JSQ4_3 (0x08U << ADC_JSQR_JSQ4_Pos)
#define ADC_JSQR_JSQ4_4 (0x10U << ADC_JSQR_JSQ4_Pos)

#define ADC_JSQR_JL_Pos (20U)
#define ADC_JSQR_JL_Msk (0x3U << ADC_JSQR_JL_Pos)
#define ADC_JSQR_JL ADC_JSQR_JL_Msk
#define ADC_JSQR_JL_0 (0x1U << ADC_JSQR_JL_Pos)
#define ADC_JSQR_JL_1 (0x2U << ADC_JSQR_JL_Pos)


#define ADC_JDR1_JDATA_Pos (0U)
#define ADC_JDR1_JDATA_Msk (0xFFFFU << ADC_JDR1_JDATA_Pos)
#define ADC_JDR1_JDATA ADC_JDR1_JDATA_Msk


#define ADC_JDR2_JDATA_Pos (0U)
#define ADC_JDR2_JDATA_Msk (0xFFFFU << ADC_JDR2_JDATA_Pos)
#define ADC_JDR2_JDATA ADC_JDR2_JDATA_Msk


#define ADC_JDR3_JDATA_Pos (0U)
#define ADC_JDR3_JDATA_Msk (0xFFFFU << ADC_JDR3_JDATA_Pos)
#define ADC_JDR3_JDATA ADC_JDR3_JDATA_Msk


#define ADC_JDR4_JDATA_Pos (0U)
#define ADC_JDR4_JDATA_Msk (0xFFFFU << ADC_JDR4_JDATA_Pos)
#define ADC_JDR4_JDATA ADC_JDR4_JDATA_Msk


#define ADC_DR_DATA_Pos (0U)
#define ADC_DR_DATA_Msk (0xFFFFU << ADC_DR_DATA_Pos)
#define ADC_DR_DATA ADC_DR_DATA_Msk
#define ADC_DR_ADC2DATA_Pos (16U)
#define ADC_DR_ADC2DATA_Msk (0xFFFFU << ADC_DR_ADC2DATA_Pos)
#define ADC_DR_ADC2DATA ADC_DR_ADC2DATA_Msk
# 3853 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define TIM_CR1_CEN_Pos (0U)
#define TIM_CR1_CEN_Msk (0x1U << TIM_CR1_CEN_Pos)
#define TIM_CR1_CEN TIM_CR1_CEN_Msk
#define TIM_CR1_UDIS_Pos (1U)
#define TIM_CR1_UDIS_Msk (0x1U << TIM_CR1_UDIS_Pos)
#define TIM_CR1_UDIS TIM_CR1_UDIS_Msk
#define TIM_CR1_URS_Pos (2U)
#define TIM_CR1_URS_Msk (0x1U << TIM_CR1_URS_Pos)
#define TIM_CR1_URS TIM_CR1_URS_Msk
#define TIM_CR1_OPM_Pos (3U)
#define TIM_CR1_OPM_Msk (0x1U << TIM_CR1_OPM_Pos)
#define TIM_CR1_OPM TIM_CR1_OPM_Msk
#define TIM_CR1_DIR_Pos (4U)
#define TIM_CR1_DIR_Msk (0x1U << TIM_CR1_DIR_Pos)
#define TIM_CR1_DIR TIM_CR1_DIR_Msk

#define TIM_CR1_CMS_Pos (5U)
#define TIM_CR1_CMS_Msk (0x3U << TIM_CR1_CMS_Pos)
#define TIM_CR1_CMS TIM_CR1_CMS_Msk
#define TIM_CR1_CMS_0 (0x1U << TIM_CR1_CMS_Pos)
#define TIM_CR1_CMS_1 (0x2U << TIM_CR1_CMS_Pos)

#define TIM_CR1_ARPE_Pos (7U)
#define TIM_CR1_ARPE_Msk (0x1U << TIM_CR1_ARPE_Pos)
#define TIM_CR1_ARPE TIM_CR1_ARPE_Msk

#define TIM_CR1_CKD_Pos (8U)
#define TIM_CR1_CKD_Msk (0x3U << TIM_CR1_CKD_Pos)
#define TIM_CR1_CKD TIM_CR1_CKD_Msk
#define TIM_CR1_CKD_0 (0x1U << TIM_CR1_CKD_Pos)
#define TIM_CR1_CKD_1 (0x2U << TIM_CR1_CKD_Pos)


#define TIM_CR2_CCPC_Pos (0U)
#define TIM_CR2_CCPC_Msk (0x1U << TIM_CR2_CCPC_Pos)
#define TIM_CR2_CCPC TIM_CR2_CCPC_Msk
#define TIM_CR2_CCUS_Pos (2U)
#define TIM_CR2_CCUS_Msk (0x1U << TIM_CR2_CCUS_Pos)
#define TIM_CR2_CCUS TIM_CR2_CCUS_Msk
#define TIM_CR2_CCDS_Pos (3U)
#define TIM_CR2_CCDS_Msk (0x1U << TIM_CR2_CCDS_Pos)
#define TIM_CR2_CCDS TIM_CR2_CCDS_Msk

#define TIM_CR2_MMS_Pos (4U)
#define TIM_CR2_MMS_Msk (0x7U << TIM_CR2_MMS_Pos)
#define TIM_CR2_MMS TIM_CR2_MMS_Msk
#define TIM_CR2_MMS_0 (0x1U << TIM_CR2_MMS_Pos)
#define TIM_CR2_MMS_1 (0x2U << TIM_CR2_MMS_Pos)
#define TIM_CR2_MMS_2 (0x4U << TIM_CR2_MMS_Pos)

#define TIM_CR2_TI1S_Pos (7U)
#define TIM_CR2_TI1S_Msk (0x1U << TIM_CR2_TI1S_Pos)
#define TIM_CR2_TI1S TIM_CR2_TI1S_Msk
#define TIM_CR2_OIS1_Pos (8U)
#define TIM_CR2_OIS1_Msk (0x1U << TIM_CR2_OIS1_Pos)
#define TIM_CR2_OIS1 TIM_CR2_OIS1_Msk
#define TIM_CR2_OIS1N_Pos (9U)
#define TIM_CR2_OIS1N_Msk (0x1U << TIM_CR2_OIS1N_Pos)
#define TIM_CR2_OIS1N TIM_CR2_OIS1N_Msk
#define TIM_CR2_OIS2_Pos (10U)
#define TIM_CR2_OIS2_Msk (0x1U << TIM_CR2_OIS2_Pos)
#define TIM_CR2_OIS2 TIM_CR2_OIS2_Msk
#define TIM_CR2_OIS2N_Pos (11U)
#define TIM_CR2_OIS2N_Msk (0x1U << TIM_CR2_OIS2N_Pos)
#define TIM_CR2_OIS2N TIM_CR2_OIS2N_Msk
#define TIM_CR2_OIS3_Pos (12U)
#define TIM_CR2_OIS3_Msk (0x1U << TIM_CR2_OIS3_Pos)
#define TIM_CR2_OIS3 TIM_CR2_OIS3_Msk
#define TIM_CR2_OIS3N_Pos (13U)
#define TIM_CR2_OIS3N_Msk (0x1U << TIM_CR2_OIS3N_Pos)
#define TIM_CR2_OIS3N TIM_CR2_OIS3N_Msk
#define TIM_CR2_OIS4_Pos (14U)
#define TIM_CR2_OIS4_Msk (0x1U << TIM_CR2_OIS4_Pos)
#define TIM_CR2_OIS4 TIM_CR2_OIS4_Msk


#define TIM_SMCR_SMS_Pos (0U)
#define TIM_SMCR_SMS_Msk (0x7U << TIM_SMCR_SMS_Pos)
#define TIM_SMCR_SMS TIM_SMCR_SMS_Msk
#define TIM_SMCR_SMS_0 (0x1U << TIM_SMCR_SMS_Pos)
#define TIM_SMCR_SMS_1 (0x2U << TIM_SMCR_SMS_Pos)
#define TIM_SMCR_SMS_2 (0x4U << TIM_SMCR_SMS_Pos)

#define TIM_SMCR_TS_Pos (4U)
#define TIM_SMCR_TS_Msk (0x7U << TIM_SMCR_TS_Pos)
#define TIM_SMCR_TS TIM_SMCR_TS_Msk
#define TIM_SMCR_TS_0 (0x1U << TIM_SMCR_TS_Pos)
#define TIM_SMCR_TS_1 (0x2U << TIM_SMCR_TS_Pos)
#define TIM_SMCR_TS_2 (0x4U << TIM_SMCR_TS_Pos)

#define TIM_SMCR_MSM_Pos (7U)
#define TIM_SMCR_MSM_Msk (0x1U << TIM_SMCR_MSM_Pos)
#define TIM_SMCR_MSM TIM_SMCR_MSM_Msk

#define TIM_SMCR_ETF_Pos (8U)
#define TIM_SMCR_ETF_Msk (0xFU << TIM_SMCR_ETF_Pos)
#define TIM_SMCR_ETF TIM_SMCR_ETF_Msk
#define TIM_SMCR_ETF_0 (0x1U << TIM_SMCR_ETF_Pos)
#define TIM_SMCR_ETF_1 (0x2U << TIM_SMCR_ETF_Pos)
#define TIM_SMCR_ETF_2 (0x4U << TIM_SMCR_ETF_Pos)
#define TIM_SMCR_ETF_3 (0x8U << TIM_SMCR_ETF_Pos)

#define TIM_SMCR_ETPS_Pos (12U)
#define TIM_SMCR_ETPS_Msk (0x3U << TIM_SMCR_ETPS_Pos)
#define TIM_SMCR_ETPS TIM_SMCR_ETPS_Msk
#define TIM_SMCR_ETPS_0 (0x1U << TIM_SMCR_ETPS_Pos)
#define TIM_SMCR_ETPS_1 (0x2U << TIM_SMCR_ETPS_Pos)

#define TIM_SMCR_ECE_Pos (14U)
#define TIM_SMCR_ECE_Msk (0x1U << TIM_SMCR_ECE_Pos)
#define TIM_SMCR_ECE TIM_SMCR_ECE_Msk
#define TIM_SMCR_ETP_Pos (15U)
#define TIM_SMCR_ETP_Msk (0x1U << TIM_SMCR_ETP_Pos)
#define TIM_SMCR_ETP TIM_SMCR_ETP_Msk


#define TIM_DIER_UIE_Pos (0U)
#define TIM_DIER_UIE_Msk (0x1U << TIM_DIER_UIE_Pos)
#define TIM_DIER_UIE TIM_DIER_UIE_Msk
#define TIM_DIER_CC1IE_Pos (1U)
#define TIM_DIER_CC1IE_Msk (0x1U << TIM_DIER_CC1IE_Pos)
#define TIM_DIER_CC1IE TIM_DIER_CC1IE_Msk
#define TIM_DIER_CC2IE_Pos (2U)
#define TIM_DIER_CC2IE_Msk (0x1U << TIM_DIER_CC2IE_Pos)
#define TIM_DIER_CC2IE TIM_DIER_CC2IE_Msk
#define TIM_DIER_CC3IE_Pos (3U)
#define TIM_DIER_CC3IE_Msk (0x1U << TIM_DIER_CC3IE_Pos)
#define TIM_DIER_CC3IE TIM_DIER_CC3IE_Msk
#define TIM_DIER_CC4IE_Pos (4U)
#define TIM_DIER_CC4IE_Msk (0x1U << TIM_DIER_CC4IE_Pos)
#define TIM_DIER_CC4IE TIM_DIER_CC4IE_Msk
#define TIM_DIER_COMIE_Pos (5U)
#define TIM_DIER_COMIE_Msk (0x1U << TIM_DIER_COMIE_Pos)
#define TIM_DIER_COMIE TIM_DIER_COMIE_Msk
#define TIM_DIER_TIE_Pos (6U)
#define TIM_DIER_TIE_Msk (0x1U << TIM_DIER_TIE_Pos)
#define TIM_DIER_TIE TIM_DIER_TIE_Msk
#define TIM_DIER_BIE_Pos (7U)
#define TIM_DIER_BIE_Msk (0x1U << TIM_DIER_BIE_Pos)
#define TIM_DIER_BIE TIM_DIER_BIE_Msk
#define TIM_DIER_UDE_Pos (8U)
#define TIM_DIER_UDE_Msk (0x1U << TIM_DIER_UDE_Pos)
#define TIM_DIER_UDE TIM_DIER_UDE_Msk
#define TIM_DIER_CC1DE_Pos (9U)
#define TIM_DIER_CC1DE_Msk (0x1U << TIM_DIER_CC1DE_Pos)
#define TIM_DIER_CC1DE TIM_DIER_CC1DE_Msk
#define TIM_DIER_CC2DE_Pos (10U)
#define TIM_DIER_CC2DE_Msk (0x1U << TIM_DIER_CC2DE_Pos)
#define TIM_DIER_CC2DE TIM_DIER_CC2DE_Msk
#define TIM_DIER_CC3DE_Pos (11U)
#define TIM_DIER_CC3DE_Msk (0x1U << TIM_DIER_CC3DE_Pos)
#define TIM_DIER_CC3DE TIM_DIER_CC3DE_Msk
#define TIM_DIER_CC4DE_Pos (12U)
#define TIM_DIER_CC4DE_Msk (0x1U << TIM_DIER_CC4DE_Pos)
#define TIM_DIER_CC4DE TIM_DIER_CC4DE_Msk
#define TIM_DIER_COMDE_Pos (13U)
#define TIM_DIER_COMDE_Msk (0x1U << TIM_DIER_COMDE_Pos)
#define TIM_DIER_COMDE TIM_DIER_COMDE_Msk
#define TIM_DIER_TDE_Pos (14U)
#define TIM_DIER_TDE_Msk (0x1U << TIM_DIER_TDE_Pos)
#define TIM_DIER_TDE TIM_DIER_TDE_Msk


#define TIM_SR_UIF_Pos (0U)
#define TIM_SR_UIF_Msk (0x1U << TIM_SR_UIF_Pos)
#define TIM_SR_UIF TIM_SR_UIF_Msk
#define TIM_SR_CC1IF_Pos (1U)
#define TIM_SR_CC1IF_Msk (0x1U << TIM_SR_CC1IF_Pos)
#define TIM_SR_CC1IF TIM_SR_CC1IF_Msk
#define TIM_SR_CC2IF_Pos (2U)
#define TIM_SR_CC2IF_Msk (0x1U << TIM_SR_CC2IF_Pos)
#define TIM_SR_CC2IF TIM_SR_CC2IF_Msk
#define TIM_SR_CC3IF_Pos (3U)
#define TIM_SR_CC3IF_Msk (0x1U << TIM_SR_CC3IF_Pos)
#define TIM_SR_CC3IF TIM_SR_CC3IF_Msk
#define TIM_SR_CC4IF_Pos (4U)
#define TIM_SR_CC4IF_Msk (0x1U << TIM_SR_CC4IF_Pos)
#define TIM_SR_CC4IF TIM_SR_CC4IF_Msk
#define TIM_SR_COMIF_Pos (5U)
#define TIM_SR_COMIF_Msk (0x1U << TIM_SR_COMIF_Pos)
#define TIM_SR_COMIF TIM_SR_COMIF_Msk
#define TIM_SR_TIF_Pos (6U)
#define TIM_SR_TIF_Msk (0x1U << TIM_SR_TIF_Pos)
#define TIM_SR_TIF TIM_SR_TIF_Msk
#define TIM_SR_BIF_Pos (7U)
#define TIM_SR_BIF_Msk (0x1U << TIM_SR_BIF_Pos)
#define TIM_SR_BIF TIM_SR_BIF_Msk
#define TIM_SR_CC1OF_Pos (9U)
#define TIM_SR_CC1OF_Msk (0x1U << TIM_SR_CC1OF_Pos)
#define TIM_SR_CC1OF TIM_SR_CC1OF_Msk
#define TIM_SR_CC2OF_Pos (10U)
#define TIM_SR_CC2OF_Msk (0x1U << TIM_SR_CC2OF_Pos)
#define TIM_SR_CC2OF TIM_SR_CC2OF_Msk
#define TIM_SR_CC3OF_Pos (11U)
#define TIM_SR_CC3OF_Msk (0x1U << TIM_SR_CC3OF_Pos)
#define TIM_SR_CC3OF TIM_SR_CC3OF_Msk
#define TIM_SR_CC4OF_Pos (12U)
#define TIM_SR_CC4OF_Msk (0x1U << TIM_SR_CC4OF_Pos)
#define TIM_SR_CC4OF TIM_SR_CC4OF_Msk


#define TIM_EGR_UG_Pos (0U)
#define TIM_EGR_UG_Msk (0x1U << TIM_EGR_UG_Pos)
#define TIM_EGR_UG TIM_EGR_UG_Msk
#define TIM_EGR_CC1G_Pos (1U)
#define TIM_EGR_CC1G_Msk (0x1U << TIM_EGR_CC1G_Pos)
#define TIM_EGR_CC1G TIM_EGR_CC1G_Msk
#define TIM_EGR_CC2G_Pos (2U)
#define TIM_EGR_CC2G_Msk (0x1U << TIM_EGR_CC2G_Pos)
#define TIM_EGR_CC2G TIM_EGR_CC2G_Msk
#define TIM_EGR_CC3G_Pos (3U)
#define TIM_EGR_CC3G_Msk (0x1U << TIM_EGR_CC3G_Pos)
#define TIM_EGR_CC3G TIM_EGR_CC3G_Msk
#define TIM_EGR_CC4G_Pos (4U)
#define TIM_EGR_CC4G_Msk (0x1U << TIM_EGR_CC4G_Pos)
#define TIM_EGR_CC4G TIM_EGR_CC4G_Msk
#define TIM_EGR_COMG_Pos (5U)
#define TIM_EGR_COMG_Msk (0x1U << TIM_EGR_COMG_Pos)
#define TIM_EGR_COMG TIM_EGR_COMG_Msk
#define TIM_EGR_TG_Pos (6U)
#define TIM_EGR_TG_Msk (0x1U << TIM_EGR_TG_Pos)
#define TIM_EGR_TG TIM_EGR_TG_Msk
#define TIM_EGR_BG_Pos (7U)
#define TIM_EGR_BG_Msk (0x1U << TIM_EGR_BG_Pos)
#define TIM_EGR_BG TIM_EGR_BG_Msk


#define TIM_CCMR1_CC1S_Pos (0U)
#define TIM_CCMR1_CC1S_Msk (0x3U << TIM_CCMR1_CC1S_Pos)
#define TIM_CCMR1_CC1S TIM_CCMR1_CC1S_Msk
#define TIM_CCMR1_CC1S_0 (0x1U << TIM_CCMR1_CC1S_Pos)
#define TIM_CCMR1_CC1S_1 (0x2U << TIM_CCMR1_CC1S_Pos)

#define TIM_CCMR1_OC1FE_Pos (2U)
#define TIM_CCMR1_OC1FE_Msk (0x1U << TIM_CCMR1_OC1FE_Pos)
#define TIM_CCMR1_OC1FE TIM_CCMR1_OC1FE_Msk
#define TIM_CCMR1_OC1PE_Pos (3U)
#define TIM_CCMR1_OC1PE_Msk (0x1U << TIM_CCMR1_OC1PE_Pos)
#define TIM_CCMR1_OC1PE TIM_CCMR1_OC1PE_Msk

#define TIM_CCMR1_OC1M_Pos (4U)
#define TIM_CCMR1_OC1M_Msk (0x7U << TIM_CCMR1_OC1M_Pos)
#define TIM_CCMR1_OC1M TIM_CCMR1_OC1M_Msk
#define TIM_CCMR1_OC1M_0 (0x1U << TIM_CCMR1_OC1M_Pos)
#define TIM_CCMR1_OC1M_1 (0x2U << TIM_CCMR1_OC1M_Pos)
#define TIM_CCMR1_OC1M_2 (0x4U << TIM_CCMR1_OC1M_Pos)

#define TIM_CCMR1_OC1CE_Pos (7U)
#define TIM_CCMR1_OC1CE_Msk (0x1U << TIM_CCMR1_OC1CE_Pos)
#define TIM_CCMR1_OC1CE TIM_CCMR1_OC1CE_Msk

#define TIM_CCMR1_CC2S_Pos (8U)
#define TIM_CCMR1_CC2S_Msk (0x3U << TIM_CCMR1_CC2S_Pos)
#define TIM_CCMR1_CC2S TIM_CCMR1_CC2S_Msk
#define TIM_CCMR1_CC2S_0 (0x1U << TIM_CCMR1_CC2S_Pos)
#define TIM_CCMR1_CC2S_1 (0x2U << TIM_CCMR1_CC2S_Pos)

#define TIM_CCMR1_OC2FE_Pos (10U)
#define TIM_CCMR1_OC2FE_Msk (0x1U << TIM_CCMR1_OC2FE_Pos)
#define TIM_CCMR1_OC2FE TIM_CCMR1_OC2FE_Msk
#define TIM_CCMR1_OC2PE_Pos (11U)
#define TIM_CCMR1_OC2PE_Msk (0x1U << TIM_CCMR1_OC2PE_Pos)
#define TIM_CCMR1_OC2PE TIM_CCMR1_OC2PE_Msk

#define TIM_CCMR1_OC2M_Pos (12U)
#define TIM_CCMR1_OC2M_Msk (0x7U << TIM_CCMR1_OC2M_Pos)
#define TIM_CCMR1_OC2M TIM_CCMR1_OC2M_Msk
#define TIM_CCMR1_OC2M_0 (0x1U << TIM_CCMR1_OC2M_Pos)
#define TIM_CCMR1_OC2M_1 (0x2U << TIM_CCMR1_OC2M_Pos)
#define TIM_CCMR1_OC2M_2 (0x4U << TIM_CCMR1_OC2M_Pos)

#define TIM_CCMR1_OC2CE_Pos (15U)
#define TIM_CCMR1_OC2CE_Msk (0x1U << TIM_CCMR1_OC2CE_Pos)
#define TIM_CCMR1_OC2CE TIM_CCMR1_OC2CE_Msk



#define TIM_CCMR1_IC1PSC_Pos (2U)
#define TIM_CCMR1_IC1PSC_Msk (0x3U << TIM_CCMR1_IC1PSC_Pos)
#define TIM_CCMR1_IC1PSC TIM_CCMR1_IC1PSC_Msk
#define TIM_CCMR1_IC1PSC_0 (0x1U << TIM_CCMR1_IC1PSC_Pos)
#define TIM_CCMR1_IC1PSC_1 (0x2U << TIM_CCMR1_IC1PSC_Pos)

#define TIM_CCMR1_IC1F_Pos (4U)
#define TIM_CCMR1_IC1F_Msk (0xFU << TIM_CCMR1_IC1F_Pos)
#define TIM_CCMR1_IC1F TIM_CCMR1_IC1F_Msk
#define TIM_CCMR1_IC1F_0 (0x1U << TIM_CCMR1_IC1F_Pos)
#define TIM_CCMR1_IC1F_1 (0x2U << TIM_CCMR1_IC1F_Pos)
#define TIM_CCMR1_IC1F_2 (0x4U << TIM_CCMR1_IC1F_Pos)
#define TIM_CCMR1_IC1F_3 (0x8U << TIM_CCMR1_IC1F_Pos)

#define TIM_CCMR1_IC2PSC_Pos (10U)
#define TIM_CCMR1_IC2PSC_Msk (0x3U << TIM_CCMR1_IC2PSC_Pos)
#define TIM_CCMR1_IC2PSC TIM_CCMR1_IC2PSC_Msk
#define TIM_CCMR1_IC2PSC_0 (0x1U << TIM_CCMR1_IC2PSC_Pos)
#define TIM_CCMR1_IC2PSC_1 (0x2U << TIM_CCMR1_IC2PSC_Pos)

#define TIM_CCMR1_IC2F_Pos (12U)
#define TIM_CCMR1_IC2F_Msk (0xFU << TIM_CCMR1_IC2F_Pos)
#define TIM_CCMR1_IC2F TIM_CCMR1_IC2F_Msk
#define TIM_CCMR1_IC2F_0 (0x1U << TIM_CCMR1_IC2F_Pos)
#define TIM_CCMR1_IC2F_1 (0x2U << TIM_CCMR1_IC2F_Pos)
#define TIM_CCMR1_IC2F_2 (0x4U << TIM_CCMR1_IC2F_Pos)
#define TIM_CCMR1_IC2F_3 (0x8U << TIM_CCMR1_IC2F_Pos)


#define TIM_CCMR2_CC3S_Pos (0U)
#define TIM_CCMR2_CC3S_Msk (0x3U << TIM_CCMR2_CC3S_Pos)
#define TIM_CCMR2_CC3S TIM_CCMR2_CC3S_Msk
#define TIM_CCMR2_CC3S_0 (0x1U << TIM_CCMR2_CC3S_Pos)
#define TIM_CCMR2_CC3S_1 (0x2U << TIM_CCMR2_CC3S_Pos)

#define TIM_CCMR2_OC3FE_Pos (2U)
#define TIM_CCMR2_OC3FE_Msk (0x1U << TIM_CCMR2_OC3FE_Pos)
#define TIM_CCMR2_OC3FE TIM_CCMR2_OC3FE_Msk
#define TIM_CCMR2_OC3PE_Pos (3U)
#define TIM_CCMR2_OC3PE_Msk (0x1U << TIM_CCMR2_OC3PE_Pos)
#define TIM_CCMR2_OC3PE TIM_CCMR2_OC3PE_Msk

#define TIM_CCMR2_OC3M_Pos (4U)
#define TIM_CCMR2_OC3M_Msk (0x7U << TIM_CCMR2_OC3M_Pos)
#define TIM_CCMR2_OC3M TIM_CCMR2_OC3M_Msk
#define TIM_CCMR2_OC3M_0 (0x1U << TIM_CCMR2_OC3M_Pos)
#define TIM_CCMR2_OC3M_1 (0x2U << TIM_CCMR2_OC3M_Pos)
#define TIM_CCMR2_OC3M_2 (0x4U << TIM_CCMR2_OC3M_Pos)

#define TIM_CCMR2_OC3CE_Pos (7U)
#define TIM_CCMR2_OC3CE_Msk (0x1U << TIM_CCMR2_OC3CE_Pos)
#define TIM_CCMR2_OC3CE TIM_CCMR2_OC3CE_Msk

#define TIM_CCMR2_CC4S_Pos (8U)
#define TIM_CCMR2_CC4S_Msk (0x3U << TIM_CCMR2_CC4S_Pos)
#define TIM_CCMR2_CC4S TIM_CCMR2_CC4S_Msk
#define TIM_CCMR2_CC4S_0 (0x1U << TIM_CCMR2_CC4S_Pos)
#define TIM_CCMR2_CC4S_1 (0x2U << TIM_CCMR2_CC4S_Pos)

#define TIM_CCMR2_OC4FE_Pos (10U)
#define TIM_CCMR2_OC4FE_Msk (0x1U << TIM_CCMR2_OC4FE_Pos)
#define TIM_CCMR2_OC4FE TIM_CCMR2_OC4FE_Msk
#define TIM_CCMR2_OC4PE_Pos (11U)
#define TIM_CCMR2_OC4PE_Msk (0x1U << TIM_CCMR2_OC4PE_Pos)
#define TIM_CCMR2_OC4PE TIM_CCMR2_OC4PE_Msk

#define TIM_CCMR2_OC4M_Pos (12U)
#define TIM_CCMR2_OC4M_Msk (0x7U << TIM_CCMR2_OC4M_Pos)
#define TIM_CCMR2_OC4M TIM_CCMR2_OC4M_Msk
#define TIM_CCMR2_OC4M_0 (0x1U << TIM_CCMR2_OC4M_Pos)
#define TIM_CCMR2_OC4M_1 (0x2U << TIM_CCMR2_OC4M_Pos)
#define TIM_CCMR2_OC4M_2 (0x4U << TIM_CCMR2_OC4M_Pos)

#define TIM_CCMR2_OC4CE_Pos (15U)
#define TIM_CCMR2_OC4CE_Msk (0x1U << TIM_CCMR2_OC4CE_Pos)
#define TIM_CCMR2_OC4CE TIM_CCMR2_OC4CE_Msk



#define TIM_CCMR2_IC3PSC_Pos (2U)
#define TIM_CCMR2_IC3PSC_Msk (0x3U << TIM_CCMR2_IC3PSC_Pos)
#define TIM_CCMR2_IC3PSC TIM_CCMR2_IC3PSC_Msk
#define TIM_CCMR2_IC3PSC_0 (0x1U << TIM_CCMR2_IC3PSC_Pos)
#define TIM_CCMR2_IC3PSC_1 (0x2U << TIM_CCMR2_IC3PSC_Pos)

#define TIM_CCMR2_IC3F_Pos (4U)
#define TIM_CCMR2_IC3F_Msk (0xFU << TIM_CCMR2_IC3F_Pos)
#define TIM_CCMR2_IC3F TIM_CCMR2_IC3F_Msk
#define TIM_CCMR2_IC3F_0 (0x1U << TIM_CCMR2_IC3F_Pos)
#define TIM_CCMR2_IC3F_1 (0x2U << TIM_CCMR2_IC3F_Pos)
#define TIM_CCMR2_IC3F_2 (0x4U << TIM_CCMR2_IC3F_Pos)
#define TIM_CCMR2_IC3F_3 (0x8U << TIM_CCMR2_IC3F_Pos)

#define TIM_CCMR2_IC4PSC_Pos (10U)
#define TIM_CCMR2_IC4PSC_Msk (0x3U << TIM_CCMR2_IC4PSC_Pos)
#define TIM_CCMR2_IC4PSC TIM_CCMR2_IC4PSC_Msk
#define TIM_CCMR2_IC4PSC_0 (0x1U << TIM_CCMR2_IC4PSC_Pos)
#define TIM_CCMR2_IC4PSC_1 (0x2U << TIM_CCMR2_IC4PSC_Pos)

#define TIM_CCMR2_IC4F_Pos (12U)
#define TIM_CCMR2_IC4F_Msk (0xFU << TIM_CCMR2_IC4F_Pos)
#define TIM_CCMR2_IC4F TIM_CCMR2_IC4F_Msk
#define TIM_CCMR2_IC4F_0 (0x1U << TIM_CCMR2_IC4F_Pos)
#define TIM_CCMR2_IC4F_1 (0x2U << TIM_CCMR2_IC4F_Pos)
#define TIM_CCMR2_IC4F_2 (0x4U << TIM_CCMR2_IC4F_Pos)
#define TIM_CCMR2_IC4F_3 (0x8U << TIM_CCMR2_IC4F_Pos)


#define TIM_CCER_CC1E_Pos (0U)
#define TIM_CCER_CC1E_Msk (0x1U << TIM_CCER_CC1E_Pos)
#define TIM_CCER_CC1E TIM_CCER_CC1E_Msk
#define TIM_CCER_CC1P_Pos (1U)
#define TIM_CCER_CC1P_Msk (0x1U << TIM_CCER_CC1P_Pos)
#define TIM_CCER_CC1P TIM_CCER_CC1P_Msk
#define TIM_CCER_CC1NE_Pos (2U)
#define TIM_CCER_CC1NE_Msk (0x1U << TIM_CCER_CC1NE_Pos)
#define TIM_CCER_CC1NE TIM_CCER_CC1NE_Msk
#define TIM_CCER_CC1NP_Pos (3U)
#define TIM_CCER_CC1NP_Msk (0x1U << TIM_CCER_CC1NP_Pos)
#define TIM_CCER_CC1NP TIM_CCER_CC1NP_Msk
#define TIM_CCER_CC2E_Pos (4U)
#define TIM_CCER_CC2E_Msk (0x1U << TIM_CCER_CC2E_Pos)
#define TIM_CCER_CC2E TIM_CCER_CC2E_Msk
#define TIM_CCER_CC2P_Pos (5U)
#define TIM_CCER_CC2P_Msk (0x1U << TIM_CCER_CC2P_Pos)
#define TIM_CCER_CC2P TIM_CCER_CC2P_Msk
#define TIM_CCER_CC2NE_Pos (6U)
#define TIM_CCER_CC2NE_Msk (0x1U << TIM_CCER_CC2NE_Pos)
#define TIM_CCER_CC2NE TIM_CCER_CC2NE_Msk
#define TIM_CCER_CC2NP_Pos (7U)
#define TIM_CCER_CC2NP_Msk (0x1U << TIM_CCER_CC2NP_Pos)
#define TIM_CCER_CC2NP TIM_CCER_CC2NP_Msk
#define TIM_CCER_CC3E_Pos (8U)
#define TIM_CCER_CC3E_Msk (0x1U << TIM_CCER_CC3E_Pos)
#define TIM_CCER_CC3E TIM_CCER_CC3E_Msk
#define TIM_CCER_CC3P_Pos (9U)
#define TIM_CCER_CC3P_Msk (0x1U << TIM_CCER_CC3P_Pos)
#define TIM_CCER_CC3P TIM_CCER_CC3P_Msk
#define TIM_CCER_CC3NE_Pos (10U)
#define TIM_CCER_CC3NE_Msk (0x1U << TIM_CCER_CC3NE_Pos)
#define TIM_CCER_CC3NE TIM_CCER_CC3NE_Msk
#define TIM_CCER_CC3NP_Pos (11U)
#define TIM_CCER_CC3NP_Msk (0x1U << TIM_CCER_CC3NP_Pos)
#define TIM_CCER_CC3NP TIM_CCER_CC3NP_Msk
#define TIM_CCER_CC4E_Pos (12U)
#define TIM_CCER_CC4E_Msk (0x1U << TIM_CCER_CC4E_Pos)
#define TIM_CCER_CC4E TIM_CCER_CC4E_Msk
#define TIM_CCER_CC4P_Pos (13U)
#define TIM_CCER_CC4P_Msk (0x1U << TIM_CCER_CC4P_Pos)
#define TIM_CCER_CC4P TIM_CCER_CC4P_Msk


#define TIM_CNT_CNT_Pos (0U)
#define TIM_CNT_CNT_Msk (0xFFFFFFFFU << TIM_CNT_CNT_Pos)
#define TIM_CNT_CNT TIM_CNT_CNT_Msk


#define TIM_PSC_PSC_Pos (0U)
#define TIM_PSC_PSC_Msk (0xFFFFU << TIM_PSC_PSC_Pos)
#define TIM_PSC_PSC TIM_PSC_PSC_Msk


#define TIM_ARR_ARR_Pos (0U)
#define TIM_ARR_ARR_Msk (0xFFFFFFFFU << TIM_ARR_ARR_Pos)
#define TIM_ARR_ARR TIM_ARR_ARR_Msk


#define TIM_RCR_REP_Pos (0U)
#define TIM_RCR_REP_Msk (0xFFU << TIM_RCR_REP_Pos)
#define TIM_RCR_REP TIM_RCR_REP_Msk


#define TIM_CCR1_CCR1_Pos (0U)
#define TIM_CCR1_CCR1_Msk (0xFFFFU << TIM_CCR1_CCR1_Pos)
#define TIM_CCR1_CCR1 TIM_CCR1_CCR1_Msk


#define TIM_CCR2_CCR2_Pos (0U)
#define TIM_CCR2_CCR2_Msk (0xFFFFU << TIM_CCR2_CCR2_Pos)
#define TIM_CCR2_CCR2 TIM_CCR2_CCR2_Msk


#define TIM_CCR3_CCR3_Pos (0U)
#define TIM_CCR3_CCR3_Msk (0xFFFFU << TIM_CCR3_CCR3_Pos)
#define TIM_CCR3_CCR3 TIM_CCR3_CCR3_Msk


#define TIM_CCR4_CCR4_Pos (0U)
#define TIM_CCR4_CCR4_Msk (0xFFFFU << TIM_CCR4_CCR4_Pos)
#define TIM_CCR4_CCR4 TIM_CCR4_CCR4_Msk


#define TIM_BDTR_DTG_Pos (0U)
#define TIM_BDTR_DTG_Msk (0xFFU << TIM_BDTR_DTG_Pos)
#define TIM_BDTR_DTG TIM_BDTR_DTG_Msk
#define TIM_BDTR_DTG_0 (0x01U << TIM_BDTR_DTG_Pos)
#define TIM_BDTR_DTG_1 (0x02U << TIM_BDTR_DTG_Pos)
#define TIM_BDTR_DTG_2 (0x04U << TIM_BDTR_DTG_Pos)
#define TIM_BDTR_DTG_3 (0x08U << TIM_BDTR_DTG_Pos)
#define TIM_BDTR_DTG_4 (0x10U << TIM_BDTR_DTG_Pos)
#define TIM_BDTR_DTG_5 (0x20U << TIM_BDTR_DTG_Pos)
#define TIM_BDTR_DTG_6 (0x40U << TIM_BDTR_DTG_Pos)
#define TIM_BDTR_DTG_7 (0x80U << TIM_BDTR_DTG_Pos)

#define TIM_BDTR_LOCK_Pos (8U)
#define TIM_BDTR_LOCK_Msk (0x3U << TIM_BDTR_LOCK_Pos)
#define TIM_BDTR_LOCK TIM_BDTR_LOCK_Msk
#define TIM_BDTR_LOCK_0 (0x1U << TIM_BDTR_LOCK_Pos)
#define TIM_BDTR_LOCK_1 (0x2U << TIM_BDTR_LOCK_Pos)

#define TIM_BDTR_OSSI_Pos (10U)
#define TIM_BDTR_OSSI_Msk (0x1U << TIM_BDTR_OSSI_Pos)
#define TIM_BDTR_OSSI TIM_BDTR_OSSI_Msk
#define TIM_BDTR_OSSR_Pos (11U)
#define TIM_BDTR_OSSR_Msk (0x1U << TIM_BDTR_OSSR_Pos)
#define TIM_BDTR_OSSR TIM_BDTR_OSSR_Msk
#define TIM_BDTR_BKE_Pos (12U)
#define TIM_BDTR_BKE_Msk (0x1U << TIM_BDTR_BKE_Pos)
#define TIM_BDTR_BKE TIM_BDTR_BKE_Msk
#define TIM_BDTR_BKP_Pos (13U)
#define TIM_BDTR_BKP_Msk (0x1U << TIM_BDTR_BKP_Pos)
#define TIM_BDTR_BKP TIM_BDTR_BKP_Msk
#define TIM_BDTR_AOE_Pos (14U)
#define TIM_BDTR_AOE_Msk (0x1U << TIM_BDTR_AOE_Pos)
#define TIM_BDTR_AOE TIM_BDTR_AOE_Msk
#define TIM_BDTR_MOE_Pos (15U)
#define TIM_BDTR_MOE_Msk (0x1U << TIM_BDTR_MOE_Pos)
#define TIM_BDTR_MOE TIM_BDTR_MOE_Msk


#define TIM_DCR_DBA_Pos (0U)
#define TIM_DCR_DBA_Msk (0x1FU << TIM_DCR_DBA_Pos)
#define TIM_DCR_DBA TIM_DCR_DBA_Msk
#define TIM_DCR_DBA_0 (0x01U << TIM_DCR_DBA_Pos)
#define TIM_DCR_DBA_1 (0x02U << TIM_DCR_DBA_Pos)
#define TIM_DCR_DBA_2 (0x04U << TIM_DCR_DBA_Pos)
#define TIM_DCR_DBA_3 (0x08U << TIM_DCR_DBA_Pos)
#define TIM_DCR_DBA_4 (0x10U << TIM_DCR_DBA_Pos)

#define TIM_DCR_DBL_Pos (8U)
#define TIM_DCR_DBL_Msk (0x1FU << TIM_DCR_DBL_Pos)
#define TIM_DCR_DBL TIM_DCR_DBL_Msk
#define TIM_DCR_DBL_0 (0x01U << TIM_DCR_DBL_Pos)
#define TIM_DCR_DBL_1 (0x02U << TIM_DCR_DBL_Pos)
#define TIM_DCR_DBL_2 (0x04U << TIM_DCR_DBL_Pos)
#define TIM_DCR_DBL_3 (0x08U << TIM_DCR_DBL_Pos)
#define TIM_DCR_DBL_4 (0x10U << TIM_DCR_DBL_Pos)


#define TIM_DMAR_DMAB_Pos (0U)
#define TIM_DMAR_DMAB_Msk (0xFFFFU << TIM_DMAR_DMAB_Pos)
#define TIM_DMAR_DMAB TIM_DMAR_DMAB_Msk
# 4390 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define RTC_CRH_SECIE_Pos (0U)
#define RTC_CRH_SECIE_Msk (0x1U << RTC_CRH_SECIE_Pos)
#define RTC_CRH_SECIE RTC_CRH_SECIE_Msk
#define RTC_CRH_ALRIE_Pos (1U)
#define RTC_CRH_ALRIE_Msk (0x1U << RTC_CRH_ALRIE_Pos)
#define RTC_CRH_ALRIE RTC_CRH_ALRIE_Msk
#define RTC_CRH_OWIE_Pos (2U)
#define RTC_CRH_OWIE_Msk (0x1U << RTC_CRH_OWIE_Pos)
#define RTC_CRH_OWIE RTC_CRH_OWIE_Msk


#define RTC_CRL_SECF_Pos (0U)
#define RTC_CRL_SECF_Msk (0x1U << RTC_CRL_SECF_Pos)
#define RTC_CRL_SECF RTC_CRL_SECF_Msk
#define RTC_CRL_ALRF_Pos (1U)
#define RTC_CRL_ALRF_Msk (0x1U << RTC_CRL_ALRF_Pos)
#define RTC_CRL_ALRF RTC_CRL_ALRF_Msk
#define RTC_CRL_OWF_Pos (2U)
#define RTC_CRL_OWF_Msk (0x1U << RTC_CRL_OWF_Pos)
#define RTC_CRL_OWF RTC_CRL_OWF_Msk
#define RTC_CRL_RSF_Pos (3U)
#define RTC_CRL_RSF_Msk (0x1U << RTC_CRL_RSF_Pos)
#define RTC_CRL_RSF RTC_CRL_RSF_Msk
#define RTC_CRL_CNF_Pos (4U)
#define RTC_CRL_CNF_Msk (0x1U << RTC_CRL_CNF_Pos)
#define RTC_CRL_CNF RTC_CRL_CNF_Msk
#define RTC_CRL_RTOFF_Pos (5U)
#define RTC_CRL_RTOFF_Msk (0x1U << RTC_CRL_RTOFF_Pos)
#define RTC_CRL_RTOFF RTC_CRL_RTOFF_Msk


#define RTC_PRLH_PRL_Pos (0U)
#define RTC_PRLH_PRL_Msk (0xFU << RTC_PRLH_PRL_Pos)
#define RTC_PRLH_PRL RTC_PRLH_PRL_Msk


#define RTC_PRLL_PRL_Pos (0U)
#define RTC_PRLL_PRL_Msk (0xFFFFU << RTC_PRLL_PRL_Pos)
#define RTC_PRLL_PRL RTC_PRLL_PRL_Msk


#define RTC_DIVH_RTC_DIV_Pos (0U)
#define RTC_DIVH_RTC_DIV_Msk (0xFU << RTC_DIVH_RTC_DIV_Pos)
#define RTC_DIVH_RTC_DIV RTC_DIVH_RTC_DIV_Msk


#define RTC_DIVL_RTC_DIV_Pos (0U)
#define RTC_DIVL_RTC_DIV_Msk (0xFFFFU << RTC_DIVL_RTC_DIV_Pos)
#define RTC_DIVL_RTC_DIV RTC_DIVL_RTC_DIV_Msk


#define RTC_CNTH_RTC_CNT_Pos (0U)
#define RTC_CNTH_RTC_CNT_Msk (0xFFFFU << RTC_CNTH_RTC_CNT_Pos)
#define RTC_CNTH_RTC_CNT RTC_CNTH_RTC_CNT_Msk


#define RTC_CNTL_RTC_CNT_Pos (0U)
#define RTC_CNTL_RTC_CNT_Msk (0xFFFFU << RTC_CNTL_RTC_CNT_Pos)
#define RTC_CNTL_RTC_CNT RTC_CNTL_RTC_CNT_Msk


#define RTC_ALRH_RTC_ALR_Pos (0U)
#define RTC_ALRH_RTC_ALR_Msk (0xFFFFU << RTC_ALRH_RTC_ALR_Pos)
#define RTC_ALRH_RTC_ALR RTC_ALRH_RTC_ALR_Msk


#define RTC_ALRL_RTC_ALR_Pos (0U)
#define RTC_ALRL_RTC_ALR_Msk (0xFFFFU << RTC_ALRL_RTC_ALR_Pos)
#define RTC_ALRL_RTC_ALR RTC_ALRL_RTC_ALR_Msk
# 4467 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define IWDG_KR_KEY_Pos (0U)
#define IWDG_KR_KEY_Msk (0xFFFFU << IWDG_KR_KEY_Pos)
#define IWDG_KR_KEY IWDG_KR_KEY_Msk


#define IWDG_PR_PR_Pos (0U)
#define IWDG_PR_PR_Msk (0x7U << IWDG_PR_PR_Pos)
#define IWDG_PR_PR IWDG_PR_PR_Msk
#define IWDG_PR_PR_0 (0x1U << IWDG_PR_PR_Pos)
#define IWDG_PR_PR_1 (0x2U << IWDG_PR_PR_Pos)
#define IWDG_PR_PR_2 (0x4U << IWDG_PR_PR_Pos)


#define IWDG_RLR_RL_Pos (0U)
#define IWDG_RLR_RL_Msk (0xFFFU << IWDG_RLR_RL_Pos)
#define IWDG_RLR_RL IWDG_RLR_RL_Msk


#define IWDG_SR_PVU_Pos (0U)
#define IWDG_SR_PVU_Msk (0x1U << IWDG_SR_PVU_Pos)
#define IWDG_SR_PVU IWDG_SR_PVU_Msk
#define IWDG_SR_RVU_Pos (1U)
#define IWDG_SR_RVU_Msk (0x1U << IWDG_SR_RVU_Pos)
#define IWDG_SR_RVU IWDG_SR_RVU_Msk
# 4499 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define WWDG_CR_T_Pos (0U)
#define WWDG_CR_T_Msk (0x7FU << WWDG_CR_T_Pos)
#define WWDG_CR_T WWDG_CR_T_Msk
#define WWDG_CR_T_0 (0x01U << WWDG_CR_T_Pos)
#define WWDG_CR_T_1 (0x02U << WWDG_CR_T_Pos)
#define WWDG_CR_T_2 (0x04U << WWDG_CR_T_Pos)
#define WWDG_CR_T_3 (0x08U << WWDG_CR_T_Pos)
#define WWDG_CR_T_4 (0x10U << WWDG_CR_T_Pos)
#define WWDG_CR_T_5 (0x20U << WWDG_CR_T_Pos)
#define WWDG_CR_T_6 (0x40U << WWDG_CR_T_Pos)


#define WWDG_CR_T0 WWDG_CR_T_0
#define WWDG_CR_T1 WWDG_CR_T_1
#define WWDG_CR_T2 WWDG_CR_T_2
#define WWDG_CR_T3 WWDG_CR_T_3
#define WWDG_CR_T4 WWDG_CR_T_4
#define WWDG_CR_T5 WWDG_CR_T_5
#define WWDG_CR_T6 WWDG_CR_T_6

#define WWDG_CR_WDGA_Pos (7U)
#define WWDG_CR_WDGA_Msk (0x1U << WWDG_CR_WDGA_Pos)
#define WWDG_CR_WDGA WWDG_CR_WDGA_Msk


#define WWDG_CFR_W_Pos (0U)
#define WWDG_CFR_W_Msk (0x7FU << WWDG_CFR_W_Pos)
#define WWDG_CFR_W WWDG_CFR_W_Msk
#define WWDG_CFR_W_0 (0x01U << WWDG_CFR_W_Pos)
#define WWDG_CFR_W_1 (0x02U << WWDG_CFR_W_Pos)
#define WWDG_CFR_W_2 (0x04U << WWDG_CFR_W_Pos)
#define WWDG_CFR_W_3 (0x08U << WWDG_CFR_W_Pos)
#define WWDG_CFR_W_4 (0x10U << WWDG_CFR_W_Pos)
#define WWDG_CFR_W_5 (0x20U << WWDG_CFR_W_Pos)
#define WWDG_CFR_W_6 (0x40U << WWDG_CFR_W_Pos)


#define WWDG_CFR_W0 WWDG_CFR_W_0
#define WWDG_CFR_W1 WWDG_CFR_W_1
#define WWDG_CFR_W2 WWDG_CFR_W_2
#define WWDG_CFR_W3 WWDG_CFR_W_3
#define WWDG_CFR_W4 WWDG_CFR_W_4
#define WWDG_CFR_W5 WWDG_CFR_W_5
#define WWDG_CFR_W6 WWDG_CFR_W_6

#define WWDG_CFR_WDGTB_Pos (7U)
#define WWDG_CFR_WDGTB_Msk (0x3U << WWDG_CFR_WDGTB_Pos)
#define WWDG_CFR_WDGTB WWDG_CFR_WDGTB_Msk
#define WWDG_CFR_WDGTB_0 (0x1U << WWDG_CFR_WDGTB_Pos)
#define WWDG_CFR_WDGTB_1 (0x2U << WWDG_CFR_WDGTB_Pos)


#define WWDG_CFR_WDGTB0 WWDG_CFR_WDGTB_0
#define WWDG_CFR_WDGTB1 WWDG_CFR_WDGTB_1

#define WWDG_CFR_EWI_Pos (9U)
#define WWDG_CFR_EWI_Msk (0x1U << WWDG_CFR_EWI_Pos)
#define WWDG_CFR_EWI WWDG_CFR_EWI_Msk


#define WWDG_SR_EWIF_Pos (0U)
#define WWDG_SR_EWIF_Msk (0x1U << WWDG_SR_EWIF_Pos)
#define WWDG_SR_EWIF WWDG_SR_EWIF_Msk
# 4571 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define SDIO_POWER_PWRCTRL_Pos (0U)
#define SDIO_POWER_PWRCTRL_Msk (0x3U << SDIO_POWER_PWRCTRL_Pos)
#define SDIO_POWER_PWRCTRL SDIO_POWER_PWRCTRL_Msk
#define SDIO_POWER_PWRCTRL_0 (0x1U << SDIO_POWER_PWRCTRL_Pos)
#define SDIO_POWER_PWRCTRL_1 (0x2U << SDIO_POWER_PWRCTRL_Pos)


#define SDIO_CLKCR_CLKDIV_Pos (0U)
#define SDIO_CLKCR_CLKDIV_Msk (0xFFU << SDIO_CLKCR_CLKDIV_Pos)
#define SDIO_CLKCR_CLKDIV SDIO_CLKCR_CLKDIV_Msk
#define SDIO_CLKCR_CLKEN_Pos (8U)
#define SDIO_CLKCR_CLKEN_Msk (0x1U << SDIO_CLKCR_CLKEN_Pos)
#define SDIO_CLKCR_CLKEN SDIO_CLKCR_CLKEN_Msk
#define SDIO_CLKCR_PWRSAV_Pos (9U)
#define SDIO_CLKCR_PWRSAV_Msk (0x1U << SDIO_CLKCR_PWRSAV_Pos)
#define SDIO_CLKCR_PWRSAV SDIO_CLKCR_PWRSAV_Msk
#define SDIO_CLKCR_BYPASS_Pos (10U)
#define SDIO_CLKCR_BYPASS_Msk (0x1U << SDIO_CLKCR_BYPASS_Pos)
#define SDIO_CLKCR_BYPASS SDIO_CLKCR_BYPASS_Msk

#define SDIO_CLKCR_WIDBUS_Pos (11U)
#define SDIO_CLKCR_WIDBUS_Msk (0x3U << SDIO_CLKCR_WIDBUS_Pos)
#define SDIO_CLKCR_WIDBUS SDIO_CLKCR_WIDBUS_Msk
#define SDIO_CLKCR_WIDBUS_0 (0x1U << SDIO_CLKCR_WIDBUS_Pos)
#define SDIO_CLKCR_WIDBUS_1 (0x2U << SDIO_CLKCR_WIDBUS_Pos)

#define SDIO_CLKCR_NEGEDGE_Pos (13U)
#define SDIO_CLKCR_NEGEDGE_Msk (0x1U << SDIO_CLKCR_NEGEDGE_Pos)
#define SDIO_CLKCR_NEGEDGE SDIO_CLKCR_NEGEDGE_Msk
#define SDIO_CLKCR_HWFC_EN_Pos (14U)
#define SDIO_CLKCR_HWFC_EN_Msk (0x1U << SDIO_CLKCR_HWFC_EN_Pos)
#define SDIO_CLKCR_HWFC_EN SDIO_CLKCR_HWFC_EN_Msk


#define SDIO_ARG_CMDARG_Pos (0U)
#define SDIO_ARG_CMDARG_Msk (0xFFFFFFFFU << SDIO_ARG_CMDARG_Pos)
#define SDIO_ARG_CMDARG SDIO_ARG_CMDARG_Msk


#define SDIO_CMD_CMDINDEX_Pos (0U)
#define SDIO_CMD_CMDINDEX_Msk (0x3FU << SDIO_CMD_CMDINDEX_Pos)
#define SDIO_CMD_CMDINDEX SDIO_CMD_CMDINDEX_Msk

#define SDIO_CMD_WAITRESP_Pos (6U)
#define SDIO_CMD_WAITRESP_Msk (0x3U << SDIO_CMD_WAITRESP_Pos)
#define SDIO_CMD_WAITRESP SDIO_CMD_WAITRESP_Msk
#define SDIO_CMD_WAITRESP_0 (0x1U << SDIO_CMD_WAITRESP_Pos)
#define SDIO_CMD_WAITRESP_1 (0x2U << SDIO_CMD_WAITRESP_Pos)

#define SDIO_CMD_WAITINT_Pos (8U)
#define SDIO_CMD_WAITINT_Msk (0x1U << SDIO_CMD_WAITINT_Pos)
#define SDIO_CMD_WAITINT SDIO_CMD_WAITINT_Msk
#define SDIO_CMD_WAITPEND_Pos (9U)
#define SDIO_CMD_WAITPEND_Msk (0x1U << SDIO_CMD_WAITPEND_Pos)
#define SDIO_CMD_WAITPEND SDIO_CMD_WAITPEND_Msk
#define SDIO_CMD_CPSMEN_Pos (10U)
#define SDIO_CMD_CPSMEN_Msk (0x1U << SDIO_CMD_CPSMEN_Pos)
#define SDIO_CMD_CPSMEN SDIO_CMD_CPSMEN_Msk
#define SDIO_CMD_SDIOSUSPEND_Pos (11U)
#define SDIO_CMD_SDIOSUSPEND_Msk (0x1U << SDIO_CMD_SDIOSUSPEND_Pos)
#define SDIO_CMD_SDIOSUSPEND SDIO_CMD_SDIOSUSPEND_Msk
#define SDIO_CMD_ENCMDCOMPL_Pos (12U)
#define SDIO_CMD_ENCMDCOMPL_Msk (0x1U << SDIO_CMD_ENCMDCOMPL_Pos)
#define SDIO_CMD_ENCMDCOMPL SDIO_CMD_ENCMDCOMPL_Msk
#define SDIO_CMD_NIEN_Pos (13U)
#define SDIO_CMD_NIEN_Msk (0x1U << SDIO_CMD_NIEN_Pos)
#define SDIO_CMD_NIEN SDIO_CMD_NIEN_Msk
#define SDIO_CMD_CEATACMD_Pos (14U)
#define SDIO_CMD_CEATACMD_Msk (0x1U << SDIO_CMD_CEATACMD_Pos)
#define SDIO_CMD_CEATACMD SDIO_CMD_CEATACMD_Msk


#define SDIO_RESPCMD_RESPCMD_Pos (0U)
#define SDIO_RESPCMD_RESPCMD_Msk (0x3FU << SDIO_RESPCMD_RESPCMD_Pos)
#define SDIO_RESPCMD_RESPCMD SDIO_RESPCMD_RESPCMD_Msk


#define SDIO_RESP0_CARDSTATUS0_Pos (0U)
#define SDIO_RESP0_CARDSTATUS0_Msk (0xFFFFFFFFU << SDIO_RESP0_CARDSTATUS0_Pos)
#define SDIO_RESP0_CARDSTATUS0 SDIO_RESP0_CARDSTATUS0_Msk


#define SDIO_RESP1_CARDSTATUS1_Pos (0U)
#define SDIO_RESP1_CARDSTATUS1_Msk (0xFFFFFFFFU << SDIO_RESP1_CARDSTATUS1_Pos)
#define SDIO_RESP1_CARDSTATUS1 SDIO_RESP1_CARDSTATUS1_Msk


#define SDIO_RESP2_CARDSTATUS2_Pos (0U)
#define SDIO_RESP2_CARDSTATUS2_Msk (0xFFFFFFFFU << SDIO_RESP2_CARDSTATUS2_Pos)
#define SDIO_RESP2_CARDSTATUS2 SDIO_RESP2_CARDSTATUS2_Msk


#define SDIO_RESP3_CARDSTATUS3_Pos (0U)
#define SDIO_RESP3_CARDSTATUS3_Msk (0xFFFFFFFFU << SDIO_RESP3_CARDSTATUS3_Pos)
#define SDIO_RESP3_CARDSTATUS3 SDIO_RESP3_CARDSTATUS3_Msk


#define SDIO_RESP4_CARDSTATUS4_Pos (0U)
#define SDIO_RESP4_CARDSTATUS4_Msk (0xFFFFFFFFU << SDIO_RESP4_CARDSTATUS4_Pos)
#define SDIO_RESP4_CARDSTATUS4 SDIO_RESP4_CARDSTATUS4_Msk


#define SDIO_DTIMER_DATATIME_Pos (0U)
#define SDIO_DTIMER_DATATIME_Msk (0xFFFFFFFFU << SDIO_DTIMER_DATATIME_Pos)
#define SDIO_DTIMER_DATATIME SDIO_DTIMER_DATATIME_Msk


#define SDIO_DLEN_DATALENGTH_Pos (0U)
#define SDIO_DLEN_DATALENGTH_Msk (0x1FFFFFFU << SDIO_DLEN_DATALENGTH_Pos)
#define SDIO_DLEN_DATALENGTH SDIO_DLEN_DATALENGTH_Msk


#define SDIO_DCTRL_DTEN_Pos (0U)
#define SDIO_DCTRL_DTEN_Msk (0x1U << SDIO_DCTRL_DTEN_Pos)
#define SDIO_DCTRL_DTEN SDIO_DCTRL_DTEN_Msk
#define SDIO_DCTRL_DTDIR_Pos (1U)
#define SDIO_DCTRL_DTDIR_Msk (0x1U << SDIO_DCTRL_DTDIR_Pos)
#define SDIO_DCTRL_DTDIR SDIO_DCTRL_DTDIR_Msk
#define SDIO_DCTRL_DTMODE_Pos (2U)
#define SDIO_DCTRL_DTMODE_Msk (0x1U << SDIO_DCTRL_DTMODE_Pos)
#define SDIO_DCTRL_DTMODE SDIO_DCTRL_DTMODE_Msk
#define SDIO_DCTRL_DMAEN_Pos (3U)
#define SDIO_DCTRL_DMAEN_Msk (0x1U << SDIO_DCTRL_DMAEN_Pos)
#define SDIO_DCTRL_DMAEN SDIO_DCTRL_DMAEN_Msk

#define SDIO_DCTRL_DBLOCKSIZE_Pos (4U)
#define SDIO_DCTRL_DBLOCKSIZE_Msk (0xFU << SDIO_DCTRL_DBLOCKSIZE_Pos)
#define SDIO_DCTRL_DBLOCKSIZE SDIO_DCTRL_DBLOCKSIZE_Msk
#define SDIO_DCTRL_DBLOCKSIZE_0 (0x1U << SDIO_DCTRL_DBLOCKSIZE_Pos)
#define SDIO_DCTRL_DBLOCKSIZE_1 (0x2U << SDIO_DCTRL_DBLOCKSIZE_Pos)
#define SDIO_DCTRL_DBLOCKSIZE_2 (0x4U << SDIO_DCTRL_DBLOCKSIZE_Pos)
#define SDIO_DCTRL_DBLOCKSIZE_3 (0x8U << SDIO_DCTRL_DBLOCKSIZE_Pos)

#define SDIO_DCTRL_RWSTART_Pos (8U)
#define SDIO_DCTRL_RWSTART_Msk (0x1U << SDIO_DCTRL_RWSTART_Pos)
#define SDIO_DCTRL_RWSTART SDIO_DCTRL_RWSTART_Msk
#define SDIO_DCTRL_RWSTOP_Pos (9U)
#define SDIO_DCTRL_RWSTOP_Msk (0x1U << SDIO_DCTRL_RWSTOP_Pos)
#define SDIO_DCTRL_RWSTOP SDIO_DCTRL_RWSTOP_Msk
#define SDIO_DCTRL_RWMOD_Pos (10U)
#define SDIO_DCTRL_RWMOD_Msk (0x1U << SDIO_DCTRL_RWMOD_Pos)
#define SDIO_DCTRL_RWMOD SDIO_DCTRL_RWMOD_Msk
#define SDIO_DCTRL_SDIOEN_Pos (11U)
#define SDIO_DCTRL_SDIOEN_Msk (0x1U << SDIO_DCTRL_SDIOEN_Pos)
#define SDIO_DCTRL_SDIOEN SDIO_DCTRL_SDIOEN_Msk


#define SDIO_DCOUNT_DATACOUNT_Pos (0U)
#define SDIO_DCOUNT_DATACOUNT_Msk (0x1FFFFFFU << SDIO_DCOUNT_DATACOUNT_Pos)
#define SDIO_DCOUNT_DATACOUNT SDIO_DCOUNT_DATACOUNT_Msk


#define SDIO_STA_CCRCFAIL_Pos (0U)
#define SDIO_STA_CCRCFAIL_Msk (0x1U << SDIO_STA_CCRCFAIL_Pos)
#define SDIO_STA_CCRCFAIL SDIO_STA_CCRCFAIL_Msk
#define SDIO_STA_DCRCFAIL_Pos (1U)
#define SDIO_STA_DCRCFAIL_Msk (0x1U << SDIO_STA_DCRCFAIL_Pos)
#define SDIO_STA_DCRCFAIL SDIO_STA_DCRCFAIL_Msk
#define SDIO_STA_CTIMEOUT_Pos (2U)
#define SDIO_STA_CTIMEOUT_Msk (0x1U << SDIO_STA_CTIMEOUT_Pos)
#define SDIO_STA_CTIMEOUT SDIO_STA_CTIMEOUT_Msk
#define SDIO_STA_DTIMEOUT_Pos (3U)
#define SDIO_STA_DTIMEOUT_Msk (0x1U << SDIO_STA_DTIMEOUT_Pos)
#define SDIO_STA_DTIMEOUT SDIO_STA_DTIMEOUT_Msk
#define SDIO_STA_TXUNDERR_Pos (4U)
#define SDIO_STA_TXUNDERR_Msk (0x1U << SDIO_STA_TXUNDERR_Pos)
#define SDIO_STA_TXUNDERR SDIO_STA_TXUNDERR_Msk
#define SDIO_STA_RXOVERR_Pos (5U)
#define SDIO_STA_RXOVERR_Msk (0x1U << SDIO_STA_RXOVERR_Pos)
#define SDIO_STA_RXOVERR SDIO_STA_RXOVERR_Msk
#define SDIO_STA_CMDREND_Pos (6U)
#define SDIO_STA_CMDREND_Msk (0x1U << SDIO_STA_CMDREND_Pos)
#define SDIO_STA_CMDREND SDIO_STA_CMDREND_Msk
#define SDIO_STA_CMDSENT_Pos (7U)
#define SDIO_STA_CMDSENT_Msk (0x1U << SDIO_STA_CMDSENT_Pos)
#define SDIO_STA_CMDSENT SDIO_STA_CMDSENT_Msk
#define SDIO_STA_DATAEND_Pos (8U)
#define SDIO_STA_DATAEND_Msk (0x1U << SDIO_STA_DATAEND_Pos)
#define SDIO_STA_DATAEND SDIO_STA_DATAEND_Msk
#define SDIO_STA_STBITERR_Pos (9U)
#define SDIO_STA_STBITERR_Msk (0x1U << SDIO_STA_STBITERR_Pos)
#define SDIO_STA_STBITERR SDIO_STA_STBITERR_Msk
#define SDIO_STA_DBCKEND_Pos (10U)
#define SDIO_STA_DBCKEND_Msk (0x1U << SDIO_STA_DBCKEND_Pos)
#define SDIO_STA_DBCKEND SDIO_STA_DBCKEND_Msk
#define SDIO_STA_CMDACT_Pos (11U)
#define SDIO_STA_CMDACT_Msk (0x1U << SDIO_STA_CMDACT_Pos)
#define SDIO_STA_CMDACT SDIO_STA_CMDACT_Msk
#define SDIO_STA_TXACT_Pos (12U)
#define SDIO_STA_TXACT_Msk (0x1U << SDIO_STA_TXACT_Pos)
#define SDIO_STA_TXACT SDIO_STA_TXACT_Msk
#define SDIO_STA_RXACT_Pos (13U)
#define SDIO_STA_RXACT_Msk (0x1U << SDIO_STA_RXACT_Pos)
#define SDIO_STA_RXACT SDIO_STA_RXACT_Msk
#define SDIO_STA_TXFIFOHE_Pos (14U)
#define SDIO_STA_TXFIFOHE_Msk (0x1U << SDIO_STA_TXFIFOHE_Pos)
#define SDIO_STA_TXFIFOHE SDIO_STA_TXFIFOHE_Msk
#define SDIO_STA_RXFIFOHF_Pos (15U)
#define SDIO_STA_RXFIFOHF_Msk (0x1U << SDIO_STA_RXFIFOHF_Pos)
#define SDIO_STA_RXFIFOHF SDIO_STA_RXFIFOHF_Msk
#define SDIO_STA_TXFIFOF_Pos (16U)
#define SDIO_STA_TXFIFOF_Msk (0x1U << SDIO_STA_TXFIFOF_Pos)
#define SDIO_STA_TXFIFOF SDIO_STA_TXFIFOF_Msk
#define SDIO_STA_RXFIFOF_Pos (17U)
#define SDIO_STA_RXFIFOF_Msk (0x1U << SDIO_STA_RXFIFOF_Pos)
#define SDIO_STA_RXFIFOF SDIO_STA_RXFIFOF_Msk
#define SDIO_STA_TXFIFOE_Pos (18U)
#define SDIO_STA_TXFIFOE_Msk (0x1U << SDIO_STA_TXFIFOE_Pos)
#define SDIO_STA_TXFIFOE SDIO_STA_TXFIFOE_Msk
#define SDIO_STA_RXFIFOE_Pos (19U)
#define SDIO_STA_RXFIFOE_Msk (0x1U << SDIO_STA_RXFIFOE_Pos)
#define SDIO_STA_RXFIFOE SDIO_STA_RXFIFOE_Msk
#define SDIO_STA_TXDAVL_Pos (20U)
#define SDIO_STA_TXDAVL_Msk (0x1U << SDIO_STA_TXDAVL_Pos)
#define SDIO_STA_TXDAVL SDIO_STA_TXDAVL_Msk
#define SDIO_STA_RXDAVL_Pos (21U)
#define SDIO_STA_RXDAVL_Msk (0x1U << SDIO_STA_RXDAVL_Pos)
#define SDIO_STA_RXDAVL SDIO_STA_RXDAVL_Msk
#define SDIO_STA_SDIOIT_Pos (22U)
#define SDIO_STA_SDIOIT_Msk (0x1U << SDIO_STA_SDIOIT_Pos)
#define SDIO_STA_SDIOIT SDIO_STA_SDIOIT_Msk
#define SDIO_STA_CEATAEND_Pos (23U)
#define SDIO_STA_CEATAEND_Msk (0x1U << SDIO_STA_CEATAEND_Pos)
#define SDIO_STA_CEATAEND SDIO_STA_CEATAEND_Msk


#define SDIO_ICR_CCRCFAILC_Pos (0U)
#define SDIO_ICR_CCRCFAILC_Msk (0x1U << SDIO_ICR_CCRCFAILC_Pos)
#define SDIO_ICR_CCRCFAILC SDIO_ICR_CCRCFAILC_Msk
#define SDIO_ICR_DCRCFAILC_Pos (1U)
#define SDIO_ICR_DCRCFAILC_Msk (0x1U << SDIO_ICR_DCRCFAILC_Pos)
#define SDIO_ICR_DCRCFAILC SDIO_ICR_DCRCFAILC_Msk
#define SDIO_ICR_CTIMEOUTC_Pos (2U)
#define SDIO_ICR_CTIMEOUTC_Msk (0x1U << SDIO_ICR_CTIMEOUTC_Pos)
#define SDIO_ICR_CTIMEOUTC SDIO_ICR_CTIMEOUTC_Msk
#define SDIO_ICR_DTIMEOUTC_Pos (3U)
#define SDIO_ICR_DTIMEOUTC_Msk (0x1U << SDIO_ICR_DTIMEOUTC_Pos)
#define SDIO_ICR_DTIMEOUTC SDIO_ICR_DTIMEOUTC_Msk
#define SDIO_ICR_TXUNDERRC_Pos (4U)
#define SDIO_ICR_TXUNDERRC_Msk (0x1U << SDIO_ICR_TXUNDERRC_Pos)
#define SDIO_ICR_TXUNDERRC SDIO_ICR_TXUNDERRC_Msk
#define SDIO_ICR_RXOVERRC_Pos (5U)
#define SDIO_ICR_RXOVERRC_Msk (0x1U << SDIO_ICR_RXOVERRC_Pos)
#define SDIO_ICR_RXOVERRC SDIO_ICR_RXOVERRC_Msk
#define SDIO_ICR_CMDRENDC_Pos (6U)
#define SDIO_ICR_CMDRENDC_Msk (0x1U << SDIO_ICR_CMDRENDC_Pos)
#define SDIO_ICR_CMDRENDC SDIO_ICR_CMDRENDC_Msk
#define SDIO_ICR_CMDSENTC_Pos (7U)
#define SDIO_ICR_CMDSENTC_Msk (0x1U << SDIO_ICR_CMDSENTC_Pos)
#define SDIO_ICR_CMDSENTC SDIO_ICR_CMDSENTC_Msk
#define SDIO_ICR_DATAENDC_Pos (8U)
#define SDIO_ICR_DATAENDC_Msk (0x1U << SDIO_ICR_DATAENDC_Pos)
#define SDIO_ICR_DATAENDC SDIO_ICR_DATAENDC_Msk
#define SDIO_ICR_STBITERRC_Pos (9U)
#define SDIO_ICR_STBITERRC_Msk (0x1U << SDIO_ICR_STBITERRC_Pos)
#define SDIO_ICR_STBITERRC SDIO_ICR_STBITERRC_Msk
#define SDIO_ICR_DBCKENDC_Pos (10U)
#define SDIO_ICR_DBCKENDC_Msk (0x1U << SDIO_ICR_DBCKENDC_Pos)
#define SDIO_ICR_DBCKENDC SDIO_ICR_DBCKENDC_Msk
#define SDIO_ICR_SDIOITC_Pos (22U)
#define SDIO_ICR_SDIOITC_Msk (0x1U << SDIO_ICR_SDIOITC_Pos)
#define SDIO_ICR_SDIOITC SDIO_ICR_SDIOITC_Msk
#define SDIO_ICR_CEATAENDC_Pos (23U)
#define SDIO_ICR_CEATAENDC_Msk (0x1U << SDIO_ICR_CEATAENDC_Pos)
#define SDIO_ICR_CEATAENDC SDIO_ICR_CEATAENDC_Msk


#define SDIO_MASK_CCRCFAILIE_Pos (0U)
#define SDIO_MASK_CCRCFAILIE_Msk (0x1U << SDIO_MASK_CCRCFAILIE_Pos)
#define SDIO_MASK_CCRCFAILIE SDIO_MASK_CCRCFAILIE_Msk
#define SDIO_MASK_DCRCFAILIE_Pos (1U)
#define SDIO_MASK_DCRCFAILIE_Msk (0x1U << SDIO_MASK_DCRCFAILIE_Pos)
#define SDIO_MASK_DCRCFAILIE SDIO_MASK_DCRCFAILIE_Msk
#define SDIO_MASK_CTIMEOUTIE_Pos (2U)
#define SDIO_MASK_CTIMEOUTIE_Msk (0x1U << SDIO_MASK_CTIMEOUTIE_Pos)
#define SDIO_MASK_CTIMEOUTIE SDIO_MASK_CTIMEOUTIE_Msk
#define SDIO_MASK_DTIMEOUTIE_Pos (3U)
#define SDIO_MASK_DTIMEOUTIE_Msk (0x1U << SDIO_MASK_DTIMEOUTIE_Pos)
#define SDIO_MASK_DTIMEOUTIE SDIO_MASK_DTIMEOUTIE_Msk
#define SDIO_MASK_TXUNDERRIE_Pos (4U)
#define SDIO_MASK_TXUNDERRIE_Msk (0x1U << SDIO_MASK_TXUNDERRIE_Pos)
#define SDIO_MASK_TXUNDERRIE SDIO_MASK_TXUNDERRIE_Msk
#define SDIO_MASK_RXOVERRIE_Pos (5U)
#define SDIO_MASK_RXOVERRIE_Msk (0x1U << SDIO_MASK_RXOVERRIE_Pos)
#define SDIO_MASK_RXOVERRIE SDIO_MASK_RXOVERRIE_Msk
#define SDIO_MASK_CMDRENDIE_Pos (6U)
#define SDIO_MASK_CMDRENDIE_Msk (0x1U << SDIO_MASK_CMDRENDIE_Pos)
#define SDIO_MASK_CMDRENDIE SDIO_MASK_CMDRENDIE_Msk
#define SDIO_MASK_CMDSENTIE_Pos (7U)
#define SDIO_MASK_CMDSENTIE_Msk (0x1U << SDIO_MASK_CMDSENTIE_Pos)
#define SDIO_MASK_CMDSENTIE SDIO_MASK_CMDSENTIE_Msk
#define SDIO_MASK_DATAENDIE_Pos (8U)
#define SDIO_MASK_DATAENDIE_Msk (0x1U << SDIO_MASK_DATAENDIE_Pos)
#define SDIO_MASK_DATAENDIE SDIO_MASK_DATAENDIE_Msk
#define SDIO_MASK_STBITERRIE_Pos (9U)
#define SDIO_MASK_STBITERRIE_Msk (0x1U << SDIO_MASK_STBITERRIE_Pos)
#define SDIO_MASK_STBITERRIE SDIO_MASK_STBITERRIE_Msk
#define SDIO_MASK_DBCKENDIE_Pos (10U)
#define SDIO_MASK_DBCKENDIE_Msk (0x1U << SDIO_MASK_DBCKENDIE_Pos)
#define SDIO_MASK_DBCKENDIE SDIO_MASK_DBCKENDIE_Msk
#define SDIO_MASK_CMDACTIE_Pos (11U)
#define SDIO_MASK_CMDACTIE_Msk (0x1U << SDIO_MASK_CMDACTIE_Pos)
#define SDIO_MASK_CMDACTIE SDIO_MASK_CMDACTIE_Msk
#define SDIO_MASK_TXACTIE_Pos (12U)
#define SDIO_MASK_TXACTIE_Msk (0x1U << SDIO_MASK_TXACTIE_Pos)
#define SDIO_MASK_TXACTIE SDIO_MASK_TXACTIE_Msk
#define SDIO_MASK_RXACTIE_Pos (13U)
#define SDIO_MASK_RXACTIE_Msk (0x1U << SDIO_MASK_RXACTIE_Pos)
#define SDIO_MASK_RXACTIE SDIO_MASK_RXACTIE_Msk
#define SDIO_MASK_TXFIFOHEIE_Pos (14U)
#define SDIO_MASK_TXFIFOHEIE_Msk (0x1U << SDIO_MASK_TXFIFOHEIE_Pos)
#define SDIO_MASK_TXFIFOHEIE SDIO_MASK_TXFIFOHEIE_Msk
#define SDIO_MASK_RXFIFOHFIE_Pos (15U)
#define SDIO_MASK_RXFIFOHFIE_Msk (0x1U << SDIO_MASK_RXFIFOHFIE_Pos)
#define SDIO_MASK_RXFIFOHFIE SDIO_MASK_RXFIFOHFIE_Msk
#define SDIO_MASK_TXFIFOFIE_Pos (16U)
#define SDIO_MASK_TXFIFOFIE_Msk (0x1U << SDIO_MASK_TXFIFOFIE_Pos)
#define SDIO_MASK_TXFIFOFIE SDIO_MASK_TXFIFOFIE_Msk
#define SDIO_MASK_RXFIFOFIE_Pos (17U)
#define SDIO_MASK_RXFIFOFIE_Msk (0x1U << SDIO_MASK_RXFIFOFIE_Pos)
#define SDIO_MASK_RXFIFOFIE SDIO_MASK_RXFIFOFIE_Msk
#define SDIO_MASK_TXFIFOEIE_Pos (18U)
#define SDIO_MASK_TXFIFOEIE_Msk (0x1U << SDIO_MASK_TXFIFOEIE_Pos)
#define SDIO_MASK_TXFIFOEIE SDIO_MASK_TXFIFOEIE_Msk
#define SDIO_MASK_RXFIFOEIE_Pos (19U)
#define SDIO_MASK_RXFIFOEIE_Msk (0x1U << SDIO_MASK_RXFIFOEIE_Pos)
#define SDIO_MASK_RXFIFOEIE SDIO_MASK_RXFIFOEIE_Msk
#define SDIO_MASK_TXDAVLIE_Pos (20U)
#define SDIO_MASK_TXDAVLIE_Msk (0x1U << SDIO_MASK_TXDAVLIE_Pos)
#define SDIO_MASK_TXDAVLIE SDIO_MASK_TXDAVLIE_Msk
#define SDIO_MASK_RXDAVLIE_Pos (21U)
#define SDIO_MASK_RXDAVLIE_Msk (0x1U << SDIO_MASK_RXDAVLIE_Pos)
#define SDIO_MASK_RXDAVLIE SDIO_MASK_RXDAVLIE_Msk
#define SDIO_MASK_SDIOITIE_Pos (22U)
#define SDIO_MASK_SDIOITIE_Msk (0x1U << SDIO_MASK_SDIOITIE_Pos)
#define SDIO_MASK_SDIOITIE SDIO_MASK_SDIOITIE_Msk
#define SDIO_MASK_CEATAENDIE_Pos (23U)
#define SDIO_MASK_CEATAENDIE_Msk (0x1U << SDIO_MASK_CEATAENDIE_Pos)
#define SDIO_MASK_CEATAENDIE SDIO_MASK_CEATAENDIE_Msk


#define SDIO_FIFOCNT_FIFOCOUNT_Pos (0U)
#define SDIO_FIFOCNT_FIFOCOUNT_Msk (0xFFFFFFU << SDIO_FIFOCNT_FIFOCOUNT_Pos)
#define SDIO_FIFOCNT_FIFOCOUNT SDIO_FIFOCNT_FIFOCOUNT_Msk


#define SDIO_FIFO_FIFODATA_Pos (0U)
#define SDIO_FIFO_FIFODATA_Msk (0xFFFFFFFFU << SDIO_FIFO_FIFODATA_Pos)
#define SDIO_FIFO_FIFODATA SDIO_FIFO_FIFODATA_Msk
# 4928 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define USB_EP0R USB_BASE
#define USB_EP1R (USB_BASE + 0x00000004)
#define USB_EP2R (USB_BASE + 0x00000008)
#define USB_EP3R (USB_BASE + 0x0000000C)
#define USB_EP4R (USB_BASE + 0x00000010)
#define USB_EP5R (USB_BASE + 0x00000014)
#define USB_EP6R (USB_BASE + 0x00000018)
#define USB_EP7R (USB_BASE + 0x0000001C)


#define USB_EP_CTR_RX_Pos (15U)
#define USB_EP_CTR_RX_Msk (0x1U << USB_EP_CTR_RX_Pos)
#define USB_EP_CTR_RX USB_EP_CTR_RX_Msk
#define USB_EP_DTOG_RX_Pos (14U)
#define USB_EP_DTOG_RX_Msk (0x1U << USB_EP_DTOG_RX_Pos)
#define USB_EP_DTOG_RX USB_EP_DTOG_RX_Msk
#define USB_EPRX_STAT_Pos (12U)
#define USB_EPRX_STAT_Msk (0x3U << USB_EPRX_STAT_Pos)
#define USB_EPRX_STAT USB_EPRX_STAT_Msk
#define USB_EP_SETUP_Pos (11U)
#define USB_EP_SETUP_Msk (0x1U << USB_EP_SETUP_Pos)
#define USB_EP_SETUP USB_EP_SETUP_Msk
#define USB_EP_T_FIELD_Pos (9U)
#define USB_EP_T_FIELD_Msk (0x3U << USB_EP_T_FIELD_Pos)
#define USB_EP_T_FIELD USB_EP_T_FIELD_Msk
#define USB_EP_KIND_Pos (8U)
#define USB_EP_KIND_Msk (0x1U << USB_EP_KIND_Pos)
#define USB_EP_KIND USB_EP_KIND_Msk
#define USB_EP_CTR_TX_Pos (7U)
#define USB_EP_CTR_TX_Msk (0x1U << USB_EP_CTR_TX_Pos)
#define USB_EP_CTR_TX USB_EP_CTR_TX_Msk
#define USB_EP_DTOG_TX_Pos (6U)
#define USB_EP_DTOG_TX_Msk (0x1U << USB_EP_DTOG_TX_Pos)
#define USB_EP_DTOG_TX USB_EP_DTOG_TX_Msk
#define USB_EPTX_STAT_Pos (4U)
#define USB_EPTX_STAT_Msk (0x3U << USB_EPTX_STAT_Pos)
#define USB_EPTX_STAT USB_EPTX_STAT_Msk
#define USB_EPADDR_FIELD_Pos (0U)
#define USB_EPADDR_FIELD_Msk (0xFU << USB_EPADDR_FIELD_Pos)
#define USB_EPADDR_FIELD USB_EPADDR_FIELD_Msk


#define USB_EPREG_MASK (USB_EP_CTR_RX|USB_EP_SETUP|USB_EP_T_FIELD|USB_EP_KIND|USB_EP_CTR_TX|USB_EPADDR_FIELD)

#define USB_EP_TYPE_MASK_Pos (9U)
#define USB_EP_TYPE_MASK_Msk (0x3U << USB_EP_TYPE_MASK_Pos)
#define USB_EP_TYPE_MASK USB_EP_TYPE_MASK_Msk
#define USB_EP_BULK 0x00000000U
#define USB_EP_CONTROL 0x00000200U
#define USB_EP_ISOCHRONOUS 0x00000400U
#define USB_EP_INTERRUPT 0x00000600U
#define USB_EP_T_MASK (~USB_EP_T_FIELD & USB_EPREG_MASK)

#define USB_EPKIND_MASK (~USB_EP_KIND & USB_EPREG_MASK)

#define USB_EP_TX_DIS 0x00000000U
#define USB_EP_TX_STALL 0x00000010U
#define USB_EP_TX_NAK 0x00000020U
#define USB_EP_TX_VALID 0x00000030U
#define USB_EPTX_DTOG1 0x00000010U
#define USB_EPTX_DTOG2 0x00000020U
#define USB_EPTX_DTOGMASK (USB_EPTX_STAT|USB_EPREG_MASK)

#define USB_EP_RX_DIS 0x00000000U
#define USB_EP_RX_STALL 0x00001000U
#define USB_EP_RX_NAK 0x00002000U
#define USB_EP_RX_VALID 0x00003000U
#define USB_EPRX_DTOG1 0x00001000U
#define USB_EPRX_DTOG2 0x00002000U
#define USB_EPRX_DTOGMASK (USB_EPRX_STAT|USB_EPREG_MASK)


#define USB_EP0R_EA_Pos (0U)
#define USB_EP0R_EA_Msk (0xFU << USB_EP0R_EA_Pos)
#define USB_EP0R_EA USB_EP0R_EA_Msk

#define USB_EP0R_STAT_TX_Pos (4U)
#define USB_EP0R_STAT_TX_Msk (0x3U << USB_EP0R_STAT_TX_Pos)
#define USB_EP0R_STAT_TX USB_EP0R_STAT_TX_Msk
#define USB_EP0R_STAT_TX_0 (0x1U << USB_EP0R_STAT_TX_Pos)
#define USB_EP0R_STAT_TX_1 (0x2U << USB_EP0R_STAT_TX_Pos)

#define USB_EP0R_DTOG_TX_Pos (6U)
#define USB_EP0R_DTOG_TX_Msk (0x1U << USB_EP0R_DTOG_TX_Pos)
#define USB_EP0R_DTOG_TX USB_EP0R_DTOG_TX_Msk
#define USB_EP0R_CTR_TX_Pos (7U)
#define USB_EP0R_CTR_TX_Msk (0x1U << USB_EP0R_CTR_TX_Pos)
#define USB_EP0R_CTR_TX USB_EP0R_CTR_TX_Msk
#define USB_EP0R_EP_KIND_Pos (8U)
#define USB_EP0R_EP_KIND_Msk (0x1U << USB_EP0R_EP_KIND_Pos)
#define USB_EP0R_EP_KIND USB_EP0R_EP_KIND_Msk

#define USB_EP0R_EP_TYPE_Pos (9U)
#define USB_EP0R_EP_TYPE_Msk (0x3U << USB_EP0R_EP_TYPE_Pos)
#define USB_EP0R_EP_TYPE USB_EP0R_EP_TYPE_Msk
#define USB_EP0R_EP_TYPE_0 (0x1U << USB_EP0R_EP_TYPE_Pos)
#define USB_EP0R_EP_TYPE_1 (0x2U << USB_EP0R_EP_TYPE_Pos)

#define USB_EP0R_SETUP_Pos (11U)
#define USB_EP0R_SETUP_Msk (0x1U << USB_EP0R_SETUP_Pos)
#define USB_EP0R_SETUP USB_EP0R_SETUP_Msk

#define USB_EP0R_STAT_RX_Pos (12U)
#define USB_EP0R_STAT_RX_Msk (0x3U << USB_EP0R_STAT_RX_Pos)
#define USB_EP0R_STAT_RX USB_EP0R_STAT_RX_Msk
#define USB_EP0R_STAT_RX_0 (0x1U << USB_EP0R_STAT_RX_Pos)
#define USB_EP0R_STAT_RX_1 (0x2U << USB_EP0R_STAT_RX_Pos)

#define USB_EP0R_DTOG_RX_Pos (14U)
#define USB_EP0R_DTOG_RX_Msk (0x1U << USB_EP0R_DTOG_RX_Pos)
#define USB_EP0R_DTOG_RX USB_EP0R_DTOG_RX_Msk
#define USB_EP0R_CTR_RX_Pos (15U)
#define USB_EP0R_CTR_RX_Msk (0x1U << USB_EP0R_CTR_RX_Pos)
#define USB_EP0R_CTR_RX USB_EP0R_CTR_RX_Msk


#define USB_EP1R_EA_Pos (0U)
#define USB_EP1R_EA_Msk (0xFU << USB_EP1R_EA_Pos)
#define USB_EP1R_EA USB_EP1R_EA_Msk

#define USB_EP1R_STAT_TX_Pos (4U)
#define USB_EP1R_STAT_TX_Msk (0x3U << USB_EP1R_STAT_TX_Pos)
#define USB_EP1R_STAT_TX USB_EP1R_STAT_TX_Msk
#define USB_EP1R_STAT_TX_0 (0x1U << USB_EP1R_STAT_TX_Pos)
#define USB_EP1R_STAT_TX_1 (0x2U << USB_EP1R_STAT_TX_Pos)

#define USB_EP1R_DTOG_TX_Pos (6U)
#define USB_EP1R_DTOG_TX_Msk (0x1U << USB_EP1R_DTOG_TX_Pos)
#define USB_EP1R_DTOG_TX USB_EP1R_DTOG_TX_Msk
#define USB_EP1R_CTR_TX_Pos (7U)
#define USB_EP1R_CTR_TX_Msk (0x1U << USB_EP1R_CTR_TX_Pos)
#define USB_EP1R_CTR_TX USB_EP1R_CTR_TX_Msk
#define USB_EP1R_EP_KIND_Pos (8U)
#define USB_EP1R_EP_KIND_Msk (0x1U << USB_EP1R_EP_KIND_Pos)
#define USB_EP1R_EP_KIND USB_EP1R_EP_KIND_Msk

#define USB_EP1R_EP_TYPE_Pos (9U)
#define USB_EP1R_EP_TYPE_Msk (0x3U << USB_EP1R_EP_TYPE_Pos)
#define USB_EP1R_EP_TYPE USB_EP1R_EP_TYPE_Msk
#define USB_EP1R_EP_TYPE_0 (0x1U << USB_EP1R_EP_TYPE_Pos)
#define USB_EP1R_EP_TYPE_1 (0x2U << USB_EP1R_EP_TYPE_Pos)

#define USB_EP1R_SETUP_Pos (11U)
#define USB_EP1R_SETUP_Msk (0x1U << USB_EP1R_SETUP_Pos)
#define USB_EP1R_SETUP USB_EP1R_SETUP_Msk

#define USB_EP1R_STAT_RX_Pos (12U)
#define USB_EP1R_STAT_RX_Msk (0x3U << USB_EP1R_STAT_RX_Pos)
#define USB_EP1R_STAT_RX USB_EP1R_STAT_RX_Msk
#define USB_EP1R_STAT_RX_0 (0x1U << USB_EP1R_STAT_RX_Pos)
#define USB_EP1R_STAT_RX_1 (0x2U << USB_EP1R_STAT_RX_Pos)

#define USB_EP1R_DTOG_RX_Pos (14U)
#define USB_EP1R_DTOG_RX_Msk (0x1U << USB_EP1R_DTOG_RX_Pos)
#define USB_EP1R_DTOG_RX USB_EP1R_DTOG_RX_Msk
#define USB_EP1R_CTR_RX_Pos (15U)
#define USB_EP1R_CTR_RX_Msk (0x1U << USB_EP1R_CTR_RX_Pos)
#define USB_EP1R_CTR_RX USB_EP1R_CTR_RX_Msk


#define USB_EP2R_EA_Pos (0U)
#define USB_EP2R_EA_Msk (0xFU << USB_EP2R_EA_Pos)
#define USB_EP2R_EA USB_EP2R_EA_Msk

#define USB_EP2R_STAT_TX_Pos (4U)
#define USB_EP2R_STAT_TX_Msk (0x3U << USB_EP2R_STAT_TX_Pos)
#define USB_EP2R_STAT_TX USB_EP2R_STAT_TX_Msk
#define USB_EP2R_STAT_TX_0 (0x1U << USB_EP2R_STAT_TX_Pos)
#define USB_EP2R_STAT_TX_1 (0x2U << USB_EP2R_STAT_TX_Pos)

#define USB_EP2R_DTOG_TX_Pos (6U)
#define USB_EP2R_DTOG_TX_Msk (0x1U << USB_EP2R_DTOG_TX_Pos)
#define USB_EP2R_DTOG_TX USB_EP2R_DTOG_TX_Msk
#define USB_EP2R_CTR_TX_Pos (7U)
#define USB_EP2R_CTR_TX_Msk (0x1U << USB_EP2R_CTR_TX_Pos)
#define USB_EP2R_CTR_TX USB_EP2R_CTR_TX_Msk
#define USB_EP2R_EP_KIND_Pos (8U)
#define USB_EP2R_EP_KIND_Msk (0x1U << USB_EP2R_EP_KIND_Pos)
#define USB_EP2R_EP_KIND USB_EP2R_EP_KIND_Msk

#define USB_EP2R_EP_TYPE_Pos (9U)
#define USB_EP2R_EP_TYPE_Msk (0x3U << USB_EP2R_EP_TYPE_Pos)
#define USB_EP2R_EP_TYPE USB_EP2R_EP_TYPE_Msk
#define USB_EP2R_EP_TYPE_0 (0x1U << USB_EP2R_EP_TYPE_Pos)
#define USB_EP2R_EP_TYPE_1 (0x2U << USB_EP2R_EP_TYPE_Pos)

#define USB_EP2R_SETUP_Pos (11U)
#define USB_EP2R_SETUP_Msk (0x1U << USB_EP2R_SETUP_Pos)
#define USB_EP2R_SETUP USB_EP2R_SETUP_Msk

#define USB_EP2R_STAT_RX_Pos (12U)
#define USB_EP2R_STAT_RX_Msk (0x3U << USB_EP2R_STAT_RX_Pos)
#define USB_EP2R_STAT_RX USB_EP2R_STAT_RX_Msk
#define USB_EP2R_STAT_RX_0 (0x1U << USB_EP2R_STAT_RX_Pos)
#define USB_EP2R_STAT_RX_1 (0x2U << USB_EP2R_STAT_RX_Pos)

#define USB_EP2R_DTOG_RX_Pos (14U)
#define USB_EP2R_DTOG_RX_Msk (0x1U << USB_EP2R_DTOG_RX_Pos)
#define USB_EP2R_DTOG_RX USB_EP2R_DTOG_RX_Msk
#define USB_EP2R_CTR_RX_Pos (15U)
#define USB_EP2R_CTR_RX_Msk (0x1U << USB_EP2R_CTR_RX_Pos)
#define USB_EP2R_CTR_RX USB_EP2R_CTR_RX_Msk


#define USB_EP3R_EA_Pos (0U)
#define USB_EP3R_EA_Msk (0xFU << USB_EP3R_EA_Pos)
#define USB_EP3R_EA USB_EP3R_EA_Msk

#define USB_EP3R_STAT_TX_Pos (4U)
#define USB_EP3R_STAT_TX_Msk (0x3U << USB_EP3R_STAT_TX_Pos)
#define USB_EP3R_STAT_TX USB_EP3R_STAT_TX_Msk
#define USB_EP3R_STAT_TX_0 (0x1U << USB_EP3R_STAT_TX_Pos)
#define USB_EP3R_STAT_TX_1 (0x2U << USB_EP3R_STAT_TX_Pos)

#define USB_EP3R_DTOG_TX_Pos (6U)
#define USB_EP3R_DTOG_TX_Msk (0x1U << USB_EP3R_DTOG_TX_Pos)
#define USB_EP3R_DTOG_TX USB_EP3R_DTOG_TX_Msk
#define USB_EP3R_CTR_TX_Pos (7U)
#define USB_EP3R_CTR_TX_Msk (0x1U << USB_EP3R_CTR_TX_Pos)
#define USB_EP3R_CTR_TX USB_EP3R_CTR_TX_Msk
#define USB_EP3R_EP_KIND_Pos (8U)
#define USB_EP3R_EP_KIND_Msk (0x1U << USB_EP3R_EP_KIND_Pos)
#define USB_EP3R_EP_KIND USB_EP3R_EP_KIND_Msk

#define USB_EP3R_EP_TYPE_Pos (9U)
#define USB_EP3R_EP_TYPE_Msk (0x3U << USB_EP3R_EP_TYPE_Pos)
#define USB_EP3R_EP_TYPE USB_EP3R_EP_TYPE_Msk
#define USB_EP3R_EP_TYPE_0 (0x1U << USB_EP3R_EP_TYPE_Pos)
#define USB_EP3R_EP_TYPE_1 (0x2U << USB_EP3R_EP_TYPE_Pos)

#define USB_EP3R_SETUP_Pos (11U)
#define USB_EP3R_SETUP_Msk (0x1U << USB_EP3R_SETUP_Pos)
#define USB_EP3R_SETUP USB_EP3R_SETUP_Msk

#define USB_EP3R_STAT_RX_Pos (12U)
#define USB_EP3R_STAT_RX_Msk (0x3U << USB_EP3R_STAT_RX_Pos)
#define USB_EP3R_STAT_RX USB_EP3R_STAT_RX_Msk
#define USB_EP3R_STAT_RX_0 (0x1U << USB_EP3R_STAT_RX_Pos)
#define USB_EP3R_STAT_RX_1 (0x2U << USB_EP3R_STAT_RX_Pos)

#define USB_EP3R_DTOG_RX_Pos (14U)
#define USB_EP3R_DTOG_RX_Msk (0x1U << USB_EP3R_DTOG_RX_Pos)
#define USB_EP3R_DTOG_RX USB_EP3R_DTOG_RX_Msk
#define USB_EP3R_CTR_RX_Pos (15U)
#define USB_EP3R_CTR_RX_Msk (0x1U << USB_EP3R_CTR_RX_Pos)
#define USB_EP3R_CTR_RX USB_EP3R_CTR_RX_Msk


#define USB_EP4R_EA_Pos (0U)
#define USB_EP4R_EA_Msk (0xFU << USB_EP4R_EA_Pos)
#define USB_EP4R_EA USB_EP4R_EA_Msk

#define USB_EP4R_STAT_TX_Pos (4U)
#define USB_EP4R_STAT_TX_Msk (0x3U << USB_EP4R_STAT_TX_Pos)
#define USB_EP4R_STAT_TX USB_EP4R_STAT_TX_Msk
#define USB_EP4R_STAT_TX_0 (0x1U << USB_EP4R_STAT_TX_Pos)
#define USB_EP4R_STAT_TX_1 (0x2U << USB_EP4R_STAT_TX_Pos)

#define USB_EP4R_DTOG_TX_Pos (6U)
#define USB_EP4R_DTOG_TX_Msk (0x1U << USB_EP4R_DTOG_TX_Pos)
#define USB_EP4R_DTOG_TX USB_EP4R_DTOG_TX_Msk
#define USB_EP4R_CTR_TX_Pos (7U)
#define USB_EP4R_CTR_TX_Msk (0x1U << USB_EP4R_CTR_TX_Pos)
#define USB_EP4R_CTR_TX USB_EP4R_CTR_TX_Msk
#define USB_EP4R_EP_KIND_Pos (8U)
#define USB_EP4R_EP_KIND_Msk (0x1U << USB_EP4R_EP_KIND_Pos)
#define USB_EP4R_EP_KIND USB_EP4R_EP_KIND_Msk

#define USB_EP4R_EP_TYPE_Pos (9U)
#define USB_EP4R_EP_TYPE_Msk (0x3U << USB_EP4R_EP_TYPE_Pos)
#define USB_EP4R_EP_TYPE USB_EP4R_EP_TYPE_Msk
#define USB_EP4R_EP_TYPE_0 (0x1U << USB_EP4R_EP_TYPE_Pos)
#define USB_EP4R_EP_TYPE_1 (0x2U << USB_EP4R_EP_TYPE_Pos)

#define USB_EP4R_SETUP_Pos (11U)
#define USB_EP4R_SETUP_Msk (0x1U << USB_EP4R_SETUP_Pos)
#define USB_EP4R_SETUP USB_EP4R_SETUP_Msk

#define USB_EP4R_STAT_RX_Pos (12U)
#define USB_EP4R_STAT_RX_Msk (0x3U << USB_EP4R_STAT_RX_Pos)
#define USB_EP4R_STAT_RX USB_EP4R_STAT_RX_Msk
#define USB_EP4R_STAT_RX_0 (0x1U << USB_EP4R_STAT_RX_Pos)
#define USB_EP4R_STAT_RX_1 (0x2U << USB_EP4R_STAT_RX_Pos)

#define USB_EP4R_DTOG_RX_Pos (14U)
#define USB_EP4R_DTOG_RX_Msk (0x1U << USB_EP4R_DTOG_RX_Pos)
#define USB_EP4R_DTOG_RX USB_EP4R_DTOG_RX_Msk
#define USB_EP4R_CTR_RX_Pos (15U)
#define USB_EP4R_CTR_RX_Msk (0x1U << USB_EP4R_CTR_RX_Pos)
#define USB_EP4R_CTR_RX USB_EP4R_CTR_RX_Msk


#define USB_EP5R_EA_Pos (0U)
#define USB_EP5R_EA_Msk (0xFU << USB_EP5R_EA_Pos)
#define USB_EP5R_EA USB_EP5R_EA_Msk

#define USB_EP5R_STAT_TX_Pos (4U)
#define USB_EP5R_STAT_TX_Msk (0x3U << USB_EP5R_STAT_TX_Pos)
#define USB_EP5R_STAT_TX USB_EP5R_STAT_TX_Msk
#define USB_EP5R_STAT_TX_0 (0x1U << USB_EP5R_STAT_TX_Pos)
#define USB_EP5R_STAT_TX_1 (0x2U << USB_EP5R_STAT_TX_Pos)

#define USB_EP5R_DTOG_TX_Pos (6U)
#define USB_EP5R_DTOG_TX_Msk (0x1U << USB_EP5R_DTOG_TX_Pos)
#define USB_EP5R_DTOG_TX USB_EP5R_DTOG_TX_Msk
#define USB_EP5R_CTR_TX_Pos (7U)
#define USB_EP5R_CTR_TX_Msk (0x1U << USB_EP5R_CTR_TX_Pos)
#define USB_EP5R_CTR_TX USB_EP5R_CTR_TX_Msk
#define USB_EP5R_EP_KIND_Pos (8U)
#define USB_EP5R_EP_KIND_Msk (0x1U << USB_EP5R_EP_KIND_Pos)
#define USB_EP5R_EP_KIND USB_EP5R_EP_KIND_Msk

#define USB_EP5R_EP_TYPE_Pos (9U)
#define USB_EP5R_EP_TYPE_Msk (0x3U << USB_EP5R_EP_TYPE_Pos)
#define USB_EP5R_EP_TYPE USB_EP5R_EP_TYPE_Msk
#define USB_EP5R_EP_TYPE_0 (0x1U << USB_EP5R_EP_TYPE_Pos)
#define USB_EP5R_EP_TYPE_1 (0x2U << USB_EP5R_EP_TYPE_Pos)

#define USB_EP5R_SETUP_Pos (11U)
#define USB_EP5R_SETUP_Msk (0x1U << USB_EP5R_SETUP_Pos)
#define USB_EP5R_SETUP USB_EP5R_SETUP_Msk

#define USB_EP5R_STAT_RX_Pos (12U)
#define USB_EP5R_STAT_RX_Msk (0x3U << USB_EP5R_STAT_RX_Pos)
#define USB_EP5R_STAT_RX USB_EP5R_STAT_RX_Msk
#define USB_EP5R_STAT_RX_0 (0x1U << USB_EP5R_STAT_RX_Pos)
#define USB_EP5R_STAT_RX_1 (0x2U << USB_EP5R_STAT_RX_Pos)

#define USB_EP5R_DTOG_RX_Pos (14U)
#define USB_EP5R_DTOG_RX_Msk (0x1U << USB_EP5R_DTOG_RX_Pos)
#define USB_EP5R_DTOG_RX USB_EP5R_DTOG_RX_Msk
#define USB_EP5R_CTR_RX_Pos (15U)
#define USB_EP5R_CTR_RX_Msk (0x1U << USB_EP5R_CTR_RX_Pos)
#define USB_EP5R_CTR_RX USB_EP5R_CTR_RX_Msk


#define USB_EP6R_EA_Pos (0U)
#define USB_EP6R_EA_Msk (0xFU << USB_EP6R_EA_Pos)
#define USB_EP6R_EA USB_EP6R_EA_Msk

#define USB_EP6R_STAT_TX_Pos (4U)
#define USB_EP6R_STAT_TX_Msk (0x3U << USB_EP6R_STAT_TX_Pos)
#define USB_EP6R_STAT_TX USB_EP6R_STAT_TX_Msk
#define USB_EP6R_STAT_TX_0 (0x1U << USB_EP6R_STAT_TX_Pos)
#define USB_EP6R_STAT_TX_1 (0x2U << USB_EP6R_STAT_TX_Pos)

#define USB_EP6R_DTOG_TX_Pos (6U)
#define USB_EP6R_DTOG_TX_Msk (0x1U << USB_EP6R_DTOG_TX_Pos)
#define USB_EP6R_DTOG_TX USB_EP6R_DTOG_TX_Msk
#define USB_EP6R_CTR_TX_Pos (7U)
#define USB_EP6R_CTR_TX_Msk (0x1U << USB_EP6R_CTR_TX_Pos)
#define USB_EP6R_CTR_TX USB_EP6R_CTR_TX_Msk
#define USB_EP6R_EP_KIND_Pos (8U)
#define USB_EP6R_EP_KIND_Msk (0x1U << USB_EP6R_EP_KIND_Pos)
#define USB_EP6R_EP_KIND USB_EP6R_EP_KIND_Msk

#define USB_EP6R_EP_TYPE_Pos (9U)
#define USB_EP6R_EP_TYPE_Msk (0x3U << USB_EP6R_EP_TYPE_Pos)
#define USB_EP6R_EP_TYPE USB_EP6R_EP_TYPE_Msk
#define USB_EP6R_EP_TYPE_0 (0x1U << USB_EP6R_EP_TYPE_Pos)
#define USB_EP6R_EP_TYPE_1 (0x2U << USB_EP6R_EP_TYPE_Pos)

#define USB_EP6R_SETUP_Pos (11U)
#define USB_EP6R_SETUP_Msk (0x1U << USB_EP6R_SETUP_Pos)
#define USB_EP6R_SETUP USB_EP6R_SETUP_Msk

#define USB_EP6R_STAT_RX_Pos (12U)
#define USB_EP6R_STAT_RX_Msk (0x3U << USB_EP6R_STAT_RX_Pos)
#define USB_EP6R_STAT_RX USB_EP6R_STAT_RX_Msk
#define USB_EP6R_STAT_RX_0 (0x1U << USB_EP6R_STAT_RX_Pos)
#define USB_EP6R_STAT_RX_1 (0x2U << USB_EP6R_STAT_RX_Pos)

#define USB_EP6R_DTOG_RX_Pos (14U)
#define USB_EP6R_DTOG_RX_Msk (0x1U << USB_EP6R_DTOG_RX_Pos)
#define USB_EP6R_DTOG_RX USB_EP6R_DTOG_RX_Msk
#define USB_EP6R_CTR_RX_Pos (15U)
#define USB_EP6R_CTR_RX_Msk (0x1U << USB_EP6R_CTR_RX_Pos)
#define USB_EP6R_CTR_RX USB_EP6R_CTR_RX_Msk


#define USB_EP7R_EA_Pos (0U)
#define USB_EP7R_EA_Msk (0xFU << USB_EP7R_EA_Pos)
#define USB_EP7R_EA USB_EP7R_EA_Msk

#define USB_EP7R_STAT_TX_Pos (4U)
#define USB_EP7R_STAT_TX_Msk (0x3U << USB_EP7R_STAT_TX_Pos)
#define USB_EP7R_STAT_TX USB_EP7R_STAT_TX_Msk
#define USB_EP7R_STAT_TX_0 (0x1U << USB_EP7R_STAT_TX_Pos)
#define USB_EP7R_STAT_TX_1 (0x2U << USB_EP7R_STAT_TX_Pos)

#define USB_EP7R_DTOG_TX_Pos (6U)
#define USB_EP7R_DTOG_TX_Msk (0x1U << USB_EP7R_DTOG_TX_Pos)
#define USB_EP7R_DTOG_TX USB_EP7R_DTOG_TX_Msk
#define USB_EP7R_CTR_TX_Pos (7U)
#define USB_EP7R_CTR_TX_Msk (0x1U << USB_EP7R_CTR_TX_Pos)
#define USB_EP7R_CTR_TX USB_EP7R_CTR_TX_Msk
#define USB_EP7R_EP_KIND_Pos (8U)
#define USB_EP7R_EP_KIND_Msk (0x1U << USB_EP7R_EP_KIND_Pos)
#define USB_EP7R_EP_KIND USB_EP7R_EP_KIND_Msk

#define USB_EP7R_EP_TYPE_Pos (9U)
#define USB_EP7R_EP_TYPE_Msk (0x3U << USB_EP7R_EP_TYPE_Pos)
#define USB_EP7R_EP_TYPE USB_EP7R_EP_TYPE_Msk
#define USB_EP7R_EP_TYPE_0 (0x1U << USB_EP7R_EP_TYPE_Pos)
#define USB_EP7R_EP_TYPE_1 (0x2U << USB_EP7R_EP_TYPE_Pos)

#define USB_EP7R_SETUP_Pos (11U)
#define USB_EP7R_SETUP_Msk (0x1U << USB_EP7R_SETUP_Pos)
#define USB_EP7R_SETUP USB_EP7R_SETUP_Msk

#define USB_EP7R_STAT_RX_Pos (12U)
#define USB_EP7R_STAT_RX_Msk (0x3U << USB_EP7R_STAT_RX_Pos)
#define USB_EP7R_STAT_RX USB_EP7R_STAT_RX_Msk
#define USB_EP7R_STAT_RX_0 (0x1U << USB_EP7R_STAT_RX_Pos)
#define USB_EP7R_STAT_RX_1 (0x2U << USB_EP7R_STAT_RX_Pos)

#define USB_EP7R_DTOG_RX_Pos (14U)
#define USB_EP7R_DTOG_RX_Msk (0x1U << USB_EP7R_DTOG_RX_Pos)
#define USB_EP7R_DTOG_RX USB_EP7R_DTOG_RX_Msk
#define USB_EP7R_CTR_RX_Pos (15U)
#define USB_EP7R_CTR_RX_Msk (0x1U << USB_EP7R_CTR_RX_Pos)
#define USB_EP7R_CTR_RX USB_EP7R_CTR_RX_Msk



#define USB_CNTR_FRES_Pos (0U)
#define USB_CNTR_FRES_Msk (0x1U << USB_CNTR_FRES_Pos)
#define USB_CNTR_FRES USB_CNTR_FRES_Msk
#define USB_CNTR_PDWN_Pos (1U)
#define USB_CNTR_PDWN_Msk (0x1U << USB_CNTR_PDWN_Pos)
#define USB_CNTR_PDWN USB_CNTR_PDWN_Msk
#define USB_CNTR_LP_MODE_Pos (2U)
#define USB_CNTR_LP_MODE_Msk (0x1U << USB_CNTR_LP_MODE_Pos)
#define USB_CNTR_LP_MODE USB_CNTR_LP_MODE_Msk
#define USB_CNTR_FSUSP_Pos (3U)
#define USB_CNTR_FSUSP_Msk (0x1U << USB_CNTR_FSUSP_Pos)
#define USB_CNTR_FSUSP USB_CNTR_FSUSP_Msk
#define USB_CNTR_RESUME_Pos (4U)
#define USB_CNTR_RESUME_Msk (0x1U << USB_CNTR_RESUME_Pos)
#define USB_CNTR_RESUME USB_CNTR_RESUME_Msk
#define USB_CNTR_ESOFM_Pos (8U)
#define USB_CNTR_ESOFM_Msk (0x1U << USB_CNTR_ESOFM_Pos)
#define USB_CNTR_ESOFM USB_CNTR_ESOFM_Msk
#define USB_CNTR_SOFM_Pos (9U)
#define USB_CNTR_SOFM_Msk (0x1U << USB_CNTR_SOFM_Pos)
#define USB_CNTR_SOFM USB_CNTR_SOFM_Msk
#define USB_CNTR_RESETM_Pos (10U)
#define USB_CNTR_RESETM_Msk (0x1U << USB_CNTR_RESETM_Pos)
#define USB_CNTR_RESETM USB_CNTR_RESETM_Msk
#define USB_CNTR_SUSPM_Pos (11U)
#define USB_CNTR_SUSPM_Msk (0x1U << USB_CNTR_SUSPM_Pos)
#define USB_CNTR_SUSPM USB_CNTR_SUSPM_Msk
#define USB_CNTR_WKUPM_Pos (12U)
#define USB_CNTR_WKUPM_Msk (0x1U << USB_CNTR_WKUPM_Pos)
#define USB_CNTR_WKUPM USB_CNTR_WKUPM_Msk
#define USB_CNTR_ERRM_Pos (13U)
#define USB_CNTR_ERRM_Msk (0x1U << USB_CNTR_ERRM_Pos)
#define USB_CNTR_ERRM USB_CNTR_ERRM_Msk
#define USB_CNTR_PMAOVRM_Pos (14U)
#define USB_CNTR_PMAOVRM_Msk (0x1U << USB_CNTR_PMAOVRM_Pos)
#define USB_CNTR_PMAOVRM USB_CNTR_PMAOVRM_Msk
#define USB_CNTR_CTRM_Pos (15U)
#define USB_CNTR_CTRM_Msk (0x1U << USB_CNTR_CTRM_Pos)
#define USB_CNTR_CTRM USB_CNTR_CTRM_Msk


#define USB_ISTR_EP_ID_Pos (0U)
#define USB_ISTR_EP_ID_Msk (0xFU << USB_ISTR_EP_ID_Pos)
#define USB_ISTR_EP_ID USB_ISTR_EP_ID_Msk
#define USB_ISTR_DIR_Pos (4U)
#define USB_ISTR_DIR_Msk (0x1U << USB_ISTR_DIR_Pos)
#define USB_ISTR_DIR USB_ISTR_DIR_Msk
#define USB_ISTR_ESOF_Pos (8U)
#define USB_ISTR_ESOF_Msk (0x1U << USB_ISTR_ESOF_Pos)
#define USB_ISTR_ESOF USB_ISTR_ESOF_Msk
#define USB_ISTR_SOF_Pos (9U)
#define USB_ISTR_SOF_Msk (0x1U << USB_ISTR_SOF_Pos)
#define USB_ISTR_SOF USB_ISTR_SOF_Msk
#define USB_ISTR_RESET_Pos (10U)
#define USB_ISTR_RESET_Msk (0x1U << USB_ISTR_RESET_Pos)
#define USB_ISTR_RESET USB_ISTR_RESET_Msk
#define USB_ISTR_SUSP_Pos (11U)
#define USB_ISTR_SUSP_Msk (0x1U << USB_ISTR_SUSP_Pos)
#define USB_ISTR_SUSP USB_ISTR_SUSP_Msk
#define USB_ISTR_WKUP_Pos (12U)
#define USB_ISTR_WKUP_Msk (0x1U << USB_ISTR_WKUP_Pos)
#define USB_ISTR_WKUP USB_ISTR_WKUP_Msk
#define USB_ISTR_ERR_Pos (13U)
#define USB_ISTR_ERR_Msk (0x1U << USB_ISTR_ERR_Pos)
#define USB_ISTR_ERR USB_ISTR_ERR_Msk
#define USB_ISTR_PMAOVR_Pos (14U)
#define USB_ISTR_PMAOVR_Msk (0x1U << USB_ISTR_PMAOVR_Pos)
#define USB_ISTR_PMAOVR USB_ISTR_PMAOVR_Msk
#define USB_ISTR_CTR_Pos (15U)
#define USB_ISTR_CTR_Msk (0x1U << USB_ISTR_CTR_Pos)
#define USB_ISTR_CTR USB_ISTR_CTR_Msk


#define USB_FNR_FN_Pos (0U)
#define USB_FNR_FN_Msk (0x7FFU << USB_FNR_FN_Pos)
#define USB_FNR_FN USB_FNR_FN_Msk
#define USB_FNR_LSOF_Pos (11U)
#define USB_FNR_LSOF_Msk (0x3U << USB_FNR_LSOF_Pos)
#define USB_FNR_LSOF USB_FNR_LSOF_Msk
#define USB_FNR_LCK_Pos (13U)
#define USB_FNR_LCK_Msk (0x1U << USB_FNR_LCK_Pos)
#define USB_FNR_LCK USB_FNR_LCK_Msk
#define USB_FNR_RXDM_Pos (14U)
#define USB_FNR_RXDM_Msk (0x1U << USB_FNR_RXDM_Pos)
#define USB_FNR_RXDM USB_FNR_RXDM_Msk
#define USB_FNR_RXDP_Pos (15U)
#define USB_FNR_RXDP_Msk (0x1U << USB_FNR_RXDP_Pos)
#define USB_FNR_RXDP USB_FNR_RXDP_Msk


#define USB_DADDR_ADD_Pos (0U)
#define USB_DADDR_ADD_Msk (0x7FU << USB_DADDR_ADD_Pos)
#define USB_DADDR_ADD USB_DADDR_ADD_Msk
#define USB_DADDR_ADD0_Pos (0U)
#define USB_DADDR_ADD0_Msk (0x1U << USB_DADDR_ADD0_Pos)
#define USB_DADDR_ADD0 USB_DADDR_ADD0_Msk
#define USB_DADDR_ADD1_Pos (1U)
#define USB_DADDR_ADD1_Msk (0x1U << USB_DADDR_ADD1_Pos)
#define USB_DADDR_ADD1 USB_DADDR_ADD1_Msk
#define USB_DADDR_ADD2_Pos (2U)
#define USB_DADDR_ADD2_Msk (0x1U << USB_DADDR_ADD2_Pos)
#define USB_DADDR_ADD2 USB_DADDR_ADD2_Msk
#define USB_DADDR_ADD3_Pos (3U)
#define USB_DADDR_ADD3_Msk (0x1U << USB_DADDR_ADD3_Pos)
#define USB_DADDR_ADD3 USB_DADDR_ADD3_Msk
#define USB_DADDR_ADD4_Pos (4U)
#define USB_DADDR_ADD4_Msk (0x1U << USB_DADDR_ADD4_Pos)
#define USB_DADDR_ADD4 USB_DADDR_ADD4_Msk
#define USB_DADDR_ADD5_Pos (5U)
#define USB_DADDR_ADD5_Msk (0x1U << USB_DADDR_ADD5_Pos)
#define USB_DADDR_ADD5 USB_DADDR_ADD5_Msk
#define USB_DADDR_ADD6_Pos (6U)
#define USB_DADDR_ADD6_Msk (0x1U << USB_DADDR_ADD6_Pos)
#define USB_DADDR_ADD6 USB_DADDR_ADD6_Msk

#define USB_DADDR_EF_Pos (7U)
#define USB_DADDR_EF_Msk (0x1U << USB_DADDR_EF_Pos)
#define USB_DADDR_EF USB_DADDR_EF_Msk


#define USB_BTABLE_BTABLE_Pos (3U)
#define USB_BTABLE_BTABLE_Msk (0x1FFFU << USB_BTABLE_BTABLE_Pos)
#define USB_BTABLE_BTABLE USB_BTABLE_BTABLE_Msk



#define USB_ADDR0_TX_ADDR0_TX_Pos (1U)
#define USB_ADDR0_TX_ADDR0_TX_Msk (0x7FFFU << USB_ADDR0_TX_ADDR0_TX_Pos)
#define USB_ADDR0_TX_ADDR0_TX USB_ADDR0_TX_ADDR0_TX_Msk


#define USB_ADDR1_TX_ADDR1_TX_Pos (1U)
#define USB_ADDR1_TX_ADDR1_TX_Msk (0x7FFFU << USB_ADDR1_TX_ADDR1_TX_Pos)
#define USB_ADDR1_TX_ADDR1_TX USB_ADDR1_TX_ADDR1_TX_Msk


#define USB_ADDR2_TX_ADDR2_TX_Pos (1U)
#define USB_ADDR2_TX_ADDR2_TX_Msk (0x7FFFU << USB_ADDR2_TX_ADDR2_TX_Pos)
#define USB_ADDR2_TX_ADDR2_TX USB_ADDR2_TX_ADDR2_TX_Msk


#define USB_ADDR3_TX_ADDR3_TX_Pos (1U)
#define USB_ADDR3_TX_ADDR3_TX_Msk (0x7FFFU << USB_ADDR3_TX_ADDR3_TX_Pos)
#define USB_ADDR3_TX_ADDR3_TX USB_ADDR3_TX_ADDR3_TX_Msk


#define USB_ADDR4_TX_ADDR4_TX_Pos (1U)
#define USB_ADDR4_TX_ADDR4_TX_Msk (0x7FFFU << USB_ADDR4_TX_ADDR4_TX_Pos)
#define USB_ADDR4_TX_ADDR4_TX USB_ADDR4_TX_ADDR4_TX_Msk


#define USB_ADDR5_TX_ADDR5_TX_Pos (1U)
#define USB_ADDR5_TX_ADDR5_TX_Msk (0x7FFFU << USB_ADDR5_TX_ADDR5_TX_Pos)
#define USB_ADDR5_TX_ADDR5_TX USB_ADDR5_TX_ADDR5_TX_Msk


#define USB_ADDR6_TX_ADDR6_TX_Pos (1U)
#define USB_ADDR6_TX_ADDR6_TX_Msk (0x7FFFU << USB_ADDR6_TX_ADDR6_TX_Pos)
#define USB_ADDR6_TX_ADDR6_TX USB_ADDR6_TX_ADDR6_TX_Msk


#define USB_ADDR7_TX_ADDR7_TX_Pos (1U)
#define USB_ADDR7_TX_ADDR7_TX_Msk (0x7FFFU << USB_ADDR7_TX_ADDR7_TX_Pos)
#define USB_ADDR7_TX_ADDR7_TX USB_ADDR7_TX_ADDR7_TX_Msk




#define USB_COUNT0_TX_COUNT0_TX_Pos (0U)
#define USB_COUNT0_TX_COUNT0_TX_Msk (0x3FFU << USB_COUNT0_TX_COUNT0_TX_Pos)
#define USB_COUNT0_TX_COUNT0_TX USB_COUNT0_TX_COUNT0_TX_Msk


#define USB_COUNT1_TX_COUNT1_TX_Pos (0U)
#define USB_COUNT1_TX_COUNT1_TX_Msk (0x3FFU << USB_COUNT1_TX_COUNT1_TX_Pos)
#define USB_COUNT1_TX_COUNT1_TX USB_COUNT1_TX_COUNT1_TX_Msk


#define USB_COUNT2_TX_COUNT2_TX_Pos (0U)
#define USB_COUNT2_TX_COUNT2_TX_Msk (0x3FFU << USB_COUNT2_TX_COUNT2_TX_Pos)
#define USB_COUNT2_TX_COUNT2_TX USB_COUNT2_TX_COUNT2_TX_Msk


#define USB_COUNT3_TX_COUNT3_TX_Pos (0U)
#define USB_COUNT3_TX_COUNT3_TX_Msk (0x3FFU << USB_COUNT3_TX_COUNT3_TX_Pos)
#define USB_COUNT3_TX_COUNT3_TX USB_COUNT3_TX_COUNT3_TX_Msk


#define USB_COUNT4_TX_COUNT4_TX_Pos (0U)
#define USB_COUNT4_TX_COUNT4_TX_Msk (0x3FFU << USB_COUNT4_TX_COUNT4_TX_Pos)
#define USB_COUNT4_TX_COUNT4_TX USB_COUNT4_TX_COUNT4_TX_Msk


#define USB_COUNT5_TX_COUNT5_TX_Pos (0U)
#define USB_COUNT5_TX_COUNT5_TX_Msk (0x3FFU << USB_COUNT5_TX_COUNT5_TX_Pos)
#define USB_COUNT5_TX_COUNT5_TX USB_COUNT5_TX_COUNT5_TX_Msk


#define USB_COUNT6_TX_COUNT6_TX_Pos (0U)
#define USB_COUNT6_TX_COUNT6_TX_Msk (0x3FFU << USB_COUNT6_TX_COUNT6_TX_Pos)
#define USB_COUNT6_TX_COUNT6_TX USB_COUNT6_TX_COUNT6_TX_Msk


#define USB_COUNT7_TX_COUNT7_TX_Pos (0U)
#define USB_COUNT7_TX_COUNT7_TX_Msk (0x3FFU << USB_COUNT7_TX_COUNT7_TX_Pos)
#define USB_COUNT7_TX_COUNT7_TX USB_COUNT7_TX_COUNT7_TX_Msk




#define USB_COUNT0_TX_0_COUNT0_TX_0 0x000003FFU


#define USB_COUNT0_TX_1_COUNT0_TX_1 0x03FF0000U


#define USB_COUNT1_TX_0_COUNT1_TX_0 0x000003FFU


#define USB_COUNT1_TX_1_COUNT1_TX_1 0x03FF0000U


#define USB_COUNT2_TX_0_COUNT2_TX_0 0x000003FFU


#define USB_COUNT2_TX_1_COUNT2_TX_1 0x03FF0000U


#define USB_COUNT3_TX_0_COUNT3_TX_0 0x000003FFU


#define USB_COUNT3_TX_1_COUNT3_TX_1 0x03FF0000U


#define USB_COUNT4_TX_0_COUNT4_TX_0 0x000003FFU


#define USB_COUNT4_TX_1_COUNT4_TX_1 0x03FF0000U


#define USB_COUNT5_TX_0_COUNT5_TX_0 0x000003FFU


#define USB_COUNT5_TX_1_COUNT5_TX_1 0x03FF0000U


#define USB_COUNT6_TX_0_COUNT6_TX_0 0x000003FFU


#define USB_COUNT6_TX_1_COUNT6_TX_1 0x03FF0000U


#define USB_COUNT7_TX_0_COUNT7_TX_0 0x000003FFU


#define USB_COUNT7_TX_1_COUNT7_TX_1 0x03FF0000U




#define USB_ADDR0_RX_ADDR0_RX_Pos (1U)
#define USB_ADDR0_RX_ADDR0_RX_Msk (0x7FFFU << USB_ADDR0_RX_ADDR0_RX_Pos)
#define USB_ADDR0_RX_ADDR0_RX USB_ADDR0_RX_ADDR0_RX_Msk


#define USB_ADDR1_RX_ADDR1_RX_Pos (1U)
#define USB_ADDR1_RX_ADDR1_RX_Msk (0x7FFFU << USB_ADDR1_RX_ADDR1_RX_Pos)
#define USB_ADDR1_RX_ADDR1_RX USB_ADDR1_RX_ADDR1_RX_Msk


#define USB_ADDR2_RX_ADDR2_RX_Pos (1U)
#define USB_ADDR2_RX_ADDR2_RX_Msk (0x7FFFU << USB_ADDR2_RX_ADDR2_RX_Pos)
#define USB_ADDR2_RX_ADDR2_RX USB_ADDR2_RX_ADDR2_RX_Msk


#define USB_ADDR3_RX_ADDR3_RX_Pos (1U)
#define USB_ADDR3_RX_ADDR3_RX_Msk (0x7FFFU << USB_ADDR3_RX_ADDR3_RX_Pos)
#define USB_ADDR3_RX_ADDR3_RX USB_ADDR3_RX_ADDR3_RX_Msk


#define USB_ADDR4_RX_ADDR4_RX_Pos (1U)
#define USB_ADDR4_RX_ADDR4_RX_Msk (0x7FFFU << USB_ADDR4_RX_ADDR4_RX_Pos)
#define USB_ADDR4_RX_ADDR4_RX USB_ADDR4_RX_ADDR4_RX_Msk


#define USB_ADDR5_RX_ADDR5_RX_Pos (1U)
#define USB_ADDR5_RX_ADDR5_RX_Msk (0x7FFFU << USB_ADDR5_RX_ADDR5_RX_Pos)
#define USB_ADDR5_RX_ADDR5_RX USB_ADDR5_RX_ADDR5_RX_Msk


#define USB_ADDR6_RX_ADDR6_RX_Pos (1U)
#define USB_ADDR6_RX_ADDR6_RX_Msk (0x7FFFU << USB_ADDR6_RX_ADDR6_RX_Pos)
#define USB_ADDR6_RX_ADDR6_RX USB_ADDR6_RX_ADDR6_RX_Msk


#define USB_ADDR7_RX_ADDR7_RX_Pos (1U)
#define USB_ADDR7_RX_ADDR7_RX_Msk (0x7FFFU << USB_ADDR7_RX_ADDR7_RX_Pos)
#define USB_ADDR7_RX_ADDR7_RX USB_ADDR7_RX_ADDR7_RX_Msk




#define USB_COUNT0_RX_COUNT0_RX_Pos (0U)
#define USB_COUNT0_RX_COUNT0_RX_Msk (0x3FFU << USB_COUNT0_RX_COUNT0_RX_Pos)
#define USB_COUNT0_RX_COUNT0_RX USB_COUNT0_RX_COUNT0_RX_Msk

#define USB_COUNT0_RX_NUM_BLOCK_Pos (10U)
#define USB_COUNT0_RX_NUM_BLOCK_Msk (0x1FU << USB_COUNT0_RX_NUM_BLOCK_Pos)
#define USB_COUNT0_RX_NUM_BLOCK USB_COUNT0_RX_NUM_BLOCK_Msk
#define USB_COUNT0_RX_NUM_BLOCK_0 (0x01U << USB_COUNT0_RX_NUM_BLOCK_Pos)
#define USB_COUNT0_RX_NUM_BLOCK_1 (0x02U << USB_COUNT0_RX_NUM_BLOCK_Pos)
#define USB_COUNT0_RX_NUM_BLOCK_2 (0x04U << USB_COUNT0_RX_NUM_BLOCK_Pos)
#define USB_COUNT0_RX_NUM_BLOCK_3 (0x08U << USB_COUNT0_RX_NUM_BLOCK_Pos)
#define USB_COUNT0_RX_NUM_BLOCK_4 (0x10U << USB_COUNT0_RX_NUM_BLOCK_Pos)

#define USB_COUNT0_RX_BLSIZE_Pos (15U)
#define USB_COUNT0_RX_BLSIZE_Msk (0x1U << USB_COUNT0_RX_BLSIZE_Pos)
#define USB_COUNT0_RX_BLSIZE USB_COUNT0_RX_BLSIZE_Msk


#define USB_COUNT1_RX_COUNT1_RX_Pos (0U)
#define USB_COUNT1_RX_COUNT1_RX_Msk (0x3FFU << USB_COUNT1_RX_COUNT1_RX_Pos)
#define USB_COUNT1_RX_COUNT1_RX USB_COUNT1_RX_COUNT1_RX_Msk

#define USB_COUNT1_RX_NUM_BLOCK_Pos (10U)
#define USB_COUNT1_RX_NUM_BLOCK_Msk (0x1FU << USB_COUNT1_RX_NUM_BLOCK_Pos)
#define USB_COUNT1_RX_NUM_BLOCK USB_COUNT1_RX_NUM_BLOCK_Msk
#define USB_COUNT1_RX_NUM_BLOCK_0 (0x01U << USB_COUNT1_RX_NUM_BLOCK_Pos)
#define USB_COUNT1_RX_NUM_BLOCK_1 (0x02U << USB_COUNT1_RX_NUM_BLOCK_Pos)
#define USB_COUNT1_RX_NUM_BLOCK_2 (0x04U << USB_COUNT1_RX_NUM_BLOCK_Pos)
#define USB_COUNT1_RX_NUM_BLOCK_3 (0x08U << USB_COUNT1_RX_NUM_BLOCK_Pos)
#define USB_COUNT1_RX_NUM_BLOCK_4 (0x10U << USB_COUNT1_RX_NUM_BLOCK_Pos)

#define USB_COUNT1_RX_BLSIZE_Pos (15U)
#define USB_COUNT1_RX_BLSIZE_Msk (0x1U << USB_COUNT1_RX_BLSIZE_Pos)
#define USB_COUNT1_RX_BLSIZE USB_COUNT1_RX_BLSIZE_Msk


#define USB_COUNT2_RX_COUNT2_RX_Pos (0U)
#define USB_COUNT2_RX_COUNT2_RX_Msk (0x3FFU << USB_COUNT2_RX_COUNT2_RX_Pos)
#define USB_COUNT2_RX_COUNT2_RX USB_COUNT2_RX_COUNT2_RX_Msk

#define USB_COUNT2_RX_NUM_BLOCK_Pos (10U)
#define USB_COUNT2_RX_NUM_BLOCK_Msk (0x1FU << USB_COUNT2_RX_NUM_BLOCK_Pos)
#define USB_COUNT2_RX_NUM_BLOCK USB_COUNT2_RX_NUM_BLOCK_Msk
#define USB_COUNT2_RX_NUM_BLOCK_0 (0x01U << USB_COUNT2_RX_NUM_BLOCK_Pos)
#define USB_COUNT2_RX_NUM_BLOCK_1 (0x02U << USB_COUNT2_RX_NUM_BLOCK_Pos)
#define USB_COUNT2_RX_NUM_BLOCK_2 (0x04U << USB_COUNT2_RX_NUM_BLOCK_Pos)
#define USB_COUNT2_RX_NUM_BLOCK_3 (0x08U << USB_COUNT2_RX_NUM_BLOCK_Pos)
#define USB_COUNT2_RX_NUM_BLOCK_4 (0x10U << USB_COUNT2_RX_NUM_BLOCK_Pos)

#define USB_COUNT2_RX_BLSIZE_Pos (15U)
#define USB_COUNT2_RX_BLSIZE_Msk (0x1U << USB_COUNT2_RX_BLSIZE_Pos)
#define USB_COUNT2_RX_BLSIZE USB_COUNT2_RX_BLSIZE_Msk


#define USB_COUNT3_RX_COUNT3_RX_Pos (0U)
#define USB_COUNT3_RX_COUNT3_RX_Msk (0x3FFU << USB_COUNT3_RX_COUNT3_RX_Pos)
#define USB_COUNT3_RX_COUNT3_RX USB_COUNT3_RX_COUNT3_RX_Msk

#define USB_COUNT3_RX_NUM_BLOCK_Pos (10U)
#define USB_COUNT3_RX_NUM_BLOCK_Msk (0x1FU << USB_COUNT3_RX_NUM_BLOCK_Pos)
#define USB_COUNT3_RX_NUM_BLOCK USB_COUNT3_RX_NUM_BLOCK_Msk
#define USB_COUNT3_RX_NUM_BLOCK_0 (0x01U << USB_COUNT3_RX_NUM_BLOCK_Pos)
#define USB_COUNT3_RX_NUM_BLOCK_1 (0x02U << USB_COUNT3_RX_NUM_BLOCK_Pos)
#define USB_COUNT3_RX_NUM_BLOCK_2 (0x04U << USB_COUNT3_RX_NUM_BLOCK_Pos)
#define USB_COUNT3_RX_NUM_BLOCK_3 (0x08U << USB_COUNT3_RX_NUM_BLOCK_Pos)
#define USB_COUNT3_RX_NUM_BLOCK_4 (0x10U << USB_COUNT3_RX_NUM_BLOCK_Pos)

#define USB_COUNT3_RX_BLSIZE_Pos (15U)
#define USB_COUNT3_RX_BLSIZE_Msk (0x1U << USB_COUNT3_RX_BLSIZE_Pos)
#define USB_COUNT3_RX_BLSIZE USB_COUNT3_RX_BLSIZE_Msk


#define USB_COUNT4_RX_COUNT4_RX_Pos (0U)
#define USB_COUNT4_RX_COUNT4_RX_Msk (0x3FFU << USB_COUNT4_RX_COUNT4_RX_Pos)
#define USB_COUNT4_RX_COUNT4_RX USB_COUNT4_RX_COUNT4_RX_Msk

#define USB_COUNT4_RX_NUM_BLOCK_Pos (10U)
#define USB_COUNT4_RX_NUM_BLOCK_Msk (0x1FU << USB_COUNT4_RX_NUM_BLOCK_Pos)
#define USB_COUNT4_RX_NUM_BLOCK USB_COUNT4_RX_NUM_BLOCK_Msk
#define USB_COUNT4_RX_NUM_BLOCK_0 (0x01U << USB_COUNT4_RX_NUM_BLOCK_Pos)
#define USB_COUNT4_RX_NUM_BLOCK_1 (0x02U << USB_COUNT4_RX_NUM_BLOCK_Pos)
#define USB_COUNT4_RX_NUM_BLOCK_2 (0x04U << USB_COUNT4_RX_NUM_BLOCK_Pos)
#define USB_COUNT4_RX_NUM_BLOCK_3 (0x08U << USB_COUNT4_RX_NUM_BLOCK_Pos)
#define USB_COUNT4_RX_NUM_BLOCK_4 (0x10U << USB_COUNT4_RX_NUM_BLOCK_Pos)

#define USB_COUNT4_RX_BLSIZE_Pos (15U)
#define USB_COUNT4_RX_BLSIZE_Msk (0x1U << USB_COUNT4_RX_BLSIZE_Pos)
#define USB_COUNT4_RX_BLSIZE USB_COUNT4_RX_BLSIZE_Msk


#define USB_COUNT5_RX_COUNT5_RX_Pos (0U)
#define USB_COUNT5_RX_COUNT5_RX_Msk (0x3FFU << USB_COUNT5_RX_COUNT5_RX_Pos)
#define USB_COUNT5_RX_COUNT5_RX USB_COUNT5_RX_COUNT5_RX_Msk

#define USB_COUNT5_RX_NUM_BLOCK_Pos (10U)
#define USB_COUNT5_RX_NUM_BLOCK_Msk (0x1FU << USB_COUNT5_RX_NUM_BLOCK_Pos)
#define USB_COUNT5_RX_NUM_BLOCK USB_COUNT5_RX_NUM_BLOCK_Msk
#define USB_COUNT5_RX_NUM_BLOCK_0 (0x01U << USB_COUNT5_RX_NUM_BLOCK_Pos)
#define USB_COUNT5_RX_NUM_BLOCK_1 (0x02U << USB_COUNT5_RX_NUM_BLOCK_Pos)
#define USB_COUNT5_RX_NUM_BLOCK_2 (0x04U << USB_COUNT5_RX_NUM_BLOCK_Pos)
#define USB_COUNT5_RX_NUM_BLOCK_3 (0x08U << USB_COUNT5_RX_NUM_BLOCK_Pos)
#define USB_COUNT5_RX_NUM_BLOCK_4 (0x10U << USB_COUNT5_RX_NUM_BLOCK_Pos)

#define USB_COUNT5_RX_BLSIZE_Pos (15U)
#define USB_COUNT5_RX_BLSIZE_Msk (0x1U << USB_COUNT5_RX_BLSIZE_Pos)
#define USB_COUNT5_RX_BLSIZE USB_COUNT5_RX_BLSIZE_Msk


#define USB_COUNT6_RX_COUNT6_RX_Pos (0U)
#define USB_COUNT6_RX_COUNT6_RX_Msk (0x3FFU << USB_COUNT6_RX_COUNT6_RX_Pos)
#define USB_COUNT6_RX_COUNT6_RX USB_COUNT6_RX_COUNT6_RX_Msk

#define USB_COUNT6_RX_NUM_BLOCK_Pos (10U)
#define USB_COUNT6_RX_NUM_BLOCK_Msk (0x1FU << USB_COUNT6_RX_NUM_BLOCK_Pos)
#define USB_COUNT6_RX_NUM_BLOCK USB_COUNT6_RX_NUM_BLOCK_Msk
#define USB_COUNT6_RX_NUM_BLOCK_0 (0x01U << USB_COUNT6_RX_NUM_BLOCK_Pos)
#define USB_COUNT6_RX_NUM_BLOCK_1 (0x02U << USB_COUNT6_RX_NUM_BLOCK_Pos)
#define USB_COUNT6_RX_NUM_BLOCK_2 (0x04U << USB_COUNT6_RX_NUM_BLOCK_Pos)
#define USB_COUNT6_RX_NUM_BLOCK_3 (0x08U << USB_COUNT6_RX_NUM_BLOCK_Pos)
#define USB_COUNT6_RX_NUM_BLOCK_4 (0x10U << USB_COUNT6_RX_NUM_BLOCK_Pos)

#define USB_COUNT6_RX_BLSIZE_Pos (15U)
#define USB_COUNT6_RX_BLSIZE_Msk (0x1U << USB_COUNT6_RX_BLSIZE_Pos)
#define USB_COUNT6_RX_BLSIZE USB_COUNT6_RX_BLSIZE_Msk


#define USB_COUNT7_RX_COUNT7_RX_Pos (0U)
#define USB_COUNT7_RX_COUNT7_RX_Msk (0x3FFU << USB_COUNT7_RX_COUNT7_RX_Pos)
#define USB_COUNT7_RX_COUNT7_RX USB_COUNT7_RX_COUNT7_RX_Msk

#define USB_COUNT7_RX_NUM_BLOCK_Pos (10U)
#define USB_COUNT7_RX_NUM_BLOCK_Msk (0x1FU << USB_COUNT7_RX_NUM_BLOCK_Pos)
#define USB_COUNT7_RX_NUM_BLOCK USB_COUNT7_RX_NUM_BLOCK_Msk
#define USB_COUNT7_RX_NUM_BLOCK_0 (0x01U << USB_COUNT7_RX_NUM_BLOCK_Pos)
#define USB_COUNT7_RX_NUM_BLOCK_1 (0x02U << USB_COUNT7_RX_NUM_BLOCK_Pos)
#define USB_COUNT7_RX_NUM_BLOCK_2 (0x04U << USB_COUNT7_RX_NUM_BLOCK_Pos)
#define USB_COUNT7_RX_NUM_BLOCK_3 (0x08U << USB_COUNT7_RX_NUM_BLOCK_Pos)
#define USB_COUNT7_RX_NUM_BLOCK_4 (0x10U << USB_COUNT7_RX_NUM_BLOCK_Pos)

#define USB_COUNT7_RX_BLSIZE_Pos (15U)
#define USB_COUNT7_RX_BLSIZE_Msk (0x1U << USB_COUNT7_RX_BLSIZE_Pos)
#define USB_COUNT7_RX_BLSIZE USB_COUNT7_RX_BLSIZE_Msk




#define USB_COUNT0_RX_0_COUNT0_RX_0 0x000003FFU

#define USB_COUNT0_RX_0_NUM_BLOCK_0 0x00007C00U
#define USB_COUNT0_RX_0_NUM_BLOCK_0_0 0x00000400U
#define USB_COUNT0_RX_0_NUM_BLOCK_0_1 0x00000800U
#define USB_COUNT0_RX_0_NUM_BLOCK_0_2 0x00001000U
#define USB_COUNT0_RX_0_NUM_BLOCK_0_3 0x00002000U
#define USB_COUNT0_RX_0_NUM_BLOCK_0_4 0x00004000U

#define USB_COUNT0_RX_0_BLSIZE_0 0x00008000U


#define USB_COUNT0_RX_1_COUNT0_RX_1 0x03FF0000U

#define USB_COUNT0_RX_1_NUM_BLOCK_1 0x7C000000U
#define USB_COUNT0_RX_1_NUM_BLOCK_1_0 0x04000000U
#define USB_COUNT0_RX_1_NUM_BLOCK_1_1 0x08000000U
#define USB_COUNT0_RX_1_NUM_BLOCK_1_2 0x10000000U
#define USB_COUNT0_RX_1_NUM_BLOCK_1_3 0x20000000U
#define USB_COUNT0_RX_1_NUM_BLOCK_1_4 0x40000000U

#define USB_COUNT0_RX_1_BLSIZE_1 0x80000000U


#define USB_COUNT1_RX_0_COUNT1_RX_0 0x000003FFU

#define USB_COUNT1_RX_0_NUM_BLOCK_0 0x00007C00U
#define USB_COUNT1_RX_0_NUM_BLOCK_0_0 0x00000400U
#define USB_COUNT1_RX_0_NUM_BLOCK_0_1 0x00000800U
#define USB_COUNT1_RX_0_NUM_BLOCK_0_2 0x00001000U
#define USB_COUNT1_RX_0_NUM_BLOCK_0_3 0x00002000U
#define USB_COUNT1_RX_0_NUM_BLOCK_0_4 0x00004000U

#define USB_COUNT1_RX_0_BLSIZE_0 0x00008000U


#define USB_COUNT1_RX_1_COUNT1_RX_1 0x03FF0000U

#define USB_COUNT1_RX_1_NUM_BLOCK_1 0x7C000000U
#define USB_COUNT1_RX_1_NUM_BLOCK_1_0 0x04000000U
#define USB_COUNT1_RX_1_NUM_BLOCK_1_1 0x08000000U
#define USB_COUNT1_RX_1_NUM_BLOCK_1_2 0x10000000U
#define USB_COUNT1_RX_1_NUM_BLOCK_1_3 0x20000000U
#define USB_COUNT1_RX_1_NUM_BLOCK_1_4 0x40000000U

#define USB_COUNT1_RX_1_BLSIZE_1 0x80000000U


#define USB_COUNT2_RX_0_COUNT2_RX_0 0x000003FFU

#define USB_COUNT2_RX_0_NUM_BLOCK_0 0x00007C00U
#define USB_COUNT2_RX_0_NUM_BLOCK_0_0 0x00000400U
#define USB_COUNT2_RX_0_NUM_BLOCK_0_1 0x00000800U
#define USB_COUNT2_RX_0_NUM_BLOCK_0_2 0x00001000U
#define USB_COUNT2_RX_0_NUM_BLOCK_0_3 0x00002000U
#define USB_COUNT2_RX_0_NUM_BLOCK_0_4 0x00004000U

#define USB_COUNT2_RX_0_BLSIZE_0 0x00008000U


#define USB_COUNT2_RX_1_COUNT2_RX_1 0x03FF0000U

#define USB_COUNT2_RX_1_NUM_BLOCK_1 0x7C000000U
#define USB_COUNT2_RX_1_NUM_BLOCK_1_0 0x04000000U
#define USB_COUNT2_RX_1_NUM_BLOCK_1_1 0x08000000U
#define USB_COUNT2_RX_1_NUM_BLOCK_1_2 0x10000000U
#define USB_COUNT2_RX_1_NUM_BLOCK_1_3 0x20000000U
#define USB_COUNT2_RX_1_NUM_BLOCK_1_4 0x40000000U

#define USB_COUNT2_RX_1_BLSIZE_1 0x80000000U


#define USB_COUNT3_RX_0_COUNT3_RX_0 0x000003FFU

#define USB_COUNT3_RX_0_NUM_BLOCK_0 0x00007C00U
#define USB_COUNT3_RX_0_NUM_BLOCK_0_0 0x00000400U
#define USB_COUNT3_RX_0_NUM_BLOCK_0_1 0x00000800U
#define USB_COUNT3_RX_0_NUM_BLOCK_0_2 0x00001000U
#define USB_COUNT3_RX_0_NUM_BLOCK_0_3 0x00002000U
#define USB_COUNT3_RX_0_NUM_BLOCK_0_4 0x00004000U

#define USB_COUNT3_RX_0_BLSIZE_0 0x00008000U


#define USB_COUNT3_RX_1_COUNT3_RX_1 0x03FF0000U

#define USB_COUNT3_RX_1_NUM_BLOCK_1 0x7C000000U
#define USB_COUNT3_RX_1_NUM_BLOCK_1_0 0x04000000U
#define USB_COUNT3_RX_1_NUM_BLOCK_1_1 0x08000000U
#define USB_COUNT3_RX_1_NUM_BLOCK_1_2 0x10000000U
#define USB_COUNT3_RX_1_NUM_BLOCK_1_3 0x20000000U
#define USB_COUNT3_RX_1_NUM_BLOCK_1_4 0x40000000U

#define USB_COUNT3_RX_1_BLSIZE_1 0x80000000U


#define USB_COUNT4_RX_0_COUNT4_RX_0 0x000003FFU

#define USB_COUNT4_RX_0_NUM_BLOCK_0 0x00007C00U
#define USB_COUNT4_RX_0_NUM_BLOCK_0_0 0x00000400U
#define USB_COUNT4_RX_0_NUM_BLOCK_0_1 0x00000800U
#define USB_COUNT4_RX_0_NUM_BLOCK_0_2 0x00001000U
#define USB_COUNT4_RX_0_NUM_BLOCK_0_3 0x00002000U
#define USB_COUNT4_RX_0_NUM_BLOCK_0_4 0x00004000U

#define USB_COUNT4_RX_0_BLSIZE_0 0x00008000U


#define USB_COUNT4_RX_1_COUNT4_RX_1 0x03FF0000U

#define USB_COUNT4_RX_1_NUM_BLOCK_1 0x7C000000U
#define USB_COUNT4_RX_1_NUM_BLOCK_1_0 0x04000000U
#define USB_COUNT4_RX_1_NUM_BLOCK_1_1 0x08000000U
#define USB_COUNT4_RX_1_NUM_BLOCK_1_2 0x10000000U
#define USB_COUNT4_RX_1_NUM_BLOCK_1_3 0x20000000U
#define USB_COUNT4_RX_1_NUM_BLOCK_1_4 0x40000000U

#define USB_COUNT4_RX_1_BLSIZE_1 0x80000000U


#define USB_COUNT5_RX_0_COUNT5_RX_0 0x000003FFU

#define USB_COUNT5_RX_0_NUM_BLOCK_0 0x00007C00U
#define USB_COUNT5_RX_0_NUM_BLOCK_0_0 0x00000400U
#define USB_COUNT5_RX_0_NUM_BLOCK_0_1 0x00000800U
#define USB_COUNT5_RX_0_NUM_BLOCK_0_2 0x00001000U
#define USB_COUNT5_RX_0_NUM_BLOCK_0_3 0x00002000U
#define USB_COUNT5_RX_0_NUM_BLOCK_0_4 0x00004000U

#define USB_COUNT5_RX_0_BLSIZE_0 0x00008000U


#define USB_COUNT5_RX_1_COUNT5_RX_1 0x03FF0000U

#define USB_COUNT5_RX_1_NUM_BLOCK_1 0x7C000000U
#define USB_COUNT5_RX_1_NUM_BLOCK_1_0 0x04000000U
#define USB_COUNT5_RX_1_NUM_BLOCK_1_1 0x08000000U
#define USB_COUNT5_RX_1_NUM_BLOCK_1_2 0x10000000U
#define USB_COUNT5_RX_1_NUM_BLOCK_1_3 0x20000000U
#define USB_COUNT5_RX_1_NUM_BLOCK_1_4 0x40000000U

#define USB_COUNT5_RX_1_BLSIZE_1 0x80000000U


#define USB_COUNT6_RX_0_COUNT6_RX_0 0x000003FFU

#define USB_COUNT6_RX_0_NUM_BLOCK_0 0x00007C00U
#define USB_COUNT6_RX_0_NUM_BLOCK_0_0 0x00000400U
#define USB_COUNT6_RX_0_NUM_BLOCK_0_1 0x00000800U
#define USB_COUNT6_RX_0_NUM_BLOCK_0_2 0x00001000U
#define USB_COUNT6_RX_0_NUM_BLOCK_0_3 0x00002000U
#define USB_COUNT6_RX_0_NUM_BLOCK_0_4 0x00004000U

#define USB_COUNT6_RX_0_BLSIZE_0 0x00008000U


#define USB_COUNT6_RX_1_COUNT6_RX_1 0x03FF0000U

#define USB_COUNT6_RX_1_NUM_BLOCK_1 0x7C000000U
#define USB_COUNT6_RX_1_NUM_BLOCK_1_0 0x04000000U
#define USB_COUNT6_RX_1_NUM_BLOCK_1_1 0x08000000U
#define USB_COUNT6_RX_1_NUM_BLOCK_1_2 0x10000000U
#define USB_COUNT6_RX_1_NUM_BLOCK_1_3 0x20000000U
#define USB_COUNT6_RX_1_NUM_BLOCK_1_4 0x40000000U

#define USB_COUNT6_RX_1_BLSIZE_1 0x80000000U


#define USB_COUNT7_RX_0_COUNT7_RX_0 0x000003FFU

#define USB_COUNT7_RX_0_NUM_BLOCK_0 0x00007C00U
#define USB_COUNT7_RX_0_NUM_BLOCK_0_0 0x00000400U
#define USB_COUNT7_RX_0_NUM_BLOCK_0_1 0x00000800U
#define USB_COUNT7_RX_0_NUM_BLOCK_0_2 0x00001000U
#define USB_COUNT7_RX_0_NUM_BLOCK_0_3 0x00002000U
#define USB_COUNT7_RX_0_NUM_BLOCK_0_4 0x00004000U

#define USB_COUNT7_RX_0_BLSIZE_0 0x00008000U


#define USB_COUNT7_RX_1_COUNT7_RX_1 0x03FF0000U

#define USB_COUNT7_RX_1_NUM_BLOCK_1 0x7C000000U
#define USB_COUNT7_RX_1_NUM_BLOCK_1_0 0x04000000U
#define USB_COUNT7_RX_1_NUM_BLOCK_1_1 0x08000000U
#define USB_COUNT7_RX_1_NUM_BLOCK_1_2 0x10000000U
#define USB_COUNT7_RX_1_NUM_BLOCK_1_3 0x20000000U
#define USB_COUNT7_RX_1_NUM_BLOCK_1_4 0x40000000U

#define USB_COUNT7_RX_1_BLSIZE_1 0x80000000U
# 6000 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define CAN_MCR_INRQ_Pos (0U)
#define CAN_MCR_INRQ_Msk (0x1U << CAN_MCR_INRQ_Pos)
#define CAN_MCR_INRQ CAN_MCR_INRQ_Msk
#define CAN_MCR_SLEEP_Pos (1U)
#define CAN_MCR_SLEEP_Msk (0x1U << CAN_MCR_SLEEP_Pos)
#define CAN_MCR_SLEEP CAN_MCR_SLEEP_Msk
#define CAN_MCR_TXFP_Pos (2U)
#define CAN_MCR_TXFP_Msk (0x1U << CAN_MCR_TXFP_Pos)
#define CAN_MCR_TXFP CAN_MCR_TXFP_Msk
#define CAN_MCR_RFLM_Pos (3U)
#define CAN_MCR_RFLM_Msk (0x1U << CAN_MCR_RFLM_Pos)
#define CAN_MCR_RFLM CAN_MCR_RFLM_Msk
#define CAN_MCR_NART_Pos (4U)
#define CAN_MCR_NART_Msk (0x1U << CAN_MCR_NART_Pos)
#define CAN_MCR_NART CAN_MCR_NART_Msk
#define CAN_MCR_AWUM_Pos (5U)
#define CAN_MCR_AWUM_Msk (0x1U << CAN_MCR_AWUM_Pos)
#define CAN_MCR_AWUM CAN_MCR_AWUM_Msk
#define CAN_MCR_ABOM_Pos (6U)
#define CAN_MCR_ABOM_Msk (0x1U << CAN_MCR_ABOM_Pos)
#define CAN_MCR_ABOM CAN_MCR_ABOM_Msk
#define CAN_MCR_TTCM_Pos (7U)
#define CAN_MCR_TTCM_Msk (0x1U << CAN_MCR_TTCM_Pos)
#define CAN_MCR_TTCM CAN_MCR_TTCM_Msk
#define CAN_MCR_RESET_Pos (15U)
#define CAN_MCR_RESET_Msk (0x1U << CAN_MCR_RESET_Pos)
#define CAN_MCR_RESET CAN_MCR_RESET_Msk
#define CAN_MCR_DBF_Pos (16U)
#define CAN_MCR_DBF_Msk (0x1U << CAN_MCR_DBF_Pos)
#define CAN_MCR_DBF CAN_MCR_DBF_Msk


#define CAN_MSR_INAK_Pos (0U)
#define CAN_MSR_INAK_Msk (0x1U << CAN_MSR_INAK_Pos)
#define CAN_MSR_INAK CAN_MSR_INAK_Msk
#define CAN_MSR_SLAK_Pos (1U)
#define CAN_MSR_SLAK_Msk (0x1U << CAN_MSR_SLAK_Pos)
#define CAN_MSR_SLAK CAN_MSR_SLAK_Msk
#define CAN_MSR_ERRI_Pos (2U)
#define CAN_MSR_ERRI_Msk (0x1U << CAN_MSR_ERRI_Pos)
#define CAN_MSR_ERRI CAN_MSR_ERRI_Msk
#define CAN_MSR_WKUI_Pos (3U)
#define CAN_MSR_WKUI_Msk (0x1U << CAN_MSR_WKUI_Pos)
#define CAN_MSR_WKUI CAN_MSR_WKUI_Msk
#define CAN_MSR_SLAKI_Pos (4U)
#define CAN_MSR_SLAKI_Msk (0x1U << CAN_MSR_SLAKI_Pos)
#define CAN_MSR_SLAKI CAN_MSR_SLAKI_Msk
#define CAN_MSR_TXM_Pos (8U)
#define CAN_MSR_TXM_Msk (0x1U << CAN_MSR_TXM_Pos)
#define CAN_MSR_TXM CAN_MSR_TXM_Msk
#define CAN_MSR_RXM_Pos (9U)
#define CAN_MSR_RXM_Msk (0x1U << CAN_MSR_RXM_Pos)
#define CAN_MSR_RXM CAN_MSR_RXM_Msk
#define CAN_MSR_SAMP_Pos (10U)
#define CAN_MSR_SAMP_Msk (0x1U << CAN_MSR_SAMP_Pos)
#define CAN_MSR_SAMP CAN_MSR_SAMP_Msk
#define CAN_MSR_RX_Pos (11U)
#define CAN_MSR_RX_Msk (0x1U << CAN_MSR_RX_Pos)
#define CAN_MSR_RX CAN_MSR_RX_Msk


#define CAN_TSR_RQCP0_Pos (0U)
#define CAN_TSR_RQCP0_Msk (0x1U << CAN_TSR_RQCP0_Pos)
#define CAN_TSR_RQCP0 CAN_TSR_RQCP0_Msk
#define CAN_TSR_TXOK0_Pos (1U)
#define CAN_TSR_TXOK0_Msk (0x1U << CAN_TSR_TXOK0_Pos)
#define CAN_TSR_TXOK0 CAN_TSR_TXOK0_Msk
#define CAN_TSR_ALST0_Pos (2U)
#define CAN_TSR_ALST0_Msk (0x1U << CAN_TSR_ALST0_Pos)
#define CAN_TSR_ALST0 CAN_TSR_ALST0_Msk
#define CAN_TSR_TERR0_Pos (3U)
#define CAN_TSR_TERR0_Msk (0x1U << CAN_TSR_TERR0_Pos)
#define CAN_TSR_TERR0 CAN_TSR_TERR0_Msk
#define CAN_TSR_ABRQ0_Pos (7U)
#define CAN_TSR_ABRQ0_Msk (0x1U << CAN_TSR_ABRQ0_Pos)
#define CAN_TSR_ABRQ0 CAN_TSR_ABRQ0_Msk
#define CAN_TSR_RQCP1_Pos (8U)
#define CAN_TSR_RQCP1_Msk (0x1U << CAN_TSR_RQCP1_Pos)
#define CAN_TSR_RQCP1 CAN_TSR_RQCP1_Msk
#define CAN_TSR_TXOK1_Pos (9U)
#define CAN_TSR_TXOK1_Msk (0x1U << CAN_TSR_TXOK1_Pos)
#define CAN_TSR_TXOK1 CAN_TSR_TXOK1_Msk
#define CAN_TSR_ALST1_Pos (10U)
#define CAN_TSR_ALST1_Msk (0x1U << CAN_TSR_ALST1_Pos)
#define CAN_TSR_ALST1 CAN_TSR_ALST1_Msk
#define CAN_TSR_TERR1_Pos (11U)
#define CAN_TSR_TERR1_Msk (0x1U << CAN_TSR_TERR1_Pos)
#define CAN_TSR_TERR1 CAN_TSR_TERR1_Msk
#define CAN_TSR_ABRQ1_Pos (15U)
#define CAN_TSR_ABRQ1_Msk (0x1U << CAN_TSR_ABRQ1_Pos)
#define CAN_TSR_ABRQ1 CAN_TSR_ABRQ1_Msk
#define CAN_TSR_RQCP2_Pos (16U)
#define CAN_TSR_RQCP2_Msk (0x1U << CAN_TSR_RQCP2_Pos)
#define CAN_TSR_RQCP2 CAN_TSR_RQCP2_Msk
#define CAN_TSR_TXOK2_Pos (17U)
#define CAN_TSR_TXOK2_Msk (0x1U << CAN_TSR_TXOK2_Pos)
#define CAN_TSR_TXOK2 CAN_TSR_TXOK2_Msk
#define CAN_TSR_ALST2_Pos (18U)
#define CAN_TSR_ALST2_Msk (0x1U << CAN_TSR_ALST2_Pos)
#define CAN_TSR_ALST2 CAN_TSR_ALST2_Msk
#define CAN_TSR_TERR2_Pos (19U)
#define CAN_TSR_TERR2_Msk (0x1U << CAN_TSR_TERR2_Pos)
#define CAN_TSR_TERR2 CAN_TSR_TERR2_Msk
#define CAN_TSR_ABRQ2_Pos (23U)
#define CAN_TSR_ABRQ2_Msk (0x1U << CAN_TSR_ABRQ2_Pos)
#define CAN_TSR_ABRQ2 CAN_TSR_ABRQ2_Msk
#define CAN_TSR_CODE_Pos (24U)
#define CAN_TSR_CODE_Msk (0x3U << CAN_TSR_CODE_Pos)
#define CAN_TSR_CODE CAN_TSR_CODE_Msk

#define CAN_TSR_TME_Pos (26U)
#define CAN_TSR_TME_Msk (0x7U << CAN_TSR_TME_Pos)
#define CAN_TSR_TME CAN_TSR_TME_Msk
#define CAN_TSR_TME0_Pos (26U)
#define CAN_TSR_TME0_Msk (0x1U << CAN_TSR_TME0_Pos)
#define CAN_TSR_TME0 CAN_TSR_TME0_Msk
#define CAN_TSR_TME1_Pos (27U)
#define CAN_TSR_TME1_Msk (0x1U << CAN_TSR_TME1_Pos)
#define CAN_TSR_TME1 CAN_TSR_TME1_Msk
#define CAN_TSR_TME2_Pos (28U)
#define CAN_TSR_TME2_Msk (0x1U << CAN_TSR_TME2_Pos)
#define CAN_TSR_TME2 CAN_TSR_TME2_Msk

#define CAN_TSR_LOW_Pos (29U)
#define CAN_TSR_LOW_Msk (0x7U << CAN_TSR_LOW_Pos)
#define CAN_TSR_LOW CAN_TSR_LOW_Msk
#define CAN_TSR_LOW0_Pos (29U)
#define CAN_TSR_LOW0_Msk (0x1U << CAN_TSR_LOW0_Pos)
#define CAN_TSR_LOW0 CAN_TSR_LOW0_Msk
#define CAN_TSR_LOW1_Pos (30U)
#define CAN_TSR_LOW1_Msk (0x1U << CAN_TSR_LOW1_Pos)
#define CAN_TSR_LOW1 CAN_TSR_LOW1_Msk
#define CAN_TSR_LOW2_Pos (31U)
#define CAN_TSR_LOW2_Msk (0x1U << CAN_TSR_LOW2_Pos)
#define CAN_TSR_LOW2 CAN_TSR_LOW2_Msk


#define CAN_RF0R_FMP0_Pos (0U)
#define CAN_RF0R_FMP0_Msk (0x3U << CAN_RF0R_FMP0_Pos)
#define CAN_RF0R_FMP0 CAN_RF0R_FMP0_Msk
#define CAN_RF0R_FULL0_Pos (3U)
#define CAN_RF0R_FULL0_Msk (0x1U << CAN_RF0R_FULL0_Pos)
#define CAN_RF0R_FULL0 CAN_RF0R_FULL0_Msk
#define CAN_RF0R_FOVR0_Pos (4U)
#define CAN_RF0R_FOVR0_Msk (0x1U << CAN_RF0R_FOVR0_Pos)
#define CAN_RF0R_FOVR0 CAN_RF0R_FOVR0_Msk
#define CAN_RF0R_RFOM0_Pos (5U)
#define CAN_RF0R_RFOM0_Msk (0x1U << CAN_RF0R_RFOM0_Pos)
#define CAN_RF0R_RFOM0 CAN_RF0R_RFOM0_Msk


#define CAN_RF1R_FMP1_Pos (0U)
#define CAN_RF1R_FMP1_Msk (0x3U << CAN_RF1R_FMP1_Pos)
#define CAN_RF1R_FMP1 CAN_RF1R_FMP1_Msk
#define CAN_RF1R_FULL1_Pos (3U)
#define CAN_RF1R_FULL1_Msk (0x1U << CAN_RF1R_FULL1_Pos)
#define CAN_RF1R_FULL1 CAN_RF1R_FULL1_Msk
#define CAN_RF1R_FOVR1_Pos (4U)
#define CAN_RF1R_FOVR1_Msk (0x1U << CAN_RF1R_FOVR1_Pos)
#define CAN_RF1R_FOVR1 CAN_RF1R_FOVR1_Msk
#define CAN_RF1R_RFOM1_Pos (5U)
#define CAN_RF1R_RFOM1_Msk (0x1U << CAN_RF1R_RFOM1_Pos)
#define CAN_RF1R_RFOM1 CAN_RF1R_RFOM1_Msk


#define CAN_IER_TMEIE_Pos (0U)
#define CAN_IER_TMEIE_Msk (0x1U << CAN_IER_TMEIE_Pos)
#define CAN_IER_TMEIE CAN_IER_TMEIE_Msk
#define CAN_IER_FMPIE0_Pos (1U)
#define CAN_IER_FMPIE0_Msk (0x1U << CAN_IER_FMPIE0_Pos)
#define CAN_IER_FMPIE0 CAN_IER_FMPIE0_Msk
#define CAN_IER_FFIE0_Pos (2U)
#define CAN_IER_FFIE0_Msk (0x1U << CAN_IER_FFIE0_Pos)
#define CAN_IER_FFIE0 CAN_IER_FFIE0_Msk
#define CAN_IER_FOVIE0_Pos (3U)
#define CAN_IER_FOVIE0_Msk (0x1U << CAN_IER_FOVIE0_Pos)
#define CAN_IER_FOVIE0 CAN_IER_FOVIE0_Msk
#define CAN_IER_FMPIE1_Pos (4U)
#define CAN_IER_FMPIE1_Msk (0x1U << CAN_IER_FMPIE1_Pos)
#define CAN_IER_FMPIE1 CAN_IER_FMPIE1_Msk
#define CAN_IER_FFIE1_Pos (5U)
#define CAN_IER_FFIE1_Msk (0x1U << CAN_IER_FFIE1_Pos)
#define CAN_IER_FFIE1 CAN_IER_FFIE1_Msk
#define CAN_IER_FOVIE1_Pos (6U)
#define CAN_IER_FOVIE1_Msk (0x1U << CAN_IER_FOVIE1_Pos)
#define CAN_IER_FOVIE1 CAN_IER_FOVIE1_Msk
#define CAN_IER_EWGIE_Pos (8U)
#define CAN_IER_EWGIE_Msk (0x1U << CAN_IER_EWGIE_Pos)
#define CAN_IER_EWGIE CAN_IER_EWGIE_Msk
#define CAN_IER_EPVIE_Pos (9U)
#define CAN_IER_EPVIE_Msk (0x1U << CAN_IER_EPVIE_Pos)
#define CAN_IER_EPVIE CAN_IER_EPVIE_Msk
#define CAN_IER_BOFIE_Pos (10U)
#define CAN_IER_BOFIE_Msk (0x1U << CAN_IER_BOFIE_Pos)
#define CAN_IER_BOFIE CAN_IER_BOFIE_Msk
#define CAN_IER_LECIE_Pos (11U)
#define CAN_IER_LECIE_Msk (0x1U << CAN_IER_LECIE_Pos)
#define CAN_IER_LECIE CAN_IER_LECIE_Msk
#define CAN_IER_ERRIE_Pos (15U)
#define CAN_IER_ERRIE_Msk (0x1U << CAN_IER_ERRIE_Pos)
#define CAN_IER_ERRIE CAN_IER_ERRIE_Msk
#define CAN_IER_WKUIE_Pos (16U)
#define CAN_IER_WKUIE_Msk (0x1U << CAN_IER_WKUIE_Pos)
#define CAN_IER_WKUIE CAN_IER_WKUIE_Msk
#define CAN_IER_SLKIE_Pos (17U)
#define CAN_IER_SLKIE_Msk (0x1U << CAN_IER_SLKIE_Pos)
#define CAN_IER_SLKIE CAN_IER_SLKIE_Msk


#define CAN_ESR_EWGF_Pos (0U)
#define CAN_ESR_EWGF_Msk (0x1U << CAN_ESR_EWGF_Pos)
#define CAN_ESR_EWGF CAN_ESR_EWGF_Msk
#define CAN_ESR_EPVF_Pos (1U)
#define CAN_ESR_EPVF_Msk (0x1U << CAN_ESR_EPVF_Pos)
#define CAN_ESR_EPVF CAN_ESR_EPVF_Msk
#define CAN_ESR_BOFF_Pos (2U)
#define CAN_ESR_BOFF_Msk (0x1U << CAN_ESR_BOFF_Pos)
#define CAN_ESR_BOFF CAN_ESR_BOFF_Msk

#define CAN_ESR_LEC_Pos (4U)
#define CAN_ESR_LEC_Msk (0x7U << CAN_ESR_LEC_Pos)
#define CAN_ESR_LEC CAN_ESR_LEC_Msk
#define CAN_ESR_LEC_0 (0x1U << CAN_ESR_LEC_Pos)
#define CAN_ESR_LEC_1 (0x2U << CAN_ESR_LEC_Pos)
#define CAN_ESR_LEC_2 (0x4U << CAN_ESR_LEC_Pos)

#define CAN_ESR_TEC_Pos (16U)
#define CAN_ESR_TEC_Msk (0xFFU << CAN_ESR_TEC_Pos)
#define CAN_ESR_TEC CAN_ESR_TEC_Msk
#define CAN_ESR_REC_Pos (24U)
#define CAN_ESR_REC_Msk (0xFFU << CAN_ESR_REC_Pos)
#define CAN_ESR_REC CAN_ESR_REC_Msk


#define CAN_BTR_BRP_Pos (0U)
#define CAN_BTR_BRP_Msk (0x3FFU << CAN_BTR_BRP_Pos)
#define CAN_BTR_BRP CAN_BTR_BRP_Msk
#define CAN_BTR_TS1_Pos (16U)
#define CAN_BTR_TS1_Msk (0xFU << CAN_BTR_TS1_Pos)
#define CAN_BTR_TS1 CAN_BTR_TS1_Msk
#define CAN_BTR_TS1_0 (0x1U << CAN_BTR_TS1_Pos)
#define CAN_BTR_TS1_1 (0x2U << CAN_BTR_TS1_Pos)
#define CAN_BTR_TS1_2 (0x4U << CAN_BTR_TS1_Pos)
#define CAN_BTR_TS1_3 (0x8U << CAN_BTR_TS1_Pos)
#define CAN_BTR_TS2_Pos (20U)
#define CAN_BTR_TS2_Msk (0x7U << CAN_BTR_TS2_Pos)
#define CAN_BTR_TS2 CAN_BTR_TS2_Msk
#define CAN_BTR_TS2_0 (0x1U << CAN_BTR_TS2_Pos)
#define CAN_BTR_TS2_1 (0x2U << CAN_BTR_TS2_Pos)
#define CAN_BTR_TS2_2 (0x4U << CAN_BTR_TS2_Pos)
#define CAN_BTR_SJW_Pos (24U)
#define CAN_BTR_SJW_Msk (0x3U << CAN_BTR_SJW_Pos)
#define CAN_BTR_SJW CAN_BTR_SJW_Msk
#define CAN_BTR_SJW_0 (0x1U << CAN_BTR_SJW_Pos)
#define CAN_BTR_SJW_1 (0x2U << CAN_BTR_SJW_Pos)
#define CAN_BTR_LBKM_Pos (30U)
#define CAN_BTR_LBKM_Msk (0x1U << CAN_BTR_LBKM_Pos)
#define CAN_BTR_LBKM CAN_BTR_LBKM_Msk
#define CAN_BTR_SILM_Pos (31U)
#define CAN_BTR_SILM_Msk (0x1U << CAN_BTR_SILM_Pos)
#define CAN_BTR_SILM CAN_BTR_SILM_Msk



#define CAN_TI0R_TXRQ_Pos (0U)
#define CAN_TI0R_TXRQ_Msk (0x1U << CAN_TI0R_TXRQ_Pos)
#define CAN_TI0R_TXRQ CAN_TI0R_TXRQ_Msk
#define CAN_TI0R_RTR_Pos (1U)
#define CAN_TI0R_RTR_Msk (0x1U << CAN_TI0R_RTR_Pos)
#define CAN_TI0R_RTR CAN_TI0R_RTR_Msk
#define CAN_TI0R_IDE_Pos (2U)
#define CAN_TI0R_IDE_Msk (0x1U << CAN_TI0R_IDE_Pos)
#define CAN_TI0R_IDE CAN_TI0R_IDE_Msk
#define CAN_TI0R_EXID_Pos (3U)
#define CAN_TI0R_EXID_Msk (0x3FFFFU << CAN_TI0R_EXID_Pos)
#define CAN_TI0R_EXID CAN_TI0R_EXID_Msk
#define CAN_TI0R_STID_Pos (21U)
#define CAN_TI0R_STID_Msk (0x7FFU << CAN_TI0R_STID_Pos)
#define CAN_TI0R_STID CAN_TI0R_STID_Msk


#define CAN_TDT0R_DLC_Pos (0U)
#define CAN_TDT0R_DLC_Msk (0xFU << CAN_TDT0R_DLC_Pos)
#define CAN_TDT0R_DLC CAN_TDT0R_DLC_Msk
#define CAN_TDT0R_TGT_Pos (8U)
#define CAN_TDT0R_TGT_Msk (0x1U << CAN_TDT0R_TGT_Pos)
#define CAN_TDT0R_TGT CAN_TDT0R_TGT_Msk
#define CAN_TDT0R_TIME_Pos (16U)
#define CAN_TDT0R_TIME_Msk (0xFFFFU << CAN_TDT0R_TIME_Pos)
#define CAN_TDT0R_TIME CAN_TDT0R_TIME_Msk


#define CAN_TDL0R_DATA0_Pos (0U)
#define CAN_TDL0R_DATA0_Msk (0xFFU << CAN_TDL0R_DATA0_Pos)
#define CAN_TDL0R_DATA0 CAN_TDL0R_DATA0_Msk
#define CAN_TDL0R_DATA1_Pos (8U)
#define CAN_TDL0R_DATA1_Msk (0xFFU << CAN_TDL0R_DATA1_Pos)
#define CAN_TDL0R_DATA1 CAN_TDL0R_DATA1_Msk
#define CAN_TDL0R_DATA2_Pos (16U)
#define CAN_TDL0R_DATA2_Msk (0xFFU << CAN_TDL0R_DATA2_Pos)
#define CAN_TDL0R_DATA2 CAN_TDL0R_DATA2_Msk
#define CAN_TDL0R_DATA3_Pos (24U)
#define CAN_TDL0R_DATA3_Msk (0xFFU << CAN_TDL0R_DATA3_Pos)
#define CAN_TDL0R_DATA3 CAN_TDL0R_DATA3_Msk


#define CAN_TDH0R_DATA4_Pos (0U)
#define CAN_TDH0R_DATA4_Msk (0xFFU << CAN_TDH0R_DATA4_Pos)
#define CAN_TDH0R_DATA4 CAN_TDH0R_DATA4_Msk
#define CAN_TDH0R_DATA5_Pos (8U)
#define CAN_TDH0R_DATA5_Msk (0xFFU << CAN_TDH0R_DATA5_Pos)
#define CAN_TDH0R_DATA5 CAN_TDH0R_DATA5_Msk
#define CAN_TDH0R_DATA6_Pos (16U)
#define CAN_TDH0R_DATA6_Msk (0xFFU << CAN_TDH0R_DATA6_Pos)
#define CAN_TDH0R_DATA6 CAN_TDH0R_DATA6_Msk
#define CAN_TDH0R_DATA7_Pos (24U)
#define CAN_TDH0R_DATA7_Msk (0xFFU << CAN_TDH0R_DATA7_Pos)
#define CAN_TDH0R_DATA7 CAN_TDH0R_DATA7_Msk


#define CAN_TI1R_TXRQ_Pos (0U)
#define CAN_TI1R_TXRQ_Msk (0x1U << CAN_TI1R_TXRQ_Pos)
#define CAN_TI1R_TXRQ CAN_TI1R_TXRQ_Msk
#define CAN_TI1R_RTR_Pos (1U)
#define CAN_TI1R_RTR_Msk (0x1U << CAN_TI1R_RTR_Pos)
#define CAN_TI1R_RTR CAN_TI1R_RTR_Msk
#define CAN_TI1R_IDE_Pos (2U)
#define CAN_TI1R_IDE_Msk (0x1U << CAN_TI1R_IDE_Pos)
#define CAN_TI1R_IDE CAN_TI1R_IDE_Msk
#define CAN_TI1R_EXID_Pos (3U)
#define CAN_TI1R_EXID_Msk (0x3FFFFU << CAN_TI1R_EXID_Pos)
#define CAN_TI1R_EXID CAN_TI1R_EXID_Msk
#define CAN_TI1R_STID_Pos (21U)
#define CAN_TI1R_STID_Msk (0x7FFU << CAN_TI1R_STID_Pos)
#define CAN_TI1R_STID CAN_TI1R_STID_Msk


#define CAN_TDT1R_DLC_Pos (0U)
#define CAN_TDT1R_DLC_Msk (0xFU << CAN_TDT1R_DLC_Pos)
#define CAN_TDT1R_DLC CAN_TDT1R_DLC_Msk
#define CAN_TDT1R_TGT_Pos (8U)
#define CAN_TDT1R_TGT_Msk (0x1U << CAN_TDT1R_TGT_Pos)
#define CAN_TDT1R_TGT CAN_TDT1R_TGT_Msk
#define CAN_TDT1R_TIME_Pos (16U)
#define CAN_TDT1R_TIME_Msk (0xFFFFU << CAN_TDT1R_TIME_Pos)
#define CAN_TDT1R_TIME CAN_TDT1R_TIME_Msk


#define CAN_TDL1R_DATA0_Pos (0U)
#define CAN_TDL1R_DATA0_Msk (0xFFU << CAN_TDL1R_DATA0_Pos)
#define CAN_TDL1R_DATA0 CAN_TDL1R_DATA0_Msk
#define CAN_TDL1R_DATA1_Pos (8U)
#define CAN_TDL1R_DATA1_Msk (0xFFU << CAN_TDL1R_DATA1_Pos)
#define CAN_TDL1R_DATA1 CAN_TDL1R_DATA1_Msk
#define CAN_TDL1R_DATA2_Pos (16U)
#define CAN_TDL1R_DATA2_Msk (0xFFU << CAN_TDL1R_DATA2_Pos)
#define CAN_TDL1R_DATA2 CAN_TDL1R_DATA2_Msk
#define CAN_TDL1R_DATA3_Pos (24U)
#define CAN_TDL1R_DATA3_Msk (0xFFU << CAN_TDL1R_DATA3_Pos)
#define CAN_TDL1R_DATA3 CAN_TDL1R_DATA3_Msk


#define CAN_TDH1R_DATA4_Pos (0U)
#define CAN_TDH1R_DATA4_Msk (0xFFU << CAN_TDH1R_DATA4_Pos)
#define CAN_TDH1R_DATA4 CAN_TDH1R_DATA4_Msk
#define CAN_TDH1R_DATA5_Pos (8U)
#define CAN_TDH1R_DATA5_Msk (0xFFU << CAN_TDH1R_DATA5_Pos)
#define CAN_TDH1R_DATA5 CAN_TDH1R_DATA5_Msk
#define CAN_TDH1R_DATA6_Pos (16U)
#define CAN_TDH1R_DATA6_Msk (0xFFU << CAN_TDH1R_DATA6_Pos)
#define CAN_TDH1R_DATA6 CAN_TDH1R_DATA6_Msk
#define CAN_TDH1R_DATA7_Pos (24U)
#define CAN_TDH1R_DATA7_Msk (0xFFU << CAN_TDH1R_DATA7_Pos)
#define CAN_TDH1R_DATA7 CAN_TDH1R_DATA7_Msk


#define CAN_TI2R_TXRQ_Pos (0U)
#define CAN_TI2R_TXRQ_Msk (0x1U << CAN_TI2R_TXRQ_Pos)
#define CAN_TI2R_TXRQ CAN_TI2R_TXRQ_Msk
#define CAN_TI2R_RTR_Pos (1U)
#define CAN_TI2R_RTR_Msk (0x1U << CAN_TI2R_RTR_Pos)
#define CAN_TI2R_RTR CAN_TI2R_RTR_Msk
#define CAN_TI2R_IDE_Pos (2U)
#define CAN_TI2R_IDE_Msk (0x1U << CAN_TI2R_IDE_Pos)
#define CAN_TI2R_IDE CAN_TI2R_IDE_Msk
#define CAN_TI2R_EXID_Pos (3U)
#define CAN_TI2R_EXID_Msk (0x3FFFFU << CAN_TI2R_EXID_Pos)
#define CAN_TI2R_EXID CAN_TI2R_EXID_Msk
#define CAN_TI2R_STID_Pos (21U)
#define CAN_TI2R_STID_Msk (0x7FFU << CAN_TI2R_STID_Pos)
#define CAN_TI2R_STID CAN_TI2R_STID_Msk


#define CAN_TDT2R_DLC_Pos (0U)
#define CAN_TDT2R_DLC_Msk (0xFU << CAN_TDT2R_DLC_Pos)
#define CAN_TDT2R_DLC CAN_TDT2R_DLC_Msk
#define CAN_TDT2R_TGT_Pos (8U)
#define CAN_TDT2R_TGT_Msk (0x1U << CAN_TDT2R_TGT_Pos)
#define CAN_TDT2R_TGT CAN_TDT2R_TGT_Msk
#define CAN_TDT2R_TIME_Pos (16U)
#define CAN_TDT2R_TIME_Msk (0xFFFFU << CAN_TDT2R_TIME_Pos)
#define CAN_TDT2R_TIME CAN_TDT2R_TIME_Msk


#define CAN_TDL2R_DATA0_Pos (0U)
#define CAN_TDL2R_DATA0_Msk (0xFFU << CAN_TDL2R_DATA0_Pos)
#define CAN_TDL2R_DATA0 CAN_TDL2R_DATA0_Msk
#define CAN_TDL2R_DATA1_Pos (8U)
#define CAN_TDL2R_DATA1_Msk (0xFFU << CAN_TDL2R_DATA1_Pos)
#define CAN_TDL2R_DATA1 CAN_TDL2R_DATA1_Msk
#define CAN_TDL2R_DATA2_Pos (16U)
#define CAN_TDL2R_DATA2_Msk (0xFFU << CAN_TDL2R_DATA2_Pos)
#define CAN_TDL2R_DATA2 CAN_TDL2R_DATA2_Msk
#define CAN_TDL2R_DATA3_Pos (24U)
#define CAN_TDL2R_DATA3_Msk (0xFFU << CAN_TDL2R_DATA3_Pos)
#define CAN_TDL2R_DATA3 CAN_TDL2R_DATA3_Msk


#define CAN_TDH2R_DATA4_Pos (0U)
#define CAN_TDH2R_DATA4_Msk (0xFFU << CAN_TDH2R_DATA4_Pos)
#define CAN_TDH2R_DATA4 CAN_TDH2R_DATA4_Msk
#define CAN_TDH2R_DATA5_Pos (8U)
#define CAN_TDH2R_DATA5_Msk (0xFFU << CAN_TDH2R_DATA5_Pos)
#define CAN_TDH2R_DATA5 CAN_TDH2R_DATA5_Msk
#define CAN_TDH2R_DATA6_Pos (16U)
#define CAN_TDH2R_DATA6_Msk (0xFFU << CAN_TDH2R_DATA6_Pos)
#define CAN_TDH2R_DATA6 CAN_TDH2R_DATA6_Msk
#define CAN_TDH2R_DATA7_Pos (24U)
#define CAN_TDH2R_DATA7_Msk (0xFFU << CAN_TDH2R_DATA7_Pos)
#define CAN_TDH2R_DATA7 CAN_TDH2R_DATA7_Msk


#define CAN_RI0R_RTR_Pos (1U)
#define CAN_RI0R_RTR_Msk (0x1U << CAN_RI0R_RTR_Pos)
#define CAN_RI0R_RTR CAN_RI0R_RTR_Msk
#define CAN_RI0R_IDE_Pos (2U)
#define CAN_RI0R_IDE_Msk (0x1U << CAN_RI0R_IDE_Pos)
#define CAN_RI0R_IDE CAN_RI0R_IDE_Msk
#define CAN_RI0R_EXID_Pos (3U)
#define CAN_RI0R_EXID_Msk (0x3FFFFU << CAN_RI0R_EXID_Pos)
#define CAN_RI0R_EXID CAN_RI0R_EXID_Msk
#define CAN_RI0R_STID_Pos (21U)
#define CAN_RI0R_STID_Msk (0x7FFU << CAN_RI0R_STID_Pos)
#define CAN_RI0R_STID CAN_RI0R_STID_Msk


#define CAN_RDT0R_DLC_Pos (0U)
#define CAN_RDT0R_DLC_Msk (0xFU << CAN_RDT0R_DLC_Pos)
#define CAN_RDT0R_DLC CAN_RDT0R_DLC_Msk
#define CAN_RDT0R_FMI_Pos (8U)
#define CAN_RDT0R_FMI_Msk (0xFFU << CAN_RDT0R_FMI_Pos)
#define CAN_RDT0R_FMI CAN_RDT0R_FMI_Msk
#define CAN_RDT0R_TIME_Pos (16U)
#define CAN_RDT0R_TIME_Msk (0xFFFFU << CAN_RDT0R_TIME_Pos)
#define CAN_RDT0R_TIME CAN_RDT0R_TIME_Msk


#define CAN_RDL0R_DATA0_Pos (0U)
#define CAN_RDL0R_DATA0_Msk (0xFFU << CAN_RDL0R_DATA0_Pos)
#define CAN_RDL0R_DATA0 CAN_RDL0R_DATA0_Msk
#define CAN_RDL0R_DATA1_Pos (8U)
#define CAN_RDL0R_DATA1_Msk (0xFFU << CAN_RDL0R_DATA1_Pos)
#define CAN_RDL0R_DATA1 CAN_RDL0R_DATA1_Msk
#define CAN_RDL0R_DATA2_Pos (16U)
#define CAN_RDL0R_DATA2_Msk (0xFFU << CAN_RDL0R_DATA2_Pos)
#define CAN_RDL0R_DATA2 CAN_RDL0R_DATA2_Msk
#define CAN_RDL0R_DATA3_Pos (24U)
#define CAN_RDL0R_DATA3_Msk (0xFFU << CAN_RDL0R_DATA3_Pos)
#define CAN_RDL0R_DATA3 CAN_RDL0R_DATA3_Msk


#define CAN_RDH0R_DATA4_Pos (0U)
#define CAN_RDH0R_DATA4_Msk (0xFFU << CAN_RDH0R_DATA4_Pos)
#define CAN_RDH0R_DATA4 CAN_RDH0R_DATA4_Msk
#define CAN_RDH0R_DATA5_Pos (8U)
#define CAN_RDH0R_DATA5_Msk (0xFFU << CAN_RDH0R_DATA5_Pos)
#define CAN_RDH0R_DATA5 CAN_RDH0R_DATA5_Msk
#define CAN_RDH0R_DATA6_Pos (16U)
#define CAN_RDH0R_DATA6_Msk (0xFFU << CAN_RDH0R_DATA6_Pos)
#define CAN_RDH0R_DATA6 CAN_RDH0R_DATA6_Msk
#define CAN_RDH0R_DATA7_Pos (24U)
#define CAN_RDH0R_DATA7_Msk (0xFFU << CAN_RDH0R_DATA7_Pos)
#define CAN_RDH0R_DATA7 CAN_RDH0R_DATA7_Msk


#define CAN_RI1R_RTR_Pos (1U)
#define CAN_RI1R_RTR_Msk (0x1U << CAN_RI1R_RTR_Pos)
#define CAN_RI1R_RTR CAN_RI1R_RTR_Msk
#define CAN_RI1R_IDE_Pos (2U)
#define CAN_RI1R_IDE_Msk (0x1U << CAN_RI1R_IDE_Pos)
#define CAN_RI1R_IDE CAN_RI1R_IDE_Msk
#define CAN_RI1R_EXID_Pos (3U)
#define CAN_RI1R_EXID_Msk (0x3FFFFU << CAN_RI1R_EXID_Pos)
#define CAN_RI1R_EXID CAN_RI1R_EXID_Msk
#define CAN_RI1R_STID_Pos (21U)
#define CAN_RI1R_STID_Msk (0x7FFU << CAN_RI1R_STID_Pos)
#define CAN_RI1R_STID CAN_RI1R_STID_Msk


#define CAN_RDT1R_DLC_Pos (0U)
#define CAN_RDT1R_DLC_Msk (0xFU << CAN_RDT1R_DLC_Pos)
#define CAN_RDT1R_DLC CAN_RDT1R_DLC_Msk
#define CAN_RDT1R_FMI_Pos (8U)
#define CAN_RDT1R_FMI_Msk (0xFFU << CAN_RDT1R_FMI_Pos)
#define CAN_RDT1R_FMI CAN_RDT1R_FMI_Msk
#define CAN_RDT1R_TIME_Pos (16U)
#define CAN_RDT1R_TIME_Msk (0xFFFFU << CAN_RDT1R_TIME_Pos)
#define CAN_RDT1R_TIME CAN_RDT1R_TIME_Msk


#define CAN_RDL1R_DATA0_Pos (0U)
#define CAN_RDL1R_DATA0_Msk (0xFFU << CAN_RDL1R_DATA0_Pos)
#define CAN_RDL1R_DATA0 CAN_RDL1R_DATA0_Msk
#define CAN_RDL1R_DATA1_Pos (8U)
#define CAN_RDL1R_DATA1_Msk (0xFFU << CAN_RDL1R_DATA1_Pos)
#define CAN_RDL1R_DATA1 CAN_RDL1R_DATA1_Msk
#define CAN_RDL1R_DATA2_Pos (16U)
#define CAN_RDL1R_DATA2_Msk (0xFFU << CAN_RDL1R_DATA2_Pos)
#define CAN_RDL1R_DATA2 CAN_RDL1R_DATA2_Msk
#define CAN_RDL1R_DATA3_Pos (24U)
#define CAN_RDL1R_DATA3_Msk (0xFFU << CAN_RDL1R_DATA3_Pos)
#define CAN_RDL1R_DATA3 CAN_RDL1R_DATA3_Msk


#define CAN_RDH1R_DATA4_Pos (0U)
#define CAN_RDH1R_DATA4_Msk (0xFFU << CAN_RDH1R_DATA4_Pos)
#define CAN_RDH1R_DATA4 CAN_RDH1R_DATA4_Msk
#define CAN_RDH1R_DATA5_Pos (8U)
#define CAN_RDH1R_DATA5_Msk (0xFFU << CAN_RDH1R_DATA5_Pos)
#define CAN_RDH1R_DATA5 CAN_RDH1R_DATA5_Msk
#define CAN_RDH1R_DATA6_Pos (16U)
#define CAN_RDH1R_DATA6_Msk (0xFFU << CAN_RDH1R_DATA6_Pos)
#define CAN_RDH1R_DATA6 CAN_RDH1R_DATA6_Msk
#define CAN_RDH1R_DATA7_Pos (24U)
#define CAN_RDH1R_DATA7_Msk (0xFFU << CAN_RDH1R_DATA7_Pos)
#define CAN_RDH1R_DATA7 CAN_RDH1R_DATA7_Msk



#define CAN_FMR_FINIT_Pos (0U)
#define CAN_FMR_FINIT_Msk (0x1U << CAN_FMR_FINIT_Pos)
#define CAN_FMR_FINIT CAN_FMR_FINIT_Msk
#define CAN_FMR_CAN2SB_Pos (8U)
#define CAN_FMR_CAN2SB_Msk (0x3FU << CAN_FMR_CAN2SB_Pos)
#define CAN_FMR_CAN2SB CAN_FMR_CAN2SB_Msk


#define CAN_FM1R_FBM_Pos (0U)
#define CAN_FM1R_FBM_Msk (0x3FFFU << CAN_FM1R_FBM_Pos)
#define CAN_FM1R_FBM CAN_FM1R_FBM_Msk
#define CAN_FM1R_FBM0_Pos (0U)
#define CAN_FM1R_FBM0_Msk (0x1U << CAN_FM1R_FBM0_Pos)
#define CAN_FM1R_FBM0 CAN_FM1R_FBM0_Msk
#define CAN_FM1R_FBM1_Pos (1U)
#define CAN_FM1R_FBM1_Msk (0x1U << CAN_FM1R_FBM1_Pos)
#define CAN_FM1R_FBM1 CAN_FM1R_FBM1_Msk
#define CAN_FM1R_FBM2_Pos (2U)
#define CAN_FM1R_FBM2_Msk (0x1U << CAN_FM1R_FBM2_Pos)
#define CAN_FM1R_FBM2 CAN_FM1R_FBM2_Msk
#define CAN_FM1R_FBM3_Pos (3U)
#define CAN_FM1R_FBM3_Msk (0x1U << CAN_FM1R_FBM3_Pos)
#define CAN_FM1R_FBM3 CAN_FM1R_FBM3_Msk
#define CAN_FM1R_FBM4_Pos (4U)
#define CAN_FM1R_FBM4_Msk (0x1U << CAN_FM1R_FBM4_Pos)
#define CAN_FM1R_FBM4 CAN_FM1R_FBM4_Msk
#define CAN_FM1R_FBM5_Pos (5U)
#define CAN_FM1R_FBM5_Msk (0x1U << CAN_FM1R_FBM5_Pos)
#define CAN_FM1R_FBM5 CAN_FM1R_FBM5_Msk
#define CAN_FM1R_FBM6_Pos (6U)
#define CAN_FM1R_FBM6_Msk (0x1U << CAN_FM1R_FBM6_Pos)
#define CAN_FM1R_FBM6 CAN_FM1R_FBM6_Msk
#define CAN_FM1R_FBM7_Pos (7U)
#define CAN_FM1R_FBM7_Msk (0x1U << CAN_FM1R_FBM7_Pos)
#define CAN_FM1R_FBM7 CAN_FM1R_FBM7_Msk
#define CAN_FM1R_FBM8_Pos (8U)
#define CAN_FM1R_FBM8_Msk (0x1U << CAN_FM1R_FBM8_Pos)
#define CAN_FM1R_FBM8 CAN_FM1R_FBM8_Msk
#define CAN_FM1R_FBM9_Pos (9U)
#define CAN_FM1R_FBM9_Msk (0x1U << CAN_FM1R_FBM9_Pos)
#define CAN_FM1R_FBM9 CAN_FM1R_FBM9_Msk
#define CAN_FM1R_FBM10_Pos (10U)
#define CAN_FM1R_FBM10_Msk (0x1U << CAN_FM1R_FBM10_Pos)
#define CAN_FM1R_FBM10 CAN_FM1R_FBM10_Msk
#define CAN_FM1R_FBM11_Pos (11U)
#define CAN_FM1R_FBM11_Msk (0x1U << CAN_FM1R_FBM11_Pos)
#define CAN_FM1R_FBM11 CAN_FM1R_FBM11_Msk
#define CAN_FM1R_FBM12_Pos (12U)
#define CAN_FM1R_FBM12_Msk (0x1U << CAN_FM1R_FBM12_Pos)
#define CAN_FM1R_FBM12 CAN_FM1R_FBM12_Msk
#define CAN_FM1R_FBM13_Pos (13U)
#define CAN_FM1R_FBM13_Msk (0x1U << CAN_FM1R_FBM13_Pos)
#define CAN_FM1R_FBM13 CAN_FM1R_FBM13_Msk


#define CAN_FS1R_FSC_Pos (0U)
#define CAN_FS1R_FSC_Msk (0x3FFFU << CAN_FS1R_FSC_Pos)
#define CAN_FS1R_FSC CAN_FS1R_FSC_Msk
#define CAN_FS1R_FSC0_Pos (0U)
#define CAN_FS1R_FSC0_Msk (0x1U << CAN_FS1R_FSC0_Pos)
#define CAN_FS1R_FSC0 CAN_FS1R_FSC0_Msk
#define CAN_FS1R_FSC1_Pos (1U)
#define CAN_FS1R_FSC1_Msk (0x1U << CAN_FS1R_FSC1_Pos)
#define CAN_FS1R_FSC1 CAN_FS1R_FSC1_Msk
#define CAN_FS1R_FSC2_Pos (2U)
#define CAN_FS1R_FSC2_Msk (0x1U << CAN_FS1R_FSC2_Pos)
#define CAN_FS1R_FSC2 CAN_FS1R_FSC2_Msk
#define CAN_FS1R_FSC3_Pos (3U)
#define CAN_FS1R_FSC3_Msk (0x1U << CAN_FS1R_FSC3_Pos)
#define CAN_FS1R_FSC3 CAN_FS1R_FSC3_Msk
#define CAN_FS1R_FSC4_Pos (4U)
#define CAN_FS1R_FSC4_Msk (0x1U << CAN_FS1R_FSC4_Pos)
#define CAN_FS1R_FSC4 CAN_FS1R_FSC4_Msk
#define CAN_FS1R_FSC5_Pos (5U)
#define CAN_FS1R_FSC5_Msk (0x1U << CAN_FS1R_FSC5_Pos)
#define CAN_FS1R_FSC5 CAN_FS1R_FSC5_Msk
#define CAN_FS1R_FSC6_Pos (6U)
#define CAN_FS1R_FSC6_Msk (0x1U << CAN_FS1R_FSC6_Pos)
#define CAN_FS1R_FSC6 CAN_FS1R_FSC6_Msk
#define CAN_FS1R_FSC7_Pos (7U)
#define CAN_FS1R_FSC7_Msk (0x1U << CAN_FS1R_FSC7_Pos)
#define CAN_FS1R_FSC7 CAN_FS1R_FSC7_Msk
#define CAN_FS1R_FSC8_Pos (8U)
#define CAN_FS1R_FSC8_Msk (0x1U << CAN_FS1R_FSC8_Pos)
#define CAN_FS1R_FSC8 CAN_FS1R_FSC8_Msk
#define CAN_FS1R_FSC9_Pos (9U)
#define CAN_FS1R_FSC9_Msk (0x1U << CAN_FS1R_FSC9_Pos)
#define CAN_FS1R_FSC9 CAN_FS1R_FSC9_Msk
#define CAN_FS1R_FSC10_Pos (10U)
#define CAN_FS1R_FSC10_Msk (0x1U << CAN_FS1R_FSC10_Pos)
#define CAN_FS1R_FSC10 CAN_FS1R_FSC10_Msk
#define CAN_FS1R_FSC11_Pos (11U)
#define CAN_FS1R_FSC11_Msk (0x1U << CAN_FS1R_FSC11_Pos)
#define CAN_FS1R_FSC11 CAN_FS1R_FSC11_Msk
#define CAN_FS1R_FSC12_Pos (12U)
#define CAN_FS1R_FSC12_Msk (0x1U << CAN_FS1R_FSC12_Pos)
#define CAN_FS1R_FSC12 CAN_FS1R_FSC12_Msk
#define CAN_FS1R_FSC13_Pos (13U)
#define CAN_FS1R_FSC13_Msk (0x1U << CAN_FS1R_FSC13_Pos)
#define CAN_FS1R_FSC13 CAN_FS1R_FSC13_Msk


#define CAN_FFA1R_FFA_Pos (0U)
#define CAN_FFA1R_FFA_Msk (0x3FFFU << CAN_FFA1R_FFA_Pos)
#define CAN_FFA1R_FFA CAN_FFA1R_FFA_Msk
#define CAN_FFA1R_FFA0_Pos (0U)
#define CAN_FFA1R_FFA0_Msk (0x1U << CAN_FFA1R_FFA0_Pos)
#define CAN_FFA1R_FFA0 CAN_FFA1R_FFA0_Msk
#define CAN_FFA1R_FFA1_Pos (1U)
#define CAN_FFA1R_FFA1_Msk (0x1U << CAN_FFA1R_FFA1_Pos)
#define CAN_FFA1R_FFA1 CAN_FFA1R_FFA1_Msk
#define CAN_FFA1R_FFA2_Pos (2U)
#define CAN_FFA1R_FFA2_Msk (0x1U << CAN_FFA1R_FFA2_Pos)
#define CAN_FFA1R_FFA2 CAN_FFA1R_FFA2_Msk
#define CAN_FFA1R_FFA3_Pos (3U)
#define CAN_FFA1R_FFA3_Msk (0x1U << CAN_FFA1R_FFA3_Pos)
#define CAN_FFA1R_FFA3 CAN_FFA1R_FFA3_Msk
#define CAN_FFA1R_FFA4_Pos (4U)
#define CAN_FFA1R_FFA4_Msk (0x1U << CAN_FFA1R_FFA4_Pos)
#define CAN_FFA1R_FFA4 CAN_FFA1R_FFA4_Msk
#define CAN_FFA1R_FFA5_Pos (5U)
#define CAN_FFA1R_FFA5_Msk (0x1U << CAN_FFA1R_FFA5_Pos)
#define CAN_FFA1R_FFA5 CAN_FFA1R_FFA5_Msk
#define CAN_FFA1R_FFA6_Pos (6U)
#define CAN_FFA1R_FFA6_Msk (0x1U << CAN_FFA1R_FFA6_Pos)
#define CAN_FFA1R_FFA6 CAN_FFA1R_FFA6_Msk
#define CAN_FFA1R_FFA7_Pos (7U)
#define CAN_FFA1R_FFA7_Msk (0x1U << CAN_FFA1R_FFA7_Pos)
#define CAN_FFA1R_FFA7 CAN_FFA1R_FFA7_Msk
#define CAN_FFA1R_FFA8_Pos (8U)
#define CAN_FFA1R_FFA8_Msk (0x1U << CAN_FFA1R_FFA8_Pos)
#define CAN_FFA1R_FFA8 CAN_FFA1R_FFA8_Msk
#define CAN_FFA1R_FFA9_Pos (9U)
#define CAN_FFA1R_FFA9_Msk (0x1U << CAN_FFA1R_FFA9_Pos)
#define CAN_FFA1R_FFA9 CAN_FFA1R_FFA9_Msk
#define CAN_FFA1R_FFA10_Pos (10U)
#define CAN_FFA1R_FFA10_Msk (0x1U << CAN_FFA1R_FFA10_Pos)
#define CAN_FFA1R_FFA10 CAN_FFA1R_FFA10_Msk
#define CAN_FFA1R_FFA11_Pos (11U)
#define CAN_FFA1R_FFA11_Msk (0x1U << CAN_FFA1R_FFA11_Pos)
#define CAN_FFA1R_FFA11 CAN_FFA1R_FFA11_Msk
#define CAN_FFA1R_FFA12_Pos (12U)
#define CAN_FFA1R_FFA12_Msk (0x1U << CAN_FFA1R_FFA12_Pos)
#define CAN_FFA1R_FFA12 CAN_FFA1R_FFA12_Msk
#define CAN_FFA1R_FFA13_Pos (13U)
#define CAN_FFA1R_FFA13_Msk (0x1U << CAN_FFA1R_FFA13_Pos)
#define CAN_FFA1R_FFA13 CAN_FFA1R_FFA13_Msk


#define CAN_FA1R_FACT_Pos (0U)
#define CAN_FA1R_FACT_Msk (0x3FFFU << CAN_FA1R_FACT_Pos)
#define CAN_FA1R_FACT CAN_FA1R_FACT_Msk
#define CAN_FA1R_FACT0_Pos (0U)
#define CAN_FA1R_FACT0_Msk (0x1U << CAN_FA1R_FACT0_Pos)
#define CAN_FA1R_FACT0 CAN_FA1R_FACT0_Msk
#define CAN_FA1R_FACT1_Pos (1U)
#define CAN_FA1R_FACT1_Msk (0x1U << CAN_FA1R_FACT1_Pos)
#define CAN_FA1R_FACT1 CAN_FA1R_FACT1_Msk
#define CAN_FA1R_FACT2_Pos (2U)
#define CAN_FA1R_FACT2_Msk (0x1U << CAN_FA1R_FACT2_Pos)
#define CAN_FA1R_FACT2 CAN_FA1R_FACT2_Msk
#define CAN_FA1R_FACT3_Pos (3U)
#define CAN_FA1R_FACT3_Msk (0x1U << CAN_FA1R_FACT3_Pos)
#define CAN_FA1R_FACT3 CAN_FA1R_FACT3_Msk
#define CAN_FA1R_FACT4_Pos (4U)
#define CAN_FA1R_FACT4_Msk (0x1U << CAN_FA1R_FACT4_Pos)
#define CAN_FA1R_FACT4 CAN_FA1R_FACT4_Msk
#define CAN_FA1R_FACT5_Pos (5U)
#define CAN_FA1R_FACT5_Msk (0x1U << CAN_FA1R_FACT5_Pos)
#define CAN_FA1R_FACT5 CAN_FA1R_FACT5_Msk
#define CAN_FA1R_FACT6_Pos (6U)
#define CAN_FA1R_FACT6_Msk (0x1U << CAN_FA1R_FACT6_Pos)
#define CAN_FA1R_FACT6 CAN_FA1R_FACT6_Msk
#define CAN_FA1R_FACT7_Pos (7U)
#define CAN_FA1R_FACT7_Msk (0x1U << CAN_FA1R_FACT7_Pos)
#define CAN_FA1R_FACT7 CAN_FA1R_FACT7_Msk
#define CAN_FA1R_FACT8_Pos (8U)
#define CAN_FA1R_FACT8_Msk (0x1U << CAN_FA1R_FACT8_Pos)
#define CAN_FA1R_FACT8 CAN_FA1R_FACT8_Msk
#define CAN_FA1R_FACT9_Pos (9U)
#define CAN_FA1R_FACT9_Msk (0x1U << CAN_FA1R_FACT9_Pos)
#define CAN_FA1R_FACT9 CAN_FA1R_FACT9_Msk
#define CAN_FA1R_FACT10_Pos (10U)
#define CAN_FA1R_FACT10_Msk (0x1U << CAN_FA1R_FACT10_Pos)
#define CAN_FA1R_FACT10 CAN_FA1R_FACT10_Msk
#define CAN_FA1R_FACT11_Pos (11U)
#define CAN_FA1R_FACT11_Msk (0x1U << CAN_FA1R_FACT11_Pos)
#define CAN_FA1R_FACT11 CAN_FA1R_FACT11_Msk
#define CAN_FA1R_FACT12_Pos (12U)
#define CAN_FA1R_FACT12_Msk (0x1U << CAN_FA1R_FACT12_Pos)
#define CAN_FA1R_FACT12 CAN_FA1R_FACT12_Msk
#define CAN_FA1R_FACT13_Pos (13U)
#define CAN_FA1R_FACT13_Msk (0x1U << CAN_FA1R_FACT13_Pos)
#define CAN_FA1R_FACT13 CAN_FA1R_FACT13_Msk


#define CAN_F0R1_FB0_Pos (0U)
#define CAN_F0R1_FB0_Msk (0x1U << CAN_F0R1_FB0_Pos)
#define CAN_F0R1_FB0 CAN_F0R1_FB0_Msk
#define CAN_F0R1_FB1_Pos (1U)
#define CAN_F0R1_FB1_Msk (0x1U << CAN_F0R1_FB1_Pos)
#define CAN_F0R1_FB1 CAN_F0R1_FB1_Msk
#define CAN_F0R1_FB2_Pos (2U)
#define CAN_F0R1_FB2_Msk (0x1U << CAN_F0R1_FB2_Pos)
#define CAN_F0R1_FB2 CAN_F0R1_FB2_Msk
#define CAN_F0R1_FB3_Pos (3U)
#define CAN_F0R1_FB3_Msk (0x1U << CAN_F0R1_FB3_Pos)
#define CAN_F0R1_FB3 CAN_F0R1_FB3_Msk
#define CAN_F0R1_FB4_Pos (4U)
#define CAN_F0R1_FB4_Msk (0x1U << CAN_F0R1_FB4_Pos)
#define CAN_F0R1_FB4 CAN_F0R1_FB4_Msk
#define CAN_F0R1_FB5_Pos (5U)
#define CAN_F0R1_FB5_Msk (0x1U << CAN_F0R1_FB5_Pos)
#define CAN_F0R1_FB5 CAN_F0R1_FB5_Msk
#define CAN_F0R1_FB6_Pos (6U)
#define CAN_F0R1_FB6_Msk (0x1U << CAN_F0R1_FB6_Pos)
#define CAN_F0R1_FB6 CAN_F0R1_FB6_Msk
#define CAN_F0R1_FB7_Pos (7U)
#define CAN_F0R1_FB7_Msk (0x1U << CAN_F0R1_FB7_Pos)
#define CAN_F0R1_FB7 CAN_F0R1_FB7_Msk
#define CAN_F0R1_FB8_Pos (8U)
#define CAN_F0R1_FB8_Msk (0x1U << CAN_F0R1_FB8_Pos)
#define CAN_F0R1_FB8 CAN_F0R1_FB8_Msk
#define CAN_F0R1_FB9_Pos (9U)
#define CAN_F0R1_FB9_Msk (0x1U << CAN_F0R1_FB9_Pos)
#define CAN_F0R1_FB9 CAN_F0R1_FB9_Msk
#define CAN_F0R1_FB10_Pos (10U)
#define CAN_F0R1_FB10_Msk (0x1U << CAN_F0R1_FB10_Pos)
#define CAN_F0R1_FB10 CAN_F0R1_FB10_Msk
#define CAN_F0R1_FB11_Pos (11U)
#define CAN_F0R1_FB11_Msk (0x1U << CAN_F0R1_FB11_Pos)
#define CAN_F0R1_FB11 CAN_F0R1_FB11_Msk
#define CAN_F0R1_FB12_Pos (12U)
#define CAN_F0R1_FB12_Msk (0x1U << CAN_F0R1_FB12_Pos)
#define CAN_F0R1_FB12 CAN_F0R1_FB12_Msk
#define CAN_F0R1_FB13_Pos (13U)
#define CAN_F0R1_FB13_Msk (0x1U << CAN_F0R1_FB13_Pos)
#define CAN_F0R1_FB13 CAN_F0R1_FB13_Msk
#define CAN_F0R1_FB14_Pos (14U)
#define CAN_F0R1_FB14_Msk (0x1U << CAN_F0R1_FB14_Pos)
#define CAN_F0R1_FB14 CAN_F0R1_FB14_Msk
#define CAN_F0R1_FB15_Pos (15U)
#define CAN_F0R1_FB15_Msk (0x1U << CAN_F0R1_FB15_Pos)
#define CAN_F0R1_FB15 CAN_F0R1_FB15_Msk
#define CAN_F0R1_FB16_Pos (16U)
#define CAN_F0R1_FB16_Msk (0x1U << CAN_F0R1_FB16_Pos)
#define CAN_F0R1_FB16 CAN_F0R1_FB16_Msk
#define CAN_F0R1_FB17_Pos (17U)
#define CAN_F0R1_FB17_Msk (0x1U << CAN_F0R1_FB17_Pos)
#define CAN_F0R1_FB17 CAN_F0R1_FB17_Msk
#define CAN_F0R1_FB18_Pos (18U)
#define CAN_F0R1_FB18_Msk (0x1U << CAN_F0R1_FB18_Pos)
#define CAN_F0R1_FB18 CAN_F0R1_FB18_Msk
#define CAN_F0R1_FB19_Pos (19U)
#define CAN_F0R1_FB19_Msk (0x1U << CAN_F0R1_FB19_Pos)
#define CAN_F0R1_FB19 CAN_F0R1_FB19_Msk
#define CAN_F0R1_FB20_Pos (20U)
#define CAN_F0R1_FB20_Msk (0x1U << CAN_F0R1_FB20_Pos)
#define CAN_F0R1_FB20 CAN_F0R1_FB20_Msk
#define CAN_F0R1_FB21_Pos (21U)
#define CAN_F0R1_FB21_Msk (0x1U << CAN_F0R1_FB21_Pos)
#define CAN_F0R1_FB21 CAN_F0R1_FB21_Msk
#define CAN_F0R1_FB22_Pos (22U)
#define CAN_F0R1_FB22_Msk (0x1U << CAN_F0R1_FB22_Pos)
#define CAN_F0R1_FB22 CAN_F0R1_FB22_Msk
#define CAN_F0R1_FB23_Pos (23U)
#define CAN_F0R1_FB23_Msk (0x1U << CAN_F0R1_FB23_Pos)
#define CAN_F0R1_FB23 CAN_F0R1_FB23_Msk
#define CAN_F0R1_FB24_Pos (24U)
#define CAN_F0R1_FB24_Msk (0x1U << CAN_F0R1_FB24_Pos)
#define CAN_F0R1_FB24 CAN_F0R1_FB24_Msk
#define CAN_F0R1_FB25_Pos (25U)
#define CAN_F0R1_FB25_Msk (0x1U << CAN_F0R1_FB25_Pos)
#define CAN_F0R1_FB25 CAN_F0R1_FB25_Msk
#define CAN_F0R1_FB26_Pos (26U)
#define CAN_F0R1_FB26_Msk (0x1U << CAN_F0R1_FB26_Pos)
#define CAN_F0R1_FB26 CAN_F0R1_FB26_Msk
#define CAN_F0R1_FB27_Pos (27U)
#define CAN_F0R1_FB27_Msk (0x1U << CAN_F0R1_FB27_Pos)
#define CAN_F0R1_FB27 CAN_F0R1_FB27_Msk
#define CAN_F0R1_FB28_Pos (28U)
#define CAN_F0R1_FB28_Msk (0x1U << CAN_F0R1_FB28_Pos)
#define CAN_F0R1_FB28 CAN_F0R1_FB28_Msk
#define CAN_F0R1_FB29_Pos (29U)
#define CAN_F0R1_FB29_Msk (0x1U << CAN_F0R1_FB29_Pos)
#define CAN_F0R1_FB29 CAN_F0R1_FB29_Msk
#define CAN_F0R1_FB30_Pos (30U)
#define CAN_F0R1_FB30_Msk (0x1U << CAN_F0R1_FB30_Pos)
#define CAN_F0R1_FB30 CAN_F0R1_FB30_Msk
#define CAN_F0R1_FB31_Pos (31U)
#define CAN_F0R1_FB31_Msk (0x1U << CAN_F0R1_FB31_Pos)
#define CAN_F0R1_FB31 CAN_F0R1_FB31_Msk


#define CAN_F1R1_FB0_Pos (0U)
#define CAN_F1R1_FB0_Msk (0x1U << CAN_F1R1_FB0_Pos)
#define CAN_F1R1_FB0 CAN_F1R1_FB0_Msk
#define CAN_F1R1_FB1_Pos (1U)
#define CAN_F1R1_FB1_Msk (0x1U << CAN_F1R1_FB1_Pos)
#define CAN_F1R1_FB1 CAN_F1R1_FB1_Msk
#define CAN_F1R1_FB2_Pos (2U)
#define CAN_F1R1_FB2_Msk (0x1U << CAN_F1R1_FB2_Pos)
#define CAN_F1R1_FB2 CAN_F1R1_FB2_Msk
#define CAN_F1R1_FB3_Pos (3U)
#define CAN_F1R1_FB3_Msk (0x1U << CAN_F1R1_FB3_Pos)
#define CAN_F1R1_FB3 CAN_F1R1_FB3_Msk
#define CAN_F1R1_FB4_Pos (4U)
#define CAN_F1R1_FB4_Msk (0x1U << CAN_F1R1_FB4_Pos)
#define CAN_F1R1_FB4 CAN_F1R1_FB4_Msk
#define CAN_F1R1_FB5_Pos (5U)
#define CAN_F1R1_FB5_Msk (0x1U << CAN_F1R1_FB5_Pos)
#define CAN_F1R1_FB5 CAN_F1R1_FB5_Msk
#define CAN_F1R1_FB6_Pos (6U)
#define CAN_F1R1_FB6_Msk (0x1U << CAN_F1R1_FB6_Pos)
#define CAN_F1R1_FB6 CAN_F1R1_FB6_Msk
#define CAN_F1R1_FB7_Pos (7U)
#define CAN_F1R1_FB7_Msk (0x1U << CAN_F1R1_FB7_Pos)
#define CAN_F1R1_FB7 CAN_F1R1_FB7_Msk
#define CAN_F1R1_FB8_Pos (8U)
#define CAN_F1R1_FB8_Msk (0x1U << CAN_F1R1_FB8_Pos)
#define CAN_F1R1_FB8 CAN_F1R1_FB8_Msk
#define CAN_F1R1_FB9_Pos (9U)
#define CAN_F1R1_FB9_Msk (0x1U << CAN_F1R1_FB9_Pos)
#define CAN_F1R1_FB9 CAN_F1R1_FB9_Msk
#define CAN_F1R1_FB10_Pos (10U)
#define CAN_F1R1_FB10_Msk (0x1U << CAN_F1R1_FB10_Pos)
#define CAN_F1R1_FB10 CAN_F1R1_FB10_Msk
#define CAN_F1R1_FB11_Pos (11U)
#define CAN_F1R1_FB11_Msk (0x1U << CAN_F1R1_FB11_Pos)
#define CAN_F1R1_FB11 CAN_F1R1_FB11_Msk
#define CAN_F1R1_FB12_Pos (12U)
#define CAN_F1R1_FB12_Msk (0x1U << CAN_F1R1_FB12_Pos)
#define CAN_F1R1_FB12 CAN_F1R1_FB12_Msk
#define CAN_F1R1_FB13_Pos (13U)
#define CAN_F1R1_FB13_Msk (0x1U << CAN_F1R1_FB13_Pos)
#define CAN_F1R1_FB13 CAN_F1R1_FB13_Msk
#define CAN_F1R1_FB14_Pos (14U)
#define CAN_F1R1_FB14_Msk (0x1U << CAN_F1R1_FB14_Pos)
#define CAN_F1R1_FB14 CAN_F1R1_FB14_Msk
#define CAN_F1R1_FB15_Pos (15U)
#define CAN_F1R1_FB15_Msk (0x1U << CAN_F1R1_FB15_Pos)
#define CAN_F1R1_FB15 CAN_F1R1_FB15_Msk
#define CAN_F1R1_FB16_Pos (16U)
#define CAN_F1R1_FB16_Msk (0x1U << CAN_F1R1_FB16_Pos)
#define CAN_F1R1_FB16 CAN_F1R1_FB16_Msk
#define CAN_F1R1_FB17_Pos (17U)
#define CAN_F1R1_FB17_Msk (0x1U << CAN_F1R1_FB17_Pos)
#define CAN_F1R1_FB17 CAN_F1R1_FB17_Msk
#define CAN_F1R1_FB18_Pos (18U)
#define CAN_F1R1_FB18_Msk (0x1U << CAN_F1R1_FB18_Pos)
#define CAN_F1R1_FB18 CAN_F1R1_FB18_Msk
#define CAN_F1R1_FB19_Pos (19U)
#define CAN_F1R1_FB19_Msk (0x1U << CAN_F1R1_FB19_Pos)
#define CAN_F1R1_FB19 CAN_F1R1_FB19_Msk
#define CAN_F1R1_FB20_Pos (20U)
#define CAN_F1R1_FB20_Msk (0x1U << CAN_F1R1_FB20_Pos)
#define CAN_F1R1_FB20 CAN_F1R1_FB20_Msk
#define CAN_F1R1_FB21_Pos (21U)
#define CAN_F1R1_FB21_Msk (0x1U << CAN_F1R1_FB21_Pos)
#define CAN_F1R1_FB21 CAN_F1R1_FB21_Msk
#define CAN_F1R1_FB22_Pos (22U)
#define CAN_F1R1_FB22_Msk (0x1U << CAN_F1R1_FB22_Pos)
#define CAN_F1R1_FB22 CAN_F1R1_FB22_Msk
#define CAN_F1R1_FB23_Pos (23U)
#define CAN_F1R1_FB23_Msk (0x1U << CAN_F1R1_FB23_Pos)
#define CAN_F1R1_FB23 CAN_F1R1_FB23_Msk
#define CAN_F1R1_FB24_Pos (24U)
#define CAN_F1R1_FB24_Msk (0x1U << CAN_F1R1_FB24_Pos)
#define CAN_F1R1_FB24 CAN_F1R1_FB24_Msk
#define CAN_F1R1_FB25_Pos (25U)
#define CAN_F1R1_FB25_Msk (0x1U << CAN_F1R1_FB25_Pos)
#define CAN_F1R1_FB25 CAN_F1R1_FB25_Msk
#define CAN_F1R1_FB26_Pos (26U)
#define CAN_F1R1_FB26_Msk (0x1U << CAN_F1R1_FB26_Pos)
#define CAN_F1R1_FB26 CAN_F1R1_FB26_Msk
#define CAN_F1R1_FB27_Pos (27U)
#define CAN_F1R1_FB27_Msk (0x1U << CAN_F1R1_FB27_Pos)
#define CAN_F1R1_FB27 CAN_F1R1_FB27_Msk
#define CAN_F1R1_FB28_Pos (28U)
#define CAN_F1R1_FB28_Msk (0x1U << CAN_F1R1_FB28_Pos)
#define CAN_F1R1_FB28 CAN_F1R1_FB28_Msk
#define CAN_F1R1_FB29_Pos (29U)
#define CAN_F1R1_FB29_Msk (0x1U << CAN_F1R1_FB29_Pos)
#define CAN_F1R1_FB29 CAN_F1R1_FB29_Msk
#define CAN_F1R1_FB30_Pos (30U)
#define CAN_F1R1_FB30_Msk (0x1U << CAN_F1R1_FB30_Pos)
#define CAN_F1R1_FB30 CAN_F1R1_FB30_Msk
#define CAN_F1R1_FB31_Pos (31U)
#define CAN_F1R1_FB31_Msk (0x1U << CAN_F1R1_FB31_Pos)
#define CAN_F1R1_FB31 CAN_F1R1_FB31_Msk


#define CAN_F2R1_FB0_Pos (0U)
#define CAN_F2R1_FB0_Msk (0x1U << CAN_F2R1_FB0_Pos)
#define CAN_F2R1_FB0 CAN_F2R1_FB0_Msk
#define CAN_F2R1_FB1_Pos (1U)
#define CAN_F2R1_FB1_Msk (0x1U << CAN_F2R1_FB1_Pos)
#define CAN_F2R1_FB1 CAN_F2R1_FB1_Msk
#define CAN_F2R1_FB2_Pos (2U)
#define CAN_F2R1_FB2_Msk (0x1U << CAN_F2R1_FB2_Pos)
#define CAN_F2R1_FB2 CAN_F2R1_FB2_Msk
#define CAN_F2R1_FB3_Pos (3U)
#define CAN_F2R1_FB3_Msk (0x1U << CAN_F2R1_FB3_Pos)
#define CAN_F2R1_FB3 CAN_F2R1_FB3_Msk
#define CAN_F2R1_FB4_Pos (4U)
#define CAN_F2R1_FB4_Msk (0x1U << CAN_F2R1_FB4_Pos)
#define CAN_F2R1_FB4 CAN_F2R1_FB4_Msk
#define CAN_F2R1_FB5_Pos (5U)
#define CAN_F2R1_FB5_Msk (0x1U << CAN_F2R1_FB5_Pos)
#define CAN_F2R1_FB5 CAN_F2R1_FB5_Msk
#define CAN_F2R1_FB6_Pos (6U)
#define CAN_F2R1_FB6_Msk (0x1U << CAN_F2R1_FB6_Pos)
#define CAN_F2R1_FB6 CAN_F2R1_FB6_Msk
#define CAN_F2R1_FB7_Pos (7U)
#define CAN_F2R1_FB7_Msk (0x1U << CAN_F2R1_FB7_Pos)
#define CAN_F2R1_FB7 CAN_F2R1_FB7_Msk
#define CAN_F2R1_FB8_Pos (8U)
#define CAN_F2R1_FB8_Msk (0x1U << CAN_F2R1_FB8_Pos)
#define CAN_F2R1_FB8 CAN_F2R1_FB8_Msk
#define CAN_F2R1_FB9_Pos (9U)
#define CAN_F2R1_FB9_Msk (0x1U << CAN_F2R1_FB9_Pos)
#define CAN_F2R1_FB9 CAN_F2R1_FB9_Msk
#define CAN_F2R1_FB10_Pos (10U)
#define CAN_F2R1_FB10_Msk (0x1U << CAN_F2R1_FB10_Pos)
#define CAN_F2R1_FB10 CAN_F2R1_FB10_Msk
#define CAN_F2R1_FB11_Pos (11U)
#define CAN_F2R1_FB11_Msk (0x1U << CAN_F2R1_FB11_Pos)
#define CAN_F2R1_FB11 CAN_F2R1_FB11_Msk
#define CAN_F2R1_FB12_Pos (12U)
#define CAN_F2R1_FB12_Msk (0x1U << CAN_F2R1_FB12_Pos)
#define CAN_F2R1_FB12 CAN_F2R1_FB12_Msk
#define CAN_F2R1_FB13_Pos (13U)
#define CAN_F2R1_FB13_Msk (0x1U << CAN_F2R1_FB13_Pos)
#define CAN_F2R1_FB13 CAN_F2R1_FB13_Msk
#define CAN_F2R1_FB14_Pos (14U)
#define CAN_F2R1_FB14_Msk (0x1U << CAN_F2R1_FB14_Pos)
#define CAN_F2R1_FB14 CAN_F2R1_FB14_Msk
#define CAN_F2R1_FB15_Pos (15U)
#define CAN_F2R1_FB15_Msk (0x1U << CAN_F2R1_FB15_Pos)
#define CAN_F2R1_FB15 CAN_F2R1_FB15_Msk
#define CAN_F2R1_FB16_Pos (16U)
#define CAN_F2R1_FB16_Msk (0x1U << CAN_F2R1_FB16_Pos)
#define CAN_F2R1_FB16 CAN_F2R1_FB16_Msk
#define CAN_F2R1_FB17_Pos (17U)
#define CAN_F2R1_FB17_Msk (0x1U << CAN_F2R1_FB17_Pos)
#define CAN_F2R1_FB17 CAN_F2R1_FB17_Msk
#define CAN_F2R1_FB18_Pos (18U)
#define CAN_F2R1_FB18_Msk (0x1U << CAN_F2R1_FB18_Pos)
#define CAN_F2R1_FB18 CAN_F2R1_FB18_Msk
#define CAN_F2R1_FB19_Pos (19U)
#define CAN_F2R1_FB19_Msk (0x1U << CAN_F2R1_FB19_Pos)
#define CAN_F2R1_FB19 CAN_F2R1_FB19_Msk
#define CAN_F2R1_FB20_Pos (20U)
#define CAN_F2R1_FB20_Msk (0x1U << CAN_F2R1_FB20_Pos)
#define CAN_F2R1_FB20 CAN_F2R1_FB20_Msk
#define CAN_F2R1_FB21_Pos (21U)
#define CAN_F2R1_FB21_Msk (0x1U << CAN_F2R1_FB21_Pos)
#define CAN_F2R1_FB21 CAN_F2R1_FB21_Msk
#define CAN_F2R1_FB22_Pos (22U)
#define CAN_F2R1_FB22_Msk (0x1U << CAN_F2R1_FB22_Pos)
#define CAN_F2R1_FB22 CAN_F2R1_FB22_Msk
#define CAN_F2R1_FB23_Pos (23U)
#define CAN_F2R1_FB23_Msk (0x1U << CAN_F2R1_FB23_Pos)
#define CAN_F2R1_FB23 CAN_F2R1_FB23_Msk
#define CAN_F2R1_FB24_Pos (24U)
#define CAN_F2R1_FB24_Msk (0x1U << CAN_F2R1_FB24_Pos)
#define CAN_F2R1_FB24 CAN_F2R1_FB24_Msk
#define CAN_F2R1_FB25_Pos (25U)
#define CAN_F2R1_FB25_Msk (0x1U << CAN_F2R1_FB25_Pos)
#define CAN_F2R1_FB25 CAN_F2R1_FB25_Msk
#define CAN_F2R1_FB26_Pos (26U)
#define CAN_F2R1_FB26_Msk (0x1U << CAN_F2R1_FB26_Pos)
#define CAN_F2R1_FB26 CAN_F2R1_FB26_Msk
#define CAN_F2R1_FB27_Pos (27U)
#define CAN_F2R1_FB27_Msk (0x1U << CAN_F2R1_FB27_Pos)
#define CAN_F2R1_FB27 CAN_F2R1_FB27_Msk
#define CAN_F2R1_FB28_Pos (28U)
#define CAN_F2R1_FB28_Msk (0x1U << CAN_F2R1_FB28_Pos)
#define CAN_F2R1_FB28 CAN_F2R1_FB28_Msk
#define CAN_F2R1_FB29_Pos (29U)
#define CAN_F2R1_FB29_Msk (0x1U << CAN_F2R1_FB29_Pos)
#define CAN_F2R1_FB29 CAN_F2R1_FB29_Msk
#define CAN_F2R1_FB30_Pos (30U)
#define CAN_F2R1_FB30_Msk (0x1U << CAN_F2R1_FB30_Pos)
#define CAN_F2R1_FB30 CAN_F2R1_FB30_Msk
#define CAN_F2R1_FB31_Pos (31U)
#define CAN_F2R1_FB31_Msk (0x1U << CAN_F2R1_FB31_Pos)
#define CAN_F2R1_FB31 CAN_F2R1_FB31_Msk


#define CAN_F3R1_FB0_Pos (0U)
#define CAN_F3R1_FB0_Msk (0x1U << CAN_F3R1_FB0_Pos)
#define CAN_F3R1_FB0 CAN_F3R1_FB0_Msk
#define CAN_F3R1_FB1_Pos (1U)
#define CAN_F3R1_FB1_Msk (0x1U << CAN_F3R1_FB1_Pos)
#define CAN_F3R1_FB1 CAN_F3R1_FB1_Msk
#define CAN_F3R1_FB2_Pos (2U)
#define CAN_F3R1_FB2_Msk (0x1U << CAN_F3R1_FB2_Pos)
#define CAN_F3R1_FB2 CAN_F3R1_FB2_Msk
#define CAN_F3R1_FB3_Pos (3U)
#define CAN_F3R1_FB3_Msk (0x1U << CAN_F3R1_FB3_Pos)
#define CAN_F3R1_FB3 CAN_F3R1_FB3_Msk
#define CAN_F3R1_FB4_Pos (4U)
#define CAN_F3R1_FB4_Msk (0x1U << CAN_F3R1_FB4_Pos)
#define CAN_F3R1_FB4 CAN_F3R1_FB4_Msk
#define CAN_F3R1_FB5_Pos (5U)
#define CAN_F3R1_FB5_Msk (0x1U << CAN_F3R1_FB5_Pos)
#define CAN_F3R1_FB5 CAN_F3R1_FB5_Msk
#define CAN_F3R1_FB6_Pos (6U)
#define CAN_F3R1_FB6_Msk (0x1U << CAN_F3R1_FB6_Pos)
#define CAN_F3R1_FB6 CAN_F3R1_FB6_Msk
#define CAN_F3R1_FB7_Pos (7U)
#define CAN_F3R1_FB7_Msk (0x1U << CAN_F3R1_FB7_Pos)
#define CAN_F3R1_FB7 CAN_F3R1_FB7_Msk
#define CAN_F3R1_FB8_Pos (8U)
#define CAN_F3R1_FB8_Msk (0x1U << CAN_F3R1_FB8_Pos)
#define CAN_F3R1_FB8 CAN_F3R1_FB8_Msk
#define CAN_F3R1_FB9_Pos (9U)
#define CAN_F3R1_FB9_Msk (0x1U << CAN_F3R1_FB9_Pos)
#define CAN_F3R1_FB9 CAN_F3R1_FB9_Msk
#define CAN_F3R1_FB10_Pos (10U)
#define CAN_F3R1_FB10_Msk (0x1U << CAN_F3R1_FB10_Pos)
#define CAN_F3R1_FB10 CAN_F3R1_FB10_Msk
#define CAN_F3R1_FB11_Pos (11U)
#define CAN_F3R1_FB11_Msk (0x1U << CAN_F3R1_FB11_Pos)
#define CAN_F3R1_FB11 CAN_F3R1_FB11_Msk
#define CAN_F3R1_FB12_Pos (12U)
#define CAN_F3R1_FB12_Msk (0x1U << CAN_F3R1_FB12_Pos)
#define CAN_F3R1_FB12 CAN_F3R1_FB12_Msk
#define CAN_F3R1_FB13_Pos (13U)
#define CAN_F3R1_FB13_Msk (0x1U << CAN_F3R1_FB13_Pos)
#define CAN_F3R1_FB13 CAN_F3R1_FB13_Msk
#define CAN_F3R1_FB14_Pos (14U)
#define CAN_F3R1_FB14_Msk (0x1U << CAN_F3R1_FB14_Pos)
#define CAN_F3R1_FB14 CAN_F3R1_FB14_Msk
#define CAN_F3R1_FB15_Pos (15U)
#define CAN_F3R1_FB15_Msk (0x1U << CAN_F3R1_FB15_Pos)
#define CAN_F3R1_FB15 CAN_F3R1_FB15_Msk
#define CAN_F3R1_FB16_Pos (16U)
#define CAN_F3R1_FB16_Msk (0x1U << CAN_F3R1_FB16_Pos)
#define CAN_F3R1_FB16 CAN_F3R1_FB16_Msk
#define CAN_F3R1_FB17_Pos (17U)
#define CAN_F3R1_FB17_Msk (0x1U << CAN_F3R1_FB17_Pos)
#define CAN_F3R1_FB17 CAN_F3R1_FB17_Msk
#define CAN_F3R1_FB18_Pos (18U)
#define CAN_F3R1_FB18_Msk (0x1U << CAN_F3R1_FB18_Pos)
#define CAN_F3R1_FB18 CAN_F3R1_FB18_Msk
#define CAN_F3R1_FB19_Pos (19U)
#define CAN_F3R1_FB19_Msk (0x1U << CAN_F3R1_FB19_Pos)
#define CAN_F3R1_FB19 CAN_F3R1_FB19_Msk
#define CAN_F3R1_FB20_Pos (20U)
#define CAN_F3R1_FB20_Msk (0x1U << CAN_F3R1_FB20_Pos)
#define CAN_F3R1_FB20 CAN_F3R1_FB20_Msk
#define CAN_F3R1_FB21_Pos (21U)
#define CAN_F3R1_FB21_Msk (0x1U << CAN_F3R1_FB21_Pos)
#define CAN_F3R1_FB21 CAN_F3R1_FB21_Msk
#define CAN_F3R1_FB22_Pos (22U)
#define CAN_F3R1_FB22_Msk (0x1U << CAN_F3R1_FB22_Pos)
#define CAN_F3R1_FB22 CAN_F3R1_FB22_Msk
#define CAN_F3R1_FB23_Pos (23U)
#define CAN_F3R1_FB23_Msk (0x1U << CAN_F3R1_FB23_Pos)
#define CAN_F3R1_FB23 CAN_F3R1_FB23_Msk
#define CAN_F3R1_FB24_Pos (24U)
#define CAN_F3R1_FB24_Msk (0x1U << CAN_F3R1_FB24_Pos)
#define CAN_F3R1_FB24 CAN_F3R1_FB24_Msk
#define CAN_F3R1_FB25_Pos (25U)
#define CAN_F3R1_FB25_Msk (0x1U << CAN_F3R1_FB25_Pos)
#define CAN_F3R1_FB25 CAN_F3R1_FB25_Msk
#define CAN_F3R1_FB26_Pos (26U)
#define CAN_F3R1_FB26_Msk (0x1U << CAN_F3R1_FB26_Pos)
#define CAN_F3R1_FB26 CAN_F3R1_FB26_Msk
#define CAN_F3R1_FB27_Pos (27U)
#define CAN_F3R1_FB27_Msk (0x1U << CAN_F3R1_FB27_Pos)
#define CAN_F3R1_FB27 CAN_F3R1_FB27_Msk
#define CAN_F3R1_FB28_Pos (28U)
#define CAN_F3R1_FB28_Msk (0x1U << CAN_F3R1_FB28_Pos)
#define CAN_F3R1_FB28 CAN_F3R1_FB28_Msk
#define CAN_F3R1_FB29_Pos (29U)
#define CAN_F3R1_FB29_Msk (0x1U << CAN_F3R1_FB29_Pos)
#define CAN_F3R1_FB29 CAN_F3R1_FB29_Msk
#define CAN_F3R1_FB30_Pos (30U)
#define CAN_F3R1_FB30_Msk (0x1U << CAN_F3R1_FB30_Pos)
#define CAN_F3R1_FB30 CAN_F3R1_FB30_Msk
#define CAN_F3R1_FB31_Pos (31U)
#define CAN_F3R1_FB31_Msk (0x1U << CAN_F3R1_FB31_Pos)
#define CAN_F3R1_FB31 CAN_F3R1_FB31_Msk


#define CAN_F4R1_FB0_Pos (0U)
#define CAN_F4R1_FB0_Msk (0x1U << CAN_F4R1_FB0_Pos)
#define CAN_F4R1_FB0 CAN_F4R1_FB0_Msk
#define CAN_F4R1_FB1_Pos (1U)
#define CAN_F4R1_FB1_Msk (0x1U << CAN_F4R1_FB1_Pos)
#define CAN_F4R1_FB1 CAN_F4R1_FB1_Msk
#define CAN_F4R1_FB2_Pos (2U)
#define CAN_F4R1_FB2_Msk (0x1U << CAN_F4R1_FB2_Pos)
#define CAN_F4R1_FB2 CAN_F4R1_FB2_Msk
#define CAN_F4R1_FB3_Pos (3U)
#define CAN_F4R1_FB3_Msk (0x1U << CAN_F4R1_FB3_Pos)
#define CAN_F4R1_FB3 CAN_F4R1_FB3_Msk
#define CAN_F4R1_FB4_Pos (4U)
#define CAN_F4R1_FB4_Msk (0x1U << CAN_F4R1_FB4_Pos)
#define CAN_F4R1_FB4 CAN_F4R1_FB4_Msk
#define CAN_F4R1_FB5_Pos (5U)
#define CAN_F4R1_FB5_Msk (0x1U << CAN_F4R1_FB5_Pos)
#define CAN_F4R1_FB5 CAN_F4R1_FB5_Msk
#define CAN_F4R1_FB6_Pos (6U)
#define CAN_F4R1_FB6_Msk (0x1U << CAN_F4R1_FB6_Pos)
#define CAN_F4R1_FB6 CAN_F4R1_FB6_Msk
#define CAN_F4R1_FB7_Pos (7U)
#define CAN_F4R1_FB7_Msk (0x1U << CAN_F4R1_FB7_Pos)
#define CAN_F4R1_FB7 CAN_F4R1_FB7_Msk
#define CAN_F4R1_FB8_Pos (8U)
#define CAN_F4R1_FB8_Msk (0x1U << CAN_F4R1_FB8_Pos)
#define CAN_F4R1_FB8 CAN_F4R1_FB8_Msk
#define CAN_F4R1_FB9_Pos (9U)
#define CAN_F4R1_FB9_Msk (0x1U << CAN_F4R1_FB9_Pos)
#define CAN_F4R1_FB9 CAN_F4R1_FB9_Msk
#define CAN_F4R1_FB10_Pos (10U)
#define CAN_F4R1_FB10_Msk (0x1U << CAN_F4R1_FB10_Pos)
#define CAN_F4R1_FB10 CAN_F4R1_FB10_Msk
#define CAN_F4R1_FB11_Pos (11U)
#define CAN_F4R1_FB11_Msk (0x1U << CAN_F4R1_FB11_Pos)
#define CAN_F4R1_FB11 CAN_F4R1_FB11_Msk
#define CAN_F4R1_FB12_Pos (12U)
#define CAN_F4R1_FB12_Msk (0x1U << CAN_F4R1_FB12_Pos)
#define CAN_F4R1_FB12 CAN_F4R1_FB12_Msk
#define CAN_F4R1_FB13_Pos (13U)
#define CAN_F4R1_FB13_Msk (0x1U << CAN_F4R1_FB13_Pos)
#define CAN_F4R1_FB13 CAN_F4R1_FB13_Msk
#define CAN_F4R1_FB14_Pos (14U)
#define CAN_F4R1_FB14_Msk (0x1U << CAN_F4R1_FB14_Pos)
#define CAN_F4R1_FB14 CAN_F4R1_FB14_Msk
#define CAN_F4R1_FB15_Pos (15U)
#define CAN_F4R1_FB15_Msk (0x1U << CAN_F4R1_FB15_Pos)
#define CAN_F4R1_FB15 CAN_F4R1_FB15_Msk
#define CAN_F4R1_FB16_Pos (16U)
#define CAN_F4R1_FB16_Msk (0x1U << CAN_F4R1_FB16_Pos)
#define CAN_F4R1_FB16 CAN_F4R1_FB16_Msk
#define CAN_F4R1_FB17_Pos (17U)
#define CAN_F4R1_FB17_Msk (0x1U << CAN_F4R1_FB17_Pos)
#define CAN_F4R1_FB17 CAN_F4R1_FB17_Msk
#define CAN_F4R1_FB18_Pos (18U)
#define CAN_F4R1_FB18_Msk (0x1U << CAN_F4R1_FB18_Pos)
#define CAN_F4R1_FB18 CAN_F4R1_FB18_Msk
#define CAN_F4R1_FB19_Pos (19U)
#define CAN_F4R1_FB19_Msk (0x1U << CAN_F4R1_FB19_Pos)
#define CAN_F4R1_FB19 CAN_F4R1_FB19_Msk
#define CAN_F4R1_FB20_Pos (20U)
#define CAN_F4R1_FB20_Msk (0x1U << CAN_F4R1_FB20_Pos)
#define CAN_F4R1_FB20 CAN_F4R1_FB20_Msk
#define CAN_F4R1_FB21_Pos (21U)
#define CAN_F4R1_FB21_Msk (0x1U << CAN_F4R1_FB21_Pos)
#define CAN_F4R1_FB21 CAN_F4R1_FB21_Msk
#define CAN_F4R1_FB22_Pos (22U)
#define CAN_F4R1_FB22_Msk (0x1U << CAN_F4R1_FB22_Pos)
#define CAN_F4R1_FB22 CAN_F4R1_FB22_Msk
#define CAN_F4R1_FB23_Pos (23U)
#define CAN_F4R1_FB23_Msk (0x1U << CAN_F4R1_FB23_Pos)
#define CAN_F4R1_FB23 CAN_F4R1_FB23_Msk
#define CAN_F4R1_FB24_Pos (24U)
#define CAN_F4R1_FB24_Msk (0x1U << CAN_F4R1_FB24_Pos)
#define CAN_F4R1_FB24 CAN_F4R1_FB24_Msk
#define CAN_F4R1_FB25_Pos (25U)
#define CAN_F4R1_FB25_Msk (0x1U << CAN_F4R1_FB25_Pos)
#define CAN_F4R1_FB25 CAN_F4R1_FB25_Msk
#define CAN_F4R1_FB26_Pos (26U)
#define CAN_F4R1_FB26_Msk (0x1U << CAN_F4R1_FB26_Pos)
#define CAN_F4R1_FB26 CAN_F4R1_FB26_Msk
#define CAN_F4R1_FB27_Pos (27U)
#define CAN_F4R1_FB27_Msk (0x1U << CAN_F4R1_FB27_Pos)
#define CAN_F4R1_FB27 CAN_F4R1_FB27_Msk
#define CAN_F4R1_FB28_Pos (28U)
#define CAN_F4R1_FB28_Msk (0x1U << CAN_F4R1_FB28_Pos)
#define CAN_F4R1_FB28 CAN_F4R1_FB28_Msk
#define CAN_F4R1_FB29_Pos (29U)
#define CAN_F4R1_FB29_Msk (0x1U << CAN_F4R1_FB29_Pos)
#define CAN_F4R1_FB29 CAN_F4R1_FB29_Msk
#define CAN_F4R1_FB30_Pos (30U)
#define CAN_F4R1_FB30_Msk (0x1U << CAN_F4R1_FB30_Pos)
#define CAN_F4R1_FB30 CAN_F4R1_FB30_Msk
#define CAN_F4R1_FB31_Pos (31U)
#define CAN_F4R1_FB31_Msk (0x1U << CAN_F4R1_FB31_Pos)
#define CAN_F4R1_FB31 CAN_F4R1_FB31_Msk


#define CAN_F5R1_FB0_Pos (0U)
#define CAN_F5R1_FB0_Msk (0x1U << CAN_F5R1_FB0_Pos)
#define CAN_F5R1_FB0 CAN_F5R1_FB0_Msk
#define CAN_F5R1_FB1_Pos (1U)
#define CAN_F5R1_FB1_Msk (0x1U << CAN_F5R1_FB1_Pos)
#define CAN_F5R1_FB1 CAN_F5R1_FB1_Msk
#define CAN_F5R1_FB2_Pos (2U)
#define CAN_F5R1_FB2_Msk (0x1U << CAN_F5R1_FB2_Pos)
#define CAN_F5R1_FB2 CAN_F5R1_FB2_Msk
#define CAN_F5R1_FB3_Pos (3U)
#define CAN_F5R1_FB3_Msk (0x1U << CAN_F5R1_FB3_Pos)
#define CAN_F5R1_FB3 CAN_F5R1_FB3_Msk
#define CAN_F5R1_FB4_Pos (4U)
#define CAN_F5R1_FB4_Msk (0x1U << CAN_F5R1_FB4_Pos)
#define CAN_F5R1_FB4 CAN_F5R1_FB4_Msk
#define CAN_F5R1_FB5_Pos (5U)
#define CAN_F5R1_FB5_Msk (0x1U << CAN_F5R1_FB5_Pos)
#define CAN_F5R1_FB5 CAN_F5R1_FB5_Msk
#define CAN_F5R1_FB6_Pos (6U)
#define CAN_F5R1_FB6_Msk (0x1U << CAN_F5R1_FB6_Pos)
#define CAN_F5R1_FB6 CAN_F5R1_FB6_Msk
#define CAN_F5R1_FB7_Pos (7U)
#define CAN_F5R1_FB7_Msk (0x1U << CAN_F5R1_FB7_Pos)
#define CAN_F5R1_FB7 CAN_F5R1_FB7_Msk
#define CAN_F5R1_FB8_Pos (8U)
#define CAN_F5R1_FB8_Msk (0x1U << CAN_F5R1_FB8_Pos)
#define CAN_F5R1_FB8 CAN_F5R1_FB8_Msk
#define CAN_F5R1_FB9_Pos (9U)
#define CAN_F5R1_FB9_Msk (0x1U << CAN_F5R1_FB9_Pos)
#define CAN_F5R1_FB9 CAN_F5R1_FB9_Msk
#define CAN_F5R1_FB10_Pos (10U)
#define CAN_F5R1_FB10_Msk (0x1U << CAN_F5R1_FB10_Pos)
#define CAN_F5R1_FB10 CAN_F5R1_FB10_Msk
#define CAN_F5R1_FB11_Pos (11U)
#define CAN_F5R1_FB11_Msk (0x1U << CAN_F5R1_FB11_Pos)
#define CAN_F5R1_FB11 CAN_F5R1_FB11_Msk
#define CAN_F5R1_FB12_Pos (12U)
#define CAN_F5R1_FB12_Msk (0x1U << CAN_F5R1_FB12_Pos)
#define CAN_F5R1_FB12 CAN_F5R1_FB12_Msk
#define CAN_F5R1_FB13_Pos (13U)
#define CAN_F5R1_FB13_Msk (0x1U << CAN_F5R1_FB13_Pos)
#define CAN_F5R1_FB13 CAN_F5R1_FB13_Msk
#define CAN_F5R1_FB14_Pos (14U)
#define CAN_F5R1_FB14_Msk (0x1U << CAN_F5R1_FB14_Pos)
#define CAN_F5R1_FB14 CAN_F5R1_FB14_Msk
#define CAN_F5R1_FB15_Pos (15U)
#define CAN_F5R1_FB15_Msk (0x1U << CAN_F5R1_FB15_Pos)
#define CAN_F5R1_FB15 CAN_F5R1_FB15_Msk
#define CAN_F5R1_FB16_Pos (16U)
#define CAN_F5R1_FB16_Msk (0x1U << CAN_F5R1_FB16_Pos)
#define CAN_F5R1_FB16 CAN_F5R1_FB16_Msk
#define CAN_F5R1_FB17_Pos (17U)
#define CAN_F5R1_FB17_Msk (0x1U << CAN_F5R1_FB17_Pos)
#define CAN_F5R1_FB17 CAN_F5R1_FB17_Msk
#define CAN_F5R1_FB18_Pos (18U)
#define CAN_F5R1_FB18_Msk (0x1U << CAN_F5R1_FB18_Pos)
#define CAN_F5R1_FB18 CAN_F5R1_FB18_Msk
#define CAN_F5R1_FB19_Pos (19U)
#define CAN_F5R1_FB19_Msk (0x1U << CAN_F5R1_FB19_Pos)
#define CAN_F5R1_FB19 CAN_F5R1_FB19_Msk
#define CAN_F5R1_FB20_Pos (20U)
#define CAN_F5R1_FB20_Msk (0x1U << CAN_F5R1_FB20_Pos)
#define CAN_F5R1_FB20 CAN_F5R1_FB20_Msk
#define CAN_F5R1_FB21_Pos (21U)
#define CAN_F5R1_FB21_Msk (0x1U << CAN_F5R1_FB21_Pos)
#define CAN_F5R1_FB21 CAN_F5R1_FB21_Msk
#define CAN_F5R1_FB22_Pos (22U)
#define CAN_F5R1_FB22_Msk (0x1U << CAN_F5R1_FB22_Pos)
#define CAN_F5R1_FB22 CAN_F5R1_FB22_Msk
#define CAN_F5R1_FB23_Pos (23U)
#define CAN_F5R1_FB23_Msk (0x1U << CAN_F5R1_FB23_Pos)
#define CAN_F5R1_FB23 CAN_F5R1_FB23_Msk
#define CAN_F5R1_FB24_Pos (24U)
#define CAN_F5R1_FB24_Msk (0x1U << CAN_F5R1_FB24_Pos)
#define CAN_F5R1_FB24 CAN_F5R1_FB24_Msk
#define CAN_F5R1_FB25_Pos (25U)
#define CAN_F5R1_FB25_Msk (0x1U << CAN_F5R1_FB25_Pos)
#define CAN_F5R1_FB25 CAN_F5R1_FB25_Msk
#define CAN_F5R1_FB26_Pos (26U)
#define CAN_F5R1_FB26_Msk (0x1U << CAN_F5R1_FB26_Pos)
#define CAN_F5R1_FB26 CAN_F5R1_FB26_Msk
#define CAN_F5R1_FB27_Pos (27U)
#define CAN_F5R1_FB27_Msk (0x1U << CAN_F5R1_FB27_Pos)
#define CAN_F5R1_FB27 CAN_F5R1_FB27_Msk
#define CAN_F5R1_FB28_Pos (28U)
#define CAN_F5R1_FB28_Msk (0x1U << CAN_F5R1_FB28_Pos)
#define CAN_F5R1_FB28 CAN_F5R1_FB28_Msk
#define CAN_F5R1_FB29_Pos (29U)
#define CAN_F5R1_FB29_Msk (0x1U << CAN_F5R1_FB29_Pos)
#define CAN_F5R1_FB29 CAN_F5R1_FB29_Msk
#define CAN_F5R1_FB30_Pos (30U)
#define CAN_F5R1_FB30_Msk (0x1U << CAN_F5R1_FB30_Pos)
#define CAN_F5R1_FB30 CAN_F5R1_FB30_Msk
#define CAN_F5R1_FB31_Pos (31U)
#define CAN_F5R1_FB31_Msk (0x1U << CAN_F5R1_FB31_Pos)
#define CAN_F5R1_FB31 CAN_F5R1_FB31_Msk


#define CAN_F6R1_FB0_Pos (0U)
#define CAN_F6R1_FB0_Msk (0x1U << CAN_F6R1_FB0_Pos)
#define CAN_F6R1_FB0 CAN_F6R1_FB0_Msk
#define CAN_F6R1_FB1_Pos (1U)
#define CAN_F6R1_FB1_Msk (0x1U << CAN_F6R1_FB1_Pos)
#define CAN_F6R1_FB1 CAN_F6R1_FB1_Msk
#define CAN_F6R1_FB2_Pos (2U)
#define CAN_F6R1_FB2_Msk (0x1U << CAN_F6R1_FB2_Pos)
#define CAN_F6R1_FB2 CAN_F6R1_FB2_Msk
#define CAN_F6R1_FB3_Pos (3U)
#define CAN_F6R1_FB3_Msk (0x1U << CAN_F6R1_FB3_Pos)
#define CAN_F6R1_FB3 CAN_F6R1_FB3_Msk
#define CAN_F6R1_FB4_Pos (4U)
#define CAN_F6R1_FB4_Msk (0x1U << CAN_F6R1_FB4_Pos)
#define CAN_F6R1_FB4 CAN_F6R1_FB4_Msk
#define CAN_F6R1_FB5_Pos (5U)
#define CAN_F6R1_FB5_Msk (0x1U << CAN_F6R1_FB5_Pos)
#define CAN_F6R1_FB5 CAN_F6R1_FB5_Msk
#define CAN_F6R1_FB6_Pos (6U)
#define CAN_F6R1_FB6_Msk (0x1U << CAN_F6R1_FB6_Pos)
#define CAN_F6R1_FB6 CAN_F6R1_FB6_Msk
#define CAN_F6R1_FB7_Pos (7U)
#define CAN_F6R1_FB7_Msk (0x1U << CAN_F6R1_FB7_Pos)
#define CAN_F6R1_FB7 CAN_F6R1_FB7_Msk
#define CAN_F6R1_FB8_Pos (8U)
#define CAN_F6R1_FB8_Msk (0x1U << CAN_F6R1_FB8_Pos)
#define CAN_F6R1_FB8 CAN_F6R1_FB8_Msk
#define CAN_F6R1_FB9_Pos (9U)
#define CAN_F6R1_FB9_Msk (0x1U << CAN_F6R1_FB9_Pos)
#define CAN_F6R1_FB9 CAN_F6R1_FB9_Msk
#define CAN_F6R1_FB10_Pos (10U)
#define CAN_F6R1_FB10_Msk (0x1U << CAN_F6R1_FB10_Pos)
#define CAN_F6R1_FB10 CAN_F6R1_FB10_Msk
#define CAN_F6R1_FB11_Pos (11U)
#define CAN_F6R1_FB11_Msk (0x1U << CAN_F6R1_FB11_Pos)
#define CAN_F6R1_FB11 CAN_F6R1_FB11_Msk
#define CAN_F6R1_FB12_Pos (12U)
#define CAN_F6R1_FB12_Msk (0x1U << CAN_F6R1_FB12_Pos)
#define CAN_F6R1_FB12 CAN_F6R1_FB12_Msk
#define CAN_F6R1_FB13_Pos (13U)
#define CAN_F6R1_FB13_Msk (0x1U << CAN_F6R1_FB13_Pos)
#define CAN_F6R1_FB13 CAN_F6R1_FB13_Msk
#define CAN_F6R1_FB14_Pos (14U)
#define CAN_F6R1_FB14_Msk (0x1U << CAN_F6R1_FB14_Pos)
#define CAN_F6R1_FB14 CAN_F6R1_FB14_Msk
#define CAN_F6R1_FB15_Pos (15U)
#define CAN_F6R1_FB15_Msk (0x1U << CAN_F6R1_FB15_Pos)
#define CAN_F6R1_FB15 CAN_F6R1_FB15_Msk
#define CAN_F6R1_FB16_Pos (16U)
#define CAN_F6R1_FB16_Msk (0x1U << CAN_F6R1_FB16_Pos)
#define CAN_F6R1_FB16 CAN_F6R1_FB16_Msk
#define CAN_F6R1_FB17_Pos (17U)
#define CAN_F6R1_FB17_Msk (0x1U << CAN_F6R1_FB17_Pos)
#define CAN_F6R1_FB17 CAN_F6R1_FB17_Msk
#define CAN_F6R1_FB18_Pos (18U)
#define CAN_F6R1_FB18_Msk (0x1U << CAN_F6R1_FB18_Pos)
#define CAN_F6R1_FB18 CAN_F6R1_FB18_Msk
#define CAN_F6R1_FB19_Pos (19U)
#define CAN_F6R1_FB19_Msk (0x1U << CAN_F6R1_FB19_Pos)
#define CAN_F6R1_FB19 CAN_F6R1_FB19_Msk
#define CAN_F6R1_FB20_Pos (20U)
#define CAN_F6R1_FB20_Msk (0x1U << CAN_F6R1_FB20_Pos)
#define CAN_F6R1_FB20 CAN_F6R1_FB20_Msk
#define CAN_F6R1_FB21_Pos (21U)
#define CAN_F6R1_FB21_Msk (0x1U << CAN_F6R1_FB21_Pos)
#define CAN_F6R1_FB21 CAN_F6R1_FB21_Msk
#define CAN_F6R1_FB22_Pos (22U)
#define CAN_F6R1_FB22_Msk (0x1U << CAN_F6R1_FB22_Pos)
#define CAN_F6R1_FB22 CAN_F6R1_FB22_Msk
#define CAN_F6R1_FB23_Pos (23U)
#define CAN_F6R1_FB23_Msk (0x1U << CAN_F6R1_FB23_Pos)
#define CAN_F6R1_FB23 CAN_F6R1_FB23_Msk
#define CAN_F6R1_FB24_Pos (24U)
#define CAN_F6R1_FB24_Msk (0x1U << CAN_F6R1_FB24_Pos)
#define CAN_F6R1_FB24 CAN_F6R1_FB24_Msk
#define CAN_F6R1_FB25_Pos (25U)
#define CAN_F6R1_FB25_Msk (0x1U << CAN_F6R1_FB25_Pos)
#define CAN_F6R1_FB25 CAN_F6R1_FB25_Msk
#define CAN_F6R1_FB26_Pos (26U)
#define CAN_F6R1_FB26_Msk (0x1U << CAN_F6R1_FB26_Pos)
#define CAN_F6R1_FB26 CAN_F6R1_FB26_Msk
#define CAN_F6R1_FB27_Pos (27U)
#define CAN_F6R1_FB27_Msk (0x1U << CAN_F6R1_FB27_Pos)
#define CAN_F6R1_FB27 CAN_F6R1_FB27_Msk
#define CAN_F6R1_FB28_Pos (28U)
#define CAN_F6R1_FB28_Msk (0x1U << CAN_F6R1_FB28_Pos)
#define CAN_F6R1_FB28 CAN_F6R1_FB28_Msk
#define CAN_F6R1_FB29_Pos (29U)
#define CAN_F6R1_FB29_Msk (0x1U << CAN_F6R1_FB29_Pos)
#define CAN_F6R1_FB29 CAN_F6R1_FB29_Msk
#define CAN_F6R1_FB30_Pos (30U)
#define CAN_F6R1_FB30_Msk (0x1U << CAN_F6R1_FB30_Pos)
#define CAN_F6R1_FB30 CAN_F6R1_FB30_Msk
#define CAN_F6R1_FB31_Pos (31U)
#define CAN_F6R1_FB31_Msk (0x1U << CAN_F6R1_FB31_Pos)
#define CAN_F6R1_FB31 CAN_F6R1_FB31_Msk


#define CAN_F7R1_FB0_Pos (0U)
#define CAN_F7R1_FB0_Msk (0x1U << CAN_F7R1_FB0_Pos)
#define CAN_F7R1_FB0 CAN_F7R1_FB0_Msk
#define CAN_F7R1_FB1_Pos (1U)
#define CAN_F7R1_FB1_Msk (0x1U << CAN_F7R1_FB1_Pos)
#define CAN_F7R1_FB1 CAN_F7R1_FB1_Msk
#define CAN_F7R1_FB2_Pos (2U)
#define CAN_F7R1_FB2_Msk (0x1U << CAN_F7R1_FB2_Pos)
#define CAN_F7R1_FB2 CAN_F7R1_FB2_Msk
#define CAN_F7R1_FB3_Pos (3U)
#define CAN_F7R1_FB3_Msk (0x1U << CAN_F7R1_FB3_Pos)
#define CAN_F7R1_FB3 CAN_F7R1_FB3_Msk
#define CAN_F7R1_FB4_Pos (4U)
#define CAN_F7R1_FB4_Msk (0x1U << CAN_F7R1_FB4_Pos)
#define CAN_F7R1_FB4 CAN_F7R1_FB4_Msk
#define CAN_F7R1_FB5_Pos (5U)
#define CAN_F7R1_FB5_Msk (0x1U << CAN_F7R1_FB5_Pos)
#define CAN_F7R1_FB5 CAN_F7R1_FB5_Msk
#define CAN_F7R1_FB6_Pos (6U)
#define CAN_F7R1_FB6_Msk (0x1U << CAN_F7R1_FB6_Pos)
#define CAN_F7R1_FB6 CAN_F7R1_FB6_Msk
#define CAN_F7R1_FB7_Pos (7U)
#define CAN_F7R1_FB7_Msk (0x1U << CAN_F7R1_FB7_Pos)
#define CAN_F7R1_FB7 CAN_F7R1_FB7_Msk
#define CAN_F7R1_FB8_Pos (8U)
#define CAN_F7R1_FB8_Msk (0x1U << CAN_F7R1_FB8_Pos)
#define CAN_F7R1_FB8 CAN_F7R1_FB8_Msk
#define CAN_F7R1_FB9_Pos (9U)
#define CAN_F7R1_FB9_Msk (0x1U << CAN_F7R1_FB9_Pos)
#define CAN_F7R1_FB9 CAN_F7R1_FB9_Msk
#define CAN_F7R1_FB10_Pos (10U)
#define CAN_F7R1_FB10_Msk (0x1U << CAN_F7R1_FB10_Pos)
#define CAN_F7R1_FB10 CAN_F7R1_FB10_Msk
#define CAN_F7R1_FB11_Pos (11U)
#define CAN_F7R1_FB11_Msk (0x1U << CAN_F7R1_FB11_Pos)
#define CAN_F7R1_FB11 CAN_F7R1_FB11_Msk
#define CAN_F7R1_FB12_Pos (12U)
#define CAN_F7R1_FB12_Msk (0x1U << CAN_F7R1_FB12_Pos)
#define CAN_F7R1_FB12 CAN_F7R1_FB12_Msk
#define CAN_F7R1_FB13_Pos (13U)
#define CAN_F7R1_FB13_Msk (0x1U << CAN_F7R1_FB13_Pos)
#define CAN_F7R1_FB13 CAN_F7R1_FB13_Msk
#define CAN_F7R1_FB14_Pos (14U)
#define CAN_F7R1_FB14_Msk (0x1U << CAN_F7R1_FB14_Pos)
#define CAN_F7R1_FB14 CAN_F7R1_FB14_Msk
#define CAN_F7R1_FB15_Pos (15U)
#define CAN_F7R1_FB15_Msk (0x1U << CAN_F7R1_FB15_Pos)
#define CAN_F7R1_FB15 CAN_F7R1_FB15_Msk
#define CAN_F7R1_FB16_Pos (16U)
#define CAN_F7R1_FB16_Msk (0x1U << CAN_F7R1_FB16_Pos)
#define CAN_F7R1_FB16 CAN_F7R1_FB16_Msk
#define CAN_F7R1_FB17_Pos (17U)
#define CAN_F7R1_FB17_Msk (0x1U << CAN_F7R1_FB17_Pos)
#define CAN_F7R1_FB17 CAN_F7R1_FB17_Msk
#define CAN_F7R1_FB18_Pos (18U)
#define CAN_F7R1_FB18_Msk (0x1U << CAN_F7R1_FB18_Pos)
#define CAN_F7R1_FB18 CAN_F7R1_FB18_Msk
#define CAN_F7R1_FB19_Pos (19U)
#define CAN_F7R1_FB19_Msk (0x1U << CAN_F7R1_FB19_Pos)
#define CAN_F7R1_FB19 CAN_F7R1_FB19_Msk
#define CAN_F7R1_FB20_Pos (20U)
#define CAN_F7R1_FB20_Msk (0x1U << CAN_F7R1_FB20_Pos)
#define CAN_F7R1_FB20 CAN_F7R1_FB20_Msk
#define CAN_F7R1_FB21_Pos (21U)
#define CAN_F7R1_FB21_Msk (0x1U << CAN_F7R1_FB21_Pos)
#define CAN_F7R1_FB21 CAN_F7R1_FB21_Msk
#define CAN_F7R1_FB22_Pos (22U)
#define CAN_F7R1_FB22_Msk (0x1U << CAN_F7R1_FB22_Pos)
#define CAN_F7R1_FB22 CAN_F7R1_FB22_Msk
#define CAN_F7R1_FB23_Pos (23U)
#define CAN_F7R1_FB23_Msk (0x1U << CAN_F7R1_FB23_Pos)
#define CAN_F7R1_FB23 CAN_F7R1_FB23_Msk
#define CAN_F7R1_FB24_Pos (24U)
#define CAN_F7R1_FB24_Msk (0x1U << CAN_F7R1_FB24_Pos)
#define CAN_F7R1_FB24 CAN_F7R1_FB24_Msk
#define CAN_F7R1_FB25_Pos (25U)
#define CAN_F7R1_FB25_Msk (0x1U << CAN_F7R1_FB25_Pos)
#define CAN_F7R1_FB25 CAN_F7R1_FB25_Msk
#define CAN_F7R1_FB26_Pos (26U)
#define CAN_F7R1_FB26_Msk (0x1U << CAN_F7R1_FB26_Pos)
#define CAN_F7R1_FB26 CAN_F7R1_FB26_Msk
#define CAN_F7R1_FB27_Pos (27U)
#define CAN_F7R1_FB27_Msk (0x1U << CAN_F7R1_FB27_Pos)
#define CAN_F7R1_FB27 CAN_F7R1_FB27_Msk
#define CAN_F7R1_FB28_Pos (28U)
#define CAN_F7R1_FB28_Msk (0x1U << CAN_F7R1_FB28_Pos)
#define CAN_F7R1_FB28 CAN_F7R1_FB28_Msk
#define CAN_F7R1_FB29_Pos (29U)
#define CAN_F7R1_FB29_Msk (0x1U << CAN_F7R1_FB29_Pos)
#define CAN_F7R1_FB29 CAN_F7R1_FB29_Msk
#define CAN_F7R1_FB30_Pos (30U)
#define CAN_F7R1_FB30_Msk (0x1U << CAN_F7R1_FB30_Pos)
#define CAN_F7R1_FB30 CAN_F7R1_FB30_Msk
#define CAN_F7R1_FB31_Pos (31U)
#define CAN_F7R1_FB31_Msk (0x1U << CAN_F7R1_FB31_Pos)
#define CAN_F7R1_FB31 CAN_F7R1_FB31_Msk


#define CAN_F8R1_FB0_Pos (0U)
#define CAN_F8R1_FB0_Msk (0x1U << CAN_F8R1_FB0_Pos)
#define CAN_F8R1_FB0 CAN_F8R1_FB0_Msk
#define CAN_F8R1_FB1_Pos (1U)
#define CAN_F8R1_FB1_Msk (0x1U << CAN_F8R1_FB1_Pos)
#define CAN_F8R1_FB1 CAN_F8R1_FB1_Msk
#define CAN_F8R1_FB2_Pos (2U)
#define CAN_F8R1_FB2_Msk (0x1U << CAN_F8R1_FB2_Pos)
#define CAN_F8R1_FB2 CAN_F8R1_FB2_Msk
#define CAN_F8R1_FB3_Pos (3U)
#define CAN_F8R1_FB3_Msk (0x1U << CAN_F8R1_FB3_Pos)
#define CAN_F8R1_FB3 CAN_F8R1_FB3_Msk
#define CAN_F8R1_FB4_Pos (4U)
#define CAN_F8R1_FB4_Msk (0x1U << CAN_F8R1_FB4_Pos)
#define CAN_F8R1_FB4 CAN_F8R1_FB4_Msk
#define CAN_F8R1_FB5_Pos (5U)
#define CAN_F8R1_FB5_Msk (0x1U << CAN_F8R1_FB5_Pos)
#define CAN_F8R1_FB5 CAN_F8R1_FB5_Msk
#define CAN_F8R1_FB6_Pos (6U)
#define CAN_F8R1_FB6_Msk (0x1U << CAN_F8R1_FB6_Pos)
#define CAN_F8R1_FB6 CAN_F8R1_FB6_Msk
#define CAN_F8R1_FB7_Pos (7U)
#define CAN_F8R1_FB7_Msk (0x1U << CAN_F8R1_FB7_Pos)
#define CAN_F8R1_FB7 CAN_F8R1_FB7_Msk
#define CAN_F8R1_FB8_Pos (8U)
#define CAN_F8R1_FB8_Msk (0x1U << CAN_F8R1_FB8_Pos)
#define CAN_F8R1_FB8 CAN_F8R1_FB8_Msk
#define CAN_F8R1_FB9_Pos (9U)
#define CAN_F8R1_FB9_Msk (0x1U << CAN_F8R1_FB9_Pos)
#define CAN_F8R1_FB9 CAN_F8R1_FB9_Msk
#define CAN_F8R1_FB10_Pos (10U)
#define CAN_F8R1_FB10_Msk (0x1U << CAN_F8R1_FB10_Pos)
#define CAN_F8R1_FB10 CAN_F8R1_FB10_Msk
#define CAN_F8R1_FB11_Pos (11U)
#define CAN_F8R1_FB11_Msk (0x1U << CAN_F8R1_FB11_Pos)
#define CAN_F8R1_FB11 CAN_F8R1_FB11_Msk
#define CAN_F8R1_FB12_Pos (12U)
#define CAN_F8R1_FB12_Msk (0x1U << CAN_F8R1_FB12_Pos)
#define CAN_F8R1_FB12 CAN_F8R1_FB12_Msk
#define CAN_F8R1_FB13_Pos (13U)
#define CAN_F8R1_FB13_Msk (0x1U << CAN_F8R1_FB13_Pos)
#define CAN_F8R1_FB13 CAN_F8R1_FB13_Msk
#define CAN_F8R1_FB14_Pos (14U)
#define CAN_F8R1_FB14_Msk (0x1U << CAN_F8R1_FB14_Pos)
#define CAN_F8R1_FB14 CAN_F8R1_FB14_Msk
#define CAN_F8R1_FB15_Pos (15U)
#define CAN_F8R1_FB15_Msk (0x1U << CAN_F8R1_FB15_Pos)
#define CAN_F8R1_FB15 CAN_F8R1_FB15_Msk
#define CAN_F8R1_FB16_Pos (16U)
#define CAN_F8R1_FB16_Msk (0x1U << CAN_F8R1_FB16_Pos)
#define CAN_F8R1_FB16 CAN_F8R1_FB16_Msk
#define CAN_F8R1_FB17_Pos (17U)
#define CAN_F8R1_FB17_Msk (0x1U << CAN_F8R1_FB17_Pos)
#define CAN_F8R1_FB17 CAN_F8R1_FB17_Msk
#define CAN_F8R1_FB18_Pos (18U)
#define CAN_F8R1_FB18_Msk (0x1U << CAN_F8R1_FB18_Pos)
#define CAN_F8R1_FB18 CAN_F8R1_FB18_Msk
#define CAN_F8R1_FB19_Pos (19U)
#define CAN_F8R1_FB19_Msk (0x1U << CAN_F8R1_FB19_Pos)
#define CAN_F8R1_FB19 CAN_F8R1_FB19_Msk
#define CAN_F8R1_FB20_Pos (20U)
#define CAN_F8R1_FB20_Msk (0x1U << CAN_F8R1_FB20_Pos)
#define CAN_F8R1_FB20 CAN_F8R1_FB20_Msk
#define CAN_F8R1_FB21_Pos (21U)
#define CAN_F8R1_FB21_Msk (0x1U << CAN_F8R1_FB21_Pos)
#define CAN_F8R1_FB21 CAN_F8R1_FB21_Msk
#define CAN_F8R1_FB22_Pos (22U)
#define CAN_F8R1_FB22_Msk (0x1U << CAN_F8R1_FB22_Pos)
#define CAN_F8R1_FB22 CAN_F8R1_FB22_Msk
#define CAN_F8R1_FB23_Pos (23U)
#define CAN_F8R1_FB23_Msk (0x1U << CAN_F8R1_FB23_Pos)
#define CAN_F8R1_FB23 CAN_F8R1_FB23_Msk
#define CAN_F8R1_FB24_Pos (24U)
#define CAN_F8R1_FB24_Msk (0x1U << CAN_F8R1_FB24_Pos)
#define CAN_F8R1_FB24 CAN_F8R1_FB24_Msk
#define CAN_F8R1_FB25_Pos (25U)
#define CAN_F8R1_FB25_Msk (0x1U << CAN_F8R1_FB25_Pos)
#define CAN_F8R1_FB25 CAN_F8R1_FB25_Msk
#define CAN_F8R1_FB26_Pos (26U)
#define CAN_F8R1_FB26_Msk (0x1U << CAN_F8R1_FB26_Pos)
#define CAN_F8R1_FB26 CAN_F8R1_FB26_Msk
#define CAN_F8R1_FB27_Pos (27U)
#define CAN_F8R1_FB27_Msk (0x1U << CAN_F8R1_FB27_Pos)
#define CAN_F8R1_FB27 CAN_F8R1_FB27_Msk
#define CAN_F8R1_FB28_Pos (28U)
#define CAN_F8R1_FB28_Msk (0x1U << CAN_F8R1_FB28_Pos)
#define CAN_F8R1_FB28 CAN_F8R1_FB28_Msk
#define CAN_F8R1_FB29_Pos (29U)
#define CAN_F8R1_FB29_Msk (0x1U << CAN_F8R1_FB29_Pos)
#define CAN_F8R1_FB29 CAN_F8R1_FB29_Msk
#define CAN_F8R1_FB30_Pos (30U)
#define CAN_F8R1_FB30_Msk (0x1U << CAN_F8R1_FB30_Pos)
#define CAN_F8R1_FB30 CAN_F8R1_FB30_Msk
#define CAN_F8R1_FB31_Pos (31U)
#define CAN_F8R1_FB31_Msk (0x1U << CAN_F8R1_FB31_Pos)
#define CAN_F8R1_FB31 CAN_F8R1_FB31_Msk


#define CAN_F9R1_FB0_Pos (0U)
#define CAN_F9R1_FB0_Msk (0x1U << CAN_F9R1_FB0_Pos)
#define CAN_F9R1_FB0 CAN_F9R1_FB0_Msk
#define CAN_F9R1_FB1_Pos (1U)
#define CAN_F9R1_FB1_Msk (0x1U << CAN_F9R1_FB1_Pos)
#define CAN_F9R1_FB1 CAN_F9R1_FB1_Msk
#define CAN_F9R1_FB2_Pos (2U)
#define CAN_F9R1_FB2_Msk (0x1U << CAN_F9R1_FB2_Pos)
#define CAN_F9R1_FB2 CAN_F9R1_FB2_Msk
#define CAN_F9R1_FB3_Pos (3U)
#define CAN_F9R1_FB3_Msk (0x1U << CAN_F9R1_FB3_Pos)
#define CAN_F9R1_FB3 CAN_F9R1_FB3_Msk
#define CAN_F9R1_FB4_Pos (4U)
#define CAN_F9R1_FB4_Msk (0x1U << CAN_F9R1_FB4_Pos)
#define CAN_F9R1_FB4 CAN_F9R1_FB4_Msk
#define CAN_F9R1_FB5_Pos (5U)
#define CAN_F9R1_FB5_Msk (0x1U << CAN_F9R1_FB5_Pos)
#define CAN_F9R1_FB5 CAN_F9R1_FB5_Msk
#define CAN_F9R1_FB6_Pos (6U)
#define CAN_F9R1_FB6_Msk (0x1U << CAN_F9R1_FB6_Pos)
#define CAN_F9R1_FB6 CAN_F9R1_FB6_Msk
#define CAN_F9R1_FB7_Pos (7U)
#define CAN_F9R1_FB7_Msk (0x1U << CAN_F9R1_FB7_Pos)
#define CAN_F9R1_FB7 CAN_F9R1_FB7_Msk
#define CAN_F9R1_FB8_Pos (8U)
#define CAN_F9R1_FB8_Msk (0x1U << CAN_F9R1_FB8_Pos)
#define CAN_F9R1_FB8 CAN_F9R1_FB8_Msk
#define CAN_F9R1_FB9_Pos (9U)
#define CAN_F9R1_FB9_Msk (0x1U << CAN_F9R1_FB9_Pos)
#define CAN_F9R1_FB9 CAN_F9R1_FB9_Msk
#define CAN_F9R1_FB10_Pos (10U)
#define CAN_F9R1_FB10_Msk (0x1U << CAN_F9R1_FB10_Pos)
#define CAN_F9R1_FB10 CAN_F9R1_FB10_Msk
#define CAN_F9R1_FB11_Pos (11U)
#define CAN_F9R1_FB11_Msk (0x1U << CAN_F9R1_FB11_Pos)
#define CAN_F9R1_FB11 CAN_F9R1_FB11_Msk
#define CAN_F9R1_FB12_Pos (12U)
#define CAN_F9R1_FB12_Msk (0x1U << CAN_F9R1_FB12_Pos)
#define CAN_F9R1_FB12 CAN_F9R1_FB12_Msk
#define CAN_F9R1_FB13_Pos (13U)
#define CAN_F9R1_FB13_Msk (0x1U << CAN_F9R1_FB13_Pos)
#define CAN_F9R1_FB13 CAN_F9R1_FB13_Msk
#define CAN_F9R1_FB14_Pos (14U)
#define CAN_F9R1_FB14_Msk (0x1U << CAN_F9R1_FB14_Pos)
#define CAN_F9R1_FB14 CAN_F9R1_FB14_Msk
#define CAN_F9R1_FB15_Pos (15U)
#define CAN_F9R1_FB15_Msk (0x1U << CAN_F9R1_FB15_Pos)
#define CAN_F9R1_FB15 CAN_F9R1_FB15_Msk
#define CAN_F9R1_FB16_Pos (16U)
#define CAN_F9R1_FB16_Msk (0x1U << CAN_F9R1_FB16_Pos)
#define CAN_F9R1_FB16 CAN_F9R1_FB16_Msk
#define CAN_F9R1_FB17_Pos (17U)
#define CAN_F9R1_FB17_Msk (0x1U << CAN_F9R1_FB17_Pos)
#define CAN_F9R1_FB17 CAN_F9R1_FB17_Msk
#define CAN_F9R1_FB18_Pos (18U)
#define CAN_F9R1_FB18_Msk (0x1U << CAN_F9R1_FB18_Pos)
#define CAN_F9R1_FB18 CAN_F9R1_FB18_Msk
#define CAN_F9R1_FB19_Pos (19U)
#define CAN_F9R1_FB19_Msk (0x1U << CAN_F9R1_FB19_Pos)
#define CAN_F9R1_FB19 CAN_F9R1_FB19_Msk
#define CAN_F9R1_FB20_Pos (20U)
#define CAN_F9R1_FB20_Msk (0x1U << CAN_F9R1_FB20_Pos)
#define CAN_F9R1_FB20 CAN_F9R1_FB20_Msk
#define CAN_F9R1_FB21_Pos (21U)
#define CAN_F9R1_FB21_Msk (0x1U << CAN_F9R1_FB21_Pos)
#define CAN_F9R1_FB21 CAN_F9R1_FB21_Msk
#define CAN_F9R1_FB22_Pos (22U)
#define CAN_F9R1_FB22_Msk (0x1U << CAN_F9R1_FB22_Pos)
#define CAN_F9R1_FB22 CAN_F9R1_FB22_Msk
#define CAN_F9R1_FB23_Pos (23U)
#define CAN_F9R1_FB23_Msk (0x1U << CAN_F9R1_FB23_Pos)
#define CAN_F9R1_FB23 CAN_F9R1_FB23_Msk
#define CAN_F9R1_FB24_Pos (24U)
#define CAN_F9R1_FB24_Msk (0x1U << CAN_F9R1_FB24_Pos)
#define CAN_F9R1_FB24 CAN_F9R1_FB24_Msk
#define CAN_F9R1_FB25_Pos (25U)
#define CAN_F9R1_FB25_Msk (0x1U << CAN_F9R1_FB25_Pos)
#define CAN_F9R1_FB25 CAN_F9R1_FB25_Msk
#define CAN_F9R1_FB26_Pos (26U)
#define CAN_F9R1_FB26_Msk (0x1U << CAN_F9R1_FB26_Pos)
#define CAN_F9R1_FB26 CAN_F9R1_FB26_Msk
#define CAN_F9R1_FB27_Pos (27U)
#define CAN_F9R1_FB27_Msk (0x1U << CAN_F9R1_FB27_Pos)
#define CAN_F9R1_FB27 CAN_F9R1_FB27_Msk
#define CAN_F9R1_FB28_Pos (28U)
#define CAN_F9R1_FB28_Msk (0x1U << CAN_F9R1_FB28_Pos)
#define CAN_F9R1_FB28 CAN_F9R1_FB28_Msk
#define CAN_F9R1_FB29_Pos (29U)
#define CAN_F9R1_FB29_Msk (0x1U << CAN_F9R1_FB29_Pos)
#define CAN_F9R1_FB29 CAN_F9R1_FB29_Msk
#define CAN_F9R1_FB30_Pos (30U)
#define CAN_F9R1_FB30_Msk (0x1U << CAN_F9R1_FB30_Pos)
#define CAN_F9R1_FB30 CAN_F9R1_FB30_Msk
#define CAN_F9R1_FB31_Pos (31U)
#define CAN_F9R1_FB31_Msk (0x1U << CAN_F9R1_FB31_Pos)
#define CAN_F9R1_FB31 CAN_F9R1_FB31_Msk


#define CAN_F10R1_FB0_Pos (0U)
#define CAN_F10R1_FB0_Msk (0x1U << CAN_F10R1_FB0_Pos)
#define CAN_F10R1_FB0 CAN_F10R1_FB0_Msk
#define CAN_F10R1_FB1_Pos (1U)
#define CAN_F10R1_FB1_Msk (0x1U << CAN_F10R1_FB1_Pos)
#define CAN_F10R1_FB1 CAN_F10R1_FB1_Msk
#define CAN_F10R1_FB2_Pos (2U)
#define CAN_F10R1_FB2_Msk (0x1U << CAN_F10R1_FB2_Pos)
#define CAN_F10R1_FB2 CAN_F10R1_FB2_Msk
#define CAN_F10R1_FB3_Pos (3U)
#define CAN_F10R1_FB3_Msk (0x1U << CAN_F10R1_FB3_Pos)
#define CAN_F10R1_FB3 CAN_F10R1_FB3_Msk
#define CAN_F10R1_FB4_Pos (4U)
#define CAN_F10R1_FB4_Msk (0x1U << CAN_F10R1_FB4_Pos)
#define CAN_F10R1_FB4 CAN_F10R1_FB4_Msk
#define CAN_F10R1_FB5_Pos (5U)
#define CAN_F10R1_FB5_Msk (0x1U << CAN_F10R1_FB5_Pos)
#define CAN_F10R1_FB5 CAN_F10R1_FB5_Msk
#define CAN_F10R1_FB6_Pos (6U)
#define CAN_F10R1_FB6_Msk (0x1U << CAN_F10R1_FB6_Pos)
#define CAN_F10R1_FB6 CAN_F10R1_FB6_Msk
#define CAN_F10R1_FB7_Pos (7U)
#define CAN_F10R1_FB7_Msk (0x1U << CAN_F10R1_FB7_Pos)
#define CAN_F10R1_FB7 CAN_F10R1_FB7_Msk
#define CAN_F10R1_FB8_Pos (8U)
#define CAN_F10R1_FB8_Msk (0x1U << CAN_F10R1_FB8_Pos)
#define CAN_F10R1_FB8 CAN_F10R1_FB8_Msk
#define CAN_F10R1_FB9_Pos (9U)
#define CAN_F10R1_FB9_Msk (0x1U << CAN_F10R1_FB9_Pos)
#define CAN_F10R1_FB9 CAN_F10R1_FB9_Msk
#define CAN_F10R1_FB10_Pos (10U)
#define CAN_F10R1_FB10_Msk (0x1U << CAN_F10R1_FB10_Pos)
#define CAN_F10R1_FB10 CAN_F10R1_FB10_Msk
#define CAN_F10R1_FB11_Pos (11U)
#define CAN_F10R1_FB11_Msk (0x1U << CAN_F10R1_FB11_Pos)
#define CAN_F10R1_FB11 CAN_F10R1_FB11_Msk
#define CAN_F10R1_FB12_Pos (12U)
#define CAN_F10R1_FB12_Msk (0x1U << CAN_F10R1_FB12_Pos)
#define CAN_F10R1_FB12 CAN_F10R1_FB12_Msk
#define CAN_F10R1_FB13_Pos (13U)
#define CAN_F10R1_FB13_Msk (0x1U << CAN_F10R1_FB13_Pos)
#define CAN_F10R1_FB13 CAN_F10R1_FB13_Msk
#define CAN_F10R1_FB14_Pos (14U)
#define CAN_F10R1_FB14_Msk (0x1U << CAN_F10R1_FB14_Pos)
#define CAN_F10R1_FB14 CAN_F10R1_FB14_Msk
#define CAN_F10R1_FB15_Pos (15U)
#define CAN_F10R1_FB15_Msk (0x1U << CAN_F10R1_FB15_Pos)
#define CAN_F10R1_FB15 CAN_F10R1_FB15_Msk
#define CAN_F10R1_FB16_Pos (16U)
#define CAN_F10R1_FB16_Msk (0x1U << CAN_F10R1_FB16_Pos)
#define CAN_F10R1_FB16 CAN_F10R1_FB16_Msk
#define CAN_F10R1_FB17_Pos (17U)
#define CAN_F10R1_FB17_Msk (0x1U << CAN_F10R1_FB17_Pos)
#define CAN_F10R1_FB17 CAN_F10R1_FB17_Msk
#define CAN_F10R1_FB18_Pos (18U)
#define CAN_F10R1_FB18_Msk (0x1U << CAN_F10R1_FB18_Pos)
#define CAN_F10R1_FB18 CAN_F10R1_FB18_Msk
#define CAN_F10R1_FB19_Pos (19U)
#define CAN_F10R1_FB19_Msk (0x1U << CAN_F10R1_FB19_Pos)
#define CAN_F10R1_FB19 CAN_F10R1_FB19_Msk
#define CAN_F10R1_FB20_Pos (20U)
#define CAN_F10R1_FB20_Msk (0x1U << CAN_F10R1_FB20_Pos)
#define CAN_F10R1_FB20 CAN_F10R1_FB20_Msk
#define CAN_F10R1_FB21_Pos (21U)
#define CAN_F10R1_FB21_Msk (0x1U << CAN_F10R1_FB21_Pos)
#define CAN_F10R1_FB21 CAN_F10R1_FB21_Msk
#define CAN_F10R1_FB22_Pos (22U)
#define CAN_F10R1_FB22_Msk (0x1U << CAN_F10R1_FB22_Pos)
#define CAN_F10R1_FB22 CAN_F10R1_FB22_Msk
#define CAN_F10R1_FB23_Pos (23U)
#define CAN_F10R1_FB23_Msk (0x1U << CAN_F10R1_FB23_Pos)
#define CAN_F10R1_FB23 CAN_F10R1_FB23_Msk
#define CAN_F10R1_FB24_Pos (24U)
#define CAN_F10R1_FB24_Msk (0x1U << CAN_F10R1_FB24_Pos)
#define CAN_F10R1_FB24 CAN_F10R1_FB24_Msk
#define CAN_F10R1_FB25_Pos (25U)
#define CAN_F10R1_FB25_Msk (0x1U << CAN_F10R1_FB25_Pos)
#define CAN_F10R1_FB25 CAN_F10R1_FB25_Msk
#define CAN_F10R1_FB26_Pos (26U)
#define CAN_F10R1_FB26_Msk (0x1U << CAN_F10R1_FB26_Pos)
#define CAN_F10R1_FB26 CAN_F10R1_FB26_Msk
#define CAN_F10R1_FB27_Pos (27U)
#define CAN_F10R1_FB27_Msk (0x1U << CAN_F10R1_FB27_Pos)
#define CAN_F10R1_FB27 CAN_F10R1_FB27_Msk
#define CAN_F10R1_FB28_Pos (28U)
#define CAN_F10R1_FB28_Msk (0x1U << CAN_F10R1_FB28_Pos)
#define CAN_F10R1_FB28 CAN_F10R1_FB28_Msk
#define CAN_F10R1_FB29_Pos (29U)
#define CAN_F10R1_FB29_Msk (0x1U << CAN_F10R1_FB29_Pos)
#define CAN_F10R1_FB29 CAN_F10R1_FB29_Msk
#define CAN_F10R1_FB30_Pos (30U)
#define CAN_F10R1_FB30_Msk (0x1U << CAN_F10R1_FB30_Pos)
#define CAN_F10R1_FB30 CAN_F10R1_FB30_Msk
#define CAN_F10R1_FB31_Pos (31U)
#define CAN_F10R1_FB31_Msk (0x1U << CAN_F10R1_FB31_Pos)
#define CAN_F10R1_FB31 CAN_F10R1_FB31_Msk


#define CAN_F11R1_FB0_Pos (0U)
#define CAN_F11R1_FB0_Msk (0x1U << CAN_F11R1_FB0_Pos)
#define CAN_F11R1_FB0 CAN_F11R1_FB0_Msk
#define CAN_F11R1_FB1_Pos (1U)
#define CAN_F11R1_FB1_Msk (0x1U << CAN_F11R1_FB1_Pos)
#define CAN_F11R1_FB1 CAN_F11R1_FB1_Msk
#define CAN_F11R1_FB2_Pos (2U)
#define CAN_F11R1_FB2_Msk (0x1U << CAN_F11R1_FB2_Pos)
#define CAN_F11R1_FB2 CAN_F11R1_FB2_Msk
#define CAN_F11R1_FB3_Pos (3U)
#define CAN_F11R1_FB3_Msk (0x1U << CAN_F11R1_FB3_Pos)
#define CAN_F11R1_FB3 CAN_F11R1_FB3_Msk
#define CAN_F11R1_FB4_Pos (4U)
#define CAN_F11R1_FB4_Msk (0x1U << CAN_F11R1_FB4_Pos)
#define CAN_F11R1_FB4 CAN_F11R1_FB4_Msk
#define CAN_F11R1_FB5_Pos (5U)
#define CAN_F11R1_FB5_Msk (0x1U << CAN_F11R1_FB5_Pos)
#define CAN_F11R1_FB5 CAN_F11R1_FB5_Msk
#define CAN_F11R1_FB6_Pos (6U)
#define CAN_F11R1_FB6_Msk (0x1U << CAN_F11R1_FB6_Pos)
#define CAN_F11R1_FB6 CAN_F11R1_FB6_Msk
#define CAN_F11R1_FB7_Pos (7U)
#define CAN_F11R1_FB7_Msk (0x1U << CAN_F11R1_FB7_Pos)
#define CAN_F11R1_FB7 CAN_F11R1_FB7_Msk
#define CAN_F11R1_FB8_Pos (8U)
#define CAN_F11R1_FB8_Msk (0x1U << CAN_F11R1_FB8_Pos)
#define CAN_F11R1_FB8 CAN_F11R1_FB8_Msk
#define CAN_F11R1_FB9_Pos (9U)
#define CAN_F11R1_FB9_Msk (0x1U << CAN_F11R1_FB9_Pos)
#define CAN_F11R1_FB9 CAN_F11R1_FB9_Msk
#define CAN_F11R1_FB10_Pos (10U)
#define CAN_F11R1_FB10_Msk (0x1U << CAN_F11R1_FB10_Pos)
#define CAN_F11R1_FB10 CAN_F11R1_FB10_Msk
#define CAN_F11R1_FB11_Pos (11U)
#define CAN_F11R1_FB11_Msk (0x1U << CAN_F11R1_FB11_Pos)
#define CAN_F11R1_FB11 CAN_F11R1_FB11_Msk
#define CAN_F11R1_FB12_Pos (12U)
#define CAN_F11R1_FB12_Msk (0x1U << CAN_F11R1_FB12_Pos)
#define CAN_F11R1_FB12 CAN_F11R1_FB12_Msk
#define CAN_F11R1_FB13_Pos (13U)
#define CAN_F11R1_FB13_Msk (0x1U << CAN_F11R1_FB13_Pos)
#define CAN_F11R1_FB13 CAN_F11R1_FB13_Msk
#define CAN_F11R1_FB14_Pos (14U)
#define CAN_F11R1_FB14_Msk (0x1U << CAN_F11R1_FB14_Pos)
#define CAN_F11R1_FB14 CAN_F11R1_FB14_Msk
#define CAN_F11R1_FB15_Pos (15U)
#define CAN_F11R1_FB15_Msk (0x1U << CAN_F11R1_FB15_Pos)
#define CAN_F11R1_FB15 CAN_F11R1_FB15_Msk
#define CAN_F11R1_FB16_Pos (16U)
#define CAN_F11R1_FB16_Msk (0x1U << CAN_F11R1_FB16_Pos)
#define CAN_F11R1_FB16 CAN_F11R1_FB16_Msk
#define CAN_F11R1_FB17_Pos (17U)
#define CAN_F11R1_FB17_Msk (0x1U << CAN_F11R1_FB17_Pos)
#define CAN_F11R1_FB17 CAN_F11R1_FB17_Msk
#define CAN_F11R1_FB18_Pos (18U)
#define CAN_F11R1_FB18_Msk (0x1U << CAN_F11R1_FB18_Pos)
#define CAN_F11R1_FB18 CAN_F11R1_FB18_Msk
#define CAN_F11R1_FB19_Pos (19U)
#define CAN_F11R1_FB19_Msk (0x1U << CAN_F11R1_FB19_Pos)
#define CAN_F11R1_FB19 CAN_F11R1_FB19_Msk
#define CAN_F11R1_FB20_Pos (20U)
#define CAN_F11R1_FB20_Msk (0x1U << CAN_F11R1_FB20_Pos)
#define CAN_F11R1_FB20 CAN_F11R1_FB20_Msk
#define CAN_F11R1_FB21_Pos (21U)
#define CAN_F11R1_FB21_Msk (0x1U << CAN_F11R1_FB21_Pos)
#define CAN_F11R1_FB21 CAN_F11R1_FB21_Msk
#define CAN_F11R1_FB22_Pos (22U)
#define CAN_F11R1_FB22_Msk (0x1U << CAN_F11R1_FB22_Pos)
#define CAN_F11R1_FB22 CAN_F11R1_FB22_Msk
#define CAN_F11R1_FB23_Pos (23U)
#define CAN_F11R1_FB23_Msk (0x1U << CAN_F11R1_FB23_Pos)
#define CAN_F11R1_FB23 CAN_F11R1_FB23_Msk
#define CAN_F11R1_FB24_Pos (24U)
#define CAN_F11R1_FB24_Msk (0x1U << CAN_F11R1_FB24_Pos)
#define CAN_F11R1_FB24 CAN_F11R1_FB24_Msk
#define CAN_F11R1_FB25_Pos (25U)
#define CAN_F11R1_FB25_Msk (0x1U << CAN_F11R1_FB25_Pos)
#define CAN_F11R1_FB25 CAN_F11R1_FB25_Msk
#define CAN_F11R1_FB26_Pos (26U)
#define CAN_F11R1_FB26_Msk (0x1U << CAN_F11R1_FB26_Pos)
#define CAN_F11R1_FB26 CAN_F11R1_FB26_Msk
#define CAN_F11R1_FB27_Pos (27U)
#define CAN_F11R1_FB27_Msk (0x1U << CAN_F11R1_FB27_Pos)
#define CAN_F11R1_FB27 CAN_F11R1_FB27_Msk
#define CAN_F11R1_FB28_Pos (28U)
#define CAN_F11R1_FB28_Msk (0x1U << CAN_F11R1_FB28_Pos)
#define CAN_F11R1_FB28 CAN_F11R1_FB28_Msk
#define CAN_F11R1_FB29_Pos (29U)
#define CAN_F11R1_FB29_Msk (0x1U << CAN_F11R1_FB29_Pos)
#define CAN_F11R1_FB29 CAN_F11R1_FB29_Msk
#define CAN_F11R1_FB30_Pos (30U)
#define CAN_F11R1_FB30_Msk (0x1U << CAN_F11R1_FB30_Pos)
#define CAN_F11R1_FB30 CAN_F11R1_FB30_Msk
#define CAN_F11R1_FB31_Pos (31U)
#define CAN_F11R1_FB31_Msk (0x1U << CAN_F11R1_FB31_Pos)
#define CAN_F11R1_FB31 CAN_F11R1_FB31_Msk


#define CAN_F12R1_FB0_Pos (0U)
#define CAN_F12R1_FB0_Msk (0x1U << CAN_F12R1_FB0_Pos)
#define CAN_F12R1_FB0 CAN_F12R1_FB0_Msk
#define CAN_F12R1_FB1_Pos (1U)
#define CAN_F12R1_FB1_Msk (0x1U << CAN_F12R1_FB1_Pos)
#define CAN_F12R1_FB1 CAN_F12R1_FB1_Msk
#define CAN_F12R1_FB2_Pos (2U)
#define CAN_F12R1_FB2_Msk (0x1U << CAN_F12R1_FB2_Pos)
#define CAN_F12R1_FB2 CAN_F12R1_FB2_Msk
#define CAN_F12R1_FB3_Pos (3U)
#define CAN_F12R1_FB3_Msk (0x1U << CAN_F12R1_FB3_Pos)
#define CAN_F12R1_FB3 CAN_F12R1_FB3_Msk
#define CAN_F12R1_FB4_Pos (4U)
#define CAN_F12R1_FB4_Msk (0x1U << CAN_F12R1_FB4_Pos)
#define CAN_F12R1_FB4 CAN_F12R1_FB4_Msk
#define CAN_F12R1_FB5_Pos (5U)
#define CAN_F12R1_FB5_Msk (0x1U << CAN_F12R1_FB5_Pos)
#define CAN_F12R1_FB5 CAN_F12R1_FB5_Msk
#define CAN_F12R1_FB6_Pos (6U)
#define CAN_F12R1_FB6_Msk (0x1U << CAN_F12R1_FB6_Pos)
#define CAN_F12R1_FB6 CAN_F12R1_FB6_Msk
#define CAN_F12R1_FB7_Pos (7U)
#define CAN_F12R1_FB7_Msk (0x1U << CAN_F12R1_FB7_Pos)
#define CAN_F12R1_FB7 CAN_F12R1_FB7_Msk
#define CAN_F12R1_FB8_Pos (8U)
#define CAN_F12R1_FB8_Msk (0x1U << CAN_F12R1_FB8_Pos)
#define CAN_F12R1_FB8 CAN_F12R1_FB8_Msk
#define CAN_F12R1_FB9_Pos (9U)
#define CAN_F12R1_FB9_Msk (0x1U << CAN_F12R1_FB9_Pos)
#define CAN_F12R1_FB9 CAN_F12R1_FB9_Msk
#define CAN_F12R1_FB10_Pos (10U)
#define CAN_F12R1_FB10_Msk (0x1U << CAN_F12R1_FB10_Pos)
#define CAN_F12R1_FB10 CAN_F12R1_FB10_Msk
#define CAN_F12R1_FB11_Pos (11U)
#define CAN_F12R1_FB11_Msk (0x1U << CAN_F12R1_FB11_Pos)
#define CAN_F12R1_FB11 CAN_F12R1_FB11_Msk
#define CAN_F12R1_FB12_Pos (12U)
#define CAN_F12R1_FB12_Msk (0x1U << CAN_F12R1_FB12_Pos)
#define CAN_F12R1_FB12 CAN_F12R1_FB12_Msk
#define CAN_F12R1_FB13_Pos (13U)
#define CAN_F12R1_FB13_Msk (0x1U << CAN_F12R1_FB13_Pos)
#define CAN_F12R1_FB13 CAN_F12R1_FB13_Msk
#define CAN_F12R1_FB14_Pos (14U)
#define CAN_F12R1_FB14_Msk (0x1U << CAN_F12R1_FB14_Pos)
#define CAN_F12R1_FB14 CAN_F12R1_FB14_Msk
#define CAN_F12R1_FB15_Pos (15U)
#define CAN_F12R1_FB15_Msk (0x1U << CAN_F12R1_FB15_Pos)
#define CAN_F12R1_FB15 CAN_F12R1_FB15_Msk
#define CAN_F12R1_FB16_Pos (16U)
#define CAN_F12R1_FB16_Msk (0x1U << CAN_F12R1_FB16_Pos)
#define CAN_F12R1_FB16 CAN_F12R1_FB16_Msk
#define CAN_F12R1_FB17_Pos (17U)
#define CAN_F12R1_FB17_Msk (0x1U << CAN_F12R1_FB17_Pos)
#define CAN_F12R1_FB17 CAN_F12R1_FB17_Msk
#define CAN_F12R1_FB18_Pos (18U)
#define CAN_F12R1_FB18_Msk (0x1U << CAN_F12R1_FB18_Pos)
#define CAN_F12R1_FB18 CAN_F12R1_FB18_Msk
#define CAN_F12R1_FB19_Pos (19U)
#define CAN_F12R1_FB19_Msk (0x1U << CAN_F12R1_FB19_Pos)
#define CAN_F12R1_FB19 CAN_F12R1_FB19_Msk
#define CAN_F12R1_FB20_Pos (20U)
#define CAN_F12R1_FB20_Msk (0x1U << CAN_F12R1_FB20_Pos)
#define CAN_F12R1_FB20 CAN_F12R1_FB20_Msk
#define CAN_F12R1_FB21_Pos (21U)
#define CAN_F12R1_FB21_Msk (0x1U << CAN_F12R1_FB21_Pos)
#define CAN_F12R1_FB21 CAN_F12R1_FB21_Msk
#define CAN_F12R1_FB22_Pos (22U)
#define CAN_F12R1_FB22_Msk (0x1U << CAN_F12R1_FB22_Pos)
#define CAN_F12R1_FB22 CAN_F12R1_FB22_Msk
#define CAN_F12R1_FB23_Pos (23U)
#define CAN_F12R1_FB23_Msk (0x1U << CAN_F12R1_FB23_Pos)
#define CAN_F12R1_FB23 CAN_F12R1_FB23_Msk
#define CAN_F12R1_FB24_Pos (24U)
#define CAN_F12R1_FB24_Msk (0x1U << CAN_F12R1_FB24_Pos)
#define CAN_F12R1_FB24 CAN_F12R1_FB24_Msk
#define CAN_F12R1_FB25_Pos (25U)
#define CAN_F12R1_FB25_Msk (0x1U << CAN_F12R1_FB25_Pos)
#define CAN_F12R1_FB25 CAN_F12R1_FB25_Msk
#define CAN_F12R1_FB26_Pos (26U)
#define CAN_F12R1_FB26_Msk (0x1U << CAN_F12R1_FB26_Pos)
#define CAN_F12R1_FB26 CAN_F12R1_FB26_Msk
#define CAN_F12R1_FB27_Pos (27U)
#define CAN_F12R1_FB27_Msk (0x1U << CAN_F12R1_FB27_Pos)
#define CAN_F12R1_FB27 CAN_F12R1_FB27_Msk
#define CAN_F12R1_FB28_Pos (28U)
#define CAN_F12R1_FB28_Msk (0x1U << CAN_F12R1_FB28_Pos)
#define CAN_F12R1_FB28 CAN_F12R1_FB28_Msk
#define CAN_F12R1_FB29_Pos (29U)
#define CAN_F12R1_FB29_Msk (0x1U << CAN_F12R1_FB29_Pos)
#define CAN_F12R1_FB29 CAN_F12R1_FB29_Msk
#define CAN_F12R1_FB30_Pos (30U)
#define CAN_F12R1_FB30_Msk (0x1U << CAN_F12R1_FB30_Pos)
#define CAN_F12R1_FB30 CAN_F12R1_FB30_Msk
#define CAN_F12R1_FB31_Pos (31U)
#define CAN_F12R1_FB31_Msk (0x1U << CAN_F12R1_FB31_Pos)
#define CAN_F12R1_FB31 CAN_F12R1_FB31_Msk


#define CAN_F13R1_FB0_Pos (0U)
#define CAN_F13R1_FB0_Msk (0x1U << CAN_F13R1_FB0_Pos)
#define CAN_F13R1_FB0 CAN_F13R1_FB0_Msk
#define CAN_F13R1_FB1_Pos (1U)
#define CAN_F13R1_FB1_Msk (0x1U << CAN_F13R1_FB1_Pos)
#define CAN_F13R1_FB1 CAN_F13R1_FB1_Msk
#define CAN_F13R1_FB2_Pos (2U)
#define CAN_F13R1_FB2_Msk (0x1U << CAN_F13R1_FB2_Pos)
#define CAN_F13R1_FB2 CAN_F13R1_FB2_Msk
#define CAN_F13R1_FB3_Pos (3U)
#define CAN_F13R1_FB3_Msk (0x1U << CAN_F13R1_FB3_Pos)
#define CAN_F13R1_FB3 CAN_F13R1_FB3_Msk
#define CAN_F13R1_FB4_Pos (4U)
#define CAN_F13R1_FB4_Msk (0x1U << CAN_F13R1_FB4_Pos)
#define CAN_F13R1_FB4 CAN_F13R1_FB4_Msk
#define CAN_F13R1_FB5_Pos (5U)
#define CAN_F13R1_FB5_Msk (0x1U << CAN_F13R1_FB5_Pos)
#define CAN_F13R1_FB5 CAN_F13R1_FB5_Msk
#define CAN_F13R1_FB6_Pos (6U)
#define CAN_F13R1_FB6_Msk (0x1U << CAN_F13R1_FB6_Pos)
#define CAN_F13R1_FB6 CAN_F13R1_FB6_Msk
#define CAN_F13R1_FB7_Pos (7U)
#define CAN_F13R1_FB7_Msk (0x1U << CAN_F13R1_FB7_Pos)
#define CAN_F13R1_FB7 CAN_F13R1_FB7_Msk
#define CAN_F13R1_FB8_Pos (8U)
#define CAN_F13R1_FB8_Msk (0x1U << CAN_F13R1_FB8_Pos)
#define CAN_F13R1_FB8 CAN_F13R1_FB8_Msk
#define CAN_F13R1_FB9_Pos (9U)
#define CAN_F13R1_FB9_Msk (0x1U << CAN_F13R1_FB9_Pos)
#define CAN_F13R1_FB9 CAN_F13R1_FB9_Msk
#define CAN_F13R1_FB10_Pos (10U)
#define CAN_F13R1_FB10_Msk (0x1U << CAN_F13R1_FB10_Pos)
#define CAN_F13R1_FB10 CAN_F13R1_FB10_Msk
#define CAN_F13R1_FB11_Pos (11U)
#define CAN_F13R1_FB11_Msk (0x1U << CAN_F13R1_FB11_Pos)
#define CAN_F13R1_FB11 CAN_F13R1_FB11_Msk
#define CAN_F13R1_FB12_Pos (12U)
#define CAN_F13R1_FB12_Msk (0x1U << CAN_F13R1_FB12_Pos)
#define CAN_F13R1_FB12 CAN_F13R1_FB12_Msk
#define CAN_F13R1_FB13_Pos (13U)
#define CAN_F13R1_FB13_Msk (0x1U << CAN_F13R1_FB13_Pos)
#define CAN_F13R1_FB13 CAN_F13R1_FB13_Msk
#define CAN_F13R1_FB14_Pos (14U)
#define CAN_F13R1_FB14_Msk (0x1U << CAN_F13R1_FB14_Pos)
#define CAN_F13R1_FB14 CAN_F13R1_FB14_Msk
#define CAN_F13R1_FB15_Pos (15U)
#define CAN_F13R1_FB15_Msk (0x1U << CAN_F13R1_FB15_Pos)
#define CAN_F13R1_FB15 CAN_F13R1_FB15_Msk
#define CAN_F13R1_FB16_Pos (16U)
#define CAN_F13R1_FB16_Msk (0x1U << CAN_F13R1_FB16_Pos)
#define CAN_F13R1_FB16 CAN_F13R1_FB16_Msk
#define CAN_F13R1_FB17_Pos (17U)
#define CAN_F13R1_FB17_Msk (0x1U << CAN_F13R1_FB17_Pos)
#define CAN_F13R1_FB17 CAN_F13R1_FB17_Msk
#define CAN_F13R1_FB18_Pos (18U)
#define CAN_F13R1_FB18_Msk (0x1U << CAN_F13R1_FB18_Pos)
#define CAN_F13R1_FB18 CAN_F13R1_FB18_Msk
#define CAN_F13R1_FB19_Pos (19U)
#define CAN_F13R1_FB19_Msk (0x1U << CAN_F13R1_FB19_Pos)
#define CAN_F13R1_FB19 CAN_F13R1_FB19_Msk
#define CAN_F13R1_FB20_Pos (20U)
#define CAN_F13R1_FB20_Msk (0x1U << CAN_F13R1_FB20_Pos)
#define CAN_F13R1_FB20 CAN_F13R1_FB20_Msk
#define CAN_F13R1_FB21_Pos (21U)
#define CAN_F13R1_FB21_Msk (0x1U << CAN_F13R1_FB21_Pos)
#define CAN_F13R1_FB21 CAN_F13R1_FB21_Msk
#define CAN_F13R1_FB22_Pos (22U)
#define CAN_F13R1_FB22_Msk (0x1U << CAN_F13R1_FB22_Pos)
#define CAN_F13R1_FB22 CAN_F13R1_FB22_Msk
#define CAN_F13R1_FB23_Pos (23U)
#define CAN_F13R1_FB23_Msk (0x1U << CAN_F13R1_FB23_Pos)
#define CAN_F13R1_FB23 CAN_F13R1_FB23_Msk
#define CAN_F13R1_FB24_Pos (24U)
#define CAN_F13R1_FB24_Msk (0x1U << CAN_F13R1_FB24_Pos)
#define CAN_F13R1_FB24 CAN_F13R1_FB24_Msk
#define CAN_F13R1_FB25_Pos (25U)
#define CAN_F13R1_FB25_Msk (0x1U << CAN_F13R1_FB25_Pos)
#define CAN_F13R1_FB25 CAN_F13R1_FB25_Msk
#define CAN_F13R1_FB26_Pos (26U)
#define CAN_F13R1_FB26_Msk (0x1U << CAN_F13R1_FB26_Pos)
#define CAN_F13R1_FB26 CAN_F13R1_FB26_Msk
#define CAN_F13R1_FB27_Pos (27U)
#define CAN_F13R1_FB27_Msk (0x1U << CAN_F13R1_FB27_Pos)
#define CAN_F13R1_FB27 CAN_F13R1_FB27_Msk
#define CAN_F13R1_FB28_Pos (28U)
#define CAN_F13R1_FB28_Msk (0x1U << CAN_F13R1_FB28_Pos)
#define CAN_F13R1_FB28 CAN_F13R1_FB28_Msk
#define CAN_F13R1_FB29_Pos (29U)
#define CAN_F13R1_FB29_Msk (0x1U << CAN_F13R1_FB29_Pos)
#define CAN_F13R1_FB29 CAN_F13R1_FB29_Msk
#define CAN_F13R1_FB30_Pos (30U)
#define CAN_F13R1_FB30_Msk (0x1U << CAN_F13R1_FB30_Pos)
#define CAN_F13R1_FB30 CAN_F13R1_FB30_Msk
#define CAN_F13R1_FB31_Pos (31U)
#define CAN_F13R1_FB31_Msk (0x1U << CAN_F13R1_FB31_Pos)
#define CAN_F13R1_FB31 CAN_F13R1_FB31_Msk


#define CAN_F0R2_FB0_Pos (0U)
#define CAN_F0R2_FB0_Msk (0x1U << CAN_F0R2_FB0_Pos)
#define CAN_F0R2_FB0 CAN_F0R2_FB0_Msk
#define CAN_F0R2_FB1_Pos (1U)
#define CAN_F0R2_FB1_Msk (0x1U << CAN_F0R2_FB1_Pos)
#define CAN_F0R2_FB1 CAN_F0R2_FB1_Msk
#define CAN_F0R2_FB2_Pos (2U)
#define CAN_F0R2_FB2_Msk (0x1U << CAN_F0R2_FB2_Pos)
#define CAN_F0R2_FB2 CAN_F0R2_FB2_Msk
#define CAN_F0R2_FB3_Pos (3U)
#define CAN_F0R2_FB3_Msk (0x1U << CAN_F0R2_FB3_Pos)
#define CAN_F0R2_FB3 CAN_F0R2_FB3_Msk
#define CAN_F0R2_FB4_Pos (4U)
#define CAN_F0R2_FB4_Msk (0x1U << CAN_F0R2_FB4_Pos)
#define CAN_F0R2_FB4 CAN_F0R2_FB4_Msk
#define CAN_F0R2_FB5_Pos (5U)
#define CAN_F0R2_FB5_Msk (0x1U << CAN_F0R2_FB5_Pos)
#define CAN_F0R2_FB5 CAN_F0R2_FB5_Msk
#define CAN_F0R2_FB6_Pos (6U)
#define CAN_F0R2_FB6_Msk (0x1U << CAN_F0R2_FB6_Pos)
#define CAN_F0R2_FB6 CAN_F0R2_FB6_Msk
#define CAN_F0R2_FB7_Pos (7U)
#define CAN_F0R2_FB7_Msk (0x1U << CAN_F0R2_FB7_Pos)
#define CAN_F0R2_FB7 CAN_F0R2_FB7_Msk
#define CAN_F0R2_FB8_Pos (8U)
#define CAN_F0R2_FB8_Msk (0x1U << CAN_F0R2_FB8_Pos)
#define CAN_F0R2_FB8 CAN_F0R2_FB8_Msk
#define CAN_F0R2_FB9_Pos (9U)
#define CAN_F0R2_FB9_Msk (0x1U << CAN_F0R2_FB9_Pos)
#define CAN_F0R2_FB9 CAN_F0R2_FB9_Msk
#define CAN_F0R2_FB10_Pos (10U)
#define CAN_F0R2_FB10_Msk (0x1U << CAN_F0R2_FB10_Pos)
#define CAN_F0R2_FB10 CAN_F0R2_FB10_Msk
#define CAN_F0R2_FB11_Pos (11U)
#define CAN_F0R2_FB11_Msk (0x1U << CAN_F0R2_FB11_Pos)
#define CAN_F0R2_FB11 CAN_F0R2_FB11_Msk
#define CAN_F0R2_FB12_Pos (12U)
#define CAN_F0R2_FB12_Msk (0x1U << CAN_F0R2_FB12_Pos)
#define CAN_F0R2_FB12 CAN_F0R2_FB12_Msk
#define CAN_F0R2_FB13_Pos (13U)
#define CAN_F0R2_FB13_Msk (0x1U << CAN_F0R2_FB13_Pos)
#define CAN_F0R2_FB13 CAN_F0R2_FB13_Msk
#define CAN_F0R2_FB14_Pos (14U)
#define CAN_F0R2_FB14_Msk (0x1U << CAN_F0R2_FB14_Pos)
#define CAN_F0R2_FB14 CAN_F0R2_FB14_Msk
#define CAN_F0R2_FB15_Pos (15U)
#define CAN_F0R2_FB15_Msk (0x1U << CAN_F0R2_FB15_Pos)
#define CAN_F0R2_FB15 CAN_F0R2_FB15_Msk
#define CAN_F0R2_FB16_Pos (16U)
#define CAN_F0R2_FB16_Msk (0x1U << CAN_F0R2_FB16_Pos)
#define CAN_F0R2_FB16 CAN_F0R2_FB16_Msk
#define CAN_F0R2_FB17_Pos (17U)
#define CAN_F0R2_FB17_Msk (0x1U << CAN_F0R2_FB17_Pos)
#define CAN_F0R2_FB17 CAN_F0R2_FB17_Msk
#define CAN_F0R2_FB18_Pos (18U)
#define CAN_F0R2_FB18_Msk (0x1U << CAN_F0R2_FB18_Pos)
#define CAN_F0R2_FB18 CAN_F0R2_FB18_Msk
#define CAN_F0R2_FB19_Pos (19U)
#define CAN_F0R2_FB19_Msk (0x1U << CAN_F0R2_FB19_Pos)
#define CAN_F0R2_FB19 CAN_F0R2_FB19_Msk
#define CAN_F0R2_FB20_Pos (20U)
#define CAN_F0R2_FB20_Msk (0x1U << CAN_F0R2_FB20_Pos)
#define CAN_F0R2_FB20 CAN_F0R2_FB20_Msk
#define CAN_F0R2_FB21_Pos (21U)
#define CAN_F0R2_FB21_Msk (0x1U << CAN_F0R2_FB21_Pos)
#define CAN_F0R2_FB21 CAN_F0R2_FB21_Msk
#define CAN_F0R2_FB22_Pos (22U)
#define CAN_F0R2_FB22_Msk (0x1U << CAN_F0R2_FB22_Pos)
#define CAN_F0R2_FB22 CAN_F0R2_FB22_Msk
#define CAN_F0R2_FB23_Pos (23U)
#define CAN_F0R2_FB23_Msk (0x1U << CAN_F0R2_FB23_Pos)
#define CAN_F0R2_FB23 CAN_F0R2_FB23_Msk
#define CAN_F0R2_FB24_Pos (24U)
#define CAN_F0R2_FB24_Msk (0x1U << CAN_F0R2_FB24_Pos)
#define CAN_F0R2_FB24 CAN_F0R2_FB24_Msk
#define CAN_F0R2_FB25_Pos (25U)
#define CAN_F0R2_FB25_Msk (0x1U << CAN_F0R2_FB25_Pos)
#define CAN_F0R2_FB25 CAN_F0R2_FB25_Msk
#define CAN_F0R2_FB26_Pos (26U)
#define CAN_F0R2_FB26_Msk (0x1U << CAN_F0R2_FB26_Pos)
#define CAN_F0R2_FB26 CAN_F0R2_FB26_Msk
#define CAN_F0R2_FB27_Pos (27U)
#define CAN_F0R2_FB27_Msk (0x1U << CAN_F0R2_FB27_Pos)
#define CAN_F0R2_FB27 CAN_F0R2_FB27_Msk
#define CAN_F0R2_FB28_Pos (28U)
#define CAN_F0R2_FB28_Msk (0x1U << CAN_F0R2_FB28_Pos)
#define CAN_F0R2_FB28 CAN_F0R2_FB28_Msk
#define CAN_F0R2_FB29_Pos (29U)
#define CAN_F0R2_FB29_Msk (0x1U << CAN_F0R2_FB29_Pos)
#define CAN_F0R2_FB29 CAN_F0R2_FB29_Msk
#define CAN_F0R2_FB30_Pos (30U)
#define CAN_F0R2_FB30_Msk (0x1U << CAN_F0R2_FB30_Pos)
#define CAN_F0R2_FB30 CAN_F0R2_FB30_Msk
#define CAN_F0R2_FB31_Pos (31U)
#define CAN_F0R2_FB31_Msk (0x1U << CAN_F0R2_FB31_Pos)
#define CAN_F0R2_FB31 CAN_F0R2_FB31_Msk


#define CAN_F1R2_FB0_Pos (0U)
#define CAN_F1R2_FB0_Msk (0x1U << CAN_F1R2_FB0_Pos)
#define CAN_F1R2_FB0 CAN_F1R2_FB0_Msk
#define CAN_F1R2_FB1_Pos (1U)
#define CAN_F1R2_FB1_Msk (0x1U << CAN_F1R2_FB1_Pos)
#define CAN_F1R2_FB1 CAN_F1R2_FB1_Msk
#define CAN_F1R2_FB2_Pos (2U)
#define CAN_F1R2_FB2_Msk (0x1U << CAN_F1R2_FB2_Pos)
#define CAN_F1R2_FB2 CAN_F1R2_FB2_Msk
#define CAN_F1R2_FB3_Pos (3U)
#define CAN_F1R2_FB3_Msk (0x1U << CAN_F1R2_FB3_Pos)
#define CAN_F1R2_FB3 CAN_F1R2_FB3_Msk
#define CAN_F1R2_FB4_Pos (4U)
#define CAN_F1R2_FB4_Msk (0x1U << CAN_F1R2_FB4_Pos)
#define CAN_F1R2_FB4 CAN_F1R2_FB4_Msk
#define CAN_F1R2_FB5_Pos (5U)
#define CAN_F1R2_FB5_Msk (0x1U << CAN_F1R2_FB5_Pos)
#define CAN_F1R2_FB5 CAN_F1R2_FB5_Msk
#define CAN_F1R2_FB6_Pos (6U)
#define CAN_F1R2_FB6_Msk (0x1U << CAN_F1R2_FB6_Pos)
#define CAN_F1R2_FB6 CAN_F1R2_FB6_Msk
#define CAN_F1R2_FB7_Pos (7U)
#define CAN_F1R2_FB7_Msk (0x1U << CAN_F1R2_FB7_Pos)
#define CAN_F1R2_FB7 CAN_F1R2_FB7_Msk
#define CAN_F1R2_FB8_Pos (8U)
#define CAN_F1R2_FB8_Msk (0x1U << CAN_F1R2_FB8_Pos)
#define CAN_F1R2_FB8 CAN_F1R2_FB8_Msk
#define CAN_F1R2_FB9_Pos (9U)
#define CAN_F1R2_FB9_Msk (0x1U << CAN_F1R2_FB9_Pos)
#define CAN_F1R2_FB9 CAN_F1R2_FB9_Msk
#define CAN_F1R2_FB10_Pos (10U)
#define CAN_F1R2_FB10_Msk (0x1U << CAN_F1R2_FB10_Pos)
#define CAN_F1R2_FB10 CAN_F1R2_FB10_Msk
#define CAN_F1R2_FB11_Pos (11U)
#define CAN_F1R2_FB11_Msk (0x1U << CAN_F1R2_FB11_Pos)
#define CAN_F1R2_FB11 CAN_F1R2_FB11_Msk
#define CAN_F1R2_FB12_Pos (12U)
#define CAN_F1R2_FB12_Msk (0x1U << CAN_F1R2_FB12_Pos)
#define CAN_F1R2_FB12 CAN_F1R2_FB12_Msk
#define CAN_F1R2_FB13_Pos (13U)
#define CAN_F1R2_FB13_Msk (0x1U << CAN_F1R2_FB13_Pos)
#define CAN_F1R2_FB13 CAN_F1R2_FB13_Msk
#define CAN_F1R2_FB14_Pos (14U)
#define CAN_F1R2_FB14_Msk (0x1U << CAN_F1R2_FB14_Pos)
#define CAN_F1R2_FB14 CAN_F1R2_FB14_Msk
#define CAN_F1R2_FB15_Pos (15U)
#define CAN_F1R2_FB15_Msk (0x1U << CAN_F1R2_FB15_Pos)
#define CAN_F1R2_FB15 CAN_F1R2_FB15_Msk
#define CAN_F1R2_FB16_Pos (16U)
#define CAN_F1R2_FB16_Msk (0x1U << CAN_F1R2_FB16_Pos)
#define CAN_F1R2_FB16 CAN_F1R2_FB16_Msk
#define CAN_F1R2_FB17_Pos (17U)
#define CAN_F1R2_FB17_Msk (0x1U << CAN_F1R2_FB17_Pos)
#define CAN_F1R2_FB17 CAN_F1R2_FB17_Msk
#define CAN_F1R2_FB18_Pos (18U)
#define CAN_F1R2_FB18_Msk (0x1U << CAN_F1R2_FB18_Pos)
#define CAN_F1R2_FB18 CAN_F1R2_FB18_Msk
#define CAN_F1R2_FB19_Pos (19U)
#define CAN_F1R2_FB19_Msk (0x1U << CAN_F1R2_FB19_Pos)
#define CAN_F1R2_FB19 CAN_F1R2_FB19_Msk
#define CAN_F1R2_FB20_Pos (20U)
#define CAN_F1R2_FB20_Msk (0x1U << CAN_F1R2_FB20_Pos)
#define CAN_F1R2_FB20 CAN_F1R2_FB20_Msk
#define CAN_F1R2_FB21_Pos (21U)
#define CAN_F1R2_FB21_Msk (0x1U << CAN_F1R2_FB21_Pos)
#define CAN_F1R2_FB21 CAN_F1R2_FB21_Msk
#define CAN_F1R2_FB22_Pos (22U)
#define CAN_F1R2_FB22_Msk (0x1U << CAN_F1R2_FB22_Pos)
#define CAN_F1R2_FB22 CAN_F1R2_FB22_Msk
#define CAN_F1R2_FB23_Pos (23U)
#define CAN_F1R2_FB23_Msk (0x1U << CAN_F1R2_FB23_Pos)
#define CAN_F1R2_FB23 CAN_F1R2_FB23_Msk
#define CAN_F1R2_FB24_Pos (24U)
#define CAN_F1R2_FB24_Msk (0x1U << CAN_F1R2_FB24_Pos)
#define CAN_F1R2_FB24 CAN_F1R2_FB24_Msk
#define CAN_F1R2_FB25_Pos (25U)
#define CAN_F1R2_FB25_Msk (0x1U << CAN_F1R2_FB25_Pos)
#define CAN_F1R2_FB25 CAN_F1R2_FB25_Msk
#define CAN_F1R2_FB26_Pos (26U)
#define CAN_F1R2_FB26_Msk (0x1U << CAN_F1R2_FB26_Pos)
#define CAN_F1R2_FB26 CAN_F1R2_FB26_Msk
#define CAN_F1R2_FB27_Pos (27U)
#define CAN_F1R2_FB27_Msk (0x1U << CAN_F1R2_FB27_Pos)
#define CAN_F1R2_FB27 CAN_F1R2_FB27_Msk
#define CAN_F1R2_FB28_Pos (28U)
#define CAN_F1R2_FB28_Msk (0x1U << CAN_F1R2_FB28_Pos)
#define CAN_F1R2_FB28 CAN_F1R2_FB28_Msk
#define CAN_F1R2_FB29_Pos (29U)
#define CAN_F1R2_FB29_Msk (0x1U << CAN_F1R2_FB29_Pos)
#define CAN_F1R2_FB29 CAN_F1R2_FB29_Msk
#define CAN_F1R2_FB30_Pos (30U)
#define CAN_F1R2_FB30_Msk (0x1U << CAN_F1R2_FB30_Pos)
#define CAN_F1R2_FB30 CAN_F1R2_FB30_Msk
#define CAN_F1R2_FB31_Pos (31U)
#define CAN_F1R2_FB31_Msk (0x1U << CAN_F1R2_FB31_Pos)
#define CAN_F1R2_FB31 CAN_F1R2_FB31_Msk


#define CAN_F2R2_FB0_Pos (0U)
#define CAN_F2R2_FB0_Msk (0x1U << CAN_F2R2_FB0_Pos)
#define CAN_F2R2_FB0 CAN_F2R2_FB0_Msk
#define CAN_F2R2_FB1_Pos (1U)
#define CAN_F2R2_FB1_Msk (0x1U << CAN_F2R2_FB1_Pos)
#define CAN_F2R2_FB1 CAN_F2R2_FB1_Msk
#define CAN_F2R2_FB2_Pos (2U)
#define CAN_F2R2_FB2_Msk (0x1U << CAN_F2R2_FB2_Pos)
#define CAN_F2R2_FB2 CAN_F2R2_FB2_Msk
#define CAN_F2R2_FB3_Pos (3U)
#define CAN_F2R2_FB3_Msk (0x1U << CAN_F2R2_FB3_Pos)
#define CAN_F2R2_FB3 CAN_F2R2_FB3_Msk
#define CAN_F2R2_FB4_Pos (4U)
#define CAN_F2R2_FB4_Msk (0x1U << CAN_F2R2_FB4_Pos)
#define CAN_F2R2_FB4 CAN_F2R2_FB4_Msk
#define CAN_F2R2_FB5_Pos (5U)
#define CAN_F2R2_FB5_Msk (0x1U << CAN_F2R2_FB5_Pos)
#define CAN_F2R2_FB5 CAN_F2R2_FB5_Msk
#define CAN_F2R2_FB6_Pos (6U)
#define CAN_F2R2_FB6_Msk (0x1U << CAN_F2R2_FB6_Pos)
#define CAN_F2R2_FB6 CAN_F2R2_FB6_Msk
#define CAN_F2R2_FB7_Pos (7U)
#define CAN_F2R2_FB7_Msk (0x1U << CAN_F2R2_FB7_Pos)
#define CAN_F2R2_FB7 CAN_F2R2_FB7_Msk
#define CAN_F2R2_FB8_Pos (8U)
#define CAN_F2R2_FB8_Msk (0x1U << CAN_F2R2_FB8_Pos)
#define CAN_F2R2_FB8 CAN_F2R2_FB8_Msk
#define CAN_F2R2_FB9_Pos (9U)
#define CAN_F2R2_FB9_Msk (0x1U << CAN_F2R2_FB9_Pos)
#define CAN_F2R2_FB9 CAN_F2R2_FB9_Msk
#define CAN_F2R2_FB10_Pos (10U)
#define CAN_F2R2_FB10_Msk (0x1U << CAN_F2R2_FB10_Pos)
#define CAN_F2R2_FB10 CAN_F2R2_FB10_Msk
#define CAN_F2R2_FB11_Pos (11U)
#define CAN_F2R2_FB11_Msk (0x1U << CAN_F2R2_FB11_Pos)
#define CAN_F2R2_FB11 CAN_F2R2_FB11_Msk
#define CAN_F2R2_FB12_Pos (12U)
#define CAN_F2R2_FB12_Msk (0x1U << CAN_F2R2_FB12_Pos)
#define CAN_F2R2_FB12 CAN_F2R2_FB12_Msk
#define CAN_F2R2_FB13_Pos (13U)
#define CAN_F2R2_FB13_Msk (0x1U << CAN_F2R2_FB13_Pos)
#define CAN_F2R2_FB13 CAN_F2R2_FB13_Msk
#define CAN_F2R2_FB14_Pos (14U)
#define CAN_F2R2_FB14_Msk (0x1U << CAN_F2R2_FB14_Pos)
#define CAN_F2R2_FB14 CAN_F2R2_FB14_Msk
#define CAN_F2R2_FB15_Pos (15U)
#define CAN_F2R2_FB15_Msk (0x1U << CAN_F2R2_FB15_Pos)
#define CAN_F2R2_FB15 CAN_F2R2_FB15_Msk
#define CAN_F2R2_FB16_Pos (16U)
#define CAN_F2R2_FB16_Msk (0x1U << CAN_F2R2_FB16_Pos)
#define CAN_F2R2_FB16 CAN_F2R2_FB16_Msk
#define CAN_F2R2_FB17_Pos (17U)
#define CAN_F2R2_FB17_Msk (0x1U << CAN_F2R2_FB17_Pos)
#define CAN_F2R2_FB17 CAN_F2R2_FB17_Msk
#define CAN_F2R2_FB18_Pos (18U)
#define CAN_F2R2_FB18_Msk (0x1U << CAN_F2R2_FB18_Pos)
#define CAN_F2R2_FB18 CAN_F2R2_FB18_Msk
#define CAN_F2R2_FB19_Pos (19U)
#define CAN_F2R2_FB19_Msk (0x1U << CAN_F2R2_FB19_Pos)
#define CAN_F2R2_FB19 CAN_F2R2_FB19_Msk
#define CAN_F2R2_FB20_Pos (20U)
#define CAN_F2R2_FB20_Msk (0x1U << CAN_F2R2_FB20_Pos)
#define CAN_F2R2_FB20 CAN_F2R2_FB20_Msk
#define CAN_F2R2_FB21_Pos (21U)
#define CAN_F2R2_FB21_Msk (0x1U << CAN_F2R2_FB21_Pos)
#define CAN_F2R2_FB21 CAN_F2R2_FB21_Msk
#define CAN_F2R2_FB22_Pos (22U)
#define CAN_F2R2_FB22_Msk (0x1U << CAN_F2R2_FB22_Pos)
#define CAN_F2R2_FB22 CAN_F2R2_FB22_Msk
#define CAN_F2R2_FB23_Pos (23U)
#define CAN_F2R2_FB23_Msk (0x1U << CAN_F2R2_FB23_Pos)
#define CAN_F2R2_FB23 CAN_F2R2_FB23_Msk
#define CAN_F2R2_FB24_Pos (24U)
#define CAN_F2R2_FB24_Msk (0x1U << CAN_F2R2_FB24_Pos)
#define CAN_F2R2_FB24 CAN_F2R2_FB24_Msk
#define CAN_F2R2_FB25_Pos (25U)
#define CAN_F2R2_FB25_Msk (0x1U << CAN_F2R2_FB25_Pos)
#define CAN_F2R2_FB25 CAN_F2R2_FB25_Msk
#define CAN_F2R2_FB26_Pos (26U)
#define CAN_F2R2_FB26_Msk (0x1U << CAN_F2R2_FB26_Pos)
#define CAN_F2R2_FB26 CAN_F2R2_FB26_Msk
#define CAN_F2R2_FB27_Pos (27U)
#define CAN_F2R2_FB27_Msk (0x1U << CAN_F2R2_FB27_Pos)
#define CAN_F2R2_FB27 CAN_F2R2_FB27_Msk
#define CAN_F2R2_FB28_Pos (28U)
#define CAN_F2R2_FB28_Msk (0x1U << CAN_F2R2_FB28_Pos)
#define CAN_F2R2_FB28 CAN_F2R2_FB28_Msk
#define CAN_F2R2_FB29_Pos (29U)
#define CAN_F2R2_FB29_Msk (0x1U << CAN_F2R2_FB29_Pos)
#define CAN_F2R2_FB29 CAN_F2R2_FB29_Msk
#define CAN_F2R2_FB30_Pos (30U)
#define CAN_F2R2_FB30_Msk (0x1U << CAN_F2R2_FB30_Pos)
#define CAN_F2R2_FB30 CAN_F2R2_FB30_Msk
#define CAN_F2R2_FB31_Pos (31U)
#define CAN_F2R2_FB31_Msk (0x1U << CAN_F2R2_FB31_Pos)
#define CAN_F2R2_FB31 CAN_F2R2_FB31_Msk


#define CAN_F3R2_FB0_Pos (0U)
#define CAN_F3R2_FB0_Msk (0x1U << CAN_F3R2_FB0_Pos)
#define CAN_F3R2_FB0 CAN_F3R2_FB0_Msk
#define CAN_F3R2_FB1_Pos (1U)
#define CAN_F3R2_FB1_Msk (0x1U << CAN_F3R2_FB1_Pos)
#define CAN_F3R2_FB1 CAN_F3R2_FB1_Msk
#define CAN_F3R2_FB2_Pos (2U)
#define CAN_F3R2_FB2_Msk (0x1U << CAN_F3R2_FB2_Pos)
#define CAN_F3R2_FB2 CAN_F3R2_FB2_Msk
#define CAN_F3R2_FB3_Pos (3U)
#define CAN_F3R2_FB3_Msk (0x1U << CAN_F3R2_FB3_Pos)
#define CAN_F3R2_FB3 CAN_F3R2_FB3_Msk
#define CAN_F3R2_FB4_Pos (4U)
#define CAN_F3R2_FB4_Msk (0x1U << CAN_F3R2_FB4_Pos)
#define CAN_F3R2_FB4 CAN_F3R2_FB4_Msk
#define CAN_F3R2_FB5_Pos (5U)
#define CAN_F3R2_FB5_Msk (0x1U << CAN_F3R2_FB5_Pos)
#define CAN_F3R2_FB5 CAN_F3R2_FB5_Msk
#define CAN_F3R2_FB6_Pos (6U)
#define CAN_F3R2_FB6_Msk (0x1U << CAN_F3R2_FB6_Pos)
#define CAN_F3R2_FB6 CAN_F3R2_FB6_Msk
#define CAN_F3R2_FB7_Pos (7U)
#define CAN_F3R2_FB7_Msk (0x1U << CAN_F3R2_FB7_Pos)
#define CAN_F3R2_FB7 CAN_F3R2_FB7_Msk
#define CAN_F3R2_FB8_Pos (8U)
#define CAN_F3R2_FB8_Msk (0x1U << CAN_F3R2_FB8_Pos)
#define CAN_F3R2_FB8 CAN_F3R2_FB8_Msk
#define CAN_F3R2_FB9_Pos (9U)
#define CAN_F3R2_FB9_Msk (0x1U << CAN_F3R2_FB9_Pos)
#define CAN_F3R2_FB9 CAN_F3R2_FB9_Msk
#define CAN_F3R2_FB10_Pos (10U)
#define CAN_F3R2_FB10_Msk (0x1U << CAN_F3R2_FB10_Pos)
#define CAN_F3R2_FB10 CAN_F3R2_FB10_Msk
#define CAN_F3R2_FB11_Pos (11U)
#define CAN_F3R2_FB11_Msk (0x1U << CAN_F3R2_FB11_Pos)
#define CAN_F3R2_FB11 CAN_F3R2_FB11_Msk
#define CAN_F3R2_FB12_Pos (12U)
#define CAN_F3R2_FB12_Msk (0x1U << CAN_F3R2_FB12_Pos)
#define CAN_F3R2_FB12 CAN_F3R2_FB12_Msk
#define CAN_F3R2_FB13_Pos (13U)
#define CAN_F3R2_FB13_Msk (0x1U << CAN_F3R2_FB13_Pos)
#define CAN_F3R2_FB13 CAN_F3R2_FB13_Msk
#define CAN_F3R2_FB14_Pos (14U)
#define CAN_F3R2_FB14_Msk (0x1U << CAN_F3R2_FB14_Pos)
#define CAN_F3R2_FB14 CAN_F3R2_FB14_Msk
#define CAN_F3R2_FB15_Pos (15U)
#define CAN_F3R2_FB15_Msk (0x1U << CAN_F3R2_FB15_Pos)
#define CAN_F3R2_FB15 CAN_F3R2_FB15_Msk
#define CAN_F3R2_FB16_Pos (16U)
#define CAN_F3R2_FB16_Msk (0x1U << CAN_F3R2_FB16_Pos)
#define CAN_F3R2_FB16 CAN_F3R2_FB16_Msk
#define CAN_F3R2_FB17_Pos (17U)
#define CAN_F3R2_FB17_Msk (0x1U << CAN_F3R2_FB17_Pos)
#define CAN_F3R2_FB17 CAN_F3R2_FB17_Msk
#define CAN_F3R2_FB18_Pos (18U)
#define CAN_F3R2_FB18_Msk (0x1U << CAN_F3R2_FB18_Pos)
#define CAN_F3R2_FB18 CAN_F3R2_FB18_Msk
#define CAN_F3R2_FB19_Pos (19U)
#define CAN_F3R2_FB19_Msk (0x1U << CAN_F3R2_FB19_Pos)
#define CAN_F3R2_FB19 CAN_F3R2_FB19_Msk
#define CAN_F3R2_FB20_Pos (20U)
#define CAN_F3R2_FB20_Msk (0x1U << CAN_F3R2_FB20_Pos)
#define CAN_F3R2_FB20 CAN_F3R2_FB20_Msk
#define CAN_F3R2_FB21_Pos (21U)
#define CAN_F3R2_FB21_Msk (0x1U << CAN_F3R2_FB21_Pos)
#define CAN_F3R2_FB21 CAN_F3R2_FB21_Msk
#define CAN_F3R2_FB22_Pos (22U)
#define CAN_F3R2_FB22_Msk (0x1U << CAN_F3R2_FB22_Pos)
#define CAN_F3R2_FB22 CAN_F3R2_FB22_Msk
#define CAN_F3R2_FB23_Pos (23U)
#define CAN_F3R2_FB23_Msk (0x1U << CAN_F3R2_FB23_Pos)
#define CAN_F3R2_FB23 CAN_F3R2_FB23_Msk
#define CAN_F3R2_FB24_Pos (24U)
#define CAN_F3R2_FB24_Msk (0x1U << CAN_F3R2_FB24_Pos)
#define CAN_F3R2_FB24 CAN_F3R2_FB24_Msk
#define CAN_F3R2_FB25_Pos (25U)
#define CAN_F3R2_FB25_Msk (0x1U << CAN_F3R2_FB25_Pos)
#define CAN_F3R2_FB25 CAN_F3R2_FB25_Msk
#define CAN_F3R2_FB26_Pos (26U)
#define CAN_F3R2_FB26_Msk (0x1U << CAN_F3R2_FB26_Pos)
#define CAN_F3R2_FB26 CAN_F3R2_FB26_Msk
#define CAN_F3R2_FB27_Pos (27U)
#define CAN_F3R2_FB27_Msk (0x1U << CAN_F3R2_FB27_Pos)
#define CAN_F3R2_FB27 CAN_F3R2_FB27_Msk
#define CAN_F3R2_FB28_Pos (28U)
#define CAN_F3R2_FB28_Msk (0x1U << CAN_F3R2_FB28_Pos)
#define CAN_F3R2_FB28 CAN_F3R2_FB28_Msk
#define CAN_F3R2_FB29_Pos (29U)
#define CAN_F3R2_FB29_Msk (0x1U << CAN_F3R2_FB29_Pos)
#define CAN_F3R2_FB29 CAN_F3R2_FB29_Msk
#define CAN_F3R2_FB30_Pos (30U)
#define CAN_F3R2_FB30_Msk (0x1U << CAN_F3R2_FB30_Pos)
#define CAN_F3R2_FB30 CAN_F3R2_FB30_Msk
#define CAN_F3R2_FB31_Pos (31U)
#define CAN_F3R2_FB31_Msk (0x1U << CAN_F3R2_FB31_Pos)
#define CAN_F3R2_FB31 CAN_F3R2_FB31_Msk


#define CAN_F4R2_FB0_Pos (0U)
#define CAN_F4R2_FB0_Msk (0x1U << CAN_F4R2_FB0_Pos)
#define CAN_F4R2_FB0 CAN_F4R2_FB0_Msk
#define CAN_F4R2_FB1_Pos (1U)
#define CAN_F4R2_FB1_Msk (0x1U << CAN_F4R2_FB1_Pos)
#define CAN_F4R2_FB1 CAN_F4R2_FB1_Msk
#define CAN_F4R2_FB2_Pos (2U)
#define CAN_F4R2_FB2_Msk (0x1U << CAN_F4R2_FB2_Pos)
#define CAN_F4R2_FB2 CAN_F4R2_FB2_Msk
#define CAN_F4R2_FB3_Pos (3U)
#define CAN_F4R2_FB3_Msk (0x1U << CAN_F4R2_FB3_Pos)
#define CAN_F4R2_FB3 CAN_F4R2_FB3_Msk
#define CAN_F4R2_FB4_Pos (4U)
#define CAN_F4R2_FB4_Msk (0x1U << CAN_F4R2_FB4_Pos)
#define CAN_F4R2_FB4 CAN_F4R2_FB4_Msk
#define CAN_F4R2_FB5_Pos (5U)
#define CAN_F4R2_FB5_Msk (0x1U << CAN_F4R2_FB5_Pos)
#define CAN_F4R2_FB5 CAN_F4R2_FB5_Msk
#define CAN_F4R2_FB6_Pos (6U)
#define CAN_F4R2_FB6_Msk (0x1U << CAN_F4R2_FB6_Pos)
#define CAN_F4R2_FB6 CAN_F4R2_FB6_Msk
#define CAN_F4R2_FB7_Pos (7U)
#define CAN_F4R2_FB7_Msk (0x1U << CAN_F4R2_FB7_Pos)
#define CAN_F4R2_FB7 CAN_F4R2_FB7_Msk
#define CAN_F4R2_FB8_Pos (8U)
#define CAN_F4R2_FB8_Msk (0x1U << CAN_F4R2_FB8_Pos)
#define CAN_F4R2_FB8 CAN_F4R2_FB8_Msk
#define CAN_F4R2_FB9_Pos (9U)
#define CAN_F4R2_FB9_Msk (0x1U << CAN_F4R2_FB9_Pos)
#define CAN_F4R2_FB9 CAN_F4R2_FB9_Msk
#define CAN_F4R2_FB10_Pos (10U)
#define CAN_F4R2_FB10_Msk (0x1U << CAN_F4R2_FB10_Pos)
#define CAN_F4R2_FB10 CAN_F4R2_FB10_Msk
#define CAN_F4R2_FB11_Pos (11U)
#define CAN_F4R2_FB11_Msk (0x1U << CAN_F4R2_FB11_Pos)
#define CAN_F4R2_FB11 CAN_F4R2_FB11_Msk
#define CAN_F4R2_FB12_Pos (12U)
#define CAN_F4R2_FB12_Msk (0x1U << CAN_F4R2_FB12_Pos)
#define CAN_F4R2_FB12 CAN_F4R2_FB12_Msk
#define CAN_F4R2_FB13_Pos (13U)
#define CAN_F4R2_FB13_Msk (0x1U << CAN_F4R2_FB13_Pos)
#define CAN_F4R2_FB13 CAN_F4R2_FB13_Msk
#define CAN_F4R2_FB14_Pos (14U)
#define CAN_F4R2_FB14_Msk (0x1U << CAN_F4R2_FB14_Pos)
#define CAN_F4R2_FB14 CAN_F4R2_FB14_Msk
#define CAN_F4R2_FB15_Pos (15U)
#define CAN_F4R2_FB15_Msk (0x1U << CAN_F4R2_FB15_Pos)
#define CAN_F4R2_FB15 CAN_F4R2_FB15_Msk
#define CAN_F4R2_FB16_Pos (16U)
#define CAN_F4R2_FB16_Msk (0x1U << CAN_F4R2_FB16_Pos)
#define CAN_F4R2_FB16 CAN_F4R2_FB16_Msk
#define CAN_F4R2_FB17_Pos (17U)
#define CAN_F4R2_FB17_Msk (0x1U << CAN_F4R2_FB17_Pos)
#define CAN_F4R2_FB17 CAN_F4R2_FB17_Msk
#define CAN_F4R2_FB18_Pos (18U)
#define CAN_F4R2_FB18_Msk (0x1U << CAN_F4R2_FB18_Pos)
#define CAN_F4R2_FB18 CAN_F4R2_FB18_Msk
#define CAN_F4R2_FB19_Pos (19U)
#define CAN_F4R2_FB19_Msk (0x1U << CAN_F4R2_FB19_Pos)
#define CAN_F4R2_FB19 CAN_F4R2_FB19_Msk
#define CAN_F4R2_FB20_Pos (20U)
#define CAN_F4R2_FB20_Msk (0x1U << CAN_F4R2_FB20_Pos)
#define CAN_F4R2_FB20 CAN_F4R2_FB20_Msk
#define CAN_F4R2_FB21_Pos (21U)
#define CAN_F4R2_FB21_Msk (0x1U << CAN_F4R2_FB21_Pos)
#define CAN_F4R2_FB21 CAN_F4R2_FB21_Msk
#define CAN_F4R2_FB22_Pos (22U)
#define CAN_F4R2_FB22_Msk (0x1U << CAN_F4R2_FB22_Pos)
#define CAN_F4R2_FB22 CAN_F4R2_FB22_Msk
#define CAN_F4R2_FB23_Pos (23U)
#define CAN_F4R2_FB23_Msk (0x1U << CAN_F4R2_FB23_Pos)
#define CAN_F4R2_FB23 CAN_F4R2_FB23_Msk
#define CAN_F4R2_FB24_Pos (24U)
#define CAN_F4R2_FB24_Msk (0x1U << CAN_F4R2_FB24_Pos)
#define CAN_F4R2_FB24 CAN_F4R2_FB24_Msk
#define CAN_F4R2_FB25_Pos (25U)
#define CAN_F4R2_FB25_Msk (0x1U << CAN_F4R2_FB25_Pos)
#define CAN_F4R2_FB25 CAN_F4R2_FB25_Msk
#define CAN_F4R2_FB26_Pos (26U)
#define CAN_F4R2_FB26_Msk (0x1U << CAN_F4R2_FB26_Pos)
#define CAN_F4R2_FB26 CAN_F4R2_FB26_Msk
#define CAN_F4R2_FB27_Pos (27U)
#define CAN_F4R2_FB27_Msk (0x1U << CAN_F4R2_FB27_Pos)
#define CAN_F4R2_FB27 CAN_F4R2_FB27_Msk
#define CAN_F4R2_FB28_Pos (28U)
#define CAN_F4R2_FB28_Msk (0x1U << CAN_F4R2_FB28_Pos)
#define CAN_F4R2_FB28 CAN_F4R2_FB28_Msk
#define CAN_F4R2_FB29_Pos (29U)
#define CAN_F4R2_FB29_Msk (0x1U << CAN_F4R2_FB29_Pos)
#define CAN_F4R2_FB29 CAN_F4R2_FB29_Msk
#define CAN_F4R2_FB30_Pos (30U)
#define CAN_F4R2_FB30_Msk (0x1U << CAN_F4R2_FB30_Pos)
#define CAN_F4R2_FB30 CAN_F4R2_FB30_Msk
#define CAN_F4R2_FB31_Pos (31U)
#define CAN_F4R2_FB31_Msk (0x1U << CAN_F4R2_FB31_Pos)
#define CAN_F4R2_FB31 CAN_F4R2_FB31_Msk


#define CAN_F5R2_FB0_Pos (0U)
#define CAN_F5R2_FB0_Msk (0x1U << CAN_F5R2_FB0_Pos)
#define CAN_F5R2_FB0 CAN_F5R2_FB0_Msk
#define CAN_F5R2_FB1_Pos (1U)
#define CAN_F5R2_FB1_Msk (0x1U << CAN_F5R2_FB1_Pos)
#define CAN_F5R2_FB1 CAN_F5R2_FB1_Msk
#define CAN_F5R2_FB2_Pos (2U)
#define CAN_F5R2_FB2_Msk (0x1U << CAN_F5R2_FB2_Pos)
#define CAN_F5R2_FB2 CAN_F5R2_FB2_Msk
#define CAN_F5R2_FB3_Pos (3U)
#define CAN_F5R2_FB3_Msk (0x1U << CAN_F5R2_FB3_Pos)
#define CAN_F5R2_FB3 CAN_F5R2_FB3_Msk
#define CAN_F5R2_FB4_Pos (4U)
#define CAN_F5R2_FB4_Msk (0x1U << CAN_F5R2_FB4_Pos)
#define CAN_F5R2_FB4 CAN_F5R2_FB4_Msk
#define CAN_F5R2_FB5_Pos (5U)
#define CAN_F5R2_FB5_Msk (0x1U << CAN_F5R2_FB5_Pos)
#define CAN_F5R2_FB5 CAN_F5R2_FB5_Msk
#define CAN_F5R2_FB6_Pos (6U)
#define CAN_F5R2_FB6_Msk (0x1U << CAN_F5R2_FB6_Pos)
#define CAN_F5R2_FB6 CAN_F5R2_FB6_Msk
#define CAN_F5R2_FB7_Pos (7U)
#define CAN_F5R2_FB7_Msk (0x1U << CAN_F5R2_FB7_Pos)
#define CAN_F5R2_FB7 CAN_F5R2_FB7_Msk
#define CAN_F5R2_FB8_Pos (8U)
#define CAN_F5R2_FB8_Msk (0x1U << CAN_F5R2_FB8_Pos)
#define CAN_F5R2_FB8 CAN_F5R2_FB8_Msk
#define CAN_F5R2_FB9_Pos (9U)
#define CAN_F5R2_FB9_Msk (0x1U << CAN_F5R2_FB9_Pos)
#define CAN_F5R2_FB9 CAN_F5R2_FB9_Msk
#define CAN_F5R2_FB10_Pos (10U)
#define CAN_F5R2_FB10_Msk (0x1U << CAN_F5R2_FB10_Pos)
#define CAN_F5R2_FB10 CAN_F5R2_FB10_Msk
#define CAN_F5R2_FB11_Pos (11U)
#define CAN_F5R2_FB11_Msk (0x1U << CAN_F5R2_FB11_Pos)
#define CAN_F5R2_FB11 CAN_F5R2_FB11_Msk
#define CAN_F5R2_FB12_Pos (12U)
#define CAN_F5R2_FB12_Msk (0x1U << CAN_F5R2_FB12_Pos)
#define CAN_F5R2_FB12 CAN_F5R2_FB12_Msk
#define CAN_F5R2_FB13_Pos (13U)
#define CAN_F5R2_FB13_Msk (0x1U << CAN_F5R2_FB13_Pos)
#define CAN_F5R2_FB13 CAN_F5R2_FB13_Msk
#define CAN_F5R2_FB14_Pos (14U)
#define CAN_F5R2_FB14_Msk (0x1U << CAN_F5R2_FB14_Pos)
#define CAN_F5R2_FB14 CAN_F5R2_FB14_Msk
#define CAN_F5R2_FB15_Pos (15U)
#define CAN_F5R2_FB15_Msk (0x1U << CAN_F5R2_FB15_Pos)
#define CAN_F5R2_FB15 CAN_F5R2_FB15_Msk
#define CAN_F5R2_FB16_Pos (16U)
#define CAN_F5R2_FB16_Msk (0x1U << CAN_F5R2_FB16_Pos)
#define CAN_F5R2_FB16 CAN_F5R2_FB16_Msk
#define CAN_F5R2_FB17_Pos (17U)
#define CAN_F5R2_FB17_Msk (0x1U << CAN_F5R2_FB17_Pos)
#define CAN_F5R2_FB17 CAN_F5R2_FB17_Msk
#define CAN_F5R2_FB18_Pos (18U)
#define CAN_F5R2_FB18_Msk (0x1U << CAN_F5R2_FB18_Pos)
#define CAN_F5R2_FB18 CAN_F5R2_FB18_Msk
#define CAN_F5R2_FB19_Pos (19U)
#define CAN_F5R2_FB19_Msk (0x1U << CAN_F5R2_FB19_Pos)
#define CAN_F5R2_FB19 CAN_F5R2_FB19_Msk
#define CAN_F5R2_FB20_Pos (20U)
#define CAN_F5R2_FB20_Msk (0x1U << CAN_F5R2_FB20_Pos)
#define CAN_F5R2_FB20 CAN_F5R2_FB20_Msk
#define CAN_F5R2_FB21_Pos (21U)
#define CAN_F5R2_FB21_Msk (0x1U << CAN_F5R2_FB21_Pos)
#define CAN_F5R2_FB21 CAN_F5R2_FB21_Msk
#define CAN_F5R2_FB22_Pos (22U)
#define CAN_F5R2_FB22_Msk (0x1U << CAN_F5R2_FB22_Pos)
#define CAN_F5R2_FB22 CAN_F5R2_FB22_Msk
#define CAN_F5R2_FB23_Pos (23U)
#define CAN_F5R2_FB23_Msk (0x1U << CAN_F5R2_FB23_Pos)
#define CAN_F5R2_FB23 CAN_F5R2_FB23_Msk
#define CAN_F5R2_FB24_Pos (24U)
#define CAN_F5R2_FB24_Msk (0x1U << CAN_F5R2_FB24_Pos)
#define CAN_F5R2_FB24 CAN_F5R2_FB24_Msk
#define CAN_F5R2_FB25_Pos (25U)
#define CAN_F5R2_FB25_Msk (0x1U << CAN_F5R2_FB25_Pos)
#define CAN_F5R2_FB25 CAN_F5R2_FB25_Msk
#define CAN_F5R2_FB26_Pos (26U)
#define CAN_F5R2_FB26_Msk (0x1U << CAN_F5R2_FB26_Pos)
#define CAN_F5R2_FB26 CAN_F5R2_FB26_Msk
#define CAN_F5R2_FB27_Pos (27U)
#define CAN_F5R2_FB27_Msk (0x1U << CAN_F5R2_FB27_Pos)
#define CAN_F5R2_FB27 CAN_F5R2_FB27_Msk
#define CAN_F5R2_FB28_Pos (28U)
#define CAN_F5R2_FB28_Msk (0x1U << CAN_F5R2_FB28_Pos)
#define CAN_F5R2_FB28 CAN_F5R2_FB28_Msk
#define CAN_F5R2_FB29_Pos (29U)
#define CAN_F5R2_FB29_Msk (0x1U << CAN_F5R2_FB29_Pos)
#define CAN_F5R2_FB29 CAN_F5R2_FB29_Msk
#define CAN_F5R2_FB30_Pos (30U)
#define CAN_F5R2_FB30_Msk (0x1U << CAN_F5R2_FB30_Pos)
#define CAN_F5R2_FB30 CAN_F5R2_FB30_Msk
#define CAN_F5R2_FB31_Pos (31U)
#define CAN_F5R2_FB31_Msk (0x1U << CAN_F5R2_FB31_Pos)
#define CAN_F5R2_FB31 CAN_F5R2_FB31_Msk


#define CAN_F6R2_FB0_Pos (0U)
#define CAN_F6R2_FB0_Msk (0x1U << CAN_F6R2_FB0_Pos)
#define CAN_F6R2_FB0 CAN_F6R2_FB0_Msk
#define CAN_F6R2_FB1_Pos (1U)
#define CAN_F6R2_FB1_Msk (0x1U << CAN_F6R2_FB1_Pos)
#define CAN_F6R2_FB1 CAN_F6R2_FB1_Msk
#define CAN_F6R2_FB2_Pos (2U)
#define CAN_F6R2_FB2_Msk (0x1U << CAN_F6R2_FB2_Pos)
#define CAN_F6R2_FB2 CAN_F6R2_FB2_Msk
#define CAN_F6R2_FB3_Pos (3U)
#define CAN_F6R2_FB3_Msk (0x1U << CAN_F6R2_FB3_Pos)
#define CAN_F6R2_FB3 CAN_F6R2_FB3_Msk
#define CAN_F6R2_FB4_Pos (4U)
#define CAN_F6R2_FB4_Msk (0x1U << CAN_F6R2_FB4_Pos)
#define CAN_F6R2_FB4 CAN_F6R2_FB4_Msk
#define CAN_F6R2_FB5_Pos (5U)
#define CAN_F6R2_FB5_Msk (0x1U << CAN_F6R2_FB5_Pos)
#define CAN_F6R2_FB5 CAN_F6R2_FB5_Msk
#define CAN_F6R2_FB6_Pos (6U)
#define CAN_F6R2_FB6_Msk (0x1U << CAN_F6R2_FB6_Pos)
#define CAN_F6R2_FB6 CAN_F6R2_FB6_Msk
#define CAN_F6R2_FB7_Pos (7U)
#define CAN_F6R2_FB7_Msk (0x1U << CAN_F6R2_FB7_Pos)
#define CAN_F6R2_FB7 CAN_F6R2_FB7_Msk
#define CAN_F6R2_FB8_Pos (8U)
#define CAN_F6R2_FB8_Msk (0x1U << CAN_F6R2_FB8_Pos)
#define CAN_F6R2_FB8 CAN_F6R2_FB8_Msk
#define CAN_F6R2_FB9_Pos (9U)
#define CAN_F6R2_FB9_Msk (0x1U << CAN_F6R2_FB9_Pos)
#define CAN_F6R2_FB9 CAN_F6R2_FB9_Msk
#define CAN_F6R2_FB10_Pos (10U)
#define CAN_F6R2_FB10_Msk (0x1U << CAN_F6R2_FB10_Pos)
#define CAN_F6R2_FB10 CAN_F6R2_FB10_Msk
#define CAN_F6R2_FB11_Pos (11U)
#define CAN_F6R2_FB11_Msk (0x1U << CAN_F6R2_FB11_Pos)
#define CAN_F6R2_FB11 CAN_F6R2_FB11_Msk
#define CAN_F6R2_FB12_Pos (12U)
#define CAN_F6R2_FB12_Msk (0x1U << CAN_F6R2_FB12_Pos)
#define CAN_F6R2_FB12 CAN_F6R2_FB12_Msk
#define CAN_F6R2_FB13_Pos (13U)
#define CAN_F6R2_FB13_Msk (0x1U << CAN_F6R2_FB13_Pos)
#define CAN_F6R2_FB13 CAN_F6R2_FB13_Msk
#define CAN_F6R2_FB14_Pos (14U)
#define CAN_F6R2_FB14_Msk (0x1U << CAN_F6R2_FB14_Pos)
#define CAN_F6R2_FB14 CAN_F6R2_FB14_Msk
#define CAN_F6R2_FB15_Pos (15U)
#define CAN_F6R2_FB15_Msk (0x1U << CAN_F6R2_FB15_Pos)
#define CAN_F6R2_FB15 CAN_F6R2_FB15_Msk
#define CAN_F6R2_FB16_Pos (16U)
#define CAN_F6R2_FB16_Msk (0x1U << CAN_F6R2_FB16_Pos)
#define CAN_F6R2_FB16 CAN_F6R2_FB16_Msk
#define CAN_F6R2_FB17_Pos (17U)
#define CAN_F6R2_FB17_Msk (0x1U << CAN_F6R2_FB17_Pos)
#define CAN_F6R2_FB17 CAN_F6R2_FB17_Msk
#define CAN_F6R2_FB18_Pos (18U)
#define CAN_F6R2_FB18_Msk (0x1U << CAN_F6R2_FB18_Pos)
#define CAN_F6R2_FB18 CAN_F6R2_FB18_Msk
#define CAN_F6R2_FB19_Pos (19U)
#define CAN_F6R2_FB19_Msk (0x1U << CAN_F6R2_FB19_Pos)
#define CAN_F6R2_FB19 CAN_F6R2_FB19_Msk
#define CAN_F6R2_FB20_Pos (20U)
#define CAN_F6R2_FB20_Msk (0x1U << CAN_F6R2_FB20_Pos)
#define CAN_F6R2_FB20 CAN_F6R2_FB20_Msk
#define CAN_F6R2_FB21_Pos (21U)
#define CAN_F6R2_FB21_Msk (0x1U << CAN_F6R2_FB21_Pos)
#define CAN_F6R2_FB21 CAN_F6R2_FB21_Msk
#define CAN_F6R2_FB22_Pos (22U)
#define CAN_F6R2_FB22_Msk (0x1U << CAN_F6R2_FB22_Pos)
#define CAN_F6R2_FB22 CAN_F6R2_FB22_Msk
#define CAN_F6R2_FB23_Pos (23U)
#define CAN_F6R2_FB23_Msk (0x1U << CAN_F6R2_FB23_Pos)
#define CAN_F6R2_FB23 CAN_F6R2_FB23_Msk
#define CAN_F6R2_FB24_Pos (24U)
#define CAN_F6R2_FB24_Msk (0x1U << CAN_F6R2_FB24_Pos)
#define CAN_F6R2_FB24 CAN_F6R2_FB24_Msk
#define CAN_F6R2_FB25_Pos (25U)
#define CAN_F6R2_FB25_Msk (0x1U << CAN_F6R2_FB25_Pos)
#define CAN_F6R2_FB25 CAN_F6R2_FB25_Msk
#define CAN_F6R2_FB26_Pos (26U)
#define CAN_F6R2_FB26_Msk (0x1U << CAN_F6R2_FB26_Pos)
#define CAN_F6R2_FB26 CAN_F6R2_FB26_Msk
#define CAN_F6R2_FB27_Pos (27U)
#define CAN_F6R2_FB27_Msk (0x1U << CAN_F6R2_FB27_Pos)
#define CAN_F6R2_FB27 CAN_F6R2_FB27_Msk
#define CAN_F6R2_FB28_Pos (28U)
#define CAN_F6R2_FB28_Msk (0x1U << CAN_F6R2_FB28_Pos)
#define CAN_F6R2_FB28 CAN_F6R2_FB28_Msk
#define CAN_F6R2_FB29_Pos (29U)
#define CAN_F6R2_FB29_Msk (0x1U << CAN_F6R2_FB29_Pos)
#define CAN_F6R2_FB29 CAN_F6R2_FB29_Msk
#define CAN_F6R2_FB30_Pos (30U)
#define CAN_F6R2_FB30_Msk (0x1U << CAN_F6R2_FB30_Pos)
#define CAN_F6R2_FB30 CAN_F6R2_FB30_Msk
#define CAN_F6R2_FB31_Pos (31U)
#define CAN_F6R2_FB31_Msk (0x1U << CAN_F6R2_FB31_Pos)
#define CAN_F6R2_FB31 CAN_F6R2_FB31_Msk


#define CAN_F7R2_FB0_Pos (0U)
#define CAN_F7R2_FB0_Msk (0x1U << CAN_F7R2_FB0_Pos)
#define CAN_F7R2_FB0 CAN_F7R2_FB0_Msk
#define CAN_F7R2_FB1_Pos (1U)
#define CAN_F7R2_FB1_Msk (0x1U << CAN_F7R2_FB1_Pos)
#define CAN_F7R2_FB1 CAN_F7R2_FB1_Msk
#define CAN_F7R2_FB2_Pos (2U)
#define CAN_F7R2_FB2_Msk (0x1U << CAN_F7R2_FB2_Pos)
#define CAN_F7R2_FB2 CAN_F7R2_FB2_Msk
#define CAN_F7R2_FB3_Pos (3U)
#define CAN_F7R2_FB3_Msk (0x1U << CAN_F7R2_FB3_Pos)
#define CAN_F7R2_FB3 CAN_F7R2_FB3_Msk
#define CAN_F7R2_FB4_Pos (4U)
#define CAN_F7R2_FB4_Msk (0x1U << CAN_F7R2_FB4_Pos)
#define CAN_F7R2_FB4 CAN_F7R2_FB4_Msk
#define CAN_F7R2_FB5_Pos (5U)
#define CAN_F7R2_FB5_Msk (0x1U << CAN_F7R2_FB5_Pos)
#define CAN_F7R2_FB5 CAN_F7R2_FB5_Msk
#define CAN_F7R2_FB6_Pos (6U)
#define CAN_F7R2_FB6_Msk (0x1U << CAN_F7R2_FB6_Pos)
#define CAN_F7R2_FB6 CAN_F7R2_FB6_Msk
#define CAN_F7R2_FB7_Pos (7U)
#define CAN_F7R2_FB7_Msk (0x1U << CAN_F7R2_FB7_Pos)
#define CAN_F7R2_FB7 CAN_F7R2_FB7_Msk
#define CAN_F7R2_FB8_Pos (8U)
#define CAN_F7R2_FB8_Msk (0x1U << CAN_F7R2_FB8_Pos)
#define CAN_F7R2_FB8 CAN_F7R2_FB8_Msk
#define CAN_F7R2_FB9_Pos (9U)
#define CAN_F7R2_FB9_Msk (0x1U << CAN_F7R2_FB9_Pos)
#define CAN_F7R2_FB9 CAN_F7R2_FB9_Msk
#define CAN_F7R2_FB10_Pos (10U)
#define CAN_F7R2_FB10_Msk (0x1U << CAN_F7R2_FB10_Pos)
#define CAN_F7R2_FB10 CAN_F7R2_FB10_Msk
#define CAN_F7R2_FB11_Pos (11U)
#define CAN_F7R2_FB11_Msk (0x1U << CAN_F7R2_FB11_Pos)
#define CAN_F7R2_FB11 CAN_F7R2_FB11_Msk
#define CAN_F7R2_FB12_Pos (12U)
#define CAN_F7R2_FB12_Msk (0x1U << CAN_F7R2_FB12_Pos)
#define CAN_F7R2_FB12 CAN_F7R2_FB12_Msk
#define CAN_F7R2_FB13_Pos (13U)
#define CAN_F7R2_FB13_Msk (0x1U << CAN_F7R2_FB13_Pos)
#define CAN_F7R2_FB13 CAN_F7R2_FB13_Msk
#define CAN_F7R2_FB14_Pos (14U)
#define CAN_F7R2_FB14_Msk (0x1U << CAN_F7R2_FB14_Pos)
#define CAN_F7R2_FB14 CAN_F7R2_FB14_Msk
#define CAN_F7R2_FB15_Pos (15U)
#define CAN_F7R2_FB15_Msk (0x1U << CAN_F7R2_FB15_Pos)
#define CAN_F7R2_FB15 CAN_F7R2_FB15_Msk
#define CAN_F7R2_FB16_Pos (16U)
#define CAN_F7R2_FB16_Msk (0x1U << CAN_F7R2_FB16_Pos)
#define CAN_F7R2_FB16 CAN_F7R2_FB16_Msk
#define CAN_F7R2_FB17_Pos (17U)
#define CAN_F7R2_FB17_Msk (0x1U << CAN_F7R2_FB17_Pos)
#define CAN_F7R2_FB17 CAN_F7R2_FB17_Msk
#define CAN_F7R2_FB18_Pos (18U)
#define CAN_F7R2_FB18_Msk (0x1U << CAN_F7R2_FB18_Pos)
#define CAN_F7R2_FB18 CAN_F7R2_FB18_Msk
#define CAN_F7R2_FB19_Pos (19U)
#define CAN_F7R2_FB19_Msk (0x1U << CAN_F7R2_FB19_Pos)
#define CAN_F7R2_FB19 CAN_F7R2_FB19_Msk
#define CAN_F7R2_FB20_Pos (20U)
#define CAN_F7R2_FB20_Msk (0x1U << CAN_F7R2_FB20_Pos)
#define CAN_F7R2_FB20 CAN_F7R2_FB20_Msk
#define CAN_F7R2_FB21_Pos (21U)
#define CAN_F7R2_FB21_Msk (0x1U << CAN_F7R2_FB21_Pos)
#define CAN_F7R2_FB21 CAN_F7R2_FB21_Msk
#define CAN_F7R2_FB22_Pos (22U)
#define CAN_F7R2_FB22_Msk (0x1U << CAN_F7R2_FB22_Pos)
#define CAN_F7R2_FB22 CAN_F7R2_FB22_Msk
#define CAN_F7R2_FB23_Pos (23U)
#define CAN_F7R2_FB23_Msk (0x1U << CAN_F7R2_FB23_Pos)
#define CAN_F7R2_FB23 CAN_F7R2_FB23_Msk
#define CAN_F7R2_FB24_Pos (24U)
#define CAN_F7R2_FB24_Msk (0x1U << CAN_F7R2_FB24_Pos)
#define CAN_F7R2_FB24 CAN_F7R2_FB24_Msk
#define CAN_F7R2_FB25_Pos (25U)
#define CAN_F7R2_FB25_Msk (0x1U << CAN_F7R2_FB25_Pos)
#define CAN_F7R2_FB25 CAN_F7R2_FB25_Msk
#define CAN_F7R2_FB26_Pos (26U)
#define CAN_F7R2_FB26_Msk (0x1U << CAN_F7R2_FB26_Pos)
#define CAN_F7R2_FB26 CAN_F7R2_FB26_Msk
#define CAN_F7R2_FB27_Pos (27U)
#define CAN_F7R2_FB27_Msk (0x1U << CAN_F7R2_FB27_Pos)
#define CAN_F7R2_FB27 CAN_F7R2_FB27_Msk
#define CAN_F7R2_FB28_Pos (28U)
#define CAN_F7R2_FB28_Msk (0x1U << CAN_F7R2_FB28_Pos)
#define CAN_F7R2_FB28 CAN_F7R2_FB28_Msk
#define CAN_F7R2_FB29_Pos (29U)
#define CAN_F7R2_FB29_Msk (0x1U << CAN_F7R2_FB29_Pos)
#define CAN_F7R2_FB29 CAN_F7R2_FB29_Msk
#define CAN_F7R2_FB30_Pos (30U)
#define CAN_F7R2_FB30_Msk (0x1U << CAN_F7R2_FB30_Pos)
#define CAN_F7R2_FB30 CAN_F7R2_FB30_Msk
#define CAN_F7R2_FB31_Pos (31U)
#define CAN_F7R2_FB31_Msk (0x1U << CAN_F7R2_FB31_Pos)
#define CAN_F7R2_FB31 CAN_F7R2_FB31_Msk


#define CAN_F8R2_FB0_Pos (0U)
#define CAN_F8R2_FB0_Msk (0x1U << CAN_F8R2_FB0_Pos)
#define CAN_F8R2_FB0 CAN_F8R2_FB0_Msk
#define CAN_F8R2_FB1_Pos (1U)
#define CAN_F8R2_FB1_Msk (0x1U << CAN_F8R2_FB1_Pos)
#define CAN_F8R2_FB1 CAN_F8R2_FB1_Msk
#define CAN_F8R2_FB2_Pos (2U)
#define CAN_F8R2_FB2_Msk (0x1U << CAN_F8R2_FB2_Pos)
#define CAN_F8R2_FB2 CAN_F8R2_FB2_Msk
#define CAN_F8R2_FB3_Pos (3U)
#define CAN_F8R2_FB3_Msk (0x1U << CAN_F8R2_FB3_Pos)
#define CAN_F8R2_FB3 CAN_F8R2_FB3_Msk
#define CAN_F8R2_FB4_Pos (4U)
#define CAN_F8R2_FB4_Msk (0x1U << CAN_F8R2_FB4_Pos)
#define CAN_F8R2_FB4 CAN_F8R2_FB4_Msk
#define CAN_F8R2_FB5_Pos (5U)
#define CAN_F8R2_FB5_Msk (0x1U << CAN_F8R2_FB5_Pos)
#define CAN_F8R2_FB5 CAN_F8R2_FB5_Msk
#define CAN_F8R2_FB6_Pos (6U)
#define CAN_F8R2_FB6_Msk (0x1U << CAN_F8R2_FB6_Pos)
#define CAN_F8R2_FB6 CAN_F8R2_FB6_Msk
#define CAN_F8R2_FB7_Pos (7U)
#define CAN_F8R2_FB7_Msk (0x1U << CAN_F8R2_FB7_Pos)
#define CAN_F8R2_FB7 CAN_F8R2_FB7_Msk
#define CAN_F8R2_FB8_Pos (8U)
#define CAN_F8R2_FB8_Msk (0x1U << CAN_F8R2_FB8_Pos)
#define CAN_F8R2_FB8 CAN_F8R2_FB8_Msk
#define CAN_F8R2_FB9_Pos (9U)
#define CAN_F8R2_FB9_Msk (0x1U << CAN_F8R2_FB9_Pos)
#define CAN_F8R2_FB9 CAN_F8R2_FB9_Msk
#define CAN_F8R2_FB10_Pos (10U)
#define CAN_F8R2_FB10_Msk (0x1U << CAN_F8R2_FB10_Pos)
#define CAN_F8R2_FB10 CAN_F8R2_FB10_Msk
#define CAN_F8R2_FB11_Pos (11U)
#define CAN_F8R2_FB11_Msk (0x1U << CAN_F8R2_FB11_Pos)
#define CAN_F8R2_FB11 CAN_F8R2_FB11_Msk
#define CAN_F8R2_FB12_Pos (12U)
#define CAN_F8R2_FB12_Msk (0x1U << CAN_F8R2_FB12_Pos)
#define CAN_F8R2_FB12 CAN_F8R2_FB12_Msk
#define CAN_F8R2_FB13_Pos (13U)
#define CAN_F8R2_FB13_Msk (0x1U << CAN_F8R2_FB13_Pos)
#define CAN_F8R2_FB13 CAN_F8R2_FB13_Msk
#define CAN_F8R2_FB14_Pos (14U)
#define CAN_F8R2_FB14_Msk (0x1U << CAN_F8R2_FB14_Pos)
#define CAN_F8R2_FB14 CAN_F8R2_FB14_Msk
#define CAN_F8R2_FB15_Pos (15U)
#define CAN_F8R2_FB15_Msk (0x1U << CAN_F8R2_FB15_Pos)
#define CAN_F8R2_FB15 CAN_F8R2_FB15_Msk
#define CAN_F8R2_FB16_Pos (16U)
#define CAN_F8R2_FB16_Msk (0x1U << CAN_F8R2_FB16_Pos)
#define CAN_F8R2_FB16 CAN_F8R2_FB16_Msk
#define CAN_F8R2_FB17_Pos (17U)
#define CAN_F8R2_FB17_Msk (0x1U << CAN_F8R2_FB17_Pos)
#define CAN_F8R2_FB17 CAN_F8R2_FB17_Msk
#define CAN_F8R2_FB18_Pos (18U)
#define CAN_F8R2_FB18_Msk (0x1U << CAN_F8R2_FB18_Pos)
#define CAN_F8R2_FB18 CAN_F8R2_FB18_Msk
#define CAN_F8R2_FB19_Pos (19U)
#define CAN_F8R2_FB19_Msk (0x1U << CAN_F8R2_FB19_Pos)
#define CAN_F8R2_FB19 CAN_F8R2_FB19_Msk
#define CAN_F8R2_FB20_Pos (20U)
#define CAN_F8R2_FB20_Msk (0x1U << CAN_F8R2_FB20_Pos)
#define CAN_F8R2_FB20 CAN_F8R2_FB20_Msk
#define CAN_F8R2_FB21_Pos (21U)
#define CAN_F8R2_FB21_Msk (0x1U << CAN_F8R2_FB21_Pos)
#define CAN_F8R2_FB21 CAN_F8R2_FB21_Msk
#define CAN_F8R2_FB22_Pos (22U)
#define CAN_F8R2_FB22_Msk (0x1U << CAN_F8R2_FB22_Pos)
#define CAN_F8R2_FB22 CAN_F8R2_FB22_Msk
#define CAN_F8R2_FB23_Pos (23U)
#define CAN_F8R2_FB23_Msk (0x1U << CAN_F8R2_FB23_Pos)
#define CAN_F8R2_FB23 CAN_F8R2_FB23_Msk
#define CAN_F8R2_FB24_Pos (24U)
#define CAN_F8R2_FB24_Msk (0x1U << CAN_F8R2_FB24_Pos)
#define CAN_F8R2_FB24 CAN_F8R2_FB24_Msk
#define CAN_F8R2_FB25_Pos (25U)
#define CAN_F8R2_FB25_Msk (0x1U << CAN_F8R2_FB25_Pos)
#define CAN_F8R2_FB25 CAN_F8R2_FB25_Msk
#define CAN_F8R2_FB26_Pos (26U)
#define CAN_F8R2_FB26_Msk (0x1U << CAN_F8R2_FB26_Pos)
#define CAN_F8R2_FB26 CAN_F8R2_FB26_Msk
#define CAN_F8R2_FB27_Pos (27U)
#define CAN_F8R2_FB27_Msk (0x1U << CAN_F8R2_FB27_Pos)
#define CAN_F8R2_FB27 CAN_F8R2_FB27_Msk
#define CAN_F8R2_FB28_Pos (28U)
#define CAN_F8R2_FB28_Msk (0x1U << CAN_F8R2_FB28_Pos)
#define CAN_F8R2_FB28 CAN_F8R2_FB28_Msk
#define CAN_F8R2_FB29_Pos (29U)
#define CAN_F8R2_FB29_Msk (0x1U << CAN_F8R2_FB29_Pos)
#define CAN_F8R2_FB29 CAN_F8R2_FB29_Msk
#define CAN_F8R2_FB30_Pos (30U)
#define CAN_F8R2_FB30_Msk (0x1U << CAN_F8R2_FB30_Pos)
#define CAN_F8R2_FB30 CAN_F8R2_FB30_Msk
#define CAN_F8R2_FB31_Pos (31U)
#define CAN_F8R2_FB31_Msk (0x1U << CAN_F8R2_FB31_Pos)
#define CAN_F8R2_FB31 CAN_F8R2_FB31_Msk


#define CAN_F9R2_FB0_Pos (0U)
#define CAN_F9R2_FB0_Msk (0x1U << CAN_F9R2_FB0_Pos)
#define CAN_F9R2_FB0 CAN_F9R2_FB0_Msk
#define CAN_F9R2_FB1_Pos (1U)
#define CAN_F9R2_FB1_Msk (0x1U << CAN_F9R2_FB1_Pos)
#define CAN_F9R2_FB1 CAN_F9R2_FB1_Msk
#define CAN_F9R2_FB2_Pos (2U)
#define CAN_F9R2_FB2_Msk (0x1U << CAN_F9R2_FB2_Pos)
#define CAN_F9R2_FB2 CAN_F9R2_FB2_Msk
#define CAN_F9R2_FB3_Pos (3U)
#define CAN_F9R2_FB3_Msk (0x1U << CAN_F9R2_FB3_Pos)
#define CAN_F9R2_FB3 CAN_F9R2_FB3_Msk
#define CAN_F9R2_FB4_Pos (4U)
#define CAN_F9R2_FB4_Msk (0x1U << CAN_F9R2_FB4_Pos)
#define CAN_F9R2_FB4 CAN_F9R2_FB4_Msk
#define CAN_F9R2_FB5_Pos (5U)
#define CAN_F9R2_FB5_Msk (0x1U << CAN_F9R2_FB5_Pos)
#define CAN_F9R2_FB5 CAN_F9R2_FB5_Msk
#define CAN_F9R2_FB6_Pos (6U)
#define CAN_F9R2_FB6_Msk (0x1U << CAN_F9R2_FB6_Pos)
#define CAN_F9R2_FB6 CAN_F9R2_FB6_Msk
#define CAN_F9R2_FB7_Pos (7U)
#define CAN_F9R2_FB7_Msk (0x1U << CAN_F9R2_FB7_Pos)
#define CAN_F9R2_FB7 CAN_F9R2_FB7_Msk
#define CAN_F9R2_FB8_Pos (8U)
#define CAN_F9R2_FB8_Msk (0x1U << CAN_F9R2_FB8_Pos)
#define CAN_F9R2_FB8 CAN_F9R2_FB8_Msk
#define CAN_F9R2_FB9_Pos (9U)
#define CAN_F9R2_FB9_Msk (0x1U << CAN_F9R2_FB9_Pos)
#define CAN_F9R2_FB9 CAN_F9R2_FB9_Msk
#define CAN_F9R2_FB10_Pos (10U)
#define CAN_F9R2_FB10_Msk (0x1U << CAN_F9R2_FB10_Pos)
#define CAN_F9R2_FB10 CAN_F9R2_FB10_Msk
#define CAN_F9R2_FB11_Pos (11U)
#define CAN_F9R2_FB11_Msk (0x1U << CAN_F9R2_FB11_Pos)
#define CAN_F9R2_FB11 CAN_F9R2_FB11_Msk
#define CAN_F9R2_FB12_Pos (12U)
#define CAN_F9R2_FB12_Msk (0x1U << CAN_F9R2_FB12_Pos)
#define CAN_F9R2_FB12 CAN_F9R2_FB12_Msk
#define CAN_F9R2_FB13_Pos (13U)
#define CAN_F9R2_FB13_Msk (0x1U << CAN_F9R2_FB13_Pos)
#define CAN_F9R2_FB13 CAN_F9R2_FB13_Msk
#define CAN_F9R2_FB14_Pos (14U)
#define CAN_F9R2_FB14_Msk (0x1U << CAN_F9R2_FB14_Pos)
#define CAN_F9R2_FB14 CAN_F9R2_FB14_Msk
#define CAN_F9R2_FB15_Pos (15U)
#define CAN_F9R2_FB15_Msk (0x1U << CAN_F9R2_FB15_Pos)
#define CAN_F9R2_FB15 CAN_F9R2_FB15_Msk
#define CAN_F9R2_FB16_Pos (16U)
#define CAN_F9R2_FB16_Msk (0x1U << CAN_F9R2_FB16_Pos)
#define CAN_F9R2_FB16 CAN_F9R2_FB16_Msk
#define CAN_F9R2_FB17_Pos (17U)
#define CAN_F9R2_FB17_Msk (0x1U << CAN_F9R2_FB17_Pos)
#define CAN_F9R2_FB17 CAN_F9R2_FB17_Msk
#define CAN_F9R2_FB18_Pos (18U)
#define CAN_F9R2_FB18_Msk (0x1U << CAN_F9R2_FB18_Pos)
#define CAN_F9R2_FB18 CAN_F9R2_FB18_Msk
#define CAN_F9R2_FB19_Pos (19U)
#define CAN_F9R2_FB19_Msk (0x1U << CAN_F9R2_FB19_Pos)
#define CAN_F9R2_FB19 CAN_F9R2_FB19_Msk
#define CAN_F9R2_FB20_Pos (20U)
#define CAN_F9R2_FB20_Msk (0x1U << CAN_F9R2_FB20_Pos)
#define CAN_F9R2_FB20 CAN_F9R2_FB20_Msk
#define CAN_F9R2_FB21_Pos (21U)
#define CAN_F9R2_FB21_Msk (0x1U << CAN_F9R2_FB21_Pos)
#define CAN_F9R2_FB21 CAN_F9R2_FB21_Msk
#define CAN_F9R2_FB22_Pos (22U)
#define CAN_F9R2_FB22_Msk (0x1U << CAN_F9R2_FB22_Pos)
#define CAN_F9R2_FB22 CAN_F9R2_FB22_Msk
#define CAN_F9R2_FB23_Pos (23U)
#define CAN_F9R2_FB23_Msk (0x1U << CAN_F9R2_FB23_Pos)
#define CAN_F9R2_FB23 CAN_F9R2_FB23_Msk
#define CAN_F9R2_FB24_Pos (24U)
#define CAN_F9R2_FB24_Msk (0x1U << CAN_F9R2_FB24_Pos)
#define CAN_F9R2_FB24 CAN_F9R2_FB24_Msk
#define CAN_F9R2_FB25_Pos (25U)
#define CAN_F9R2_FB25_Msk (0x1U << CAN_F9R2_FB25_Pos)
#define CAN_F9R2_FB25 CAN_F9R2_FB25_Msk
#define CAN_F9R2_FB26_Pos (26U)
#define CAN_F9R2_FB26_Msk (0x1U << CAN_F9R2_FB26_Pos)
#define CAN_F9R2_FB26 CAN_F9R2_FB26_Msk
#define CAN_F9R2_FB27_Pos (27U)
#define CAN_F9R2_FB27_Msk (0x1U << CAN_F9R2_FB27_Pos)
#define CAN_F9R2_FB27 CAN_F9R2_FB27_Msk
#define CAN_F9R2_FB28_Pos (28U)
#define CAN_F9R2_FB28_Msk (0x1U << CAN_F9R2_FB28_Pos)
#define CAN_F9R2_FB28 CAN_F9R2_FB28_Msk
#define CAN_F9R2_FB29_Pos (29U)
#define CAN_F9R2_FB29_Msk (0x1U << CAN_F9R2_FB29_Pos)
#define CAN_F9R2_FB29 CAN_F9R2_FB29_Msk
#define CAN_F9R2_FB30_Pos (30U)
#define CAN_F9R2_FB30_Msk (0x1U << CAN_F9R2_FB30_Pos)
#define CAN_F9R2_FB30 CAN_F9R2_FB30_Msk
#define CAN_F9R2_FB31_Pos (31U)
#define CAN_F9R2_FB31_Msk (0x1U << CAN_F9R2_FB31_Pos)
#define CAN_F9R2_FB31 CAN_F9R2_FB31_Msk


#define CAN_F10R2_FB0_Pos (0U)
#define CAN_F10R2_FB0_Msk (0x1U << CAN_F10R2_FB0_Pos)
#define CAN_F10R2_FB0 CAN_F10R2_FB0_Msk
#define CAN_F10R2_FB1_Pos (1U)
#define CAN_F10R2_FB1_Msk (0x1U << CAN_F10R2_FB1_Pos)
#define CAN_F10R2_FB1 CAN_F10R2_FB1_Msk
#define CAN_F10R2_FB2_Pos (2U)
#define CAN_F10R2_FB2_Msk (0x1U << CAN_F10R2_FB2_Pos)
#define CAN_F10R2_FB2 CAN_F10R2_FB2_Msk
#define CAN_F10R2_FB3_Pos (3U)
#define CAN_F10R2_FB3_Msk (0x1U << CAN_F10R2_FB3_Pos)
#define CAN_F10R2_FB3 CAN_F10R2_FB3_Msk
#define CAN_F10R2_FB4_Pos (4U)
#define CAN_F10R2_FB4_Msk (0x1U << CAN_F10R2_FB4_Pos)
#define CAN_F10R2_FB4 CAN_F10R2_FB4_Msk
#define CAN_F10R2_FB5_Pos (5U)
#define CAN_F10R2_FB5_Msk (0x1U << CAN_F10R2_FB5_Pos)
#define CAN_F10R2_FB5 CAN_F10R2_FB5_Msk
#define CAN_F10R2_FB6_Pos (6U)
#define CAN_F10R2_FB6_Msk (0x1U << CAN_F10R2_FB6_Pos)
#define CAN_F10R2_FB6 CAN_F10R2_FB6_Msk
#define CAN_F10R2_FB7_Pos (7U)
#define CAN_F10R2_FB7_Msk (0x1U << CAN_F10R2_FB7_Pos)
#define CAN_F10R2_FB7 CAN_F10R2_FB7_Msk
#define CAN_F10R2_FB8_Pos (8U)
#define CAN_F10R2_FB8_Msk (0x1U << CAN_F10R2_FB8_Pos)
#define CAN_F10R2_FB8 CAN_F10R2_FB8_Msk
#define CAN_F10R2_FB9_Pos (9U)
#define CAN_F10R2_FB9_Msk (0x1U << CAN_F10R2_FB9_Pos)
#define CAN_F10R2_FB9 CAN_F10R2_FB9_Msk
#define CAN_F10R2_FB10_Pos (10U)
#define CAN_F10R2_FB10_Msk (0x1U << CAN_F10R2_FB10_Pos)
#define CAN_F10R2_FB10 CAN_F10R2_FB10_Msk
#define CAN_F10R2_FB11_Pos (11U)
#define CAN_F10R2_FB11_Msk (0x1U << CAN_F10R2_FB11_Pos)
#define CAN_F10R2_FB11 CAN_F10R2_FB11_Msk
#define CAN_F10R2_FB12_Pos (12U)
#define CAN_F10R2_FB12_Msk (0x1U << CAN_F10R2_FB12_Pos)
#define CAN_F10R2_FB12 CAN_F10R2_FB12_Msk
#define CAN_F10R2_FB13_Pos (13U)
#define CAN_F10R2_FB13_Msk (0x1U << CAN_F10R2_FB13_Pos)
#define CAN_F10R2_FB13 CAN_F10R2_FB13_Msk
#define CAN_F10R2_FB14_Pos (14U)
#define CAN_F10R2_FB14_Msk (0x1U << CAN_F10R2_FB14_Pos)
#define CAN_F10R2_FB14 CAN_F10R2_FB14_Msk
#define CAN_F10R2_FB15_Pos (15U)
#define CAN_F10R2_FB15_Msk (0x1U << CAN_F10R2_FB15_Pos)
#define CAN_F10R2_FB15 CAN_F10R2_FB15_Msk
#define CAN_F10R2_FB16_Pos (16U)
#define CAN_F10R2_FB16_Msk (0x1U << CAN_F10R2_FB16_Pos)
#define CAN_F10R2_FB16 CAN_F10R2_FB16_Msk
#define CAN_F10R2_FB17_Pos (17U)
#define CAN_F10R2_FB17_Msk (0x1U << CAN_F10R2_FB17_Pos)
#define CAN_F10R2_FB17 CAN_F10R2_FB17_Msk
#define CAN_F10R2_FB18_Pos (18U)
#define CAN_F10R2_FB18_Msk (0x1U << CAN_F10R2_FB18_Pos)
#define CAN_F10R2_FB18 CAN_F10R2_FB18_Msk
#define CAN_F10R2_FB19_Pos (19U)
#define CAN_F10R2_FB19_Msk (0x1U << CAN_F10R2_FB19_Pos)
#define CAN_F10R2_FB19 CAN_F10R2_FB19_Msk
#define CAN_F10R2_FB20_Pos (20U)
#define CAN_F10R2_FB20_Msk (0x1U << CAN_F10R2_FB20_Pos)
#define CAN_F10R2_FB20 CAN_F10R2_FB20_Msk
#define CAN_F10R2_FB21_Pos (21U)
#define CAN_F10R2_FB21_Msk (0x1U << CAN_F10R2_FB21_Pos)
#define CAN_F10R2_FB21 CAN_F10R2_FB21_Msk
#define CAN_F10R2_FB22_Pos (22U)
#define CAN_F10R2_FB22_Msk (0x1U << CAN_F10R2_FB22_Pos)
#define CAN_F10R2_FB22 CAN_F10R2_FB22_Msk
#define CAN_F10R2_FB23_Pos (23U)
#define CAN_F10R2_FB23_Msk (0x1U << CAN_F10R2_FB23_Pos)
#define CAN_F10R2_FB23 CAN_F10R2_FB23_Msk
#define CAN_F10R2_FB24_Pos (24U)
#define CAN_F10R2_FB24_Msk (0x1U << CAN_F10R2_FB24_Pos)
#define CAN_F10R2_FB24 CAN_F10R2_FB24_Msk
#define CAN_F10R2_FB25_Pos (25U)
#define CAN_F10R2_FB25_Msk (0x1U << CAN_F10R2_FB25_Pos)
#define CAN_F10R2_FB25 CAN_F10R2_FB25_Msk
#define CAN_F10R2_FB26_Pos (26U)
#define CAN_F10R2_FB26_Msk (0x1U << CAN_F10R2_FB26_Pos)
#define CAN_F10R2_FB26 CAN_F10R2_FB26_Msk
#define CAN_F10R2_FB27_Pos (27U)
#define CAN_F10R2_FB27_Msk (0x1U << CAN_F10R2_FB27_Pos)
#define CAN_F10R2_FB27 CAN_F10R2_FB27_Msk
#define CAN_F10R2_FB28_Pos (28U)
#define CAN_F10R2_FB28_Msk (0x1U << CAN_F10R2_FB28_Pos)
#define CAN_F10R2_FB28 CAN_F10R2_FB28_Msk
#define CAN_F10R2_FB29_Pos (29U)
#define CAN_F10R2_FB29_Msk (0x1U << CAN_F10R2_FB29_Pos)
#define CAN_F10R2_FB29 CAN_F10R2_FB29_Msk
#define CAN_F10R2_FB30_Pos (30U)
#define CAN_F10R2_FB30_Msk (0x1U << CAN_F10R2_FB30_Pos)
#define CAN_F10R2_FB30 CAN_F10R2_FB30_Msk
#define CAN_F10R2_FB31_Pos (31U)
#define CAN_F10R2_FB31_Msk (0x1U << CAN_F10R2_FB31_Pos)
#define CAN_F10R2_FB31 CAN_F10R2_FB31_Msk


#define CAN_F11R2_FB0_Pos (0U)
#define CAN_F11R2_FB0_Msk (0x1U << CAN_F11R2_FB0_Pos)
#define CAN_F11R2_FB0 CAN_F11R2_FB0_Msk
#define CAN_F11R2_FB1_Pos (1U)
#define CAN_F11R2_FB1_Msk (0x1U << CAN_F11R2_FB1_Pos)
#define CAN_F11R2_FB1 CAN_F11R2_FB1_Msk
#define CAN_F11R2_FB2_Pos (2U)
#define CAN_F11R2_FB2_Msk (0x1U << CAN_F11R2_FB2_Pos)
#define CAN_F11R2_FB2 CAN_F11R2_FB2_Msk
#define CAN_F11R2_FB3_Pos (3U)
#define CAN_F11R2_FB3_Msk (0x1U << CAN_F11R2_FB3_Pos)
#define CAN_F11R2_FB3 CAN_F11R2_FB3_Msk
#define CAN_F11R2_FB4_Pos (4U)
#define CAN_F11R2_FB4_Msk (0x1U << CAN_F11R2_FB4_Pos)
#define CAN_F11R2_FB4 CAN_F11R2_FB4_Msk
#define CAN_F11R2_FB5_Pos (5U)
#define CAN_F11R2_FB5_Msk (0x1U << CAN_F11R2_FB5_Pos)
#define CAN_F11R2_FB5 CAN_F11R2_FB5_Msk
#define CAN_F11R2_FB6_Pos (6U)
#define CAN_F11R2_FB6_Msk (0x1U << CAN_F11R2_FB6_Pos)
#define CAN_F11R2_FB6 CAN_F11R2_FB6_Msk
#define CAN_F11R2_FB7_Pos (7U)
#define CAN_F11R2_FB7_Msk (0x1U << CAN_F11R2_FB7_Pos)
#define CAN_F11R2_FB7 CAN_F11R2_FB7_Msk
#define CAN_F11R2_FB8_Pos (8U)
#define CAN_F11R2_FB8_Msk (0x1U << CAN_F11R2_FB8_Pos)
#define CAN_F11R2_FB8 CAN_F11R2_FB8_Msk
#define CAN_F11R2_FB9_Pos (9U)
#define CAN_F11R2_FB9_Msk (0x1U << CAN_F11R2_FB9_Pos)
#define CAN_F11R2_FB9 CAN_F11R2_FB9_Msk
#define CAN_F11R2_FB10_Pos (10U)
#define CAN_F11R2_FB10_Msk (0x1U << CAN_F11R2_FB10_Pos)
#define CAN_F11R2_FB10 CAN_F11R2_FB10_Msk
#define CAN_F11R2_FB11_Pos (11U)
#define CAN_F11R2_FB11_Msk (0x1U << CAN_F11R2_FB11_Pos)
#define CAN_F11R2_FB11 CAN_F11R2_FB11_Msk
#define CAN_F11R2_FB12_Pos (12U)
#define CAN_F11R2_FB12_Msk (0x1U << CAN_F11R2_FB12_Pos)
#define CAN_F11R2_FB12 CAN_F11R2_FB12_Msk
#define CAN_F11R2_FB13_Pos (13U)
#define CAN_F11R2_FB13_Msk (0x1U << CAN_F11R2_FB13_Pos)
#define CAN_F11R2_FB13 CAN_F11R2_FB13_Msk
#define CAN_F11R2_FB14_Pos (14U)
#define CAN_F11R2_FB14_Msk (0x1U << CAN_F11R2_FB14_Pos)
#define CAN_F11R2_FB14 CAN_F11R2_FB14_Msk
#define CAN_F11R2_FB15_Pos (15U)
#define CAN_F11R2_FB15_Msk (0x1U << CAN_F11R2_FB15_Pos)
#define CAN_F11R2_FB15 CAN_F11R2_FB15_Msk
#define CAN_F11R2_FB16_Pos (16U)
#define CAN_F11R2_FB16_Msk (0x1U << CAN_F11R2_FB16_Pos)
#define CAN_F11R2_FB16 CAN_F11R2_FB16_Msk
#define CAN_F11R2_FB17_Pos (17U)
#define CAN_F11R2_FB17_Msk (0x1U << CAN_F11R2_FB17_Pos)
#define CAN_F11R2_FB17 CAN_F11R2_FB17_Msk
#define CAN_F11R2_FB18_Pos (18U)
#define CAN_F11R2_FB18_Msk (0x1U << CAN_F11R2_FB18_Pos)
#define CAN_F11R2_FB18 CAN_F11R2_FB18_Msk
#define CAN_F11R2_FB19_Pos (19U)
#define CAN_F11R2_FB19_Msk (0x1U << CAN_F11R2_FB19_Pos)
#define CAN_F11R2_FB19 CAN_F11R2_FB19_Msk
#define CAN_F11R2_FB20_Pos (20U)
#define CAN_F11R2_FB20_Msk (0x1U << CAN_F11R2_FB20_Pos)
#define CAN_F11R2_FB20 CAN_F11R2_FB20_Msk
#define CAN_F11R2_FB21_Pos (21U)
#define CAN_F11R2_FB21_Msk (0x1U << CAN_F11R2_FB21_Pos)
#define CAN_F11R2_FB21 CAN_F11R2_FB21_Msk
#define CAN_F11R2_FB22_Pos (22U)
#define CAN_F11R2_FB22_Msk (0x1U << CAN_F11R2_FB22_Pos)
#define CAN_F11R2_FB22 CAN_F11R2_FB22_Msk
#define CAN_F11R2_FB23_Pos (23U)
#define CAN_F11R2_FB23_Msk (0x1U << CAN_F11R2_FB23_Pos)
#define CAN_F11R2_FB23 CAN_F11R2_FB23_Msk
#define CAN_F11R2_FB24_Pos (24U)
#define CAN_F11R2_FB24_Msk (0x1U << CAN_F11R2_FB24_Pos)
#define CAN_F11R2_FB24 CAN_F11R2_FB24_Msk
#define CAN_F11R2_FB25_Pos (25U)
#define CAN_F11R2_FB25_Msk (0x1U << CAN_F11R2_FB25_Pos)
#define CAN_F11R2_FB25 CAN_F11R2_FB25_Msk
#define CAN_F11R2_FB26_Pos (26U)
#define CAN_F11R2_FB26_Msk (0x1U << CAN_F11R2_FB26_Pos)
#define CAN_F11R2_FB26 CAN_F11R2_FB26_Msk
#define CAN_F11R2_FB27_Pos (27U)
#define CAN_F11R2_FB27_Msk (0x1U << CAN_F11R2_FB27_Pos)
#define CAN_F11R2_FB27 CAN_F11R2_FB27_Msk
#define CAN_F11R2_FB28_Pos (28U)
#define CAN_F11R2_FB28_Msk (0x1U << CAN_F11R2_FB28_Pos)
#define CAN_F11R2_FB28 CAN_F11R2_FB28_Msk
#define CAN_F11R2_FB29_Pos (29U)
#define CAN_F11R2_FB29_Msk (0x1U << CAN_F11R2_FB29_Pos)
#define CAN_F11R2_FB29 CAN_F11R2_FB29_Msk
#define CAN_F11R2_FB30_Pos (30U)
#define CAN_F11R2_FB30_Msk (0x1U << CAN_F11R2_FB30_Pos)
#define CAN_F11R2_FB30 CAN_F11R2_FB30_Msk
#define CAN_F11R2_FB31_Pos (31U)
#define CAN_F11R2_FB31_Msk (0x1U << CAN_F11R2_FB31_Pos)
#define CAN_F11R2_FB31 CAN_F11R2_FB31_Msk


#define CAN_F12R2_FB0_Pos (0U)
#define CAN_F12R2_FB0_Msk (0x1U << CAN_F12R2_FB0_Pos)
#define CAN_F12R2_FB0 CAN_F12R2_FB0_Msk
#define CAN_F12R2_FB1_Pos (1U)
#define CAN_F12R2_FB1_Msk (0x1U << CAN_F12R2_FB1_Pos)
#define CAN_F12R2_FB1 CAN_F12R2_FB1_Msk
#define CAN_F12R2_FB2_Pos (2U)
#define CAN_F12R2_FB2_Msk (0x1U << CAN_F12R2_FB2_Pos)
#define CAN_F12R2_FB2 CAN_F12R2_FB2_Msk
#define CAN_F12R2_FB3_Pos (3U)
#define CAN_F12R2_FB3_Msk (0x1U << CAN_F12R2_FB3_Pos)
#define CAN_F12R2_FB3 CAN_F12R2_FB3_Msk
#define CAN_F12R2_FB4_Pos (4U)
#define CAN_F12R2_FB4_Msk (0x1U << CAN_F12R2_FB4_Pos)
#define CAN_F12R2_FB4 CAN_F12R2_FB4_Msk
#define CAN_F12R2_FB5_Pos (5U)
#define CAN_F12R2_FB5_Msk (0x1U << CAN_F12R2_FB5_Pos)
#define CAN_F12R2_FB5 CAN_F12R2_FB5_Msk
#define CAN_F12R2_FB6_Pos (6U)
#define CAN_F12R2_FB6_Msk (0x1U << CAN_F12R2_FB6_Pos)
#define CAN_F12R2_FB6 CAN_F12R2_FB6_Msk
#define CAN_F12R2_FB7_Pos (7U)
#define CAN_F12R2_FB7_Msk (0x1U << CAN_F12R2_FB7_Pos)
#define CAN_F12R2_FB7 CAN_F12R2_FB7_Msk
#define CAN_F12R2_FB8_Pos (8U)
#define CAN_F12R2_FB8_Msk (0x1U << CAN_F12R2_FB8_Pos)
#define CAN_F12R2_FB8 CAN_F12R2_FB8_Msk
#define CAN_F12R2_FB9_Pos (9U)
#define CAN_F12R2_FB9_Msk (0x1U << CAN_F12R2_FB9_Pos)
#define CAN_F12R2_FB9 CAN_F12R2_FB9_Msk
#define CAN_F12R2_FB10_Pos (10U)
#define CAN_F12R2_FB10_Msk (0x1U << CAN_F12R2_FB10_Pos)
#define CAN_F12R2_FB10 CAN_F12R2_FB10_Msk
#define CAN_F12R2_FB11_Pos (11U)
#define CAN_F12R2_FB11_Msk (0x1U << CAN_F12R2_FB11_Pos)
#define CAN_F12R2_FB11 CAN_F12R2_FB11_Msk
#define CAN_F12R2_FB12_Pos (12U)
#define CAN_F12R2_FB12_Msk (0x1U << CAN_F12R2_FB12_Pos)
#define CAN_F12R2_FB12 CAN_F12R2_FB12_Msk
#define CAN_F12R2_FB13_Pos (13U)
#define CAN_F12R2_FB13_Msk (0x1U << CAN_F12R2_FB13_Pos)
#define CAN_F12R2_FB13 CAN_F12R2_FB13_Msk
#define CAN_F12R2_FB14_Pos (14U)
#define CAN_F12R2_FB14_Msk (0x1U << CAN_F12R2_FB14_Pos)
#define CAN_F12R2_FB14 CAN_F12R2_FB14_Msk
#define CAN_F12R2_FB15_Pos (15U)
#define CAN_F12R2_FB15_Msk (0x1U << CAN_F12R2_FB15_Pos)
#define CAN_F12R2_FB15 CAN_F12R2_FB15_Msk
#define CAN_F12R2_FB16_Pos (16U)
#define CAN_F12R2_FB16_Msk (0x1U << CAN_F12R2_FB16_Pos)
#define CAN_F12R2_FB16 CAN_F12R2_FB16_Msk
#define CAN_F12R2_FB17_Pos (17U)
#define CAN_F12R2_FB17_Msk (0x1U << CAN_F12R2_FB17_Pos)
#define CAN_F12R2_FB17 CAN_F12R2_FB17_Msk
#define CAN_F12R2_FB18_Pos (18U)
#define CAN_F12R2_FB18_Msk (0x1U << CAN_F12R2_FB18_Pos)
#define CAN_F12R2_FB18 CAN_F12R2_FB18_Msk
#define CAN_F12R2_FB19_Pos (19U)
#define CAN_F12R2_FB19_Msk (0x1U << CAN_F12R2_FB19_Pos)
#define CAN_F12R2_FB19 CAN_F12R2_FB19_Msk
#define CAN_F12R2_FB20_Pos (20U)
#define CAN_F12R2_FB20_Msk (0x1U << CAN_F12R2_FB20_Pos)
#define CAN_F12R2_FB20 CAN_F12R2_FB20_Msk
#define CAN_F12R2_FB21_Pos (21U)
#define CAN_F12R2_FB21_Msk (0x1U << CAN_F12R2_FB21_Pos)
#define CAN_F12R2_FB21 CAN_F12R2_FB21_Msk
#define CAN_F12R2_FB22_Pos (22U)
#define CAN_F12R2_FB22_Msk (0x1U << CAN_F12R2_FB22_Pos)
#define CAN_F12R2_FB22 CAN_F12R2_FB22_Msk
#define CAN_F12R2_FB23_Pos (23U)
#define CAN_F12R2_FB23_Msk (0x1U << CAN_F12R2_FB23_Pos)
#define CAN_F12R2_FB23 CAN_F12R2_FB23_Msk
#define CAN_F12R2_FB24_Pos (24U)
#define CAN_F12R2_FB24_Msk (0x1U << CAN_F12R2_FB24_Pos)
#define CAN_F12R2_FB24 CAN_F12R2_FB24_Msk
#define CAN_F12R2_FB25_Pos (25U)
#define CAN_F12R2_FB25_Msk (0x1U << CAN_F12R2_FB25_Pos)
#define CAN_F12R2_FB25 CAN_F12R2_FB25_Msk
#define CAN_F12R2_FB26_Pos (26U)
#define CAN_F12R2_FB26_Msk (0x1U << CAN_F12R2_FB26_Pos)
#define CAN_F12R2_FB26 CAN_F12R2_FB26_Msk
#define CAN_F12R2_FB27_Pos (27U)
#define CAN_F12R2_FB27_Msk (0x1U << CAN_F12R2_FB27_Pos)
#define CAN_F12R2_FB27 CAN_F12R2_FB27_Msk
#define CAN_F12R2_FB28_Pos (28U)
#define CAN_F12R2_FB28_Msk (0x1U << CAN_F12R2_FB28_Pos)
#define CAN_F12R2_FB28 CAN_F12R2_FB28_Msk
#define CAN_F12R2_FB29_Pos (29U)
#define CAN_F12R2_FB29_Msk (0x1U << CAN_F12R2_FB29_Pos)
#define CAN_F12R2_FB29 CAN_F12R2_FB29_Msk
#define CAN_F12R2_FB30_Pos (30U)
#define CAN_F12R2_FB30_Msk (0x1U << CAN_F12R2_FB30_Pos)
#define CAN_F12R2_FB30 CAN_F12R2_FB30_Msk
#define CAN_F12R2_FB31_Pos (31U)
#define CAN_F12R2_FB31_Msk (0x1U << CAN_F12R2_FB31_Pos)
#define CAN_F12R2_FB31 CAN_F12R2_FB31_Msk


#define CAN_F13R2_FB0_Pos (0U)
#define CAN_F13R2_FB0_Msk (0x1U << CAN_F13R2_FB0_Pos)
#define CAN_F13R2_FB0 CAN_F13R2_FB0_Msk
#define CAN_F13R2_FB1_Pos (1U)
#define CAN_F13R2_FB1_Msk (0x1U << CAN_F13R2_FB1_Pos)
#define CAN_F13R2_FB1 CAN_F13R2_FB1_Msk
#define CAN_F13R2_FB2_Pos (2U)
#define CAN_F13R2_FB2_Msk (0x1U << CAN_F13R2_FB2_Pos)
#define CAN_F13R2_FB2 CAN_F13R2_FB2_Msk
#define CAN_F13R2_FB3_Pos (3U)
#define CAN_F13R2_FB3_Msk (0x1U << CAN_F13R2_FB3_Pos)
#define CAN_F13R2_FB3 CAN_F13R2_FB3_Msk
#define CAN_F13R2_FB4_Pos (4U)
#define CAN_F13R2_FB4_Msk (0x1U << CAN_F13R2_FB4_Pos)
#define CAN_F13R2_FB4 CAN_F13R2_FB4_Msk
#define CAN_F13R2_FB5_Pos (5U)
#define CAN_F13R2_FB5_Msk (0x1U << CAN_F13R2_FB5_Pos)
#define CAN_F13R2_FB5 CAN_F13R2_FB5_Msk
#define CAN_F13R2_FB6_Pos (6U)
#define CAN_F13R2_FB6_Msk (0x1U << CAN_F13R2_FB6_Pos)
#define CAN_F13R2_FB6 CAN_F13R2_FB6_Msk
#define CAN_F13R2_FB7_Pos (7U)
#define CAN_F13R2_FB7_Msk (0x1U << CAN_F13R2_FB7_Pos)
#define CAN_F13R2_FB7 CAN_F13R2_FB7_Msk
#define CAN_F13R2_FB8_Pos (8U)
#define CAN_F13R2_FB8_Msk (0x1U << CAN_F13R2_FB8_Pos)
#define CAN_F13R2_FB8 CAN_F13R2_FB8_Msk
#define CAN_F13R2_FB9_Pos (9U)
#define CAN_F13R2_FB9_Msk (0x1U << CAN_F13R2_FB9_Pos)
#define CAN_F13R2_FB9 CAN_F13R2_FB9_Msk
#define CAN_F13R2_FB10_Pos (10U)
#define CAN_F13R2_FB10_Msk (0x1U << CAN_F13R2_FB10_Pos)
#define CAN_F13R2_FB10 CAN_F13R2_FB10_Msk
#define CAN_F13R2_FB11_Pos (11U)
#define CAN_F13R2_FB11_Msk (0x1U << CAN_F13R2_FB11_Pos)
#define CAN_F13R2_FB11 CAN_F13R2_FB11_Msk
#define CAN_F13R2_FB12_Pos (12U)
#define CAN_F13R2_FB12_Msk (0x1U << CAN_F13R2_FB12_Pos)
#define CAN_F13R2_FB12 CAN_F13R2_FB12_Msk
#define CAN_F13R2_FB13_Pos (13U)
#define CAN_F13R2_FB13_Msk (0x1U << CAN_F13R2_FB13_Pos)
#define CAN_F13R2_FB13 CAN_F13R2_FB13_Msk
#define CAN_F13R2_FB14_Pos (14U)
#define CAN_F13R2_FB14_Msk (0x1U << CAN_F13R2_FB14_Pos)
#define CAN_F13R2_FB14 CAN_F13R2_FB14_Msk
#define CAN_F13R2_FB15_Pos (15U)
#define CAN_F13R2_FB15_Msk (0x1U << CAN_F13R2_FB15_Pos)
#define CAN_F13R2_FB15 CAN_F13R2_FB15_Msk
#define CAN_F13R2_FB16_Pos (16U)
#define CAN_F13R2_FB16_Msk (0x1U << CAN_F13R2_FB16_Pos)
#define CAN_F13R2_FB16 CAN_F13R2_FB16_Msk
#define CAN_F13R2_FB17_Pos (17U)
#define CAN_F13R2_FB17_Msk (0x1U << CAN_F13R2_FB17_Pos)
#define CAN_F13R2_FB17 CAN_F13R2_FB17_Msk
#define CAN_F13R2_FB18_Pos (18U)
#define CAN_F13R2_FB18_Msk (0x1U << CAN_F13R2_FB18_Pos)
#define CAN_F13R2_FB18 CAN_F13R2_FB18_Msk
#define CAN_F13R2_FB19_Pos (19U)
#define CAN_F13R2_FB19_Msk (0x1U << CAN_F13R2_FB19_Pos)
#define CAN_F13R2_FB19 CAN_F13R2_FB19_Msk
#define CAN_F13R2_FB20_Pos (20U)
#define CAN_F13R2_FB20_Msk (0x1U << CAN_F13R2_FB20_Pos)
#define CAN_F13R2_FB20 CAN_F13R2_FB20_Msk
#define CAN_F13R2_FB21_Pos (21U)
#define CAN_F13R2_FB21_Msk (0x1U << CAN_F13R2_FB21_Pos)
#define CAN_F13R2_FB21 CAN_F13R2_FB21_Msk
#define CAN_F13R2_FB22_Pos (22U)
#define CAN_F13R2_FB22_Msk (0x1U << CAN_F13R2_FB22_Pos)
#define CAN_F13R2_FB22 CAN_F13R2_FB22_Msk
#define CAN_F13R2_FB23_Pos (23U)
#define CAN_F13R2_FB23_Msk (0x1U << CAN_F13R2_FB23_Pos)
#define CAN_F13R2_FB23 CAN_F13R2_FB23_Msk
#define CAN_F13R2_FB24_Pos (24U)
#define CAN_F13R2_FB24_Msk (0x1U << CAN_F13R2_FB24_Pos)
#define CAN_F13R2_FB24 CAN_F13R2_FB24_Msk
#define CAN_F13R2_FB25_Pos (25U)
#define CAN_F13R2_FB25_Msk (0x1U << CAN_F13R2_FB25_Pos)
#define CAN_F13R2_FB25 CAN_F13R2_FB25_Msk
#define CAN_F13R2_FB26_Pos (26U)
#define CAN_F13R2_FB26_Msk (0x1U << CAN_F13R2_FB26_Pos)
#define CAN_F13R2_FB26 CAN_F13R2_FB26_Msk
#define CAN_F13R2_FB27_Pos (27U)
#define CAN_F13R2_FB27_Msk (0x1U << CAN_F13R2_FB27_Pos)
#define CAN_F13R2_FB27 CAN_F13R2_FB27_Msk
#define CAN_F13R2_FB28_Pos (28U)
#define CAN_F13R2_FB28_Msk (0x1U << CAN_F13R2_FB28_Pos)
#define CAN_F13R2_FB28 CAN_F13R2_FB28_Msk
#define CAN_F13R2_FB29_Pos (29U)
#define CAN_F13R2_FB29_Msk (0x1U << CAN_F13R2_FB29_Pos)
#define CAN_F13R2_FB29 CAN_F13R2_FB29_Msk
#define CAN_F13R2_FB30_Pos (30U)
#define CAN_F13R2_FB30_Msk (0x1U << CAN_F13R2_FB30_Pos)
#define CAN_F13R2_FB30 CAN_F13R2_FB30_Msk
#define CAN_F13R2_FB31_Pos (31U)
#define CAN_F13R2_FB31_Msk (0x1U << CAN_F13R2_FB31_Pos)
#define CAN_F13R2_FB31 CAN_F13R2_FB31_Msk
# 9485 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define SPI_CR1_CPHA_Pos (0U)
#define SPI_CR1_CPHA_Msk (0x1U << SPI_CR1_CPHA_Pos)
#define SPI_CR1_CPHA SPI_CR1_CPHA_Msk
#define SPI_CR1_CPOL_Pos (1U)
#define SPI_CR1_CPOL_Msk (0x1U << SPI_CR1_CPOL_Pos)
#define SPI_CR1_CPOL SPI_CR1_CPOL_Msk
#define SPI_CR1_MSTR_Pos (2U)
#define SPI_CR1_MSTR_Msk (0x1U << SPI_CR1_MSTR_Pos)
#define SPI_CR1_MSTR SPI_CR1_MSTR_Msk

#define SPI_CR1_BR_Pos (3U)
#define SPI_CR1_BR_Msk (0x7U << SPI_CR1_BR_Pos)
#define SPI_CR1_BR SPI_CR1_BR_Msk
#define SPI_CR1_BR_0 (0x1U << SPI_CR1_BR_Pos)
#define SPI_CR1_BR_1 (0x2U << SPI_CR1_BR_Pos)
#define SPI_CR1_BR_2 (0x4U << SPI_CR1_BR_Pos)

#define SPI_CR1_SPE_Pos (6U)
#define SPI_CR1_SPE_Msk (0x1U << SPI_CR1_SPE_Pos)
#define SPI_CR1_SPE SPI_CR1_SPE_Msk
#define SPI_CR1_LSBFIRST_Pos (7U)
#define SPI_CR1_LSBFIRST_Msk (0x1U << SPI_CR1_LSBFIRST_Pos)
#define SPI_CR1_LSBFIRST SPI_CR1_LSBFIRST_Msk
#define SPI_CR1_SSI_Pos (8U)
#define SPI_CR1_SSI_Msk (0x1U << SPI_CR1_SSI_Pos)
#define SPI_CR1_SSI SPI_CR1_SSI_Msk
#define SPI_CR1_SSM_Pos (9U)
#define SPI_CR1_SSM_Msk (0x1U << SPI_CR1_SSM_Pos)
#define SPI_CR1_SSM SPI_CR1_SSM_Msk
#define SPI_CR1_RXONLY_Pos (10U)
#define SPI_CR1_RXONLY_Msk (0x1U << SPI_CR1_RXONLY_Pos)
#define SPI_CR1_RXONLY SPI_CR1_RXONLY_Msk
#define SPI_CR1_DFF_Pos (11U)
#define SPI_CR1_DFF_Msk (0x1U << SPI_CR1_DFF_Pos)
#define SPI_CR1_DFF SPI_CR1_DFF_Msk
#define SPI_CR1_CRCNEXT_Pos (12U)
#define SPI_CR1_CRCNEXT_Msk (0x1U << SPI_CR1_CRCNEXT_Pos)
#define SPI_CR1_CRCNEXT SPI_CR1_CRCNEXT_Msk
#define SPI_CR1_CRCEN_Pos (13U)
#define SPI_CR1_CRCEN_Msk (0x1U << SPI_CR1_CRCEN_Pos)
#define SPI_CR1_CRCEN SPI_CR1_CRCEN_Msk
#define SPI_CR1_BIDIOE_Pos (14U)
#define SPI_CR1_BIDIOE_Msk (0x1U << SPI_CR1_BIDIOE_Pos)
#define SPI_CR1_BIDIOE SPI_CR1_BIDIOE_Msk
#define SPI_CR1_BIDIMODE_Pos (15U)
#define SPI_CR1_BIDIMODE_Msk (0x1U << SPI_CR1_BIDIMODE_Pos)
#define SPI_CR1_BIDIMODE SPI_CR1_BIDIMODE_Msk


#define SPI_CR2_RXDMAEN_Pos (0U)
#define SPI_CR2_RXDMAEN_Msk (0x1U << SPI_CR2_RXDMAEN_Pos)
#define SPI_CR2_RXDMAEN SPI_CR2_RXDMAEN_Msk
#define SPI_CR2_TXDMAEN_Pos (1U)
#define SPI_CR2_TXDMAEN_Msk (0x1U << SPI_CR2_TXDMAEN_Pos)
#define SPI_CR2_TXDMAEN SPI_CR2_TXDMAEN_Msk
#define SPI_CR2_SSOE_Pos (2U)
#define SPI_CR2_SSOE_Msk (0x1U << SPI_CR2_SSOE_Pos)
#define SPI_CR2_SSOE SPI_CR2_SSOE_Msk
#define SPI_CR2_ERRIE_Pos (5U)
#define SPI_CR2_ERRIE_Msk (0x1U << SPI_CR2_ERRIE_Pos)
#define SPI_CR2_ERRIE SPI_CR2_ERRIE_Msk
#define SPI_CR2_RXNEIE_Pos (6U)
#define SPI_CR2_RXNEIE_Msk (0x1U << SPI_CR2_RXNEIE_Pos)
#define SPI_CR2_RXNEIE SPI_CR2_RXNEIE_Msk
#define SPI_CR2_TXEIE_Pos (7U)
#define SPI_CR2_TXEIE_Msk (0x1U << SPI_CR2_TXEIE_Pos)
#define SPI_CR2_TXEIE SPI_CR2_TXEIE_Msk


#define SPI_SR_RXNE_Pos (0U)
#define SPI_SR_RXNE_Msk (0x1U << SPI_SR_RXNE_Pos)
#define SPI_SR_RXNE SPI_SR_RXNE_Msk
#define SPI_SR_TXE_Pos (1U)
#define SPI_SR_TXE_Msk (0x1U << SPI_SR_TXE_Pos)
#define SPI_SR_TXE SPI_SR_TXE_Msk
#define SPI_SR_CHSIDE_Pos (2U)
#define SPI_SR_CHSIDE_Msk (0x1U << SPI_SR_CHSIDE_Pos)
#define SPI_SR_CHSIDE SPI_SR_CHSIDE_Msk
#define SPI_SR_UDR_Pos (3U)
#define SPI_SR_UDR_Msk (0x1U << SPI_SR_UDR_Pos)
#define SPI_SR_UDR SPI_SR_UDR_Msk
#define SPI_SR_CRCERR_Pos (4U)
#define SPI_SR_CRCERR_Msk (0x1U << SPI_SR_CRCERR_Pos)
#define SPI_SR_CRCERR SPI_SR_CRCERR_Msk
#define SPI_SR_MODF_Pos (5U)
#define SPI_SR_MODF_Msk (0x1U << SPI_SR_MODF_Pos)
#define SPI_SR_MODF SPI_SR_MODF_Msk
#define SPI_SR_OVR_Pos (6U)
#define SPI_SR_OVR_Msk (0x1U << SPI_SR_OVR_Pos)
#define SPI_SR_OVR SPI_SR_OVR_Msk
#define SPI_SR_BSY_Pos (7U)
#define SPI_SR_BSY_Msk (0x1U << SPI_SR_BSY_Pos)
#define SPI_SR_BSY SPI_SR_BSY_Msk


#define SPI_DR_DR_Pos (0U)
#define SPI_DR_DR_Msk (0xFFFFU << SPI_DR_DR_Pos)
#define SPI_DR_DR SPI_DR_DR_Msk


#define SPI_CRCPR_CRCPOLY_Pos (0U)
#define SPI_CRCPR_CRCPOLY_Msk (0xFFFFU << SPI_CRCPR_CRCPOLY_Pos)
#define SPI_CRCPR_CRCPOLY SPI_CRCPR_CRCPOLY_Msk


#define SPI_RXCRCR_RXCRC_Pos (0U)
#define SPI_RXCRCR_RXCRC_Msk (0xFFFFU << SPI_RXCRCR_RXCRC_Pos)
#define SPI_RXCRCR_RXCRC SPI_RXCRCR_RXCRC_Msk


#define SPI_TXCRCR_TXCRC_Pos (0U)
#define SPI_TXCRCR_TXCRC_Msk (0xFFFFU << SPI_TXCRCR_TXCRC_Pos)
#define SPI_TXCRCR_TXCRC SPI_TXCRCR_TXCRC_Msk


#define SPI_I2SCFGR_I2SMOD_Pos (11U)
#define SPI_I2SCFGR_I2SMOD_Msk (0x1U << SPI_I2SCFGR_I2SMOD_Pos)
#define SPI_I2SCFGR_I2SMOD SPI_I2SCFGR_I2SMOD_Msk
# 9612 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define I2C_CR1_PE_Pos (0U)
#define I2C_CR1_PE_Msk (0x1U << I2C_CR1_PE_Pos)
#define I2C_CR1_PE I2C_CR1_PE_Msk
#define I2C_CR1_SMBUS_Pos (1U)
#define I2C_CR1_SMBUS_Msk (0x1U << I2C_CR1_SMBUS_Pos)
#define I2C_CR1_SMBUS I2C_CR1_SMBUS_Msk
#define I2C_CR1_SMBTYPE_Pos (3U)
#define I2C_CR1_SMBTYPE_Msk (0x1U << I2C_CR1_SMBTYPE_Pos)
#define I2C_CR1_SMBTYPE I2C_CR1_SMBTYPE_Msk
#define I2C_CR1_ENARP_Pos (4U)
#define I2C_CR1_ENARP_Msk (0x1U << I2C_CR1_ENARP_Pos)
#define I2C_CR1_ENARP I2C_CR1_ENARP_Msk
#define I2C_CR1_ENPEC_Pos (5U)
#define I2C_CR1_ENPEC_Msk (0x1U << I2C_CR1_ENPEC_Pos)
#define I2C_CR1_ENPEC I2C_CR1_ENPEC_Msk
#define I2C_CR1_ENGC_Pos (6U)
#define I2C_CR1_ENGC_Msk (0x1U << I2C_CR1_ENGC_Pos)
#define I2C_CR1_ENGC I2C_CR1_ENGC_Msk
#define I2C_CR1_NOSTRETCH_Pos (7U)
#define I2C_CR1_NOSTRETCH_Msk (0x1U << I2C_CR1_NOSTRETCH_Pos)
#define I2C_CR1_NOSTRETCH I2C_CR1_NOSTRETCH_Msk
#define I2C_CR1_START_Pos (8U)
#define I2C_CR1_START_Msk (0x1U << I2C_CR1_START_Pos)
#define I2C_CR1_START I2C_CR1_START_Msk
#define I2C_CR1_STOP_Pos (9U)
#define I2C_CR1_STOP_Msk (0x1U << I2C_CR1_STOP_Pos)
#define I2C_CR1_STOP I2C_CR1_STOP_Msk
#define I2C_CR1_ACK_Pos (10U)
#define I2C_CR1_ACK_Msk (0x1U << I2C_CR1_ACK_Pos)
#define I2C_CR1_ACK I2C_CR1_ACK_Msk
#define I2C_CR1_POS_Pos (11U)
#define I2C_CR1_POS_Msk (0x1U << I2C_CR1_POS_Pos)
#define I2C_CR1_POS I2C_CR1_POS_Msk
#define I2C_CR1_PEC_Pos (12U)
#define I2C_CR1_PEC_Msk (0x1U << I2C_CR1_PEC_Pos)
#define I2C_CR1_PEC I2C_CR1_PEC_Msk
#define I2C_CR1_ALERT_Pos (13U)
#define I2C_CR1_ALERT_Msk (0x1U << I2C_CR1_ALERT_Pos)
#define I2C_CR1_ALERT I2C_CR1_ALERT_Msk
#define I2C_CR1_SWRST_Pos (15U)
#define I2C_CR1_SWRST_Msk (0x1U << I2C_CR1_SWRST_Pos)
#define I2C_CR1_SWRST I2C_CR1_SWRST_Msk


#define I2C_CR2_FREQ_Pos (0U)
#define I2C_CR2_FREQ_Msk (0x3FU << I2C_CR2_FREQ_Pos)
#define I2C_CR2_FREQ I2C_CR2_FREQ_Msk
#define I2C_CR2_FREQ_0 (0x01U << I2C_CR2_FREQ_Pos)
#define I2C_CR2_FREQ_1 (0x02U << I2C_CR2_FREQ_Pos)
#define I2C_CR2_FREQ_2 (0x04U << I2C_CR2_FREQ_Pos)
#define I2C_CR2_FREQ_3 (0x08U << I2C_CR2_FREQ_Pos)
#define I2C_CR2_FREQ_4 (0x10U << I2C_CR2_FREQ_Pos)
#define I2C_CR2_FREQ_5 (0x20U << I2C_CR2_FREQ_Pos)

#define I2C_CR2_ITERREN_Pos (8U)
#define I2C_CR2_ITERREN_Msk (0x1U << I2C_CR2_ITERREN_Pos)
#define I2C_CR2_ITERREN I2C_CR2_ITERREN_Msk
#define I2C_CR2_ITEVTEN_Pos (9U)
#define I2C_CR2_ITEVTEN_Msk (0x1U << I2C_CR2_ITEVTEN_Pos)
#define I2C_CR2_ITEVTEN I2C_CR2_ITEVTEN_Msk
#define I2C_CR2_ITBUFEN_Pos (10U)
#define I2C_CR2_ITBUFEN_Msk (0x1U << I2C_CR2_ITBUFEN_Pos)
#define I2C_CR2_ITBUFEN I2C_CR2_ITBUFEN_Msk
#define I2C_CR2_DMAEN_Pos (11U)
#define I2C_CR2_DMAEN_Msk (0x1U << I2C_CR2_DMAEN_Pos)
#define I2C_CR2_DMAEN I2C_CR2_DMAEN_Msk
#define I2C_CR2_LAST_Pos (12U)
#define I2C_CR2_LAST_Msk (0x1U << I2C_CR2_LAST_Pos)
#define I2C_CR2_LAST I2C_CR2_LAST_Msk


#define I2C_OAR1_ADD1_7 0x000000FEU
#define I2C_OAR1_ADD8_9 0x00000300U

#define I2C_OAR1_ADD0_Pos (0U)
#define I2C_OAR1_ADD0_Msk (0x1U << I2C_OAR1_ADD0_Pos)
#define I2C_OAR1_ADD0 I2C_OAR1_ADD0_Msk
#define I2C_OAR1_ADD1_Pos (1U)
#define I2C_OAR1_ADD1_Msk (0x1U << I2C_OAR1_ADD1_Pos)
#define I2C_OAR1_ADD1 I2C_OAR1_ADD1_Msk
#define I2C_OAR1_ADD2_Pos (2U)
#define I2C_OAR1_ADD2_Msk (0x1U << I2C_OAR1_ADD2_Pos)
#define I2C_OAR1_ADD2 I2C_OAR1_ADD2_Msk
#define I2C_OAR1_ADD3_Pos (3U)
#define I2C_OAR1_ADD3_Msk (0x1U << I2C_OAR1_ADD3_Pos)
#define I2C_OAR1_ADD3 I2C_OAR1_ADD3_Msk
#define I2C_OAR1_ADD4_Pos (4U)
#define I2C_OAR1_ADD4_Msk (0x1U << I2C_OAR1_ADD4_Pos)
#define I2C_OAR1_ADD4 I2C_OAR1_ADD4_Msk
#define I2C_OAR1_ADD5_Pos (5U)
#define I2C_OAR1_ADD5_Msk (0x1U << I2C_OAR1_ADD5_Pos)
#define I2C_OAR1_ADD5 I2C_OAR1_ADD5_Msk
#define I2C_OAR1_ADD6_Pos (6U)
#define I2C_OAR1_ADD6_Msk (0x1U << I2C_OAR1_ADD6_Pos)
#define I2C_OAR1_ADD6 I2C_OAR1_ADD6_Msk
#define I2C_OAR1_ADD7_Pos (7U)
#define I2C_OAR1_ADD7_Msk (0x1U << I2C_OAR1_ADD7_Pos)
#define I2C_OAR1_ADD7 I2C_OAR1_ADD7_Msk
#define I2C_OAR1_ADD8_Pos (8U)
#define I2C_OAR1_ADD8_Msk (0x1U << I2C_OAR1_ADD8_Pos)
#define I2C_OAR1_ADD8 I2C_OAR1_ADD8_Msk
#define I2C_OAR1_ADD9_Pos (9U)
#define I2C_OAR1_ADD9_Msk (0x1U << I2C_OAR1_ADD9_Pos)
#define I2C_OAR1_ADD9 I2C_OAR1_ADD9_Msk

#define I2C_OAR1_ADDMODE_Pos (15U)
#define I2C_OAR1_ADDMODE_Msk (0x1U << I2C_OAR1_ADDMODE_Pos)
#define I2C_OAR1_ADDMODE I2C_OAR1_ADDMODE_Msk


#define I2C_OAR2_ENDUAL_Pos (0U)
#define I2C_OAR2_ENDUAL_Msk (0x1U << I2C_OAR2_ENDUAL_Pos)
#define I2C_OAR2_ENDUAL I2C_OAR2_ENDUAL_Msk
#define I2C_OAR2_ADD2_Pos (1U)
#define I2C_OAR2_ADD2_Msk (0x7FU << I2C_OAR2_ADD2_Pos)
#define I2C_OAR2_ADD2 I2C_OAR2_ADD2_Msk


#define I2C_DR_DR_Pos (0U)
#define I2C_DR_DR_Msk (0xFFU << I2C_DR_DR_Pos)
#define I2C_DR_DR I2C_DR_DR_Msk


#define I2C_SR1_SB_Pos (0U)
#define I2C_SR1_SB_Msk (0x1U << I2C_SR1_SB_Pos)
#define I2C_SR1_SB I2C_SR1_SB_Msk
#define I2C_SR1_ADDR_Pos (1U)
#define I2C_SR1_ADDR_Msk (0x1U << I2C_SR1_ADDR_Pos)
#define I2C_SR1_ADDR I2C_SR1_ADDR_Msk
#define I2C_SR1_BTF_Pos (2U)
#define I2C_SR1_BTF_Msk (0x1U << I2C_SR1_BTF_Pos)
#define I2C_SR1_BTF I2C_SR1_BTF_Msk
#define I2C_SR1_ADD10_Pos (3U)
#define I2C_SR1_ADD10_Msk (0x1U << I2C_SR1_ADD10_Pos)
#define I2C_SR1_ADD10 I2C_SR1_ADD10_Msk
#define I2C_SR1_STOPF_Pos (4U)
#define I2C_SR1_STOPF_Msk (0x1U << I2C_SR1_STOPF_Pos)
#define I2C_SR1_STOPF I2C_SR1_STOPF_Msk
#define I2C_SR1_RXNE_Pos (6U)
#define I2C_SR1_RXNE_Msk (0x1U << I2C_SR1_RXNE_Pos)
#define I2C_SR1_RXNE I2C_SR1_RXNE_Msk
#define I2C_SR1_TXE_Pos (7U)
#define I2C_SR1_TXE_Msk (0x1U << I2C_SR1_TXE_Pos)
#define I2C_SR1_TXE I2C_SR1_TXE_Msk
#define I2C_SR1_BERR_Pos (8U)
#define I2C_SR1_BERR_Msk (0x1U << I2C_SR1_BERR_Pos)
#define I2C_SR1_BERR I2C_SR1_BERR_Msk
#define I2C_SR1_ARLO_Pos (9U)
#define I2C_SR1_ARLO_Msk (0x1U << I2C_SR1_ARLO_Pos)
#define I2C_SR1_ARLO I2C_SR1_ARLO_Msk
#define I2C_SR1_AF_Pos (10U)
#define I2C_SR1_AF_Msk (0x1U << I2C_SR1_AF_Pos)
#define I2C_SR1_AF I2C_SR1_AF_Msk
#define I2C_SR1_OVR_Pos (11U)
#define I2C_SR1_OVR_Msk (0x1U << I2C_SR1_OVR_Pos)
#define I2C_SR1_OVR I2C_SR1_OVR_Msk
#define I2C_SR1_PECERR_Pos (12U)
#define I2C_SR1_PECERR_Msk (0x1U << I2C_SR1_PECERR_Pos)
#define I2C_SR1_PECERR I2C_SR1_PECERR_Msk
#define I2C_SR1_TIMEOUT_Pos (14U)
#define I2C_SR1_TIMEOUT_Msk (0x1U << I2C_SR1_TIMEOUT_Pos)
#define I2C_SR1_TIMEOUT I2C_SR1_TIMEOUT_Msk
#define I2C_SR1_SMBALERT_Pos (15U)
#define I2C_SR1_SMBALERT_Msk (0x1U << I2C_SR1_SMBALERT_Pos)
#define I2C_SR1_SMBALERT I2C_SR1_SMBALERT_Msk


#define I2C_SR2_MSL_Pos (0U)
#define I2C_SR2_MSL_Msk (0x1U << I2C_SR2_MSL_Pos)
#define I2C_SR2_MSL I2C_SR2_MSL_Msk
#define I2C_SR2_BUSY_Pos (1U)
#define I2C_SR2_BUSY_Msk (0x1U << I2C_SR2_BUSY_Pos)
#define I2C_SR2_BUSY I2C_SR2_BUSY_Msk
#define I2C_SR2_TRA_Pos (2U)
#define I2C_SR2_TRA_Msk (0x1U << I2C_SR2_TRA_Pos)
#define I2C_SR2_TRA I2C_SR2_TRA_Msk
#define I2C_SR2_GENCALL_Pos (4U)
#define I2C_SR2_GENCALL_Msk (0x1U << I2C_SR2_GENCALL_Pos)
#define I2C_SR2_GENCALL I2C_SR2_GENCALL_Msk
#define I2C_SR2_SMBDEFAULT_Pos (5U)
#define I2C_SR2_SMBDEFAULT_Msk (0x1U << I2C_SR2_SMBDEFAULT_Pos)
#define I2C_SR2_SMBDEFAULT I2C_SR2_SMBDEFAULT_Msk
#define I2C_SR2_SMBHOST_Pos (6U)
#define I2C_SR2_SMBHOST_Msk (0x1U << I2C_SR2_SMBHOST_Pos)
#define I2C_SR2_SMBHOST I2C_SR2_SMBHOST_Msk
#define I2C_SR2_DUALF_Pos (7U)
#define I2C_SR2_DUALF_Msk (0x1U << I2C_SR2_DUALF_Pos)
#define I2C_SR2_DUALF I2C_SR2_DUALF_Msk
#define I2C_SR2_PEC_Pos (8U)
#define I2C_SR2_PEC_Msk (0xFFU << I2C_SR2_PEC_Pos)
#define I2C_SR2_PEC I2C_SR2_PEC_Msk


#define I2C_CCR_CCR_Pos (0U)
#define I2C_CCR_CCR_Msk (0xFFFU << I2C_CCR_CCR_Pos)
#define I2C_CCR_CCR I2C_CCR_CCR_Msk
#define I2C_CCR_DUTY_Pos (14U)
#define I2C_CCR_DUTY_Msk (0x1U << I2C_CCR_DUTY_Pos)
#define I2C_CCR_DUTY I2C_CCR_DUTY_Msk
#define I2C_CCR_FS_Pos (15U)
#define I2C_CCR_FS_Msk (0x1U << I2C_CCR_FS_Pos)
#define I2C_CCR_FS I2C_CCR_FS_Msk


#define I2C_TRISE_TRISE_Pos (0U)
#define I2C_TRISE_TRISE_Msk (0x3FU << I2C_TRISE_TRISE_Pos)
#define I2C_TRISE_TRISE I2C_TRISE_TRISE_Msk
# 9827 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define USART_SR_PE_Pos (0U)
#define USART_SR_PE_Msk (0x1U << USART_SR_PE_Pos)
#define USART_SR_PE USART_SR_PE_Msk
#define USART_SR_FE_Pos (1U)
#define USART_SR_FE_Msk (0x1U << USART_SR_FE_Pos)
#define USART_SR_FE USART_SR_FE_Msk
#define USART_SR_NE_Pos (2U)
#define USART_SR_NE_Msk (0x1U << USART_SR_NE_Pos)
#define USART_SR_NE USART_SR_NE_Msk
#define USART_SR_ORE_Pos (3U)
#define USART_SR_ORE_Msk (0x1U << USART_SR_ORE_Pos)
#define USART_SR_ORE USART_SR_ORE_Msk
#define USART_SR_IDLE_Pos (4U)
#define USART_SR_IDLE_Msk (0x1U << USART_SR_IDLE_Pos)
#define USART_SR_IDLE USART_SR_IDLE_Msk
#define USART_SR_RXNE_Pos (5U)
#define USART_SR_RXNE_Msk (0x1U << USART_SR_RXNE_Pos)
#define USART_SR_RXNE USART_SR_RXNE_Msk
#define USART_SR_TC_Pos (6U)
#define USART_SR_TC_Msk (0x1U << USART_SR_TC_Pos)
#define USART_SR_TC USART_SR_TC_Msk
#define USART_SR_TXE_Pos (7U)
#define USART_SR_TXE_Msk (0x1U << USART_SR_TXE_Pos)
#define USART_SR_TXE USART_SR_TXE_Msk
#define USART_SR_LBD_Pos (8U)
#define USART_SR_LBD_Msk (0x1U << USART_SR_LBD_Pos)
#define USART_SR_LBD USART_SR_LBD_Msk
#define USART_SR_CTS_Pos (9U)
#define USART_SR_CTS_Msk (0x1U << USART_SR_CTS_Pos)
#define USART_SR_CTS USART_SR_CTS_Msk


#define USART_DR_DR_Pos (0U)
#define USART_DR_DR_Msk (0x1FFU << USART_DR_DR_Pos)
#define USART_DR_DR USART_DR_DR_Msk


#define USART_BRR_DIV_Fraction_Pos (0U)
#define USART_BRR_DIV_Fraction_Msk (0xFU << USART_BRR_DIV_Fraction_Pos)
#define USART_BRR_DIV_Fraction USART_BRR_DIV_Fraction_Msk
#define USART_BRR_DIV_Mantissa_Pos (4U)
#define USART_BRR_DIV_Mantissa_Msk (0xFFFU << USART_BRR_DIV_Mantissa_Pos)
#define USART_BRR_DIV_Mantissa USART_BRR_DIV_Mantissa_Msk


#define USART_CR1_SBK_Pos (0U)
#define USART_CR1_SBK_Msk (0x1U << USART_CR1_SBK_Pos)
#define USART_CR1_SBK USART_CR1_SBK_Msk
#define USART_CR1_RWU_Pos (1U)
#define USART_CR1_RWU_Msk (0x1U << USART_CR1_RWU_Pos)
#define USART_CR1_RWU USART_CR1_RWU_Msk
#define USART_CR1_RE_Pos (2U)
#define USART_CR1_RE_Msk (0x1U << USART_CR1_RE_Pos)
#define USART_CR1_RE USART_CR1_RE_Msk
#define USART_CR1_TE_Pos (3U)
#define USART_CR1_TE_Msk (0x1U << USART_CR1_TE_Pos)
#define USART_CR1_TE USART_CR1_TE_Msk
#define USART_CR1_IDLEIE_Pos (4U)
#define USART_CR1_IDLEIE_Msk (0x1U << USART_CR1_IDLEIE_Pos)
#define USART_CR1_IDLEIE USART_CR1_IDLEIE_Msk
#define USART_CR1_RXNEIE_Pos (5U)
#define USART_CR1_RXNEIE_Msk (0x1U << USART_CR1_RXNEIE_Pos)
#define USART_CR1_RXNEIE USART_CR1_RXNEIE_Msk
#define USART_CR1_TCIE_Pos (6U)
#define USART_CR1_TCIE_Msk (0x1U << USART_CR1_TCIE_Pos)
#define USART_CR1_TCIE USART_CR1_TCIE_Msk
#define USART_CR1_TXEIE_Pos (7U)
#define USART_CR1_TXEIE_Msk (0x1U << USART_CR1_TXEIE_Pos)
#define USART_CR1_TXEIE USART_CR1_TXEIE_Msk
#define USART_CR1_PEIE_Pos (8U)
#define USART_CR1_PEIE_Msk (0x1U << USART_CR1_PEIE_Pos)
#define USART_CR1_PEIE USART_CR1_PEIE_Msk
#define USART_CR1_PS_Pos (9U)
#define USART_CR1_PS_Msk (0x1U << USART_CR1_PS_Pos)
#define USART_CR1_PS USART_CR1_PS_Msk
#define USART_CR1_PCE_Pos (10U)
#define USART_CR1_PCE_Msk (0x1U << USART_CR1_PCE_Pos)
#define USART_CR1_PCE USART_CR1_PCE_Msk
#define USART_CR1_WAKE_Pos (11U)
#define USART_CR1_WAKE_Msk (0x1U << USART_CR1_WAKE_Pos)
#define USART_CR1_WAKE USART_CR1_WAKE_Msk
#define USART_CR1_M_Pos (12U)
#define USART_CR1_M_Msk (0x1U << USART_CR1_M_Pos)
#define USART_CR1_M USART_CR1_M_Msk
#define USART_CR1_UE_Pos (13U)
#define USART_CR1_UE_Msk (0x1U << USART_CR1_UE_Pos)
#define USART_CR1_UE USART_CR1_UE_Msk


#define USART_CR2_ADD_Pos (0U)
#define USART_CR2_ADD_Msk (0xFU << USART_CR2_ADD_Pos)
#define USART_CR2_ADD USART_CR2_ADD_Msk
#define USART_CR2_LBDL_Pos (5U)
#define USART_CR2_LBDL_Msk (0x1U << USART_CR2_LBDL_Pos)
#define USART_CR2_LBDL USART_CR2_LBDL_Msk
#define USART_CR2_LBDIE_Pos (6U)
#define USART_CR2_LBDIE_Msk (0x1U << USART_CR2_LBDIE_Pos)
#define USART_CR2_LBDIE USART_CR2_LBDIE_Msk
#define USART_CR2_LBCL_Pos (8U)
#define USART_CR2_LBCL_Msk (0x1U << USART_CR2_LBCL_Pos)
#define USART_CR2_LBCL USART_CR2_LBCL_Msk
#define USART_CR2_CPHA_Pos (9U)
#define USART_CR2_CPHA_Msk (0x1U << USART_CR2_CPHA_Pos)
#define USART_CR2_CPHA USART_CR2_CPHA_Msk
#define USART_CR2_CPOL_Pos (10U)
#define USART_CR2_CPOL_Msk (0x1U << USART_CR2_CPOL_Pos)
#define USART_CR2_CPOL USART_CR2_CPOL_Msk
#define USART_CR2_CLKEN_Pos (11U)
#define USART_CR2_CLKEN_Msk (0x1U << USART_CR2_CLKEN_Pos)
#define USART_CR2_CLKEN USART_CR2_CLKEN_Msk

#define USART_CR2_STOP_Pos (12U)
#define USART_CR2_STOP_Msk (0x3U << USART_CR2_STOP_Pos)
#define USART_CR2_STOP USART_CR2_STOP_Msk
#define USART_CR2_STOP_0 (0x1U << USART_CR2_STOP_Pos)
#define USART_CR2_STOP_1 (0x2U << USART_CR2_STOP_Pos)

#define USART_CR2_LINEN_Pos (14U)
#define USART_CR2_LINEN_Msk (0x1U << USART_CR2_LINEN_Pos)
#define USART_CR2_LINEN USART_CR2_LINEN_Msk


#define USART_CR3_EIE_Pos (0U)
#define USART_CR3_EIE_Msk (0x1U << USART_CR3_EIE_Pos)
#define USART_CR3_EIE USART_CR3_EIE_Msk
#define USART_CR3_IREN_Pos (1U)
#define USART_CR3_IREN_Msk (0x1U << USART_CR3_IREN_Pos)
#define USART_CR3_IREN USART_CR3_IREN_Msk
#define USART_CR3_IRLP_Pos (2U)
#define USART_CR3_IRLP_Msk (0x1U << USART_CR3_IRLP_Pos)
#define USART_CR3_IRLP USART_CR3_IRLP_Msk
#define USART_CR3_HDSEL_Pos (3U)
#define USART_CR3_HDSEL_Msk (0x1U << USART_CR3_HDSEL_Pos)
#define USART_CR3_HDSEL USART_CR3_HDSEL_Msk
#define USART_CR3_NACK_Pos (4U)
#define USART_CR3_NACK_Msk (0x1U << USART_CR3_NACK_Pos)
#define USART_CR3_NACK USART_CR3_NACK_Msk
#define USART_CR3_SCEN_Pos (5U)
#define USART_CR3_SCEN_Msk (0x1U << USART_CR3_SCEN_Pos)
#define USART_CR3_SCEN USART_CR3_SCEN_Msk
#define USART_CR3_DMAR_Pos (6U)
#define USART_CR3_DMAR_Msk (0x1U << USART_CR3_DMAR_Pos)
#define USART_CR3_DMAR USART_CR3_DMAR_Msk
#define USART_CR3_DMAT_Pos (7U)
#define USART_CR3_DMAT_Msk (0x1U << USART_CR3_DMAT_Pos)
#define USART_CR3_DMAT USART_CR3_DMAT_Msk
#define USART_CR3_RTSE_Pos (8U)
#define USART_CR3_RTSE_Msk (0x1U << USART_CR3_RTSE_Pos)
#define USART_CR3_RTSE USART_CR3_RTSE_Msk
#define USART_CR3_CTSE_Pos (9U)
#define USART_CR3_CTSE_Msk (0x1U << USART_CR3_CTSE_Pos)
#define USART_CR3_CTSE USART_CR3_CTSE_Msk
#define USART_CR3_CTSIE_Pos (10U)
#define USART_CR3_CTSIE_Msk (0x1U << USART_CR3_CTSIE_Pos)
#define USART_CR3_CTSIE USART_CR3_CTSIE_Msk


#define USART_GTPR_PSC_Pos (0U)
#define USART_GTPR_PSC_Msk (0xFFU << USART_GTPR_PSC_Pos)
#define USART_GTPR_PSC USART_GTPR_PSC_Msk
#define USART_GTPR_PSC_0 (0x01U << USART_GTPR_PSC_Pos)
#define USART_GTPR_PSC_1 (0x02U << USART_GTPR_PSC_Pos)
#define USART_GTPR_PSC_2 (0x04U << USART_GTPR_PSC_Pos)
#define USART_GTPR_PSC_3 (0x08U << USART_GTPR_PSC_Pos)
#define USART_GTPR_PSC_4 (0x10U << USART_GTPR_PSC_Pos)
#define USART_GTPR_PSC_5 (0x20U << USART_GTPR_PSC_Pos)
#define USART_GTPR_PSC_6 (0x40U << USART_GTPR_PSC_Pos)
#define USART_GTPR_PSC_7 (0x80U << USART_GTPR_PSC_Pos)

#define USART_GTPR_GT_Pos (8U)
#define USART_GTPR_GT_Msk (0xFFU << USART_GTPR_GT_Pos)
#define USART_GTPR_GT USART_GTPR_GT_Msk
# 10007 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define DBGMCU_IDCODE_DEV_ID_Pos (0U)
#define DBGMCU_IDCODE_DEV_ID_Msk (0xFFFU << DBGMCU_IDCODE_DEV_ID_Pos)
#define DBGMCU_IDCODE_DEV_ID DBGMCU_IDCODE_DEV_ID_Msk

#define DBGMCU_IDCODE_REV_ID_Pos (16U)
#define DBGMCU_IDCODE_REV_ID_Msk (0xFFFFU << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID DBGMCU_IDCODE_REV_ID_Msk
#define DBGMCU_IDCODE_REV_ID_0 (0x0001U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_1 (0x0002U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_2 (0x0004U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_3 (0x0008U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_4 (0x0010U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_5 (0x0020U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_6 (0x0040U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_7 (0x0080U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_8 (0x0100U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_9 (0x0200U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_10 (0x0400U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_11 (0x0800U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_12 (0x1000U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_13 (0x2000U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_14 (0x4000U << DBGMCU_IDCODE_REV_ID_Pos)
#define DBGMCU_IDCODE_REV_ID_15 (0x8000U << DBGMCU_IDCODE_REV_ID_Pos)


#define DBGMCU_CR_DBG_SLEEP_Pos (0U)
#define DBGMCU_CR_DBG_SLEEP_Msk (0x1U << DBGMCU_CR_DBG_SLEEP_Pos)
#define DBGMCU_CR_DBG_SLEEP DBGMCU_CR_DBG_SLEEP_Msk
#define DBGMCU_CR_DBG_STOP_Pos (1U)
#define DBGMCU_CR_DBG_STOP_Msk (0x1U << DBGMCU_CR_DBG_STOP_Pos)
#define DBGMCU_CR_DBG_STOP DBGMCU_CR_DBG_STOP_Msk
#define DBGMCU_CR_DBG_STANDBY_Pos (2U)
#define DBGMCU_CR_DBG_STANDBY_Msk (0x1U << DBGMCU_CR_DBG_STANDBY_Pos)
#define DBGMCU_CR_DBG_STANDBY DBGMCU_CR_DBG_STANDBY_Msk
#define DBGMCU_CR_TRACE_IOEN_Pos (5U)
#define DBGMCU_CR_TRACE_IOEN_Msk (0x1U << DBGMCU_CR_TRACE_IOEN_Pos)
#define DBGMCU_CR_TRACE_IOEN DBGMCU_CR_TRACE_IOEN_Msk

#define DBGMCU_CR_TRACE_MODE_Pos (6U)
#define DBGMCU_CR_TRACE_MODE_Msk (0x3U << DBGMCU_CR_TRACE_MODE_Pos)
#define DBGMCU_CR_TRACE_MODE DBGMCU_CR_TRACE_MODE_Msk
#define DBGMCU_CR_TRACE_MODE_0 (0x1U << DBGMCU_CR_TRACE_MODE_Pos)
#define DBGMCU_CR_TRACE_MODE_1 (0x2U << DBGMCU_CR_TRACE_MODE_Pos)

#define DBGMCU_CR_DBG_IWDG_STOP_Pos (8U)
#define DBGMCU_CR_DBG_IWDG_STOP_Msk (0x1U << DBGMCU_CR_DBG_IWDG_STOP_Pos)
#define DBGMCU_CR_DBG_IWDG_STOP DBGMCU_CR_DBG_IWDG_STOP_Msk
#define DBGMCU_CR_DBG_WWDG_STOP_Pos (9U)
#define DBGMCU_CR_DBG_WWDG_STOP_Msk (0x1U << DBGMCU_CR_DBG_WWDG_STOP_Pos)
#define DBGMCU_CR_DBG_WWDG_STOP DBGMCU_CR_DBG_WWDG_STOP_Msk
#define DBGMCU_CR_DBG_TIM1_STOP_Pos (10U)
#define DBGMCU_CR_DBG_TIM1_STOP_Msk (0x1U << DBGMCU_CR_DBG_TIM1_STOP_Pos)
#define DBGMCU_CR_DBG_TIM1_STOP DBGMCU_CR_DBG_TIM1_STOP_Msk
#define DBGMCU_CR_DBG_TIM2_STOP_Pos (11U)
#define DBGMCU_CR_DBG_TIM2_STOP_Msk (0x1U << DBGMCU_CR_DBG_TIM2_STOP_Pos)
#define DBGMCU_CR_DBG_TIM2_STOP DBGMCU_CR_DBG_TIM2_STOP_Msk
#define DBGMCU_CR_DBG_TIM3_STOP_Pos (12U)
#define DBGMCU_CR_DBG_TIM3_STOP_Msk (0x1U << DBGMCU_CR_DBG_TIM3_STOP_Pos)
#define DBGMCU_CR_DBG_TIM3_STOP DBGMCU_CR_DBG_TIM3_STOP_Msk
#define DBGMCU_CR_DBG_TIM4_STOP_Pos (13U)
#define DBGMCU_CR_DBG_TIM4_STOP_Msk (0x1U << DBGMCU_CR_DBG_TIM4_STOP_Pos)
#define DBGMCU_CR_DBG_TIM4_STOP DBGMCU_CR_DBG_TIM4_STOP_Msk
#define DBGMCU_CR_DBG_CAN1_STOP_Pos (14U)
#define DBGMCU_CR_DBG_CAN1_STOP_Msk (0x1U << DBGMCU_CR_DBG_CAN1_STOP_Pos)
#define DBGMCU_CR_DBG_CAN1_STOP DBGMCU_CR_DBG_CAN1_STOP_Msk
#define DBGMCU_CR_DBG_I2C1_SMBUS_TIMEOUT_Pos (15U)
#define DBGMCU_CR_DBG_I2C1_SMBUS_TIMEOUT_Msk (0x1U << DBGMCU_CR_DBG_I2C1_SMBUS_TIMEOUT_Pos)
#define DBGMCU_CR_DBG_I2C1_SMBUS_TIMEOUT DBGMCU_CR_DBG_I2C1_SMBUS_TIMEOUT_Msk
#define DBGMCU_CR_DBG_I2C2_SMBUS_TIMEOUT_Pos (16U)
#define DBGMCU_CR_DBG_I2C2_SMBUS_TIMEOUT_Msk (0x1U << DBGMCU_CR_DBG_I2C2_SMBUS_TIMEOUT_Pos)
#define DBGMCU_CR_DBG_I2C2_SMBUS_TIMEOUT DBGMCU_CR_DBG_I2C2_SMBUS_TIMEOUT_Msk







#define FLASH_ACR_LATENCY_Pos (0U)
#define FLASH_ACR_LATENCY_Msk (0x7U << FLASH_ACR_LATENCY_Pos)
#define FLASH_ACR_LATENCY FLASH_ACR_LATENCY_Msk
#define FLASH_ACR_LATENCY_0 (0x1U << FLASH_ACR_LATENCY_Pos)
#define FLASH_ACR_LATENCY_1 (0x2U << FLASH_ACR_LATENCY_Pos)
#define FLASH_ACR_LATENCY_2 (0x4U << FLASH_ACR_LATENCY_Pos)

#define FLASH_ACR_HLFCYA_Pos (3U)
#define FLASH_ACR_HLFCYA_Msk (0x1U << FLASH_ACR_HLFCYA_Pos)
#define FLASH_ACR_HLFCYA FLASH_ACR_HLFCYA_Msk
#define FLASH_ACR_PRFTBE_Pos (4U)
#define FLASH_ACR_PRFTBE_Msk (0x1U << FLASH_ACR_PRFTBE_Pos)
#define FLASH_ACR_PRFTBE FLASH_ACR_PRFTBE_Msk
#define FLASH_ACR_PRFTBS_Pos (5U)
#define FLASH_ACR_PRFTBS_Msk (0x1U << FLASH_ACR_PRFTBS_Pos)
#define FLASH_ACR_PRFTBS FLASH_ACR_PRFTBS_Msk


#define FLASH_KEYR_FKEYR_Pos (0U)
#define FLASH_KEYR_FKEYR_Msk (0xFFFFFFFFU << FLASH_KEYR_FKEYR_Pos)
#define FLASH_KEYR_FKEYR FLASH_KEYR_FKEYR_Msk

#define RDP_KEY_Pos (0U)
#define RDP_KEY_Msk (0xA5U << RDP_KEY_Pos)
#define RDP_KEY RDP_KEY_Msk
#define FLASH_KEY1_Pos (0U)
#define FLASH_KEY1_Msk (0x45670123U << FLASH_KEY1_Pos)
#define FLASH_KEY1 FLASH_KEY1_Msk
#define FLASH_KEY2_Pos (0U)
#define FLASH_KEY2_Msk (0xCDEF89ABU << FLASH_KEY2_Pos)
#define FLASH_KEY2 FLASH_KEY2_Msk


#define FLASH_OPTKEYR_OPTKEYR_Pos (0U)
#define FLASH_OPTKEYR_OPTKEYR_Msk (0xFFFFFFFFU << FLASH_OPTKEYR_OPTKEYR_Pos)
#define FLASH_OPTKEYR_OPTKEYR FLASH_OPTKEYR_OPTKEYR_Msk

#define FLASH_OPTKEY1 FLASH_KEY1
#define FLASH_OPTKEY2 FLASH_KEY2


#define FLASH_SR_BSY_Pos (0U)
#define FLASH_SR_BSY_Msk (0x1U << FLASH_SR_BSY_Pos)
#define FLASH_SR_BSY FLASH_SR_BSY_Msk
#define FLASH_SR_PGERR_Pos (2U)
#define FLASH_SR_PGERR_Msk (0x1U << FLASH_SR_PGERR_Pos)
#define FLASH_SR_PGERR FLASH_SR_PGERR_Msk
#define FLASH_SR_WRPRTERR_Pos (4U)
#define FLASH_SR_WRPRTERR_Msk (0x1U << FLASH_SR_WRPRTERR_Pos)
#define FLASH_SR_WRPRTERR FLASH_SR_WRPRTERR_Msk
#define FLASH_SR_EOP_Pos (5U)
#define FLASH_SR_EOP_Msk (0x1U << FLASH_SR_EOP_Pos)
#define FLASH_SR_EOP FLASH_SR_EOP_Msk


#define FLASH_CR_PG_Pos (0U)
#define FLASH_CR_PG_Msk (0x1U << FLASH_CR_PG_Pos)
#define FLASH_CR_PG FLASH_CR_PG_Msk
#define FLASH_CR_PER_Pos (1U)
#define FLASH_CR_PER_Msk (0x1U << FLASH_CR_PER_Pos)
#define FLASH_CR_PER FLASH_CR_PER_Msk
#define FLASH_CR_MER_Pos (2U)
#define FLASH_CR_MER_Msk (0x1U << FLASH_CR_MER_Pos)
#define FLASH_CR_MER FLASH_CR_MER_Msk
#define FLASH_CR_OPTPG_Pos (4U)
#define FLASH_CR_OPTPG_Msk (0x1U << FLASH_CR_OPTPG_Pos)
#define FLASH_CR_OPTPG FLASH_CR_OPTPG_Msk
#define FLASH_CR_OPTER_Pos (5U)
#define FLASH_CR_OPTER_Msk (0x1U << FLASH_CR_OPTER_Pos)
#define FLASH_CR_OPTER FLASH_CR_OPTER_Msk
#define FLASH_CR_STRT_Pos (6U)
#define FLASH_CR_STRT_Msk (0x1U << FLASH_CR_STRT_Pos)
#define FLASH_CR_STRT FLASH_CR_STRT_Msk
#define FLASH_CR_LOCK_Pos (7U)
#define FLASH_CR_LOCK_Msk (0x1U << FLASH_CR_LOCK_Pos)
#define FLASH_CR_LOCK FLASH_CR_LOCK_Msk
#define FLASH_CR_OPTWRE_Pos (9U)
#define FLASH_CR_OPTWRE_Msk (0x1U << FLASH_CR_OPTWRE_Pos)
#define FLASH_CR_OPTWRE FLASH_CR_OPTWRE_Msk
#define FLASH_CR_ERRIE_Pos (10U)
#define FLASH_CR_ERRIE_Msk (0x1U << FLASH_CR_ERRIE_Pos)
#define FLASH_CR_ERRIE FLASH_CR_ERRIE_Msk
#define FLASH_CR_EOPIE_Pos (12U)
#define FLASH_CR_EOPIE_Msk (0x1U << FLASH_CR_EOPIE_Pos)
#define FLASH_CR_EOPIE FLASH_CR_EOPIE_Msk


#define FLASH_AR_FAR_Pos (0U)
#define FLASH_AR_FAR_Msk (0xFFFFFFFFU << FLASH_AR_FAR_Pos)
#define FLASH_AR_FAR FLASH_AR_FAR_Msk


#define FLASH_OBR_OPTERR_Pos (0U)
#define FLASH_OBR_OPTERR_Msk (0x1U << FLASH_OBR_OPTERR_Pos)
#define FLASH_OBR_OPTERR FLASH_OBR_OPTERR_Msk
#define FLASH_OBR_RDPRT_Pos (1U)
#define FLASH_OBR_RDPRT_Msk (0x1U << FLASH_OBR_RDPRT_Pos)
#define FLASH_OBR_RDPRT FLASH_OBR_RDPRT_Msk

#define FLASH_OBR_IWDG_SW_Pos (2U)
#define FLASH_OBR_IWDG_SW_Msk (0x1U << FLASH_OBR_IWDG_SW_Pos)
#define FLASH_OBR_IWDG_SW FLASH_OBR_IWDG_SW_Msk
#define FLASH_OBR_nRST_STOP_Pos (3U)
#define FLASH_OBR_nRST_STOP_Msk (0x1U << FLASH_OBR_nRST_STOP_Pos)
#define FLASH_OBR_nRST_STOP FLASH_OBR_nRST_STOP_Msk
#define FLASH_OBR_nRST_STDBY_Pos (4U)
#define FLASH_OBR_nRST_STDBY_Msk (0x1U << FLASH_OBR_nRST_STDBY_Pos)
#define FLASH_OBR_nRST_STDBY FLASH_OBR_nRST_STDBY_Msk
#define FLASH_OBR_USER_Pos (2U)
#define FLASH_OBR_USER_Msk (0x7U << FLASH_OBR_USER_Pos)
#define FLASH_OBR_USER FLASH_OBR_USER_Msk
#define FLASH_OBR_DATA0_Pos (10U)
#define FLASH_OBR_DATA0_Msk (0xFFU << FLASH_OBR_DATA0_Pos)
#define FLASH_OBR_DATA0 FLASH_OBR_DATA0_Msk
#define FLASH_OBR_DATA1_Pos (18U)
#define FLASH_OBR_DATA1_Msk (0xFFU << FLASH_OBR_DATA1_Pos)
#define FLASH_OBR_DATA1 FLASH_OBR_DATA1_Msk


#define FLASH_WRPR_WRP_Pos (0U)
#define FLASH_WRPR_WRP_Msk (0xFFFFFFFFU << FLASH_WRPR_WRP_Pos)
#define FLASH_WRPR_WRP FLASH_WRPR_WRP_Msk




#define FLASH_RDP_RDP_Pos (0U)
#define FLASH_RDP_RDP_Msk (0xFFU << FLASH_RDP_RDP_Pos)
#define FLASH_RDP_RDP FLASH_RDP_RDP_Msk
#define FLASH_RDP_nRDP_Pos (8U)
#define FLASH_RDP_nRDP_Msk (0xFFU << FLASH_RDP_nRDP_Pos)
#define FLASH_RDP_nRDP FLASH_RDP_nRDP_Msk


#define FLASH_USER_USER_Pos (16U)
#define FLASH_USER_USER_Msk (0xFFU << FLASH_USER_USER_Pos)
#define FLASH_USER_USER FLASH_USER_USER_Msk
#define FLASH_USER_nUSER_Pos (24U)
#define FLASH_USER_nUSER_Msk (0xFFU << FLASH_USER_nUSER_Pos)
#define FLASH_USER_nUSER FLASH_USER_nUSER_Msk


#define FLASH_DATA0_DATA0_Pos (0U)
#define FLASH_DATA0_DATA0_Msk (0xFFU << FLASH_DATA0_DATA0_Pos)
#define FLASH_DATA0_DATA0 FLASH_DATA0_DATA0_Msk
#define FLASH_DATA0_nDATA0_Pos (8U)
#define FLASH_DATA0_nDATA0_Msk (0xFFU << FLASH_DATA0_nDATA0_Pos)
#define FLASH_DATA0_nDATA0 FLASH_DATA0_nDATA0_Msk


#define FLASH_DATA1_DATA1_Pos (16U)
#define FLASH_DATA1_DATA1_Msk (0xFFU << FLASH_DATA1_DATA1_Pos)
#define FLASH_DATA1_DATA1 FLASH_DATA1_DATA1_Msk
#define FLASH_DATA1_nDATA1_Pos (24U)
#define FLASH_DATA1_nDATA1_Msk (0xFFU << FLASH_DATA1_nDATA1_Pos)
#define FLASH_DATA1_nDATA1 FLASH_DATA1_nDATA1_Msk


#define FLASH_WRP0_WRP0_Pos (0U)
#define FLASH_WRP0_WRP0_Msk (0xFFU << FLASH_WRP0_WRP0_Pos)
#define FLASH_WRP0_WRP0 FLASH_WRP0_WRP0_Msk
#define FLASH_WRP0_nWRP0_Pos (8U)
#define FLASH_WRP0_nWRP0_Msk (0xFFU << FLASH_WRP0_nWRP0_Pos)
#define FLASH_WRP0_nWRP0 FLASH_WRP0_nWRP0_Msk


#define FLASH_WRP1_WRP1_Pos (16U)
#define FLASH_WRP1_WRP1_Msk (0xFFU << FLASH_WRP1_WRP1_Pos)
#define FLASH_WRP1_WRP1 FLASH_WRP1_WRP1_Msk
#define FLASH_WRP1_nWRP1_Pos (24U)
#define FLASH_WRP1_nWRP1_Msk (0xFFU << FLASH_WRP1_nWRP1_Pos)
#define FLASH_WRP1_nWRP1 FLASH_WRP1_nWRP1_Msk


#define FLASH_WRP2_WRP2_Pos (0U)
#define FLASH_WRP2_WRP2_Msk (0xFFU << FLASH_WRP2_WRP2_Pos)
#define FLASH_WRP2_WRP2 FLASH_WRP2_WRP2_Msk
#define FLASH_WRP2_nWRP2_Pos (8U)
#define FLASH_WRP2_nWRP2_Msk (0xFFU << FLASH_WRP2_nWRP2_Pos)
#define FLASH_WRP2_nWRP2 FLASH_WRP2_nWRP2_Msk


#define FLASH_WRP3_WRP3_Pos (16U)
#define FLASH_WRP3_WRP3_Msk (0xFFU << FLASH_WRP3_WRP3_Pos)
#define FLASH_WRP3_WRP3 FLASH_WRP3_WRP3_Msk
#define FLASH_WRP3_nWRP3_Pos (24U)
#define FLASH_WRP3_nWRP3_Msk (0xFFU << FLASH_WRP3_nWRP3_Pos)
#define FLASH_WRP3_nWRP3 FLASH_WRP3_nWRP3_Msk
# 10289 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define IS_ADC_ALL_INSTANCE(INSTANCE) (((INSTANCE) == ADC1) || ((INSTANCE) == ADC2))


#define IS_ADC_COMMON_INSTANCE(INSTANCE) ((INSTANCE) == ADC12_COMMON)

#define IS_ADC_MULTIMODE_MASTER_INSTANCE(INSTANCE) ((INSTANCE) == ADC1)

#define IS_ADC_DMA_CAPABILITY_INSTANCE(INSTANCE) ((INSTANCE) == ADC1)


#define IS_CAN_ALL_INSTANCE(INSTANCE) ((INSTANCE) == CAN1)


#define IS_CRC_ALL_INSTANCE(INSTANCE) ((INSTANCE) == CRC)




#define IS_DMA_ALL_INSTANCE(INSTANCE) (((INSTANCE) == DMA1_Channel1) || ((INSTANCE) == DMA1_Channel2) || ((INSTANCE) == DMA1_Channel3) || ((INSTANCE) == DMA1_Channel4) || ((INSTANCE) == DMA1_Channel5) || ((INSTANCE) == DMA1_Channel6) || ((INSTANCE) == DMA1_Channel7))
# 10316 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define IS_GPIO_ALL_INSTANCE(INSTANCE) (((INSTANCE) == GPIOA) || ((INSTANCE) == GPIOB) || ((INSTANCE) == GPIOC) || ((INSTANCE) == GPIOD) || ((INSTANCE) == GPIOE))






#define IS_GPIO_AF_INSTANCE(INSTANCE) IS_GPIO_ALL_INSTANCE(INSTANCE)


#define IS_GPIO_LOCK_INSTANCE(INSTANCE) IS_GPIO_ALL_INSTANCE(INSTANCE)


#define IS_I2C_ALL_INSTANCE(INSTANCE) (((INSTANCE) == I2C1) || ((INSTANCE) == I2C2))



#define IS_SMBUS_ALL_INSTANCE IS_I2C_ALL_INSTANCE


#define IS_IWDG_ALL_INSTANCE(INSTANCE) ((INSTANCE) == IWDG)


#define IS_SPI_ALL_INSTANCE(INSTANCE) (((INSTANCE) == SPI1) || ((INSTANCE) == SPI2))




#define IS_TIM_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_ADVANCED_INSTANCE(INSTANCE) ((INSTANCE) == TIM1)

#define IS_TIM_CC1_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_CC2_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_CC3_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_CC4_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_CLOCKSOURCE_ETRMODE1_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_CLOCKSOURCE_ETRMODE2_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_CLOCKSOURCE_TIX_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_CLOCKSOURCE_ITRX_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_OCXREF_CLEAR_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_ENCODER_INTERFACE_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_XOR_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_MASTER_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_SLAVE_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_DMABURST_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_BREAK_INSTANCE(INSTANCE) ((INSTANCE) == TIM1)


#define IS_TIM_CCX_INSTANCE(INSTANCE,CHANNEL) ((((INSTANCE) == TIM1) && (((CHANNEL) == TIM_CHANNEL_1) || ((CHANNEL) == TIM_CHANNEL_2) || ((CHANNEL) == TIM_CHANNEL_3) || ((CHANNEL) == TIM_CHANNEL_4))) || (((INSTANCE) == TIM2) && (((CHANNEL) == TIM_CHANNEL_1) || ((CHANNEL) == TIM_CHANNEL_2) || ((CHANNEL) == TIM_CHANNEL_3) || ((CHANNEL) == TIM_CHANNEL_4))) || (((INSTANCE) == TIM3) && (((CHANNEL) == TIM_CHANNEL_1) || ((CHANNEL) == TIM_CHANNEL_2) || ((CHANNEL) == TIM_CHANNEL_3) || ((CHANNEL) == TIM_CHANNEL_4))) || (((INSTANCE) == TIM4) && (((CHANNEL) == TIM_CHANNEL_1) || ((CHANNEL) == TIM_CHANNEL_2) || ((CHANNEL) == TIM_CHANNEL_3) || ((CHANNEL) == TIM_CHANNEL_4))))
# 10464 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define IS_TIM_CCXN_INSTANCE(INSTANCE,CHANNEL) (((INSTANCE) == TIM1) && (((CHANNEL) == TIM_CHANNEL_1) || ((CHANNEL) == TIM_CHANNEL_2) || ((CHANNEL) == TIM_CHANNEL_3)))





#define IS_TIM_COUNTER_MODE_SELECT_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_REPETITION_COUNTER_INSTANCE(INSTANCE) ((INSTANCE) == TIM1)


#define IS_TIM_CLOCK_DIVISION_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_DMA_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_DMA_CC_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))





#define IS_TIM_COMMUTATION_EVENT_INSTANCE(INSTANCE) ((INSTANCE) == TIM1)


#define IS_TIM_ETR_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))




#define IS_TIM_HALL_SENSOR_INTERFACE_INSTANCE(INSTANCE) (((INSTANCE) == TIM1) || ((INSTANCE) == TIM2) || ((INSTANCE) == TIM3) || ((INSTANCE) == TIM4))




#define IS_TIM_32B_COUNTER_INSTANCE(INSTANCE) 0U





#define IS_USART_INSTANCE(INSTANCE) (((INSTANCE) == USART1) || ((INSTANCE) == USART2) || ((INSTANCE) == USART3))




#define IS_UART_INSTANCE(INSTANCE) (((INSTANCE) == USART1) || ((INSTANCE) == USART2) || ((INSTANCE) == USART3))




#define IS_UART_HALFDUPLEX_INSTANCE(INSTANCE) (((INSTANCE) == USART1) || ((INSTANCE) == USART2) || ((INSTANCE) == USART3))




#define IS_UART_LIN_INSTANCE(INSTANCE) (((INSTANCE) == USART1) || ((INSTANCE) == USART2) || ((INSTANCE) == USART3))




#define IS_UART_HWFLOW_INSTANCE(INSTANCE) (((INSTANCE) == USART1) || ((INSTANCE) == USART2) || ((INSTANCE) == USART3))




#define IS_SMARTCARD_INSTANCE(INSTANCE) (((INSTANCE) == USART1) || ((INSTANCE) == USART2) || ((INSTANCE) == USART3))




#define IS_IRDA_INSTANCE(INSTANCE) (((INSTANCE) == USART1) || ((INSTANCE) == USART2) || ((INSTANCE) == USART3))




#define IS_UART_MULTIPROCESSOR_INSTANCE(INSTANCE) (((INSTANCE) == USART1) || ((INSTANCE) == USART2) || ((INSTANCE) == USART3))




#define IS_UART_DMA_INSTANCE(INSTANCE) (((INSTANCE) == USART1) || ((INSTANCE) == USART2) || ((INSTANCE) == USART3))




#define IS_RTC_ALL_INSTANCE(INSTANCE) ((INSTANCE) == RTC)


#define IS_WWDG_ALL_INSTANCE(INSTANCE) ((INSTANCE) == WWDG)


#define IS_USB_ALL_INSTANCE(INSTANCE) ((INSTANCE) == USB)



#define RCC_HSE_MIN 4000000U
#define RCC_HSE_MAX 16000000U

#define RCC_MAX_FREQUENCY 72000000U
# 10588 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
#define ADC1_IRQn ADC1_2_IRQn
#define TIM9_IRQn TIM1_BRK_IRQn
#define TIM1_BRK_TIM9_IRQn TIM1_BRK_IRQn
#define TIM1_BRK_TIM15_IRQn TIM1_BRK_IRQn
#define TIM1_TRG_COM_TIM17_IRQn TIM1_TRG_COM_IRQn
#define TIM1_TRG_COM_TIM11_IRQn TIM1_TRG_COM_IRQn
#define TIM11_IRQn TIM1_TRG_COM_IRQn
#define TIM1_UP_TIM10_IRQn TIM1_UP_IRQn
#define TIM1_UP_TIM16_IRQn TIM1_UP_IRQn
#define TIM10_IRQn TIM1_UP_IRQn
#define OTG_FS_WKUP_IRQn USBWakeUp_IRQn
#define CEC_IRQn USBWakeUp_IRQn
#define USB_HP_IRQn USB_HP_CAN1_TX_IRQn
#define CAN1_TX_IRQn USB_HP_CAN1_TX_IRQn
#define CAN1_RX0_IRQn USB_LP_CAN1_RX0_IRQn
#define USB_LP_IRQn USB_LP_CAN1_RX0_IRQn



#define ADC1_IRQHandler ADC1_2_IRQHandler
#define TIM9_IRQHandler TIM1_BRK_IRQHandler
#define TIM1_BRK_TIM9_IRQHandler TIM1_BRK_IRQHandler
#define TIM1_BRK_TIM15_IRQHandler TIM1_BRK_IRQHandler
#define TIM1_TRG_COM_TIM17_IRQHandler TIM1_TRG_COM_IRQHandler
#define TIM1_TRG_COM_TIM11_IRQHandler TIM1_TRG_COM_IRQHandler
#define TIM11_IRQHandler TIM1_TRG_COM_IRQHandler
#define TIM1_UP_TIM10_IRQHandler TIM1_UP_IRQHandler
#define TIM1_UP_TIM16_IRQHandler TIM1_UP_IRQHandler
#define TIM10_IRQHandler TIM1_UP_IRQHandler
#define OTG_FS_WKUP_IRQHandler USBWakeUp_IRQHandler
#define CEC_IRQHandler USBWakeUp_IRQHandler
#define USB_HP_IRQHandler USB_HP_CAN1_TX_IRQHandler
#define CAN1_TX_IRQHandler USB_HP_CAN1_TX_IRQHandler
#define CAN1_RX0_IRQHandler USB_LP_CAN1_RX0_IRQHandler
#define USB_LP_IRQHandler USB_LP_CAN1_RX0_IRQHandler
# 150 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f1xx.h" 2
# 169 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f1xx.h"
typedef enum
{
  RESET = 0,
  SET = !RESET
} FlagStatus, ITStatus;

typedef enum
{
  DISABLE = 0,
  ENABLE = !DISABLE
} FunctionalState;
#define IS_FUNCTIONAL_STATE(STATE) (((STATE) == DISABLE) || ((STATE) == ENABLE))

typedef enum
{
  ERROR = 0,
  SUCCESS = !ERROR
} ErrorStatus;
# 196 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f1xx.h"
#define SET_BIT(REG,BIT) ((REG) |= (BIT))

#define CLEAR_BIT(REG,BIT) ((REG) &= ~(BIT))

#define READ_BIT(REG,BIT) ((REG) & (BIT))

#define CLEAR_REG(REG) ((REG) = (0x0))

#define WRITE_REG(REG,VAL) ((REG) = (VAL))

#define READ_REG(REG) ((REG))

#define MODIFY_REG(REG,CLEARMASK,SETMASK) WRITE_REG((REG), (((READ_REG(REG)) & (~(CLEARMASK))) | (SETMASK)))

#define POSITION_VAL(VAL) (__CLZ(__RBIT(VAL)))
# 16 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/include/mcu/cmsis_nvic.h" 2





void NVIC_Relocate(void);
void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector);
uint32_t __NVIC_GetVector(IRQn_Type IRQn);
# 26 "repos/apache-mynewt-core/kernel/os/include/os/arch/cortex_m3/os/os_arch.h" 2
# 1 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/include/mcu/cortex_m3.h" 1
# 21 "repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/include/mcu/cortex_m3.h"
#define __MCU_CORTEX_M3_H__ 







#define OS_TICKS_PER_SEC (1000)
# 27 "repos/apache-mynewt-core/kernel/os/include/os/arch/cortex_m3/os/os_arch.h" 2






typedef uint32_t os_sr_t;


typedef uint32_t os_stack_t;


#define OS_SANITY_STACK_SIZE (64)



#define OS_IDLE_STACK_SIZE (64)


static inline int
os_arch_in_isr(void)
{
    return (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICSR & (0x1FFUL )) != 0;
}


# 1 "repos/apache-mynewt-core/kernel/os/include/os/arch/common.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/arch/common.h"
#define _OS_ARCH_COMMON_H 


# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_error.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/os_error.h"
#define H_OS_ERROR_ 
# 30 "repos/apache-mynewt-core/kernel/os/include/os/os_error.h"
enum os_error {
    OS_OK = 0,
    OS_ENOMEM = 1,
    OS_EINVAL = 2,
    OS_INVALID_PARM = 3,
    OS_MEM_NOT_ALIGNED = 4,
    OS_BAD_MUTEX = 5,
    OS_TIMEOUT = 6,
    OS_ERR_IN_ISR = 7,
    OS_ERR_PRIV = 8,
    OS_NOT_STARTED = 9,
    OS_ENOENT = 10,
    OS_EBUSY = 11,
    OS_ERROR = 12,
};

typedef enum os_error os_error_t;
# 25 "repos/apache-mynewt-core/kernel/os/include/os/arch/common.h" 2





struct os_stack;
struct os_task;


#define OS_STACK_PATTERN (0xdeadbeef)



#define OS_ALIGNMENT (4)



#define OS_STACK_ALIGNMENT (8)



#define OS_STACK_ALIGN(__len) (OS_ALIGN((__len), OS_STACK_ALIGNMENT))



#define OS_ENTER_CRITICAL(__os_sr) (__os_sr = os_arch_save_sr())



#define OS_EXIT_CRITICAL(__os_sr) (os_arch_restore_sr(__os_sr))



#define OS_ASSERT_CRITICAL() (assert(os_arch_in_critical()))


os_stack_t *os_arch_task_stack_init(struct os_task *, os_stack_t *, int);
void os_arch_ctx_sw(struct os_task *);
os_sr_t os_arch_save_sr(void);
void os_arch_restore_sr(os_sr_t);
int os_arch_in_critical(void);
void os_arch_init(void);
uint32_t os_arch_start(void);
os_error_t os_arch_os_init(void);
os_error_t os_arch_os_start(void);
void os_set_env(os_stack_t *);
void os_arch_init_task_stack(os_stack_t *sf);
void os_default_irq_asm(void);
# 54 "repos/apache-mynewt-core/kernel/os/include/os/arch/cortex_m3/os/os_arch.h" 2
# 66 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/queue.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/queue.h"
#define _QUEUE_H 

# 1 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h" 1
# 34 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define _SYS_QUEUE_H_ 
# 114 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define SLIST_HEAD(name,type) struct name { struct type *slh_first; }




#define SLIST_HEAD_INITIALIZER(head) { NULL }


#define SLIST_ENTRY(type) struct { struct type *sle_next; }







#define SLIST_EMPTY(head) ((head)->slh_first == NULL)

#define SLIST_FIRST(head) ((head)->slh_first)

#define SLIST_FOREACH(var,head,field) for ((var) = SLIST_FIRST((head)); (var); (var) = SLIST_NEXT((var), field))




#define SLIST_INIT(head) do { SLIST_FIRST((head)) = NULL; } while (0)



#define SLIST_INSERT_AFTER(slistelm,elm,field) do { SLIST_NEXT((elm), field) = SLIST_NEXT((slistelm), field); SLIST_NEXT((slistelm), field) = (elm); } while (0)




#define SLIST_INSERT_HEAD(head,elm,field) do { SLIST_NEXT((elm), field) = SLIST_FIRST((head)); SLIST_FIRST((head)) = (elm); } while (0)




#define SLIST_NEXT(elm,field) ((elm)->field.sle_next)

#define SLIST_REMOVE(head,elm,type,field) do { if (SLIST_FIRST((head)) == (elm)) { SLIST_REMOVE_HEAD((head), field); } else { struct type *curelm = SLIST_FIRST((head)); while (SLIST_NEXT(curelm, field) != (elm)) curelm = SLIST_NEXT(curelm, field); SLIST_NEXT(curelm, field) = SLIST_NEXT(SLIST_NEXT(curelm, field), field); } } while (0)
# 168 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define SLIST_REMOVE_HEAD(head,field) do { SLIST_FIRST((head)) = SLIST_NEXT(SLIST_FIRST((head)), field); } while (0)






#define STAILQ_HEAD(name,type) struct name { struct type *stqh_first; struct type **stqh_last; }





#define STAILQ_HEAD_INITIALIZER(head) { NULL, &(head).stqh_first }


#define STAILQ_ENTRY(type) struct { struct type *stqe_next; }







#define STAILQ_EMPTY(head) ((head)->stqh_first == NULL)

#define STAILQ_FIRST(head) ((head)->stqh_first)

#define STAILQ_FOREACH(var,head,field) for((var) = STAILQ_FIRST((head)); (var); (var) = STAILQ_NEXT((var), field))




#define STAILQ_INIT(head) do { STAILQ_FIRST((head)) = NULL; (head)->stqh_last = &STAILQ_FIRST((head)); } while (0)




#define STAILQ_INSERT_AFTER(head,tqelm,elm,field) do { if ((STAILQ_NEXT((elm), field) = STAILQ_NEXT((tqelm), field)) == NULL) (head)->stqh_last = &STAILQ_NEXT((elm), field); STAILQ_NEXT((tqelm), field) = (elm); } while (0)





#define STAILQ_INSERT_HEAD(head,elm,field) do { if ((STAILQ_NEXT((elm), field) = STAILQ_FIRST((head))) == NULL) (head)->stqh_last = &STAILQ_NEXT((elm), field); STAILQ_FIRST((head)) = (elm); } while (0)





#define STAILQ_INSERT_TAIL(head,elm,field) do { STAILQ_NEXT((elm), field) = NULL; *(head)->stqh_last = (elm); (head)->stqh_last = &STAILQ_NEXT((elm), field); } while (0)





#define STAILQ_LAST(head,type,field) (STAILQ_EMPTY(head) ? NULL : ((struct type *) ((char *)((head)->stqh_last) - offsetof(struct type, field))))





#define STAILQ_NEXT(elm,field) ((elm)->field.stqe_next)

#define STAILQ_REMOVE(head,elm,type,field) do { if (STAILQ_FIRST((head)) == (elm)) { STAILQ_REMOVE_HEAD(head, field); } else { struct type *curelm = STAILQ_FIRST((head)); while (STAILQ_NEXT(curelm, field) != (elm)) curelm = STAILQ_NEXT(curelm, field); if ((STAILQ_NEXT(curelm, field) = STAILQ_NEXT(STAILQ_NEXT(curelm, field), field)) == NULL) (head)->stqh_last = &STAILQ_NEXT((curelm), field); } } while (0)
# 246 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define STAILQ_REMOVE_HEAD(head,field) do { if ((STAILQ_FIRST((head)) = STAILQ_NEXT(STAILQ_FIRST((head)), field)) == NULL) (head)->stqh_last = &STAILQ_FIRST((head)); } while (0)





#define STAILQ_REMOVE_HEAD_UNTIL(head,elm,field) do { if ((STAILQ_FIRST((head)) = STAILQ_NEXT((elm), field)) == NULL) (head)->stqh_last = &STAILQ_FIRST((head)); } while (0)




#define STAILQ_REMOVE_AFTER(head,elm,field) do { if ((STAILQ_NEXT(elm, field) = STAILQ_NEXT(STAILQ_NEXT(elm, field), field)) == NULL) (head)->stqh_last = &STAILQ_NEXT((elm), field); } while (0)
# 266 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define LIST_HEAD(name,type) struct name { struct type *lh_first; }




#define LIST_HEAD_INITIALIZER(head) { NULL }


#define LIST_ENTRY(type) struct { struct type *le_next; struct type **le_prev; }
# 284 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define LIST_EMPTY(head) ((head)->lh_first == NULL)

#define LIST_FIRST(head) ((head)->lh_first)

#define LIST_FOREACH(var,head,field) for ((var) = LIST_FIRST((head)); (var); (var) = LIST_NEXT((var), field))




#define LIST_INIT(head) do { LIST_FIRST((head)) = NULL; } while (0)



#define LIST_INSERT_AFTER(listelm,elm,field) do { if ((LIST_NEXT((elm), field) = LIST_NEXT((listelm), field)) != NULL) LIST_NEXT((listelm), field)->field.le_prev = &LIST_NEXT((elm), field); LIST_NEXT((listelm), field) = (elm); (elm)->field.le_prev = &LIST_NEXT((listelm), field); } while (0)







#define LIST_INSERT_BEFORE(listelm,elm,field) do { (elm)->field.le_prev = (listelm)->field.le_prev; LIST_NEXT((elm), field) = (listelm); *(listelm)->field.le_prev = (elm); (listelm)->field.le_prev = &LIST_NEXT((elm), field); } while (0)






#define LIST_INSERT_HEAD(head,elm,field) do { if ((LIST_NEXT((elm), field) = LIST_FIRST((head))) != NULL) LIST_FIRST((head))->field.le_prev = &LIST_NEXT((elm), field); LIST_FIRST((head)) = (elm); (elm)->field.le_prev = &LIST_FIRST((head)); } while (0)






#define LIST_NEXT(elm,field) ((elm)->field.le_next)

#define LIST_REMOVE(elm,field) do { if (LIST_NEXT((elm), field) != NULL) LIST_NEXT((elm), field)->field.le_prev = (elm)->field.le_prev; *(elm)->field.le_prev = LIST_NEXT((elm), field); } while (0)
# 331 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define TAILQ_HEAD(name,type) struct name { struct type *tqh_first; struct type **tqh_last; }





#define TAILQ_HEAD_INITIALIZER(head) { NULL, &(head).tqh_first }


#define TAILQ_ENTRY(type) struct { struct type *tqe_next; struct type **tqe_prev; }
# 349 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define TAILQ_EMPTY(head) ((head)->tqh_first == NULL)

#define TAILQ_FIRST(head) ((head)->tqh_first)

#define TAILQ_FOREACH(var,head,field) for ((var) = TAILQ_FIRST((head)); (var); (var) = TAILQ_NEXT((var), field))




#define TAILQ_FOREACH_REVERSE(var,head,headname,field) for ((var) = TAILQ_LAST((head), headname); (var); (var) = TAILQ_PREV((var), headname, field))




#define TAILQ_INIT(head) do { TAILQ_FIRST((head)) = NULL; (head)->tqh_last = &TAILQ_FIRST((head)); } while (0)




#define TAILQ_INSERT_AFTER(head,listelm,elm,field) do { if ((TAILQ_NEXT((elm), field) = TAILQ_NEXT((listelm), field)) != NULL) TAILQ_NEXT((elm), field)->field.tqe_prev = &TAILQ_NEXT((elm), field); else (head)->tqh_last = &TAILQ_NEXT((elm), field); TAILQ_NEXT((listelm), field) = (elm); (elm)->field.tqe_prev = &TAILQ_NEXT((listelm), field); } while (0)
# 378 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define TAILQ_INSERT_BEFORE(listelm,elm,field) do { (elm)->field.tqe_prev = (listelm)->field.tqe_prev; TAILQ_NEXT((elm), field) = (listelm); *(listelm)->field.tqe_prev = (elm); (listelm)->field.tqe_prev = &TAILQ_NEXT((elm), field); } while (0)






#define TAILQ_INSERT_HEAD(head,elm,field) do { if ((TAILQ_NEXT((elm), field) = TAILQ_FIRST((head))) != NULL) TAILQ_FIRST((head))->field.tqe_prev = &TAILQ_NEXT((elm), field); else (head)->tqh_last = &TAILQ_NEXT((elm), field); TAILQ_FIRST((head)) = (elm); (elm)->field.tqe_prev = &TAILQ_FIRST((head)); } while (0)
# 395 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define TAILQ_INSERT_TAIL(head,elm,field) do { TAILQ_NEXT((elm), field) = NULL; (elm)->field.tqe_prev = (head)->tqh_last; *(head)->tqh_last = (elm); (head)->tqh_last = &TAILQ_NEXT((elm), field); } while (0)






#define TAILQ_LAST(head,headname) (*(((struct headname *)((head)->tqh_last))->tqh_last))


#define TAILQ_NEXT(elm,field) ((elm)->field.tqe_next)

#define TAILQ_PREV(elm,headname,field) (*(((struct headname *)((elm)->field.tqe_prev))->tqh_last))


#define TAILQ_REMOVE(head,elm,field) do { if ((TAILQ_NEXT((elm), field)) != NULL) TAILQ_NEXT((elm), field)->field.tqe_prev = (elm)->field.tqe_prev; else (head)->tqh_last = (elm)->field.tqe_prev; *(elm)->field.tqe_prev = TAILQ_NEXT((elm), field); } while (0)
# 422 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define CIRCLEQ_HEAD(name,type) struct name { struct type *cqh_first; struct type *cqh_last; }





#define CIRCLEQ_HEAD_INITIALIZER(head) { (void *)&(head), (void *)&(head) }


#define CIRCLEQ_ENTRY(type) struct { struct type *cqe_next; struct type *cqe_prev; }
# 440 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define CIRCLEQ_EMPTY(head) ((head)->cqh_first == (void *)(head))

#define CIRCLEQ_FIRST(head) ((head)->cqh_first)

#define CIRCLEQ_FOREACH(var,head,field) for ((var) = CIRCLEQ_FIRST((head)); (var) != (void *)(head) || ((var) = NULL); (var) = CIRCLEQ_NEXT((var), field))




#define CIRCLEQ_FOREACH_REVERSE(var,head,field) for ((var) = CIRCLEQ_LAST((head)); (var) != (void *)(head) || ((var) = NULL); (var) = CIRCLEQ_PREV((var), field))




#define CIRCLEQ_INIT(head) do { CIRCLEQ_FIRST((head)) = (void *)(head); CIRCLEQ_LAST((head)) = (void *)(head); } while (0)




#define CIRCLEQ_INSERT_AFTER(head,listelm,elm,field) do { CIRCLEQ_NEXT((elm), field) = CIRCLEQ_NEXT((listelm), field); CIRCLEQ_PREV((elm), field) = (listelm); if (CIRCLEQ_NEXT((listelm), field) == (void *)(head)) CIRCLEQ_LAST((head)) = (elm); else CIRCLEQ_PREV(CIRCLEQ_NEXT((listelm), field), field) = (elm); CIRCLEQ_NEXT((listelm), field) = (elm); } while (0)
# 469 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define CIRCLEQ_INSERT_BEFORE(head,listelm,elm,field) do { CIRCLEQ_NEXT((elm), field) = (listelm); CIRCLEQ_PREV((elm), field) = CIRCLEQ_PREV((listelm), field); if (CIRCLEQ_PREV((listelm), field) == (void *)(head)) CIRCLEQ_FIRST((head)) = (elm); else CIRCLEQ_NEXT(CIRCLEQ_PREV((listelm), field), field) = (elm); CIRCLEQ_PREV((listelm), field) = (elm); } while (0)
# 479 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define CIRCLEQ_INSERT_HEAD(head,elm,field) do { CIRCLEQ_NEXT((elm), field) = CIRCLEQ_FIRST((head)); CIRCLEQ_PREV((elm), field) = (void *)(head); if (CIRCLEQ_LAST((head)) == (void *)(head)) CIRCLEQ_LAST((head)) = (elm); else CIRCLEQ_PREV(CIRCLEQ_FIRST((head)), field) = (elm); CIRCLEQ_FIRST((head)) = (elm); } while (0)
# 489 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define CIRCLEQ_INSERT_TAIL(head,elm,field) do { CIRCLEQ_NEXT((elm), field) = (void *)(head); CIRCLEQ_PREV((elm), field) = CIRCLEQ_LAST((head)); if (CIRCLEQ_FIRST((head)) == (void *)(head)) CIRCLEQ_FIRST((head)) = (elm); else CIRCLEQ_NEXT(CIRCLEQ_LAST((head)), field) = (elm); CIRCLEQ_LAST((head)) = (elm); } while (0)
# 499 "repos/apache-mynewt-core/sys/sys/include/sys/queue.h"
#define CIRCLEQ_LAST(head) ((head)->cqh_last)

#define CIRCLEQ_NEXT(elm,field) ((elm)->field.cqe_next)

#define CIRCLEQ_PREV(elm,field) ((elm)->field.cqe_prev)

#define CIRCLEQ_REMOVE(head,elm,field) do { if (CIRCLEQ_NEXT((elm), field) == (void *)(head)) CIRCLEQ_LAST((head)) = CIRCLEQ_PREV((elm), field); else CIRCLEQ_PREV(CIRCLEQ_NEXT((elm), field), field) = CIRCLEQ_PREV((elm), field); if (CIRCLEQ_PREV((elm), field) == (void *)(head)) CIRCLEQ_FIRST((head)) = CIRCLEQ_NEXT((elm), field); else CIRCLEQ_NEXT(CIRCLEQ_PREV((elm), field), field) = CIRCLEQ_NEXT((elm), field); } while (0)
# 24 "repos/apache-mynewt-core/kernel/os/include/os/queue.h" 2
# 67 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h" 2
# 80 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
typedef uint32_t os_time_t;
typedef int32_t os_stime_t;
#define OS_TIME_MAX UINT32_MAX
#define OS_STIME_MAX INT32_MAX


#define OS_TIMEOUT_NEVER (OS_TIME_MAX)







os_time_t os_time_get(void);






void os_time_advance(int ticks);







void os_time_delay(os_time_t osticks);

#define OS_TIME_TICK_LT(__t1,__t2) ((os_stime_t) ((__t1) - (__t2)) < 0)
#define OS_TIME_TICK_GT(__t1,__t2) ((os_stime_t) ((__t1) - (__t2)) > 0)
#define OS_TIME_TICK_GEQ(__t1,__t2) ((os_stime_t) ((__t1) - (__t2)) >= 0)

#define OS_TIMEVAL_LT(__t1,__t2) (((__t1).tv_sec < (__t2).tv_sec) || (((__t1).tv_sec == (__t2).tv_sec) && ((__t1).tv_usec < (__t2).tv_usec)))


#define OS_TIMEVAL_LEQ(__t1,__t2) (((__t1).tv_sec < (__t2).tv_sec) || (((__t1).tv_sec == (__t2).tv_sec) && ((__t1).tv_usec <= (__t2).tv_usec)))


#define OS_TIMEVAL_GT(__t1,__t2) (((__t1).tv_sec > (__t2).tv_sec) || (((__t1).tv_sec == (__t2).tv_sec) && ((__t1).tv_usec > (__t2).tv_usec)))


#define OS_TIMEVAL_GEQ(__t1,__t2) (((__t1).tv_sec > (__t2).tv_sec) || (((__t1).tv_sec == (__t2).tv_sec) && ((__t1).tv_usec >= (__t2).tv_usec)))







struct os_timeval {

    int64_t tv_sec;

    int32_t tv_usec;
};


struct os_timezone {

    int16_t tz_minuteswest;

    int16_t tz_dsttime;
};





struct os_time_change_info {

    const struct os_timeval *tci_prev_tv;

    const struct os_timezone *tci_prev_tz;

    const struct os_timeval *tci_cur_tv;

    const struct os_timezone *tci_cur_tz;

    
# 161 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h" 3 4
   _Bool 
# 161 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
        tci_newly_synced;
};







typedef void os_time_change_fn(const struct os_time_change_info *info,
                               void *arg);




struct os_time_change_listener {

    os_time_change_fn *tcl_fn;
    void *tcl_arg;


    struct { struct os_time_change_listener *stqe_next; } tcl_next;
};





#define os_timeradd(tvp,uvp,vvp) do { (vvp)->tv_sec = (tvp)->tv_sec + (uvp)->tv_sec; (vvp)->tv_usec = (tvp)->tv_usec + (uvp)->tv_usec; if ((vvp)->tv_usec >= 1000000) { (vvp)->tv_sec++; (vvp)->tv_usec -= 1000000; } } while (0)
# 204 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
#define os_timersub(tvp,uvp,vvp) do { (vvp)->tv_sec = (tvp)->tv_sec - (uvp)->tv_sec; (vvp)->tv_usec = (tvp)->tv_usec - (uvp)->tv_usec; if ((vvp)->tv_usec < 0) { (vvp)->tv_sec--; (vvp)->tv_usec += 1000000; } } while (0)
# 225 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
int os_settimeofday(struct os_timeval *utctime, struct os_timezone *tz);
# 237 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
int os_gettimeofday(struct os_timeval *utctime, struct os_timezone *tz);







# 244 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h" 3 4
_Bool 
# 244 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
    os_time_is_set(void);






int64_t os_get_uptime_usec(void);






void os_get_uptime(struct os_timeval *tvp);
# 269 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
int os_time_ms_to_ticks(uint32_t ms, os_time_t *out_ticks);
# 280 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
int os_time_ticks_to_ms(os_time_t ticks, uint32_t *out_ms);
# 293 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
static inline os_time_t
os_time_ms_to_ticks32(uint32_t ms)
{

    return ms;



}
# 313 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
static inline uint32_t
os_time_ticks_to_ms32(os_time_t ticks)
{

    return ticks;



}
# 337 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
void os_time_change_listen(struct os_time_change_listener *listener);
# 350 "repos/apache-mynewt-core/kernel/os/include/os/os_time.h"
int os_time_change_remove(const struct os_time_change_listener *listener);
# 34 "repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h" 2






struct os_event;
typedef void os_event_fn(struct os_event *ev);





struct os_event {

    uint8_t ev_queued;





    os_event_fn *ev_cb;

    void *ev_arg;

    struct { struct os_event *stqe_next; } ev_next;
};


#define OS_EVENT_QUEUED(__ev) ((__ev)->ev_queued)
# 81 "repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h"
struct os_eventq {

    struct os_task *evq_owner;




    struct os_task *evq_task;

    struct { struct os_event *stqh_first; struct os_event **stqh_last; } evq_list;
# 100 "repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h"
};






void os_eventq_init(struct os_eventq *);






int os_eventq_inited(const struct os_eventq *evq);







void os_eventq_put(struct os_eventq *, struct os_event *);







struct os_event *os_eventq_get_no_wait(struct os_eventq *evq);
# 140 "repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h"
struct os_event *os_eventq_get(struct os_eventq *);







void os_eventq_run(struct os_eventq *evq);
# 163 "repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h"
struct os_event *os_eventq_poll(struct os_eventq **, int, os_time_t);







void os_eventq_remove(struct os_eventq *, struct os_event *);






struct os_eventq *os_eventq_dflt_get(void);
# 214 "repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h"
void os_eventq_designate(struct os_eventq **dst, struct os_eventq *val,
                         struct os_event *start_ev);
# 35 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h" 2
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 36 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h" 2





struct os_callout {

    struct os_event c_ev;

    struct os_eventq *c_evq;

    os_time_t c_ticks;


    struct { struct os_callout *tqe_next; struct os_callout **tqe_prev; } c_next;
};





struct os_callout_list { struct os_callout *tqh_first; struct os_callout **tqh_last; };
# 80 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h"
void os_callout_init(struct os_callout *cf, struct os_eventq *evq,
                     os_event_fn *ev_cb, void *ev_arg);







void os_callout_stop(struct os_callout *);
# 100 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h"
int os_callout_reset(struct os_callout *, os_time_t);
# 110 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h"
os_time_t os_callout_remaining_ticks(struct os_callout *, os_time_t);
# 119 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h"
static inline int
os_callout_queued(struct os_callout *c)
{
    return c->c_next.tqe_prev != 
# 122 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h" 3 4
                                ((void *)0)
# 122 "repos/apache-mynewt-core/kernel/os/include/os/os_callout.h"
                                    ;
}





void os_callout_tick(void);
os_time_t os_callout_wakeup_ticks(os_time_t now);
# 123 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_cfg.h" 1
# 22 "repos/apache-mynewt-core/kernel/os/include/os/os_cfg.h"
#define _OS_CFG_H_ 
# 124 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h" 1
# 28 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
#define H_OS_CPUTIME_ 







# 1 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h" 1
# 29 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
#define H_HAL_TIMER_ 
# 39 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
typedef void (*hal_timer_cb)(void *arg);
# 51 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
struct hal_timer {

    void *bsp_timer;

    hal_timer_cb cb_func;

    void *cb_arg;

    uint32_t expiry;
    struct { struct hal_timer *tqe_next; struct hal_timer **tqe_prev; } link;
};
# 70 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
int hal_timer_init(int timer_num, void *cfg);






int hal_timer_deinit(int timer_num);
# 88 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
int hal_timer_config(int timer_num, uint32_t freq_hz);
# 100 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
uint32_t hal_timer_get_resolution(int timer_num);
# 109 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
uint32_t hal_timer_read(int timer_num);
# 119 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
int hal_timer_delay(int timer_num, uint32_t ticks);
# 132 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
int hal_timer_set_cb(int timer_num, struct hal_timer *tmr, hal_timer_cb cb_func,
                     void *arg);
# 143 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
int hal_timer_start(struct hal_timer *tmr, uint32_t ticks);
# 155 "repos/apache-mynewt-core/hw/hal/include/hal/hal_timer.h"
int hal_timer_start_at(struct hal_timer *tmr, uint32_t tick);






int hal_timer_stop(struct hal_timer *tmr);
# 37 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h" 2
# 49 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
#define OS_CPUTIME_FREQ_1MHZ 
# 88 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
#define CPUTIME_LT(__t1,__t2) ((int32_t) ((__t1) - (__t2)) < 0)

#define CPUTIME_GT(__t1,__t2) ((int32_t) ((__t1) - (__t2)) > 0)

#define CPUTIME_GEQ(__t1,__t2) ((int32_t) ((__t1) - (__t2)) >= 0)

#define CPUTIME_LEQ(__t1,__t2) ((int32_t) ((__t1) - (__t2)) <= 0)
# 105 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
int os_cputime_init(uint32_t clock_freq);






uint32_t os_cputime_get32(void);
# 123 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
uint32_t os_cputime_nsecs_to_ticks(uint32_t nsecs);
# 133 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
uint32_t os_cputime_ticks_to_nsecs(uint32_t ticks);
# 142 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
void os_cputime_delay_nsecs(uint32_t nsecs);



#define os_cputime_usecs_to_ticks(x) (x)
#define os_cputime_ticks_to_usecs(x) (x)
# 174 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
void os_cputime_delay_ticks(uint32_t ticks);






void os_cputime_delay_usecs(uint32_t usecs);
# 190 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
void os_cputime_timer_init(struct hal_timer *timer, hal_timer_cb fp,
        void *arg);
# 206 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
int os_cputime_timer_start(struct hal_timer *timer, uint32_t cputime);
# 220 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
int os_cputime_timer_relative(struct hal_timer *timer, uint32_t usecs);
# 229 "repos/apache-mynewt-core/kernel/os/include/os/os_cputime.h"
void os_cputime_timer_stop(struct hal_timer *timer);
# 125 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
#define _OS_DEV_H 
# 30 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 1
# 31 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h" 2







struct os_dev;
# 49 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
#define OS_DEV_INIT_PRIMARY (1)

#define OS_DEV_INIT_SECONDARY (2)

#define OS_DEV_INIT_KERNEL (3)





#define OS_DEV_INIT_F_CRITICAL (1 << 0)

#define OS_DEV_INIT_PRIO_DEFAULT (0xff)


#define OS_DEV_F_STATUS_READY (1 << 0)

#define OS_DEV_F_STATUS_OPEN (1 << 1)

#define OS_DEV_F_STATUS_SUSPENDED (1 << 2)




#define OS_DEV_F_INIT_CRITICAL (1 << 3)
# 83 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
typedef int (*os_dev_init_func_t)(struct os_dev *, void *);

typedef int (*os_dev_open_func_t)(struct os_dev *, uint32_t,
        void *);
typedef int (*os_dev_suspend_func_t)(struct os_dev *, os_time_t, int);
typedef int (*os_dev_resume_func_t)(struct os_dev *);
typedef int (*os_dev_close_func_t)(struct os_dev *);





struct os_dev_handlers {




    os_dev_open_func_t od_open;






    os_dev_suspend_func_t od_suspend;



    os_dev_resume_func_t od_resume;




    os_dev_close_func_t od_close;
};




struct os_dev {

    struct os_dev_handlers od_handlers;

    os_dev_init_func_t od_init;

    void *od_init_arg;

    uint8_t od_stage;

    uint8_t od_priority;




    uint8_t od_open_ref;

    uint8_t od_flags;

    const char *od_name;
    struct { struct os_dev *stqe_next; } od_next;
};

#define OS_DEV_SETHANDLERS(__dev,__open,__close) (__dev)->od_handlers.od_open = (__open); (__dev)->od_handlers.od_close = (__close);
# 160 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
int os_dev_suspend(struct os_dev *dev, os_time_t suspend_t, uint8_t force);
# 169 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
int os_dev_resume(struct os_dev *dev);
# 185 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
int os_dev_create(struct os_dev *dev, const char *name, uint8_t stage,
        uint8_t priority, os_dev_init_func_t od_init, void *arg);
# 198 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
struct os_dev *os_dev_lookup(const char *name);
# 207 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
int os_dev_initialize_all(uint8_t);
# 219 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
int os_dev_suspend_all(os_time_t, uint8_t);






int os_dev_resume_all(void);
# 237 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
struct os_dev *os_dev_open(const char *devname, uint32_t timo, void *arg);
# 246 "repos/apache-mynewt-core/kernel/os/include/os/os_dev.h"
int os_dev_close(struct os_dev *dev);







void os_dev_reset(void);







void os_dev_walk(int (*walk_func)(struct os_dev *, void *), void *arg);
# 126 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2



# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_heap.h" 1
# 30 "repos/apache-mynewt-core/kernel/os/include/os/os_heap.h"
#define H_OS_HEAP_ 

# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 33 "repos/apache-mynewt-core/kernel/os/include/os/os_heap.h" 2
# 49 "repos/apache-mynewt-core/kernel/os/include/os/os_heap.h"
void *os_malloc(size_t size);
# 59 "repos/apache-mynewt-core/kernel/os/include/os/os_heap.h"
void os_free(void *mem);
# 71 "repos/apache-mynewt-core/kernel/os/include/os/os_heap.h"
void *os_realloc(void *ptr, size_t size);
# 130 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h" 1
# 30 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
#define _OS_MBUF_H 
# 46 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf_pool {




    uint16_t omp_databuf_len;



    struct os_mempool *omp_pool;

    struct { struct os_mbuf_pool *stqe_next; } omp_next;
};





struct os_mbuf_pkthdr {



    uint16_t omp_len;



    uint16_t omp_flags;

    struct { struct os_mbuf_pkthdr *stqe_next; } omp_next;
};




struct os_mbuf {



    uint8_t *om_data;



    uint8_t om_flags;



    uint8_t om_pkthdr_len;



    uint16_t om_len;




    struct os_mbuf_pool *om_omp;

    struct { struct os_mbuf *sle_next; } om_next;




    uint8_t om_databuf[0];
};




struct os_mqueue {
    struct { struct os_mbuf_pkthdr *stqh_first; struct os_mbuf_pkthdr **stqh_last; } mq_head;

    struct os_event mq_ev;
};






#define OS_MBUF_F_MASK(__n) (1 << (__n))






#define OS_MBUF_IS_PKTHDR(__om) ((__om)->om_pkthdr_len >= sizeof (struct os_mbuf_pkthdr))



#define OS_MBUF_PKTHDR(__om) ((struct os_mbuf_pkthdr *) ((uint8_t *)&(__om)->om_data + sizeof(struct os_mbuf)))



#define OS_MBUF_PKTHDR_TO_MBUF(__hdr) (struct os_mbuf *)((uint8_t *)(__hdr) - sizeof(struct os_mbuf))






#define OS_MBUF_PKTLEN(__om) (OS_MBUF_PKTHDR(__om)->omp_len)







#define OS_MBUF_DATA(__om,__type) (__type) ((__om)->om_data)







#define OS_MBUF_USRHDR(om) (void *)((uint8_t *)om + sizeof (struct os_mbuf) + sizeof (struct os_mbuf_pkthdr))
# 172 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
#define OS_MBUF_USRHDR_LEN(om) ((om)->om_pkthdr_len - sizeof (struct os_mbuf_pkthdr))
# 181 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
static inline uint16_t
_os_mbuf_leadingspace(struct os_mbuf *om)
{
    uint16_t startoff;
    uint16_t leadingspace;

    startoff = 0;
    if (((om)->om_pkthdr_len >= sizeof (struct os_mbuf_pkthdr))) {
        startoff = om->om_pkthdr_len;
    }

    leadingspace = (uint16_t) ((uint8_t *) ((om)->om_data) -
        ((uint8_t *) &om->om_databuf[0] + startoff));

    return (leadingspace);
}
# 210 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
#define OS_MBUF_LEADINGSPACE(__om) _os_mbuf_leadingspace(__om)





static inline uint16_t
_os_mbuf_trailingspace(struct os_mbuf *om)
{
    struct os_mbuf_pool *omp;

    omp = om->om_omp;

    return (&om->om_databuf[0] + omp->omp_databuf_len) -
      (om->om_data + om->om_len);
}
# 238 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
#define OS_MBUF_TRAILINGSPACE(__om) _os_mbuf_trailingspace(__om)
# 258 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mqueue_init(struct os_mqueue *mq, os_event_fn *ev_cb, void *arg);
# 267 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_mqueue_get(struct os_mqueue *);
# 279 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mqueue_put(struct os_mqueue *, struct os_eventq *, struct os_mbuf *);
# 297 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_msys_register(struct os_mbuf_pool *);
# 308 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_msys_get(uint16_t dsize, uint16_t leadingspace);




void os_msys_reset(void);
# 324 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_msys_get_pkthdr(uint16_t dsize, uint16_t user_hdr_len);






int os_msys_count(void);






int os_msys_num_free(void);
# 350 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mbuf_pool_init(struct os_mbuf_pool *, struct os_mempool *mp,
        uint16_t, uint16_t);
# 363 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_mbuf_get(struct os_mbuf_pool *omp, uint16_t);
# 373 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_mbuf_get_pkthdr(struct os_mbuf_pool *omp,
        uint8_t pkthdr_len);
# 384 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_mbuf_dup(struct os_mbuf *m);
# 399 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_mbuf_off(const struct os_mbuf *om, int off,
                            uint16_t *out_off);
# 415 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mbuf_copydata(const struct os_mbuf *m, int off, int len, void *dst);
# 429 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
uint16_t os_mbuf_len(const struct os_mbuf *om);
# 440 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mbuf_append(struct os_mbuf *m, const void *, uint16_t);
# 457 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mbuf_appendfrom(struct os_mbuf *dst, const struct os_mbuf *src,
                       uint16_t src_off, uint16_t len);
# 468 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mbuf_free(struct os_mbuf *mb);
# 478 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mbuf_free_chain(struct os_mbuf *om);
# 489 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
void os_mbuf_adj(struct os_mbuf *mp, int req_len);
# 506 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mbuf_cmpf(const struct os_mbuf *om, int off, const void *data, int len);
# 527 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mbuf_cmpm(const struct os_mbuf *om1, uint16_t offset1,
                 const struct os_mbuf *om2, uint16_t offset2,
                 uint16_t len);
# 546 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_mbuf_prepend(struct os_mbuf *om, int len);
# 559 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_mbuf_prepend_pullup(struct os_mbuf *om, uint16_t len);
# 575 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mbuf_copyinto(struct os_mbuf *om, int off, const void *src, int len);
# 585 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
void os_mbuf_concat(struct os_mbuf *first, struct os_mbuf *second);
# 601 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
void *os_mbuf_extend(struct os_mbuf *om, uint16_t len);
# 619 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_mbuf_pullup(struct os_mbuf *om, uint16_t len);
# 630 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
struct os_mbuf *os_mbuf_trim_front(struct os_mbuf *om);
# 645 "repos/apache-mynewt-core/kernel/os/include/os/os_mbuf.h"
int os_mbuf_widen(struct os_mbuf *om, uint16_t off, uint16_t len);
# 131 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h" 1
# 29 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
#define _OS_MEMPOOL_H_ 
# 44 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
struct os_memblock {
    struct { struct os_memblock *sle_next; } mb_next;
};
# 56 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
struct os_mempool {

    uint32_t mp_block_size;

    uint16_t mp_num_blocks;

    uint16_t mp_num_free;

    uint16_t mp_min_free;

    uint8_t mp_flags;

    uint32_t mp_membuf_addr;
    struct { struct os_mempool *stqe_next; } mp_list;
    struct { struct os_memblock *slh_first; };

    char *name;
};





#define OS_MEMPOOL_F_EXT 0x01

struct os_mempool_ext;
# 101 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
typedef os_error_t os_mempool_put_fn(struct os_mempool_ext *ome, void *data,
                                     void *arg);

struct os_mempool_ext {
    struct os_mempool mpe_mp;


    os_mempool_put_fn *mpe_put_cb;
    void *mpe_put_arg;
};

#define OS_MEMPOOL_INFO_NAME_LEN (32)





struct os_mempool_info {

    int omi_block_size;

    int omi_num_blocks;

    int omi_num_free;

    int omi_min_free;

    char omi_name[(32)];
};
# 141 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
struct os_mempool *os_mempool_info_get_next(struct os_mempool *,
        struct os_mempool_info *);
# 155 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
#define OS_MEMPOOL_BLOCK_SZ(sz) (sz)


#define OS_MEMPOOL_SIZE(n,blksize) (((OS_MEMPOOL_BLOCK_SZ(blksize) + 3) / 4) * (n))

typedef uint32_t os_membuf_t;







#define OS_MEMPOOL_BYTES(n,blksize) (sizeof (os_membuf_t) * OS_MEMPOOL_SIZE((n), (blksize)))
# 183 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
os_error_t os_mempool_init(struct os_mempool *mp, uint16_t blocks,
                           uint32_t block_size, void *membuf, char *name);
# 199 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
os_error_t os_mempool_ext_init(struct os_mempool_ext *mpe, uint16_t blocks,
                               uint32_t block_size, void *membuf, char *name);
# 211 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
os_error_t os_mempool_unregister(struct os_mempool *mp);
# 220 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
os_error_t os_mempool_clear(struct os_mempool *mp);
# 232 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"

# 232 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h" 3 4
_Bool 
# 232 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
    os_mempool_is_sane(const struct os_mempool *mp);
# 243 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
int os_memblock_from(const struct os_mempool *mp, const void *block_addr);
# 252 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
void *os_memblock_get(struct os_mempool *mp);
# 264 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
os_error_t os_memblock_put_from_cb(struct os_mempool *mp, void *block_addr);
# 274 "repos/apache-mynewt-core/kernel/os/include/os/os_mempool.h"
os_error_t os_memblock_put(struct os_mempool *mp, void *block_addr);
# 132 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_mutex.h" 1
# 28 "repos/apache-mynewt-core/kernel/os/include/os/os_mutex.h"
#define _OS_MUTEX_H_ 
# 40 "repos/apache-mynewt-core/kernel/os/include/os/os_mutex.h"
struct os_mutex {
    struct { struct os_task *slh_first; } mu_head;
    uint8_t _pad;

    uint8_t mu_prio;

    uint16_t mu_level;

    struct os_task *mu_owner;
};
# 75 "repos/apache-mynewt-core/kernel/os/include/os/os_mutex.h"
os_error_t os_mutex_init(struct os_mutex *mu);
# 87 "repos/apache-mynewt-core/kernel/os/include/os/os_mutex.h"
os_error_t os_mutex_release(struct os_mutex *mu);
# 103 "repos/apache-mynewt-core/kernel/os/include/os/os_mutex.h"
os_error_t os_mutex_pend(struct os_mutex *mu, os_time_t timeout);
# 120 "repos/apache-mynewt-core/kernel/os/include/os/os_mutex.h"
static inline os_error_t os_mutex_get_level(struct os_mutex *mu)
{
    return (os_error_t) mu->mu_level;
}
# 133 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_sanity.h" 1
# 29 "repos/apache-mynewt-core/kernel/os/include/os/os_sanity.h"
#define _OS_SANITY_H 
# 40 "repos/apache-mynewt-core/kernel/os/include/os/os_sanity.h"
struct os_sanity_check;
typedef int (*os_sanity_check_func_t)(struct os_sanity_check *, void *);

struct os_sanity_check {

    os_time_t sc_checkin_last;

    os_time_t sc_checkin_itvl;

    os_sanity_check_func_t sc_func;

    void *sc_arg;

    struct { struct os_sanity_check *sle_next; } sc_next;

};

#define OS_SANITY_CHECK_SETFUNC(__sc,__f,__arg,__itvl) (__sc)->sc_func = (__f); (__sc)->sc_arg = (__arg); (__sc)->sc_checkin_itvl = (__itvl) * OS_TICKS_PER_SEC;





int os_sanity_init(void);
void os_sanity_run(void);


struct os_task;
# 76 "repos/apache-mynewt-core/kernel/os/include/os/os_sanity.h"
int os_sanity_task_checkin(struct os_task *);
# 85 "repos/apache-mynewt-core/kernel/os/include/os/os_sanity.h"
int os_sanity_check_init(struct os_sanity_check *);
# 94 "repos/apache-mynewt-core/kernel/os/include/os/os_sanity.h"
int os_sanity_check_register(struct os_sanity_check *);
# 104 "repos/apache-mynewt-core/kernel/os/include/os/os_sanity.h"
int os_sanity_check_reset(struct os_sanity_check *);
# 134 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_sched.h" 1
# 28 "repos/apache-mynewt-core/kernel/os/include/os/os_sched.h"
#define _OS_SCHED_H 

# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_task.h" 1
# 29 "repos/apache-mynewt-core/kernel/os/include/os/os_task.h"
#define _OS_TASK_H 
# 40 "repos/apache-mynewt-core/kernel/os/include/os/os_task.h"
#define OS_TASK_STACK_DEFINE_NOSTATIC(__name,__size) os_stack_t __name [OS_STACK_ALIGN(__size)] __attribute__((aligned(OS_STACK_ALIGNMENT)))



#define OS_TASK_STACK_DEFINE(__name,__size) static OS_TASK_STACK_DEFINE_NOSTATIC(__name, __size);



#define OS_TASK_PRI_HIGHEST (0)

#define OS_TASK_PRI_LOWEST (0xff)







struct os_task_obj {
    struct { struct os_task *slh_first; } obj_head;
};


typedef enum os_task_state {

    OS_TASK_READY = 1,

    OS_TASK_SLEEP = 2,
} os_task_state_t;


#define OS_TASK_FLAG_NO_TIMEOUT (0x01U)

#define OS_TASK_FLAG_SEM_WAIT (0x02U)

#define OS_TASK_FLAG_MUTEX_WAIT (0x04U)

#define OS_TASK_FLAG_EVQ_WAIT (0x08U)

typedef void (*os_task_func_t)(void *);

#define OS_TASK_MAX_NAME_LEN (32)




struct os_task {

    os_stack_t *t_stackptr;

    os_stack_t *t_stacktop;

    uint16_t t_stacksize;

    uint8_t t_taskid;

    uint8_t t_prio;

    uint8_t t_state;

    uint8_t t_flags;
    uint8_t t_lockcnt;
    uint8_t t_pad;


    const char *t_name;

    os_task_func_t t_func;

    void *t_arg;


    void *t_obj;


    struct os_sanity_check t_sanity_check;


    os_time_t t_next_wakeup;

    os_time_t t_run_time;




    uint32_t t_ctx_sw_cnt;

    struct { struct os_task *stqe_next; } t_os_task_list;
    struct { struct os_task *tqe_next; struct os_task **tqe_prev; } t_os_list;
    struct { struct os_task *sle_next; } t_obj_list;
};


struct os_task_stailq { struct os_task *stqh_first; struct os_task **stqh_last; };

extern struct os_task_stailq g_os_task_list;
# 159 "repos/apache-mynewt-core/kernel/os/include/os/os_task.h"
int os_task_init(struct os_task *, const char *, os_task_func_t, void *,
        uint8_t, os_time_t, os_stack_t *, uint16_t);






int os_task_remove(struct os_task *t);






uint8_t os_task_count(void);




struct os_task_info {

    uint8_t oti_prio;

    uint8_t oti_taskid;

    uint8_t oti_state;

    uint16_t oti_stkusage;

    uint16_t oti_stksize;

    uint32_t oti_cswcnt;

    uint32_t oti_runtime;

    os_time_t oti_last_checkin;

    os_time_t oti_next_checkin;

    char oti_name[(32)];
};
# 232 "repos/apache-mynewt-core/kernel/os/include/os/os_task.h"
struct os_task *os_task_info_get_next(const struct os_task *,
        struct os_task_info *);
# 31 "repos/apache-mynewt-core/kernel/os/include/os/os_sched.h" 2







struct os_task;

struct os_task_list { struct os_task *tqh_first; struct os_task **tqh_last; };

extern struct os_task *g_current_task;
extern struct os_task_list g_os_run_list;
extern struct os_task_list g_os_sleep_list;

void os_sched_ctx_sw_hook(struct os_task *);
# 56 "repos/apache-mynewt-core/kernel/os/include/os/os_sched.h"
struct os_task *os_sched_get_current_task(void);
void os_sched_set_current_task(struct os_task *);
struct os_task *os_sched_next_task(void);
# 92 "repos/apache-mynewt-core/kernel/os/include/os/os_sched.h"
void os_sched(struct os_task *);


void os_sched_os_timer_exp(void);
os_error_t os_sched_insert(struct os_task *);
int os_sched_sleep(struct os_task *, os_time_t nticks);
int os_sched_wakeup(struct os_task *);
int os_sched_remove(struct os_task *);
void os_sched_resort(struct os_task *);
os_time_t os_sched_wakeup_ticks(os_time_t now);
# 135 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_sem.h" 1
# 28 "repos/apache-mynewt-core/kernel/os/include/os/os_sem.h"
#define _OS_SEM_H_ 
# 39 "repos/apache-mynewt-core/kernel/os/include/os/os_sem.h"
struct os_sem {
    struct { struct os_task *slh_first; } sem_head;
    uint16_t _pad;

    uint16_t sem_tokens;
};
# 67 "repos/apache-mynewt-core/kernel/os/include/os/os_sem.h"
os_error_t os_sem_init(struct os_sem *sem, uint16_t tokens);
# 78 "repos/apache-mynewt-core/kernel/os/include/os/os_sem.h"
os_error_t os_sem_release(struct os_sem *sem);
# 96 "repos/apache-mynewt-core/kernel/os/include/os/os_sem.h"
os_error_t os_sem_pend(struct os_sem *sem, os_time_t timeout);




static inline uint16_t os_sem_get_count(struct os_sem *sem)
{
    return sem->sem_tokens;
}
# 136 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2


# 1 "repos/apache-mynewt-core/kernel/os/include/os/os_trace_api.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/os_trace_api.h"
#define OS_TRACE_API_H 
# 31 "repos/apache-mynewt-core/kernel/os/include/os/os_trace_api.h"
# 1 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 1





#define _STDIO_H 



# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdarg.h" 1 3 4
# 31 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdarg.h" 3 4
#define _STDARG_H 
#define _ANSI_STDARG_H_ 

#undef __need___va_list




#define __GNUC_VA_LIST 

# 40 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;






#define va_start(v,l) __builtin_va_start(v,l)
#define va_end(v) __builtin_va_end(v)
#define va_arg(v,l) __builtin_va_arg(v,l)


#define va_copy(d,s) __builtin_va_copy(d,s)

#define __va_copy(d,s) __builtin_va_copy(d,s)
# 99 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;





#define _VA_LIST_ 


#define _VA_LIST 


#define _VA_LIST_DEFINED 


#define _VA_LIST_T_H 


#define __va_list__ 
# 11 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 2
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 12 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/string.h" 1





#define _STRING_H 


# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
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


inline static int strcoll(const char *s1, const char *s2)
{
 return strcmp(s1, s2);
}

inline static size_t strxfrm(char *dest, const char *src, size_t n)
{
 strncpy(dest, src, n);
 return strlen(src);
}
# 13 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 2
# 21 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h"
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



extern FILE* const stdin;
extern FILE* const stdout;
extern FILE* const stderr;


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



struct MemFile
{
    struct File file;
    char *buffer;
    size_t bytes_written;
    size_t size;
};

FILE *fmemopen_w(struct MemFile* storage, char *buffer, size_t size);
# 32 "repos/apache-mynewt-core/kernel/os/include/os/os_trace_api.h" 2







#define OS_TRACE_ID_EVENTQ_PUT (40)
#define OS_TRACE_ID_EVENTQ_GET_NO_WAIT (41)
#define OS_TRACE_ID_EVENTQ_GET (42)
#define OS_TRACE_ID_EVENTQ_REMOVE (43)
#define OS_TRACE_ID_EVENTQ_POLL_0TIMO (44)
#define OS_TRACE_ID_EVENTQ_POLL (45)
#define OS_TRACE_ID_MUTEX_INIT (50)
#define OS_TRACE_ID_MUTEX_RELEASE (51)
#define OS_TRACE_ID_MUTEX_PEND (52)
#define OS_TRACE_ID_SEM_INIT (60)
#define OS_TRACE_ID_SEM_RELEASE (61)
#define OS_TRACE_ID_SEM_PEND (62)
#define OS_TRACE_ID_CALLOUT_INIT (70)
#define OS_TRACE_ID_CALLOUT_STOP (71)
#define OS_TRACE_ID_CALLOUT_RESET (72)
#define OS_TRACE_ID_CALLOUT_TICK (73)
#define OS_TRACE_ID_MEMBLOCK_GET (80)
#define OS_TRACE_ID_MEMBLOCK_PUT_FROM_CB (81)
#define OS_TRACE_ID_MEMBLOCK_PUT (82)
#define OS_TRACE_ID_MBUF_GET (90)
#define OS_TRACE_ID_MBUF_GET_PKTHDR (91)
#define OS_TRACE_ID_MBUF_FREE (92)
#define OS_TRACE_ID_MBUF_FREE_CHAIN (93)
# 209 "repos/apache-mynewt-core/kernel/os/include/os/os_trace_api.h"
static inline void
os_trace_isr_enter(void)
{
}

static inline void
os_trace_isr_exit(void)
{
}

static inline void
os_trace_task_info(const struct os_task *t)
{
}

static inline void
os_trace_task_create(const struct os_task *t)
{
}

static inline void
os_trace_task_start_exec(const struct os_task *t)
{
}

static inline void
os_trace_task_stop_exec(void)
{
}

static inline void
os_trace_task_start_ready(const struct os_task *t)
{
}

static inline void
os_trace_task_stop_ready(const struct os_task *t, unsigned reason)
{
}

static inline void
os_trace_idle(void)
{
}

static inline void
os_trace_user_start(unsigned id)
{
}

static inline void
os_trace_user_stop(unsigned id)
{
}





static inline void
os_trace_api_void(unsigned id)
{
}

static inline void
os_trace_api_u32(unsigned id, uint32_t p0)
{
}

static inline void
os_trace_api_u32x2(unsigned id, uint32_t p0, uint32_t p1)
{
}

static inline void
os_trace_api_u32x3(unsigned id, uint32_t p0, uint32_t p1, uint32_t p2)
{
}

static inline void
os_trace_api_ret(unsigned id)
{
}

static inline void
os_trace_api_ret_u32(unsigned id, uint32_t return_value)
{
}
# 139 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2

# 1 "repos/apache-mynewt-core/kernel/os/include/os/util.h" 1
# 21 "repos/apache-mynewt-core/kernel/os/include/os/util.h"
#define H_OS_UTIL_ 


#define POINTER_TO_UINT(p) ((unsigned int) ((uintptr_t) (p)))
#define UINT_TO_POINTER(u) ((void *) ((uintptr_t) (u)))
#define POINTER_TO_INT(p) ((int) ((intptr_t) (p)))
#define INT_TO_POINTER(u) ((void *) ((intptr_t) (u)))


#define CONTAINER_OF(ptr,type,field) ((type *)(((char *)(ptr)) - offsetof(type, field)))




#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
# 141 "repos/apache-mynewt-core/kernel/os/include/os/os.h" 2
# 28 "repos/apache-mynewt-core/kernel/os/include/os/mynewt.h" 2
# 1 "repos/apache-mynewt-core/sys/defs/include/defs/error.h" 1
# 21 "repos/apache-mynewt-core/sys/defs/include/defs/error.h"
#define H_DEFS_ERROR_ 





#define SYS_EOK (0)
#define SYS_ENOMEM (-1)
#define SYS_EINVAL (-2)
#define SYS_ETIMEOUT (-3)
#define SYS_ENOENT (-4)
#define SYS_EIO (-5)
#define SYS_EAGAIN (-6)
#define SYS_EACCES (-7)
#define SYS_EBUSY (-8)
#define SYS_ENODEV (-9)
#define SYS_ERANGE (-10)
#define SYS_EALREADY (-11)
#define SYS_ENOTSUP (-12)
#define SYS_EUNKNOWN (-13)
#define SYS_EREMOTEIO (-14)
#define SYS_EDONE (-15)

#define SYS_EPERUSER (-65535)
# 29 "repos/apache-mynewt-core/kernel/os/include/os/mynewt.h" 2
# 1 "repos/apache-mynewt-core/sys/sys/include/sys/debug_panic.h" 1
# 21 "repos/apache-mynewt-core/sys/sys/include/sys/debug_panic.h"
#define H_DEBUG_PANIC_ 

# 1 "repos/apache-mynewt-core/kernel/os/include/os/mynewt.h" 1
# 24 "repos/apache-mynewt-core/sys/sys/include/sys/debug_panic.h" 2


#define DEBUG_PANIC() OS_CRASH()





#define DEBUG_ASSERT(expr) ((expr) ? (void)0 : OS_CRASH())
# 30 "repos/apache-mynewt-core/kernel/os/include/os/mynewt.h" 2



# 1 "bin/targets/bluepill_my_sensor/generated/include/logcfg/logcfg.h" 1





#define H_MYNEWT_LOGCFG_ 
# 34 "repos/apache-mynewt-core/kernel/os/include/os/mynewt.h" 2
# 24 "libs/semihosting_console/include/console/console.h" 2





struct os_eventq;







struct console_input {


    char line[(256)];
};

typedef void (*console_rx_cb)(void);
typedef int (*console_append_char_cb)(char *line, uint8_t byte);
typedef void (*completion_cb)(char *str, console_append_char_cb cb);


void console_buffer(const char *buffer, unsigned int length);
void console_printhex(uint8_t v);
void console_printfloat(float f);
void console_dump(const uint8_t *buffer, unsigned int len);
void console_flush(void);




void console_deinit(void);



void console_reinit(void);
int console_init(console_rx_cb rx_cb);
int console_is_init(void);
void console_write(const char *str, int cnt);
void console_blocking_mode(void);
void console_non_blocking_mode(void);
void console_echo(int on);

int console_printf(const char *fmt, ...)
    __attribute__ ((format (printf, 1, 2)));;

void console_set_completion_cb(completion_cb cb);
int console_handle_char(uint8_t byte);


void console_line_queue_set(struct os_eventq *evq);

void console_line_event_put(struct os_event *ev);



extern 
# 82 "libs/semihosting_console/include/console/console.h" 3 4
      _Bool 
# 82 "libs/semihosting_console/include/console/console.h"
           g_silence_console;



extern 
# 86 "libs/semihosting_console/include/console/console.h" 3 4
      _Bool 
# 86 "libs/semihosting_console/include/console/console.h"
           g_console_input_ignore;
# 95 "libs/semihosting_console/include/console/console.h"
static void inline
console_silence(
# 96 "libs/semihosting_console/include/console/console.h" 3 4
               _Bool 
# 96 "libs/semihosting_console/include/console/console.h"
                    silent)
{
    g_silence_console = silent;
}
# 108 "libs/semihosting_console/include/console/console.h"
static void inline
console_input_ignore(
# 109 "libs/semihosting_console/include/console/console.h" 3 4
                    _Bool 
# 109 "libs/semihosting_console/include/console/console.h"
                         ignore)
{
    g_console_input_ignore = ignore;
}

extern int console_is_midline;
extern int console_out(int character);
extern void console_rx_restart(void);

int console_lock(int timeout);
int console_unlock(void);
# 17 "apps/my_sensor_app/src/send_coap.c" 2
# 1 "libs/sensor_network/include/sensor_network/sensor_network.h" 1
# 39 "libs/sensor_network/include/sensor_network/sensor_network.h"
#define __SENSOR_NETWORK_H__ 


# 1 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h" 1
# 21 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
#define __SENSOR_H__ 
# 46 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
void sensor_pkg_init(void);



struct sensor;

typedef enum {

    SENSOR_TYPE_NONE = 0,

    SENSOR_TYPE_ACCELEROMETER = (1 << 0),

    SENSOR_TYPE_MAGNETIC_FIELD = (1 << 1),

    SENSOR_TYPE_GYROSCOPE = (1 << 2),

    SENSOR_TYPE_LIGHT = (1 << 3),

    SENSOR_TYPE_TEMPERATURE = (1 << 4),

    SENSOR_TYPE_AMBIENT_TEMPERATURE = (1 << 5),

    SENSOR_TYPE_PRESSURE = (1 << 6),

    SENSOR_TYPE_PROXIMITY = (1 << 7),

    SENSOR_TYPE_RELATIVE_HUMIDITY = (1 << 8),

    SENSOR_TYPE_ROTATION_VECTOR = (1 << 9),

    SENSOR_TYPE_ALTITUDE = (1 << 10),

    SENSOR_TYPE_WEIGHT = (1 << 11),

    SENSOR_TYPE_LINEAR_ACCEL = (1 << 12),

    SENSOR_TYPE_GRAVITY = (1 << 13),

    SENSOR_TYPE_EULER = (1 << 14),

    SENSOR_TYPE_COLOR = (1 << 15),




    SENSOR_TYPE_USER_DEFINED_1 = (1 << 26),

    SENSOR_TYPE_USER_DEFINED_2 = (1 << 27),

    SENSOR_TYPE_USER_DEFINED_3 = (1 << 28),

    SENSOR_TYPE_USER_DEFINED_4 = (1 << 29),

    SENSOR_TYPE_USER_DEFINED_5 = (1 << 30),

    SENSOR_TYPE_USER_DEFINED_6 = (1 << 31),

    SENSOR_TYPE_ALL = 0xFFFFFFFF
} sensor_type_t;

typedef enum {

    SENSOR_EVENT_TYPE_DOUBLE_TAP = (1 << 0),

    SENSOR_EVENT_TYPE_SINGLE_TAP = (1 << 1),

    SENSOR_EVENT_TYPE_FREE_FALL = (1 << 2),

    SENSOR_EVENT_TYPE_SLEEP_CHANGE = (1 << 3),

    SENSOR_EVENT_TYPE_WAKEUP = (1 << 4),

    SENSOR_EVENT_TYPE_SLEEP = (1 << 5),

    SENSOR_EVENT_TYPE_ORIENT_CHANGE = (1 << 6),

    SENSOR_EVENT_TYPE_ORIENT_X_CHANGE = (1 << 7),

    SENSOR_EVENT_TYPE_ORIENT_Y_CHANGE = (1 << 8),

    SENSOR_EVENT_TYPE_ORIENT_Z_CHANGE = (1 << 9),

    SENSOR_EVENT_TYPE_ORIENT_X_L_CHANGE = (1 << 10),

    SENSOR_EVENT_TYPE_ORIENT_Y_L_CHANGE = (1 << 11),

    SENSOR_EVENT_TYPE_ORIENT_Z_L_CHANGE = (1 << 12),

    SENSOR_EVENT_TYPE_ORIENT_X_H_CHANGE = (1 << 13),

    SENSOR_EVENT_TYPE_ORIENT_Y_H_CHANGE = (1 << 14),

    SENSOR_EVENT_TYPE_ORIENT_Z_H_CHANGE = (1 << 15),
} sensor_event_type_t;






#define SENSOR_VALUE_TYPE_OPAQUE (0)



#define SENSOR_VALUE_TYPE_INT32 (1)



#define SENSOR_VALUE_TYPE_FLOAT (2)



#define SENSOR_VALUE_TYPE_INT32_TRIPLET (3)



#define SENSOR_VALUE_TYPE_FLOAT_TRIPLET (4)




#define SENSOR_ITF_SPI (0)
#define SENSOR_ITF_I2C (1)
#define SENSOR_ITF_UART (2)




#define SENSOR_THRESH_ALGO_WINDOW 0x1
#define SENSOR_THRESH_ALGO_WATERMARK 0x2
#define SENSOR_THRESH_ALGO_USERDEF 0x3




#define SENSOR_IGN_LISTENER 1




#define STANDARD_ACCEL_GRAVITY 9.80665F





struct sensor_cfg {




    uint8_t sc_valtype;

    uint8_t _reserved[3];
};

typedef union {
    struct sensor_mag_data *smd;
    struct sensor_accel_data *sad;
    struct sensor_euler_data *sed;
    struct sensor_quat_data *sqd;
    struct sensor_accel_data *slad;
    struct sensor_accel_data *sgrd;
    struct sensor_gyro_data *sgd;
    struct sensor_temp_data *std;
    struct sensor_temp_data *satd;
    struct sensor_light_data *sld;
    struct sensor_color_data *scd;
    struct sensor_press_data *spd;
    struct sensor_humid_data *srhd;
}sensor_data_t;
# 228 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int (*sensor_data_func_t)(struct sensor *, void *, void *,
             sensor_type_t);
# 238 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int
(*sensor_trigger_notify_func_t)(struct sensor *, void *, sensor_type_t);
# 250 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int
(*sensor_trigger_cmp_func_t)(sensor_type_t, sensor_data_t *,
                             sensor_data_t *, void *);
# 261 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int
(*sensor_notifier_func_t)(struct sensor *, void *, sensor_event_type_t);
# 272 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef void
(*sensor_error_func_t)(struct sensor *sensor, void *arg, int status);




struct sensor_listener {




    sensor_type_t sl_sensor_type;


    sensor_data_func_t sl_func;


    void *sl_arg;




    struct { struct sensor_listener *sle_next; } sl_next;
};




struct sensor_notifier {




    sensor_event_type_t sn_sensor_event_type;




    sensor_notifier_func_t sn_func;


    void *sn_arg;




    struct { struct sensor_notifier *sle_next; } sn_next;
};




struct sensor_read_ev_ctx {

    struct sensor *srec_sensor;

    sensor_type_t srec_type;
};




struct sensor_type_traits {

    sensor_type_t stt_sensor_type;


    sensor_data_t stt_low_thresh;


    sensor_data_t stt_high_thresh;


    uint8_t stt_algo;


    uint16_t stt_poll_n;

    uint16_t stt_polls_left;






    sensor_trigger_cmp_func_t stt_trigger_cmp_algo;






    struct sensor *stt_sensor;




    struct { struct sensor_type_traits *sle_next; } stt_next;
};

struct sensor_notify_ev_ctx {

    struct sensor *snec_sensor;

    sensor_event_type_t snec_evtype;
};

struct sensor_notify_os_ev {

    struct os_event snoe_evt;

    sensor_event_type_t snoe_evtype;

    struct sensor *snoe_sensor;
};
# 403 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int (*sensor_read_func_t)(struct sensor *, sensor_type_t,
        sensor_data_func_t, void *, uint32_t);
# 416 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int (*sensor_get_config_func_t)(struct sensor *, sensor_type_t,
        struct sensor_cfg *);
# 427 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int (*sensor_set_config_func_t)(struct sensor *, void *);
# 439 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int (*sensor_set_trigger_thresh_t)(struct sensor *, sensor_type_t,
                                           struct sensor_type_traits *stt);
# 451 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int (*sensor_clear_trigger_thresh_t)(struct sensor *sensor, sensor_type_t type);
# 463 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int (*sensor_set_notification_t)(struct sensor *,
                                         sensor_event_type_t);
# 475 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int (*sensor_unset_notification_t)(struct sensor *,
                                           sensor_event_type_t);
# 485 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int (*sensor_handle_interrupt_t)(struct sensor *sensor);
# 494 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
typedef int (*sensor_reset_t)(struct sensor *);


struct sensor_driver {
    sensor_read_func_t sd_read;
    sensor_get_config_func_t sd_get_config;
    sensor_set_config_func_t sd_set_config;
    sensor_set_trigger_thresh_t sd_set_trigger_thresh;
    sensor_clear_trigger_thresh_t sd_clear_low_trigger_thresh;
    sensor_clear_trigger_thresh_t sd_clear_high_trigger_thresh;
    sensor_set_notification_t sd_set_notification;
    sensor_unset_notification_t sd_unset_notification;
    sensor_handle_interrupt_t sd_handle_interrupt;
    sensor_reset_t sd_reset;
};

struct sensor_timestamp {
    struct os_timeval st_ostv;
    struct os_timezone st_ostz;
    uint32_t st_cputime;
};

struct sensor_int {
    uint8_t host_pin;
    uint8_t device_pin;
    uint8_t active;
};

struct sensor_itf {






    uint8_t si_type;


    uint8_t si_num;


    uint8_t si_cs_pin;


    uint16_t si_addr;


    struct os_mutex *si_lock;



    uint8_t si_low_pin;


    uint8_t si_high_pin;




    struct sensor_int si_ints[(2)];
};




#define SENSOR_GET_DEVICE(__s) ((__s)->s_dev)




#define SENSOR_GET_ITF(__s) (&((__s)->s_itf))





#define SENSOR_DATA_CMP_GT(__d,__t,__f) ( ((__d->__f ##_is_valid) && (__t->__f ##_is_valid)) ? (__d->__f > __t->__f) : (0))






#define SENSOR_DATA_CMP_LT(__d,__t,__f) ( ((__d->__f ##_is_valid) && (__t->__f ##_is_valid)) ? (__d->__f < __t->__f) : (0))


struct sensor {



    struct os_dev *s_dev;


    struct os_mutex s_lock;






    sensor_type_t s_types;


    sensor_type_t s_mask;



    uint32_t s_poll_rate;


    os_time_t s_next_run;




    struct sensor_driver *s_funcs;


    struct sensor_timestamp s_sts;


    struct sensor_itf s_itf;


    struct os_event s_interrupt_evt;




    struct { struct sensor_listener *slh_first; } s_listener_list;


    sensor_error_func_t s_err_fn;
    void *s_err_arg;




    struct { struct sensor_notifier *slh_first; } s_notifier_list;


    struct { struct sensor_type_traits *slh_first; } s_type_traits_list;


    struct { struct sensor *sle_next; } s_next;
};




struct sensor_read_ctx {
    sensor_data_func_t user_func;
    void *user_arg;
};
# 657 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int
sensor_itf_lock(struct sensor_itf *si, os_time_t timeout);
# 667 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
void
sensor_itf_unlock(struct sensor_itf *si);
# 678 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_init(struct sensor *sensor, struct os_dev *dev);
# 687 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_lock(struct sensor *sensor);






void sensor_unlock(struct sensor *sensor);
# 717 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_register_listener(struct sensor *sensor, struct sensor_listener *listener);
# 728 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_unregister_listener(struct sensor *sensor, struct sensor_listener *listener);
# 740 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_register_err_func(struct sensor *sensor,
        sensor_error_func_t err_fn, void *arg);
# 762 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_register_notifier(struct sensor *sensor, struct sensor_notifier *notifier);
# 773 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_unregister_notifier(struct sensor *sensor, struct sensor_notifier *notifier);
# 796 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_read(struct sensor *sensor, sensor_type_t type,
                sensor_data_func_t data_func, void *arg,
                uint32_t timeout);
# 810 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
static inline int
sensor_set_driver(struct sensor *sensor, sensor_type_t type,
        struct sensor_driver *driver)
{
    sensor->s_funcs = driver;
    sensor->s_types = type;

    return (0);
}
# 828 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
static inline int
sensor_set_type_mask(struct sensor *sensor, sensor_type_t mask)
{
    sensor->s_mask = mask;

    return (0);
}
# 844 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
static inline sensor_type_t
sensor_check_type(struct sensor *sensor, sensor_type_t type)
{
    return (sensor_type_t) (sensor->s_types & sensor->s_mask & type);
}







static inline int
sensor_set_interface(struct sensor *sensor, struct sensor_itf *s_itf)
{
    memcpy(&sensor->s_itf, s_itf, sizeof(*s_itf));
    return (0);
}
# 873 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
static inline int
sensor_get_config(struct sensor *sensor, sensor_type_t type,
        struct sensor_cfg *cfg)
{
    return (sensor->s_funcs->sd_get_config(sensor, type, cfg));
}
# 899 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_mgr_lock(void);




void sensor_mgr_unlock(void);
# 914 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_mgr_register(struct sensor *sensor);







struct os_eventq *sensor_mgr_evq_get(void);


typedef int (*sensor_mgr_compare_func_t)(struct sensor *, void *);
# 947 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
struct sensor *sensor_mgr_find_next(sensor_mgr_compare_func_t, void *,
        struct sensor *);
# 962 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
struct sensor *sensor_mgr_find_next_bytype(sensor_type_t type, struct sensor *sensor);
# 973 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
struct sensor *sensor_mgr_find_next_bydevname(const char *devname,
                                              struct sensor *prev_cursor);
# 984 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int sensor_mgr_match_bytype(struct sensor *sensor, void *);







int
sensor_set_poll_rate_ms(const char *devname, uint32_t poll_rate);







int
sensor_set_n_poll_rate(const char *devname, struct sensor_type_traits *stt);
# 1013 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int
sensor_oic_tx_trigger(struct sensor *sensor, void *arg, sensor_type_t type);
# 1023 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
void
sensor_trigger_init(struct sensor *sensor, sensor_type_t type,
                    sensor_trigger_notify_func_t notify);
# 1036 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
struct sensor_type_traits *
sensor_get_type_traits_bytype(sensor_type_t type, struct sensor *sensor);
# 1048 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
struct sensor *
sensor_get_type_traits_byname(const char *, struct sensor_type_traits **,
                              sensor_type_t);
# 1060 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int
sensor_set_thresh(const char *devname, struct sensor_type_traits *stt);
# 1071 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int
sensor_clear_low_thresh(const char *devname, sensor_type_t type);
# 1082 "repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h"
int
sensor_clear_high_thresh(const char *devname, sensor_type_t type);







void
sensor_mgr_put_notify_evt(struct sensor_notify_ev_ctx *ctx,
                          sensor_event_type_t evtype);






void
sensor_mgr_put_interrupt_evt(struct sensor *sensor);






void
sensor_mgr_put_read_evt(void *arg);






int
sensor_reset(struct sensor *sensor);
# 43 "libs/sensor_network/include/sensor_network/sensor_network.h" 2
# 53 "libs/sensor_network/include/sensor_network/sensor_network.h"
#define SERVER_INTERFACE_TYPE 0
#define COLLECTOR_INTERFACE_TYPE 1
#define MAX_INTERFACE_TYPES 2
#define MAX_ENDPOINT_SIZE 16
#define SENSOR_NETWORK_SIZE 5


struct sensor_network_interface {
    uint8_t iface_type;
    const char *network_device;
    uint8_t server_endpoint_size;
    int (*register_transport_func)(const char *network_device, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size);
    uint8_t transport_registered;
};

struct sensor_value;





int register_server_transport(void);


int register_collector_transport(void);


int sensor_network_register_transport(uint8_t iface_type);








# 88 "libs/sensor_network/include/sensor_network/sensor_network.h" 3 4
_Bool 
# 88 "libs/sensor_network/include/sensor_network/sensor_network.h"
    init_server_post(const char *uri);





# 93 "libs/sensor_network/include/sensor_network/sensor_network.h" 3 4
_Bool 
# 93 "libs/sensor_network/include/sensor_network/sensor_network.h"
    init_collector_post(void);





# 98 "libs/sensor_network/include/sensor_network/sensor_network.h" 3 4
_Bool 
# 98 "libs/sensor_network/include/sensor_network/sensor_network.h"
    sensor_network_init_post(uint8_t iface_type, const char *uri);








# 106 "libs/sensor_network/include/sensor_network/sensor_network.h" 3 4
_Bool 
# 106 "libs/sensor_network/include/sensor_network/sensor_network.h"
    do_server_post(void);





# 111 "libs/sensor_network/include/sensor_network/sensor_network.h" 3 4
_Bool 
# 111 "libs/sensor_network/include/sensor_network/sensor_network.h"
    do_collector_post(void);





# 116 "libs/sensor_network/include/sensor_network/sensor_network.h" 3 4
_Bool 
# 116 "libs/sensor_network/include/sensor_network/sensor_network.h"
    sensor_network_do_post(uint8_t iface_type);







# 123 "libs/sensor_network/include/sensor_network/sensor_network.h" 3 4
_Bool 
# 123 "libs/sensor_network/include/sensor_network/sensor_network.h"
    is_collector_node(void);




# 127 "libs/sensor_network/include/sensor_network/sensor_network.h" 3 4
_Bool 
# 127 "libs/sensor_network/include/sensor_network/sensor_network.h"
    is_sensor_node(void);



# 130 "libs/sensor_network/include/sensor_network/sensor_network.h" 3 4
_Bool 
# 130 "libs/sensor_network/include/sensor_network/sensor_network.h"
    is_standalone_node(void);



# 133 "libs/sensor_network/include/sensor_network/sensor_network.h" 3 4
_Bool 
# 133 "libs/sensor_network/include/sensor_network/sensor_network.h"
    should_send_to_collector(struct sensor_value *val, const char *device_name);





const uint8_t *get_hardware_id(void);


const char *get_device_id(void);


unsigned long long get_collector_node_address(void);


unsigned long long get_sensor_node_address(void);


const unsigned long long *get_sensor_node_addresses(void);


const char **get_sensor_node_names(void);





void sensor_network_init(void);


int sensor_network_register_interface(const struct sensor_network_interface *iface);
# 18 "apps/my_sensor_app/src/send_coap.c" 2
# 1 "libs/sensor_coap/include/sensor_coap/sensor_coap.h" 1




#define __SENSOR_COAP_H__ 
# 14 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
struct sensor_value {
    const char *key;
    int val_type;
    uint16_t int_val;
    float float_val;
};




#define COAP_PORT_UNSECURED (5683)

struct oc_server_handle;


void init_sensor_coap(void);



# 32 "libs/sensor_coap/include/sensor_coap/sensor_coap.h" 3 4
_Bool 
# 32 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
    sensor_coap_ready(void);




# 36 "libs/sensor_coap/include/sensor_coap/sensor_coap.h" 3 4
_Bool 
# 36 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
    init_sensor_post(struct oc_server_handle *server, const char *uri, int coap_content_format);



# 39 "libs/sensor_coap/include/sensor_coap/sensor_coap.h" 3 4
_Bool 
# 39 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
    do_sensor_post(void);





# 1 "repos/apache-mynewt-core/encoding/json/include/json/json.h" 1
# 21 "repos/apache-mynewt-core/encoding/json/include/json/json.h"
#define _JSON_H_ 



# 1 "repos/apache-mynewt-core/libc/baselibc/include/ctype.h" 1







#define _CTYPE_H 
# 17 "repos/apache-mynewt-core/libc/baselibc/include/ctype.h"
extern inline __attribute__((gnu_inline)) int isupper(int __c)
{
 return __c >= 'A' && __c <= 'Z';
}

extern inline __attribute__((gnu_inline)) int islower(int __c)
{
 return __c >= 'a' && __c <= 'z';
}

extern inline __attribute__((gnu_inline)) int isalpha(int __c)
{
 return islower(__c) || isupper(__c);
}

extern inline __attribute__((gnu_inline)) int isdigit(int __c)
{
 return ((unsigned)__c - '0') <= 9;
}

extern inline __attribute__((gnu_inline)) int isalnum(int __c)
{
 return isalpha(__c) || isdigit(__c);
}

extern inline __attribute__((gnu_inline)) int isascii(int __c)
{
 return !(__c & ~0x7f);
}

extern inline __attribute__((gnu_inline)) int isblank(int __c)
{
 return (__c == '\t') || (__c == ' ');
}

extern inline __attribute__((gnu_inline)) int iscntrl(int __c)
{
 return __c < 0x20;
}

extern inline __attribute__((gnu_inline)) int isspace(int __c)
{
 return __c == ' ' || __c == '\n' || __c == '\t' || __c == '\r';
}

extern inline __attribute__((gnu_inline)) int isxdigit(int __c)
{
 return isdigit(__c) || (__c >= 'a' && __c <= 'f') || (__c >= 'A' && __c <= 'F');
}

extern inline __attribute__((gnu_inline)) int ispunct(int __c)
{
 return (__c >= '!' && __c <= '/') ||
     (__c >= ':' && __c <= '@') ||
     (__c >= '[' && __c <= '`') ||
     (__c >= '{' && __c <= '~');
}

extern inline __attribute__((gnu_inline)) int isprint(int __c)
{
 return (__c >= 0x20 && __c <= 0x7e);
}

extern inline __attribute__((gnu_inline)) int isgraph(int __c)
{
 return (__c > 0x20 && __c < 0x7f);
}

extern inline __attribute__((gnu_inline)) int toupper(int __c)
{
 return islower(__c) ? (__c & ~32) : __c;
}

extern inline __attribute__((gnu_inline)) int tolower(int __c)
{
 return isupper(__c) ? (__c | 32) : __c;
}
# 26 "repos/apache-mynewt-core/encoding/json/include/json/json.h" 2

# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 1 3
# 20 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 3
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/_ansi.h" 1 3







#define _ANSIDECL_H_ 

# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/newlib.h" 1 3







#define __NEWLIB_H__ 1
# 18 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/newlib.h" 3
#define _WANT_IO_C99_FORMATS 1


#define _WANT_IO_LONG_LONG 1


#define _WANT_REGISTER_FINI 1
# 40 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/newlib.h" 3
#define _MB_LEN_MAX 1
# 50 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/newlib.h" 3
#define HAVE_INITFINI_ARRAY 1



#define _ATEXIT_DYNAMIC_ALLOC 1


#define _HAVE_LONG_DOUBLE 1


#define _HAVE_CC_INHIBIT_LOOP_TO_LIBCALL 1


#define _LDBL_EQ_DBL 1


#define _FVWRITE_IN_STREAMIO 1


#define _FSEEK_OPTIMIZATION 1


#define _WIDE_ORIENT 1


#define _UNBUF_STREAM_OPT 1
# 92 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/newlib.h" 3
#define _RETARGETABLE_LOCKING 1
# 11 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/config.h" 1 3

#define __SYS_CONFIG_H__ 

# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 77 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/ieeefp.h" 3
#define __IEEE_LITTLE_ENDIAN 
# 453 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/ieeefp.h" 3
#define __OBSOLETE_MATH_DEFAULT 1


#define __OBSOLETE_MATH __OBSOLETE_MATH_DEFAULT
# 5 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/config.h" 2 3
# 220 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/config.h" 3
#define _POINTER_INT long





#undef __RAND_MAX



#define __RAND_MAX 0x7fffffff
# 246 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/config.h" 3
#define __EXPORT 



#define __IMPORT 






#define _READ_WRITE_RETURN_TYPE int





#define _READ_WRITE_BUFSIZE_TYPE int
# 12 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/_ansi.h" 2 3
# 31 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/_ansi.h" 3
#define _BEGIN_STD_C 
#define _END_STD_C 
#define _NOTHROW 



#define _LONG_DOUBLE long double





#define _ATTRIBUTE(attrs) __attribute__ (attrs)
# 69 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/_ansi.h" 3
#define _ELIDABLE_INLINE static __inline__



#define _NOINLINE __attribute__ ((__noinline__))
#define _NOINLINE_STATIC _NOINLINE static
# 21 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 1 3
# 41 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define _SYS_CDEFS_H_ 



# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 46 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 2 3

#define __PMT(args) args
#define __DOTS , ...
#define __THROW 


#define __ASMNAME(cname) __XSTRING (__USER_LABEL_PREFIX__) cname


#define __ptr_t void *
#define __long_double_t long double

#define __attribute_malloc__ 
#define __attribute_pure__ 
#define __attribute_format_strfmon__(a,b) 
#define __flexarr [0]


#define __bounded 
#define __unbounded 
#define __ptrvalue 
# 76 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __has_extension __has_feature


#define __has_feature(x) 0
# 92 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __BEGIN_DECLS 
#define __END_DECLS 
# 105 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __GNUCLIKE_ASM 3
#define __GNUCLIKE_MATH_BUILTIN_CONSTANTS 



#define __GNUCLIKE___TYPEOF 1
#define __GNUCLIKE___OFFSETOF 1
#define __GNUCLIKE___SECTION 1


#define __GNUCLIKE_CTOR_SECTION_HANDLING 1


#define __GNUCLIKE_BUILTIN_CONSTANT_P 1






#define __GNUCLIKE_BUILTIN_VARARGS 1
#define __GNUCLIKE_BUILTIN_STDARG 1
#define __GNUCLIKE_BUILTIN_VAALIST 1



#define __GNUC_VA_LIST_COMPATIBILITY 1






#define __compiler_membar() __asm __volatile(" " : : : "memory")



#define __GNUCLIKE_BUILTIN_NEXT_ARG 1
#define __GNUCLIKE_MATH_BUILTIN_RELOPS 


#define __GNUCLIKE_BUILTIN_MEMCPY 1


#define __CC_SUPPORTS_INLINE 1
#define __CC_SUPPORTS___INLINE 1
#define __CC_SUPPORTS___INLINE__ 1

#define __CC_SUPPORTS___FUNC__ 1
#define __CC_SUPPORTS_WARNING 1

#define __CC_SUPPORTS_VARADIC_XXX 1

#define __CC_SUPPORTS_DYNAMIC_ARRAY_INIT 1
# 175 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __P(protos) protos
#define __CONCAT1(x,y) x ## y
#define __CONCAT(x,y) __CONCAT1(x,y)
#define __STRING(x) #x
#define __XSTRING(x) __STRING(x)

#define __const const
#define __signed signed
#define __volatile volatile
# 239 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __weak_symbol __attribute__((__weak__))
# 252 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __dead2 __attribute__((__noreturn__))
#define __pure2 __attribute__((__const__))
#define __unused __attribute__((__unused__))
#define __used __attribute__((__used__))
#define __packed __attribute__((__packed__))
#define __aligned(x) __attribute__((__aligned__(x)))
#define __section(x) __attribute__((__section__(x)))


#define __alloc_size(x) __attribute__((__alloc_size__(x)))




#define __alloc_align(x) __attribute__((__alloc_align__(x)))
# 356 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __generic(expr,t,yes,no) _Generic(expr, t: yes, default: no)
# 374 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __min_size(x) static (x)





#define __malloc_like __attribute__((__malloc__))
#define __pure __attribute__((__pure__))






#define __always_inline __inline__ __attribute__((__always_inline__))





#define __noinline __attribute__ ((__noinline__))





#define __nonnull(x) __attribute__((__nonnull__ x))
#define __nonnull_all __attribute__((__nonnull__))






#define __fastcall __attribute__((__fastcall__))
#define __result_use_check __attribute__((__warn_unused_result__))






#define __returns_twice __attribute__((__returns_twice__))





#define __unreachable() __builtin_unreachable()
# 442 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __restrict restrict
# 475 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __predict_true(exp) __builtin_expect((exp), 1)
#define __predict_false(exp) __builtin_expect((exp), 0)






#define __null_sentinel __attribute__((__sentinel__))
#define __exported __attribute__((__visibility__("default")))


#define __hidden __attribute__((__visibility__("hidden")))
# 497 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __offsetof(type,field) offsetof(type, field)
#define __rangeof(type,start,end) (__offsetof(type, end) - __offsetof(type, start))
# 508 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __containerof(x,s,m) ({ const volatile __typeof(((s *)0)->m) *__x = (x); __DEQUALIFY(s *, (const volatile char *)__x - __offsetof(s, m));})
# 530 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __printflike(fmtarg,firstvararg) __attribute__((__format__ (__printf__, fmtarg, firstvararg)))

#define __scanflike(fmtarg,firstvararg) __attribute__((__format__ (__scanf__, fmtarg, firstvararg)))

#define __format_arg(fmtarg) __attribute__((__format_arg__ (fmtarg)))
#define __strfmonlike(fmtarg,firstvararg) __attribute__((__format__ (__strfmon__, fmtarg, firstvararg)))

#define __strftimelike(fmtarg,firstvararg) __attribute__((__format__ (__strftime__, fmtarg, firstvararg)))
# 547 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __printf0like(fmtarg,firstvararg) 




#define __strong_reference(sym,aliassym) extern __typeof (sym) aliassym __attribute__ ((__alias__ (#sym)))




#define __weak_reference(sym,alias) __asm__(".weak " #alias); __asm__(".equ " #alias ", " #sym)


#define __warn_references(sym,msg) __asm__(".section .gnu.warning." #sym); __asm__(".asciz \"" msg "\""); __asm__(".previous")



#define __sym_compat(sym,impl,verid) __asm__(".symver " #impl ", " #sym "@" #verid)

#define __sym_default(sym,impl,verid) __asm__(".symver " #impl ", " #sym "@@" #verid)
# 601 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __FBSDID(s) struct __hack



#define __RCSID(s) struct __hack



#define __RCSID_SOURCE(s) struct __hack



#define __SCCSID(s) struct __hack



#define __COPYRIGHT(s) struct __hack



#define __DECONST(type,var) ((type)(__uintptr_t)(const void *)(var))



#define __DEVOLATILE(type,var) ((type)(__uintptr_t)(volatile void *)(var))



#define __DEQUALIFY(type,var) ((type)(__uintptr_t)(const volatile void *)(var))






#define _Nonnull 
#define _Nullable 
#define _Null_unspecified 
#define __NULLABILITY_PRAGMA_PUSH 
#define __NULLABILITY_PRAGMA_POP 
# 661 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __arg_type_tag(arg_kind,arg_idx,type_tag_idx) 
#define __datatype_type_tag(kind,type) 
# 680 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/cdefs.h" 3
#define __lock_annotate(x) 





#define __lockable __lock_annotate(lockable)


#define __locks_exclusive(...) __lock_annotate(exclusive_lock_function(__VA_ARGS__))

#define __locks_shared(...) __lock_annotate(shared_lock_function(__VA_ARGS__))



#define __trylocks_exclusive(...) __lock_annotate(exclusive_trylock_function(__VA_ARGS__))

#define __trylocks_shared(...) __lock_annotate(shared_trylock_function(__VA_ARGS__))



#define __unlocks(...) __lock_annotate(unlock_function(__VA_ARGS__))


#define __asserts_exclusive(...) __lock_annotate(assert_exclusive_lock(__VA_ARGS__))

#define __asserts_shared(...) __lock_annotate(assert_shared_lock(__VA_ARGS__))



#define __requires_exclusive(...) __lock_annotate(exclusive_locks_required(__VA_ARGS__))

#define __requires_shared(...) __lock_annotate(shared_locks_required(__VA_ARGS__))

#define __requires_unlocked(...) __lock_annotate(locks_excluded(__VA_ARGS__))



#define __no_lock_analysis __lock_annotate(no_thread_safety_analysis)


#define __guarded_by(x) __lock_annotate(guarded_by(x))
#define __pt_guarded_by(x) __lock_annotate(pt_guarded_by(x))
# 22 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_types.h" 1 3





#define _MACHINE__TYPES_H 
# 23 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 2 3






# 28 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef int register_t;
#define __BIT_TYPES_DEFINED__ 1
# 60 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 3
#define _SYS_TYPES_H 

# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 63 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_types.h" 1 3
# 20 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_types.h" 3
#define _SYS__TYPES_H 




# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/lock.h" 1 3

#define __SYS_LOCK_H__ 
# 33 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/lock.h" 3
struct __lock;
typedef struct __lock * _LOCK_T;
#define _LOCK_RECURSIVE_T _LOCK_T

#define __LOCK_INIT(class,lock) extern struct __lock __lock_ ## lock; class _LOCK_T lock = &__lock_ ## lock

#define __LOCK_INIT_RECURSIVE(class,lock) __LOCK_INIT(class,lock)

extern void __retarget_lock_init(_LOCK_T *lock);
#define __lock_init(lock) __retarget_lock_init(&lock)
extern void __retarget_lock_init_recursive(_LOCK_T *lock);
#define __lock_init_recursive(lock) __retarget_lock_init_recursive(&lock)
extern void __retarget_lock_close(_LOCK_T lock);
#define __lock_close(lock) __retarget_lock_close(lock)
extern void __retarget_lock_close_recursive(_LOCK_T lock);
#define __lock_close_recursive(lock) __retarget_lock_close_recursive(lock)
extern void __retarget_lock_acquire(_LOCK_T lock);
#define __lock_acquire(lock) __retarget_lock_acquire(lock)
extern void __retarget_lock_acquire_recursive(_LOCK_T lock);
#define __lock_acquire_recursive(lock) __retarget_lock_acquire_recursive(lock)
extern int __retarget_lock_try_acquire(_LOCK_T lock);
#define __lock_try_acquire(lock) __retarget_lock_try_acquire(lock)
extern int __retarget_lock_try_acquire_recursive(_LOCK_T lock);
#define __lock_try_acquire_recursive(lock) __retarget_lock_try_acquire_recursive(lock)

extern void __retarget_lock_release(_LOCK_T lock);
#define __lock_release(lock) __retarget_lock_release(lock)
extern void __retarget_lock_release_recursive(_LOCK_T lock);
#define __lock_release_recursive(lock) __retarget_lock_release_recursive(lock)
# 26 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;



typedef long _off_t;





typedef int __pid_t;



typedef short __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;







typedef unsigned short __ino_t;
# 88 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;







typedef long _fpos_t;
# 125 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_types.h" 3
#undef __size_t



typedef unsigned int __size_t;
# 144 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_types.h" 3
#define unsigned signed
typedef signed int _ssize_t;
#undef unsigned
# 156 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;

#define __need_wint_t 
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 161 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 238 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_size_t
# 347 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_wchar_t




#define _WINT_T 




typedef unsigned int wint_t;

#undef __need_wint_t
# 401 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 160 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_T _flock_t;




typedef void *_iconv_t;



#define _CLOCK_T_ unsigned long


typedef unsigned long __clock_t;




#define _TIME_T_ __int_least64_t

typedef __int_least64_t __time_t;


#define _CLOCKID_T_ unsigned long


typedef unsigned long __clockid_t;

#define _TIMER_T_ unsigned long
typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;


typedef __builtin_va_list __va_list;
# 64 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 2 3



# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/endian.h" 1 3

#define __MACHINE_ENDIAN_H__ 



# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_endian.h" 1 3
# 31 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/_endian.h" 3
#define _LITTLE_ENDIAN 1234
#define _BIG_ENDIAN 4321
#define _PDP_ENDIAN 3412




#define _BYTE_ORDER _LITTLE_ENDIAN
# 7 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/endian.h" 2 3


#define _QUAD_HIGHWORD 1
#define _QUAD_LOWWORD 0






#define LITTLE_ENDIAN _LITTLE_ENDIAN
#define BIG_ENDIAN _BIG_ENDIAN
#define PDP_ENDIAN _PDP_ENDIAN
#define BYTE_ORDER _BYTE_ORDER



#define __bswap16(_x) __builtin_bswap16(_x)
#define __bswap32(_x) __builtin_bswap32(_x)
#define __bswap64(_x) __builtin_bswap64(_x)
# 57 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/endian.h" 3
#define __htonl(_x) __bswap32(_x)
#define __htons(_x) __bswap16(_x)
#define __ntohl(_x) __bswap32(_x)
#define __ntohs(_x) __bswap16(_x)
# 68 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/select.h" 1 3

#define _SYS_SELECT_H 
# 14 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/select.h" 3
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_sigset.h" 1 3
# 39 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_sigset.h" 3
#define _SYS__SIGSET_H_ 

typedef unsigned long __sigset_t;
# 15 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/select.h" 2 3
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_timeval.h" 1 3
# 30 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_timeval.h" 3
#define _SYS__TIMEVAL_H_ 




typedef __suseconds_t suseconds_t;
#define _SUSECONDS_T_DECLARED 



typedef __int_least64_t time_t;
#define __time_t_defined 
#define _TIME_T_DECLARED 




#define _TIMEVAL_DEFINED 




struct timeval {
 time_t tv_sec;
 suseconds_t tv_usec;
};




#define timerclear(tvp) ((tvp)->tv_sec = (tvp)->tv_usec = 0)
#define timerisset(tvp) ((tvp)->tv_sec || (tvp)->tv_usec)
#define timercmp(tvp,uvp,cmp) (((tvp)->tv_sec == (uvp)->tv_sec) ? ((tvp)->tv_usec cmp (uvp)->tv_usec) : ((tvp)->tv_sec cmp (uvp)->tv_sec))



#define timeradd(tvp,uvp,vvp) do { (vvp)->tv_sec = (tvp)->tv_sec + (uvp)->tv_sec; (vvp)->tv_usec = (tvp)->tv_usec + (uvp)->tv_usec; if ((vvp)->tv_usec >= 1000000) { (vvp)->tv_sec++; (vvp)->tv_usec -= 1000000; } } while (0)
# 75 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_timeval.h" 3
#define timersub(tvp,uvp,vvp) do { (vvp)->tv_sec = (tvp)->tv_sec - (uvp)->tv_sec; (vvp)->tv_usec = (tvp)->tv_usec - (uvp)->tv_usec; if ((vvp)->tv_usec < 0) { (vvp)->tv_sec--; (vvp)->tv_usec += 1000000; } } while (0)
# 16 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/select.h" 2 3
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/timespec.h" 1 3
# 35 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/timespec.h" 3
#define _SYS_TIMESPEC_H_ 


# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_timespec.h" 1 3
# 35 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_timespec.h" 3
#define _SYS__TIMESPEC_H_ 
# 45 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_timespec.h" 3
struct timespec {
 time_t tv_sec;
 long tv_nsec;
};
# 39 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/timespec.h" 2 3


#define TIMEVAL_TO_TIMESPEC(tv,ts) do { (ts)->tv_sec = (tv)->tv_sec; (ts)->tv_nsec = (tv)->tv_usec * 1000; } while (0)




#define TIMESPEC_TO_TIMEVAL(tv,ts) do { (tv)->tv_sec = (ts)->tv_sec; (tv)->tv_usec = (ts)->tv_nsec / 1000; } while (0)
# 58 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/timespec.h" 3
struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};
# 17 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/select.h" 2 3


#define _SIGSET_T_DECLARED 
typedef __sigset_t sigset_t;


#define _SYS_TYPES_FD_SET 







#define FD_SETSIZE 64


typedef unsigned long fd_mask;
#define NFDBITS (sizeof (fd_mask) * 8)

#define _howmany(x,y) (((x)+((y)-1))/(y))




typedef struct _types_fd_set {
 fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;

#define fd_set _types_fd_set

#define FD_SET(n,p) ((p)->fds_bits[(n)/NFDBITS] |= (1L << ((n) % NFDBITS)))
#define FD_CLR(n,p) ((p)->fds_bits[(n)/NFDBITS] &= ~(1L << ((n) % NFDBITS)))
#define FD_ISSET(n,p) ((p)->fds_bits[(n)/NFDBITS] & (1L << ((n) % NFDBITS)))
#define FD_ZERO(p) (__extension__ (void)({ size_t __i; char *__tmp = (char *)p; for (__i = 0; __i < sizeof (*(p)); ++__i) *__tmp++ = 0; }))
# 60 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/select.h" 3


int select (int __n, _types_fd_set *__readfds, _types_fd_set *__writefds, _types_fd_set *__exceptfds, struct timeval *__timeout)
                                                   ;

int pselect (int __n, _types_fd_set *__readfds, _types_fd_set *__writefds, _types_fd_set *__exceptfds, const struct timespec *__timeout, const sigset_t *__set)

                           ;



# 69 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 2 3
#define physadr physadr_t
#define quad quad_t


typedef __uint32_t in_addr_t;
#define _IN_ADDR_T_DECLARED 



typedef __uint16_t in_port_t;
#define _IN_PORT_T_DECLARED 







typedef unsigned char u_char;
#define __u_char_defined 


typedef unsigned short u_short;
#define __u_short_defined 


typedef unsigned int u_int;
#define __u_int_defined 


typedef unsigned long u_long;
#define __u_long_defined 

#define _BSDTYPES_DEFINED 




typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;



typedef __blkcnt_t blkcnt_t;
#define _BLKCNT_T_DECLARED 



typedef __blksize_t blksize_t;
#define _BLKSIZE_T_DECLARED 



typedef unsigned long clock_t;
#define __clock_t_defined 
#define _CLOCK_T_DECLARED 
# 135 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 3
typedef long daddr_t;
#define __daddr_t_defined 


typedef char * caddr_t;
#define __caddr_t_defined 



typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
#define _FSBLKCNT_T_DECLARED 



typedef __id_t id_t;
#define _ID_T_DECLARED 



typedef __ino_t ino_t;
#define _INO_T_DECLARED 
# 173 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 3
typedef __off_t off_t;
#define _OFF_T_DECLARED 


typedef __dev_t dev_t;
#define _DEV_T_DECLARED 


typedef __uid_t uid_t;
#define _UID_T_DECLARED 


typedef __gid_t gid_t;
#define _GID_T_DECLARED 



typedef __pid_t pid_t;
#define _PID_T_DECLARED 



typedef __key_t key_t;
#define _KEY_T_DECLARED 



typedef _ssize_t ssize_t;
#define _SSIZE_T_DECLARED 



typedef __mode_t mode_t;
#define _MODE_T_DECLARED 



typedef __nlink_t nlink_t;
#define _NLINK_T_DECLARED 



typedef __clockid_t clockid_t;
#define __clockid_t_defined 
#define _CLOCKID_T_DECLARED 



typedef __timer_t timer_t;
#define __timer_t_defined 
#define _TIMER_T_DECLARED 



typedef __useconds_t useconds_t;
#define _USECONDS_T_DECLARED 







typedef __int64_t sbintime_t;


# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_pthreadtypes.h" 1 3
# 19 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_pthreadtypes.h" 3
#define _SYS__PTHREADTYPES_H_ 



# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/sched.h" 1 3
# 22 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/sched.h" 3
#define _SYS_SCHED_H_ 
# 35 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/sched.h" 3
#define SCHED_OTHER 0


#define SCHED_FIFO 1
#define SCHED_RR 2
# 48 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/sched.h" 3
struct sched_param {
  int sched_priority;
# 61 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/sched.h" 3
};
# 24 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_pthreadtypes.h" 2 3
# 32 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_pthreadtypes.h" 3
typedef __uint32_t pthread_t;



#define PTHREAD_SCOPE_PROCESS 0
#define PTHREAD_SCOPE_SYSTEM 1


#define PTHREAD_INHERIT_SCHED 1


#define PTHREAD_EXPLICIT_SCHED 2


#define PTHREAD_CREATE_DETACHED 0
#define PTHREAD_CREATE_JOINABLE 1
# 61 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_pthreadtypes.h" 3
typedef struct {
  int is_initialized;
  void *stackaddr;
  int stacksize;
  int contentionscope;
  int inheritsched;
  int schedpolicy;
  struct sched_param schedparam;





  int detachstate;
} pthread_attr_t;
# 154 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_pthreadtypes.h" 3
typedef __uint32_t pthread_mutex_t;

typedef struct {
  int is_initialized;
# 168 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/_pthreadtypes.h" 3
  int recursive;
} pthread_mutexattr_t;


#define _PTHREAD_MUTEX_INITIALIZER ((pthread_mutex_t) 0xFFFFFFFF)



typedef __uint32_t pthread_cond_t;

#define _PTHREAD_COND_INITIALIZER ((pthread_cond_t) 0xFFFFFFFF)

typedef struct {
  int is_initialized;
  clock_t clock;



} pthread_condattr_t;



typedef __uint32_t pthread_key_t;

typedef struct {
  int is_initialized;
  int init_executed;
} pthread_once_t;

#define _PTHREAD_ONCE_INIT { 1, 0 }
# 240 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/machine/types.h" 1 3
# 241 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/sys/types.h" 2 3



#undef __need_inttypes
# 28 "repos/apache-mynewt-core/encoding/json/include/json/json.h" 2






#define JSON_VALUE_TYPE_BOOL (0)
#define JSON_VALUE_TYPE_UINT64 (1)
#define JSON_VALUE_TYPE_INT64 (2)
#define JSON_VALUE_TYPE_STRING (3)
#define JSON_VALUE_TYPE_ARRAY (4)
#define JSON_VALUE_TYPE_OBJECT (5)


# 41 "repos/apache-mynewt-core/encoding/json/include/json/json.h"
struct json_value {
    uint8_t jv_pad1;
    uint8_t jv_type;
    uint16_t jv_len;

    union {
        uint64_t u;
        float fl;
        char *str;
        struct {
            char **keys;
            struct json_value **values;
        } composite;
    } jv_val;
};

#define JSON_VALUE_STRING(__jv,__str) (__jv)->jv_type = JSON_VALUE_TYPE_STRING; (__jv)->jv_len = strlen(__str); (__jv)->jv_val.str = (__str);




#define JSON_VALUE_STRINGN(__jv,__str,__len) (__jv)->jv_type = JSON_VALUE_TYPE_STRING; (__jv)->jv_len = (uint16_t) (__len); (__jv)->jv_val.str = (__str);




#define JSON_VALUE_BOOL(__jv,__v) (__jv)->jv_type = JSON_VALUE_TYPE_BOOL; (__jv)->jv_val.u = (__v);



#define JSON_VALUE_INT(__jv,__v) (__jv)->jv_type = JSON_VALUE_TYPE_INT64; (__jv)->jv_val.u = (uint64_t) __v;



#define JSON_VALUE_UINT(__jv,__v) (__jv)->jv_type = JSON_VALUE_TYPE_UINT64; (__jv)->jv_val.u = (uint64_t) __v;




typedef int (*json_write_func_t)(void *buf, char *data,
        int len);

struct json_encoder {
    json_write_func_t je_write;
    void *je_arg;
    int je_wr_commas:1;
    char je_encode_buf[64];
};


#define JSON_NITEMS(x) (int)(sizeof(x)/sizeof(x[0]))

int json_encode_object_start(struct json_encoder *);
int json_encode_object_key(struct json_encoder *encoder, char *key);
int json_encode_object_entry(struct json_encoder *, char *,
        struct json_value *);
int json_encode_object_finish(struct json_encoder *);

int json_encode_array_name(struct json_encoder *encoder, char *name);
int json_encode_array_start(struct json_encoder *encoder);
int json_encode_array_value(struct json_encoder *encoder, struct json_value *val);
int json_encode_array_finish(struct json_encoder *encoder);


typedef enum {
    t_integer,
    t_uinteger,
    t_real,
    t_string,
    t_boolean,
    t_character,
    t_object,
    t_structobject,
    t_array,
    t_check,
    t_ignore
} json_type;

struct json_enum_t {
    char *name;
    long long int value;
};

struct json_array_t {
    json_type element_type;
    union {
        struct {
            const struct json_attr_t *subtype;
            char *base;
            size_t stride;
        } objects;
        struct {
            char **ptrs;
            char *store;
            int storelen;
        } strings;
        struct {
            long long int *store;
        } integers;
        struct {
            long long unsigned int *store;
        } uintegers;
        struct {
            double *store;
        } reals;
        struct {
            
# 147 "repos/apache-mynewt-core/encoding/json/include/json/json.h" 3 4
           _Bool 
# 147 "repos/apache-mynewt-core/encoding/json/include/json/json.h"
                *store;
        } booleans;
    } arr;
    int *count;
    int maxlen;
};

struct json_attr_t {
    char *attribute;
    json_type type;
    union {
        long long int *integer;
        long long unsigned int *uinteger;
        double *real;
        char *string;
        
# 162 "repos/apache-mynewt-core/encoding/json/include/json/json.h" 3 4
       _Bool 
# 162 "repos/apache-mynewt-core/encoding/json/include/json/json.h"
            *boolean;
        char *character;
        struct json_array_t array;
        size_t offset;
    } addr;
    union {
        long long int integer;
        long long unsigned int uinteger;
        double real;
        
# 171 "repos/apache-mynewt-core/encoding/json/include/json/json.h" 3 4
       _Bool 
# 171 "repos/apache-mynewt-core/encoding/json/include/json/json.h"
            boolean;
        char character;
        char *check;
    } dflt;
    size_t len;
    const struct json_enum_t *map;
    
# 177 "repos/apache-mynewt-core/encoding/json/include/json/json.h" 3 4
   _Bool 
# 177 "repos/apache-mynewt-core/encoding/json/include/json/json.h"
        nodefault;
};

struct json_buffer;




typedef char (*json_buffer_read_next_byte_t)(struct json_buffer *);

typedef char (*json_buffer_read_prev_byte_t)(struct json_buffer *);

typedef int (*json_buffer_readn_t)(struct json_buffer *, char *buf, int n);

struct json_buffer {
    json_buffer_readn_t jb_readn;
    json_buffer_read_next_byte_t jb_read_next;
    json_buffer_read_prev_byte_t jb_read_prev;
};

#define JSON_ATTR_MAX 31
#define JSON_VAL_MAX 512

int json_read_object(struct json_buffer *, const struct json_attr_t *);
int json_read_array(struct json_buffer *, const struct json_array_t *);

#define JSON_ERR_OBSTART 1
#define JSON_ERR_ATTRSTART 2
#define JSON_ERR_BADATTR 3
#define JSON_ERR_ATTRLEN 4
#define JSON_ERR_NOARRAY 5
#define JSON_ERR_NOBRAK 6
#define JSON_ERR_STRLONG 7
#define JSON_ERR_TOKLONG 8
#define JSON_ERR_BADTRAIL 9
#define JSON_ERR_ARRAYSTART 10
#define JSON_ERR_OBJARR 11
#define JSON_ERR_SUBTOOLONG 12
#define JSON_ERR_BADSUBTRAIL 13
#define JSON_ERR_SUBTYPE 14
#define JSON_ERR_BADSTRING 15
#define JSON_ERR_CHECKFAIL 16
#define JSON_ERR_NOPARSTR 17
#define JSON_ERR_BADENUM 18
#define JSON_ERR_QNONSTRING 19
#define JSON_ERR_NONQSTRING 19
#define JSON_ERR_MISC 20
#define JSON_ERR_BADNUM 21
#define JSON_ERR_NULLPTR 22
# 237 "repos/apache-mynewt-core/encoding/json/include/json/json.h"
#define JSON_STRUCT_OBJECT(s,f) .addr.offset = offsetof(s, f)
#define JSON_STRUCT_ARRAY(a,e,n) .addr.array.element_type = t_structobject, .addr.array.arr.objects.subtype = e, .addr.array.arr.objects.base = (char*)a, .addr.array.arr.objects.stride = sizeof(a[0]), .addr.array.count = n, .addr.array.maxlen = (int)(sizeof(a)/sizeof(a[0]))
# 46 "libs/sensor_coap/include/sensor_coap/sensor_coap.h" 2
#define COAP_CONTENT_FORMAT APPLICATION_JSON
#define JSON_VALUE_TYPE_EXT_FLOAT (6)

extern struct json_encoder coap_json_encoder;
extern struct json_value coap_json_value;

void json_rep_new(struct os_mbuf *m);
void json_rep_reset(void);
int json_rep_finalize(void);
int json_encode_object_entry_ext(struct json_encoder *encoder, char *key, struct json_value *val);



void json_rep_start_root_object(void);



void json_rep_end_root_object(void);



#define json_rep_set_array(object,key) { json_encode_array_name(&coap_json_encoder, #key); json_encode_array_start(&coap_json_encoder); }



#define json_rep_close_array(object,key) json_encode_array_finish(&coap_json_encoder)



#define json_rep_object_array_start_item(key) { json_encode_object_start(&coap_json_encoder); }



#define json_rep_object_array_end_item(key) { json_encode_object_finish(&coap_json_encoder); }


#define JSON_VALUE_EXT_FLOAT(__jv,__v) (__jv)->jv_type = JSON_VALUE_TYPE_EXT_FLOAT; (__jv)->jv_val.fl = (float) __v;




#define json_rep_set_int(object,key,value) { JSON_VALUE_INT (&coap_json_value, value); json_encode_object_entry (&coap_json_encoder, #key, &coap_json_value); }
#define json_rep_set_uint(object,key,value) { JSON_VALUE_UINT (&coap_json_value, value); json_encode_object_entry (&coap_json_encoder, #key, &coap_json_value); }
#define json_rep_set_float(object,key,value) { JSON_VALUE_EXT_FLOAT(&coap_json_value, value); json_encode_object_entry_ext(&coap_json_encoder, #key, &coap_json_value); }
#define json_rep_set_text_string(object,key,value) { JSON_VALUE_STRING (&coap_json_value, (char *) value); json_encode_object_entry (&coap_json_encoder, #key, &coap_json_value); }
# 148 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
# 1 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h" 1
# 18 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h"
#define OC_REP_H 




# 1 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 1
# 26 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
#define CBOR_H 


# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include-fixed/limits.h" 1 3 4
# 30 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include-fixed/limits.h" 3 4
#define _GCC_LIMITS_H_ 



# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include-fixed/syslimits.h" 1 3 4





#define _GCC_NEXT_LIMITS_H 
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include-fixed/limits.h" 1 3 4
# 194 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include-fixed/limits.h" 3 4
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/limits.h" 1 3 4

#define _LIBC_LIMITS_H_ 1





#define MB_LEN_MAX _MB_LEN_MAX






#define NL_ARGMAX 32
# 137 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/limits.h" 3 4
#define _POSIX2_RE_DUP_MAX 255



#define ARG_MAX 4096



#define PATH_MAX 4096
# 195 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include-fixed/limits.h" 2 3 4
# 8 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include-fixed/syslimits.h" 2 3 4
#undef _GCC_NEXT_LIMITS_H
# 35 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include-fixed/limits.h" 2 3 4
# 60 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include-fixed/limits.h" 3 4
#define _LIMITS_H___ 


#undef CHAR_BIT
#define CHAR_BIT __CHAR_BIT__







#undef SCHAR_MIN
#define SCHAR_MIN (-SCHAR_MAX - 1)
#undef SCHAR_MAX
#define SCHAR_MAX __SCHAR_MAX__


#undef UCHAR_MAX



#define UCHAR_MAX (SCHAR_MAX * 2 + 1)




#undef CHAR_MIN



#define CHAR_MIN 0

#undef CHAR_MAX
#define CHAR_MAX UCHAR_MAX
# 103 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include-fixed/limits.h" 3 4
#undef SHRT_MIN
#define SHRT_MIN (-SHRT_MAX - 1)
#undef SHRT_MAX
#define SHRT_MAX __SHRT_MAX__


#undef USHRT_MAX



#define USHRT_MAX (SHRT_MAX * 2 + 1)



#undef INT_MIN
#define INT_MIN (-INT_MAX - 1)
#undef INT_MAX
#define INT_MAX __INT_MAX__


#undef UINT_MAX
#define UINT_MAX (INT_MAX * 2U + 1U)



#undef LONG_MIN
#define LONG_MIN (-LONG_MAX - 1L)
#undef LONG_MAX
#define LONG_MAX __LONG_MAX__


#undef ULONG_MAX
#define ULONG_MAX (LONG_MAX * 2UL + 1UL)



#undef LLONG_MIN
#define LLONG_MIN (-LLONG_MAX - 1LL)
#undef LLONG_MAX
#define LLONG_MAX __LONG_LONG_MAX__


#undef ULLONG_MAX
#define ULLONG_MAX (LLONG_MAX * 2ULL + 1ULL)




#undef LONG_LONG_MIN
#define LONG_LONG_MIN (-LONG_LONG_MAX - 1LL)
#undef LONG_LONG_MAX
#define LONG_LONG_MAX __LONG_LONG_MAX__


#undef ULONG_LONG_MAX
#define ULONG_LONG_MAX (LONG_LONG_MAX * 2ULL + 1ULL)
# 30 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 2
# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 31 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 2
# 53 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
#define CBOR_API 


#define CBOR_PRIVATE_API 






#define CBOR_INLINE_API static CBOR_INLINE



#define CBOR_INLINE __inline__
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

    CborInvalidType = 0xff
} CborType;

typedef uint64_t CborTag;
typedef enum CborKnownTags {
    CborDateTimeStringTag = 0,
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
    CborMimeMessageTag = 36,
    CborSignatureTag = 55799
} CborKnownTags;



typedef enum CborError {
    CborNoError = 0,


    CborUnknownError,
    CborErrorUnknownLength,
    CborErrorAdvancePastEOF,
    CborErrorIO,


    CborErrorGarbageAtEnd = 256,
    CborErrorUnexpectedEOF,
    CborErrorUnexpectedBreak,
    CborErrorUnknownType,
    CborErrorIllegalType,
    CborErrorIllegalNumber,
    CborErrorIllegalSimpleType,


    CborErrorUnknownSimpleType = 512,
    CborErrorUnknownTag,
    CborErrorInappropriateTagForType,
    CborErrorDuplicateObjectKeys,
    CborErrorInvalidUtf8TextString,


    CborErrorTooManyItems = 768,
    CborErrorTooFewItems,


    CborErrorDataTooLarge = 1024,
    CborErrorNestingTooDeep,
    CborErrorUnsupportedType,


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



 CborError cbor_value_text_string_equals(const CborValue *value, const char *string, 
# 429 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h" 3 4
                                                                                            _Bool 
# 429 "repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h"
                                                                                                 *result);


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
# 24 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h" 2
# 1 "repos/apache-mynewt-core/net/oic/include/oic/oc_constants.h" 1
# 18 "repos/apache-mynewt-core/net/oic/include/oic/oc_constants.h"
#define OC_CONSTANTS_H 






#define OC_NUM_STD_INTERFACES (7)
#define OC_RSRVD_IF_BASELINE "oic.if.baseline"
#define OC_BASELINE_IF_LEN (15)
#define OC_RSRVD_IF_LL "oic.if.ll"
#define OC_LL_IF_LEN (9)
#define OC_RSRVD_IF_B "oic.if.b"
#define OC_B_IF_LEN (8)
#define OC_RSRVD_IF_R "oic.if.r"
#define OC_R_IF_LEN (8)
#define OC_RSRVD_IF_RW "oic.if.rw"
#define OC_RW_IF_LEN (9)
#define OC_RSRVD_IF_A "oic.if.a"
#define OC_A_IF_LEN (8)
#define OC_RSRVD_IF_S "oic.if.s"
#define OC_S_IF_LEN (8)


#define OC_RSRVD_WELL_KNOWN_URI "/oic/res"
#define OC_MULTICAST_DISCOVERY_URI "/oic/res"
#define OC_RSRVD_DEVICE_URI "/oic/d"
#define OC_RSRVD_PLATFORM_URI "/oic/p"
# 25 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h" 2
# 1 "repos/apache-mynewt-core/net/oic/include/oic/oc_helpers.h" 1
# 18 "repos/apache-mynewt-core/net/oic/include/oic/oc_helpers.h"
#define OC_HELPERS_H 
# 29 "repos/apache-mynewt-core/net/oic/include/oic/oc_helpers.h"
#define STRING_ARRAY_ITEM_MAX_LEN 24

typedef struct oc_string {
    uint16_t os_sz;
    uint8_t *os_str;
} oc_string_t;

typedef struct oc_array {
    uint16_t oa_sz;
    union {
        
# 39 "repos/apache-mynewt-core/net/oic/include/oic/oc_helpers.h" 3 4
       _Bool 
# 39 "repos/apache-mynewt-core/net/oic/include/oic/oc_helpers.h"
            *b;
        int64_t *i;
        double *d;
        char *s;
    } oa_arr;
} oc_array_t;

typedef struct oc_array oc_string_array_t;

#define oc_string(ocstring) ((char *)(ocstring).os_str)

void oc_new_string(oc_string_t *ocstring, const char str[]);
void oc_alloc_string(oc_string_t *ocstring, int size);
void oc_free_string(oc_string_t *ocstring);
void oc_concat_strings(oc_string_t *concat, const char *, const char *);
#define oc_string_len(ocstring) ((ocstring).os_sz ? (ocstring).os_sz - 1 : 0)

void _oc_new_array(oc_array_t *ocarray, uint8_t size, uint8_t elem_sz);
void _oc_free_array(oc_array_t *ocarray);

#define oc_new_int_array(ocarray,size) _oc_new_array(ocarray, size, sizeof(uint64_t))

#define oc_new_bool_array(ocarray,size) _oc_new_array(ocarray, size, sizeof(bool))

#define oc_new_double_array(ocarray,size) _oc_new_array(ocarray, size, sizeof(double))

#define oc_free_int_array(ocarray) _oc_free_array(ocarray)
#define oc_free_bool_array(ocarray) _oc_free_array(ocarray)
#define oc_free_double_array(ocarray) _oc_free_array(ocarray)
#define oc_int_array_size(ocintarray) ((ocintarray).oa_sz / sizeof(int64_t))
#define oc_bool_array_size(ocboolarray) ((ocboolarray).oa_sz / sizeof(bool))
#define oc_double_array_size(ocdoublearray) ((ocdoublearray).oa_sz / sizeof(double))

#define oc_int_array(ocintarray) (ocintarray.oa_arr.i)
#define oc_bool_array(ocboolarray) (ocboolarray.oa_arr.b)
#define oc_double_array(ocdoublearray) (ocdoublearray.oa_arr.d)

void _oc_alloc_string_array(oc_string_array_t *ocstringarray, uint8_t size);

# 77 "repos/apache-mynewt-core/net/oic/include/oic/oc_helpers.h" 3 4
_Bool 
# 77 "repos/apache-mynewt-core/net/oic/include/oic/oc_helpers.h"
    _oc_copy_string_to_string_array(oc_string_array_t *ocstringarray,
                                     const char str[], uint8_t index);

# 79 "repos/apache-mynewt-core/net/oic/include/oic/oc_helpers.h" 3 4
_Bool 
# 79 "repos/apache-mynewt-core/net/oic/include/oic/oc_helpers.h"
    _oc_string_array_add_item(oc_string_array_t *ocstringarray,
                               const char str[]);
#define oc_new_string_array(ocstringarray,size) (_oc_alloc_string_array(ocstringarray, size))

#define oc_free_string_array(ocs) (_oc_free_array(ocs))
#define oc_string_array_add_item(ocstringarray,str) (_oc_string_array_add_item(&(ocstringarray), str))

#define oc_string_array_get_item(ocstringarray,index) (&(ocstringarray.oa_arr.s[index * STRING_ARRAY_ITEM_MAX_LEN]))

#define oc_string_array_set_item(ocstringarray,str,index) (_oc_copy_string_to_string_array(&(ocstringarray), str, index))

#define oc_string_array_get_item_size(ocstringarray,index) (strlen(oc_string_array_get_item(ocstringarray, index)))

#define oc_string_array_get_allocated_size(ocstringarray) (ocstringarray.oa_sz / STRING_ARRAY_ITEM_MAX_LEN)
# 26 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h" 2
# 1 "repos/apache-mynewt-core/net/oic/include/oic/port/mynewt/config.h" 1

#define CONFIG_H 
# 13 "repos/apache-mynewt-core/net/oic/include/oic/port/mynewt/config.h"
# 1 "repos/apache-mynewt-core/sys/log/stub/include/log/log.h" 1
# 20 "repos/apache-mynewt-core/sys/log/stub/include/log/log.h"
#define __SYS_LOG_STUB_H__ 



# 1 "repos/apache-mynewt-core/sys/log/common/include/log_common/log_common.h" 1
# 21 "repos/apache-mynewt-core/sys/log/common/include/log_common/log_common.h"
#define H_LOG_COMMON_ 


# 1 "repos/apache-mynewt-core/sys/log/common/include/log_common/ignore.h" 1
# 21 "repos/apache-mynewt-core/sys/log/common/include/log_common/ignore.h"
#define H_IGNORE_ 
# 32 "repos/apache-mynewt-core/sys/log/common/include/log_common/ignore.h"
#define IGN_1(X) ((void)(X))
#define IGN_2(X,...) ((void)(X));IGN_1(__VA_ARGS__)
#define IGN_3(X,...) ((void)(X));IGN_2(__VA_ARGS__)
#define IGN_4(X,...) ((void)(X));IGN_3(__VA_ARGS__)
#define IGN_5(X,...) ((void)(X));IGN_4(__VA_ARGS__)
#define IGN_6(X,...) ((void)(X));IGN_5(__VA_ARGS__)
#define IGN_7(X,...) ((void)(X));IGN_6(__VA_ARGS__)
#define IGN_8(X,...) ((void)(X));IGN_7(__VA_ARGS__)
#define IGN_9(X,...) ((void)(X));IGN_8(__VA_ARGS__)
#define IGN_10(X,...) ((void)(X));IGN_9(__VA_ARGS__)
#define IGN_11(X,...) ((void)(X));IGN_10(__VA_ARGS__)
#define IGN_12(X,...) ((void)(X));IGN_11(__VA_ARGS__)
#define IGN_13(X,...) ((void)(X));IGN_12(__VA_ARGS__)
#define IGN_14(X,...) ((void)(X));IGN_13(__VA_ARGS__)
#define IGN_15(X,...) ((void)(X));IGN_14(__VA_ARGS__)
#define IGN_16(X,...) ((void)(X));IGN_15(__VA_ARGS__)
#define IGN_17(X,...) ((void)(X));IGN_16(__VA_ARGS__)
#define IGN_18(X,...) ((void)(X));IGN_17(__VA_ARGS__)
#define IGN_19(X,...) ((void)(X));IGN_18(__VA_ARGS__)
#define IGN_20(X,...) ((void)(X));IGN_19(__VA_ARGS__)

#define GET_MACRO(_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,_11,_12,_13,_14,_15,_16,_17,_18,_19,_20,NAME,...) NAME

#define IGNORE(...) GET_MACRO(__VA_ARGS__, IGN_20, IGN_19, IGN_18, IGN_17, IGN_16, IGN_15, IGN_14, IGN_13, IGN_12, IGN_11, IGN_10, IGN_9, IGN_8, IGN_7, IGN_6, IGN_5, IGN_4, IGN_3, IGN_2, IGN_1)(__VA_ARGS__)
# 25 "repos/apache-mynewt-core/sys/log/common/include/log_common/log_common.h" 2





struct log;

#define LOG_VERSION_V3 3
#define LOG_VERSION_V2 2
#define LOG_VERSION_V1 1

#define LOG_TYPE_STREAM (0)
#define LOG_TYPE_MEMORY (1)
#define LOG_TYPE_STORAGE (2)

#define LOG_LEVEL_DEBUG (0)
#define LOG_LEVEL_INFO (1)
#define LOG_LEVEL_WARN (2)
#define LOG_LEVEL_ERROR (3)
#define LOG_LEVEL_CRITICAL (4)

#define LOG_LEVEL_MAX (UINT8_MAX)

#define LOG_LEVEL_STR(level) (LOG_LEVEL_DEBUG == level ? "DEBUG" : (LOG_LEVEL_INFO == level ? "INFO" : (LOG_LEVEL_WARN == level ? "WARN" : (LOG_LEVEL_ERROR == level ? "ERROR" : (LOG_LEVEL_CRITICAL == level ? "CRITICAL" : "UNKNOWN")))))
# 57 "repos/apache-mynewt-core/sys/log/common/include/log_common/log_common.h"
#define LOG_MODULE_DEFAULT (0)
#define LOG_MODULE_OS (1)
#define LOG_MODULE_NEWTMGR (2)
#define LOG_MODULE_NIMBLE_CTLR (3)
#define LOG_MODULE_NIMBLE_HOST (4)
#define LOG_MODULE_NFFS (5)
#define LOG_MODULE_REBOOT (6)
#define LOG_MODULE_IOTIVITY (7)
#define LOG_MODULE_TEST (8)
#define LOG_MODULE_PERUSER (64)
#define LOG_MODULE_MAX (255)

#define LOG_ETYPE_STRING (0)






#define LOG_STORE_CONSOLE 1
#define LOG_STORE_CBMEM 2
#define LOG_STORE_FCB 3


#define UTC01_01_2016 1451606400

#define LOG_NAME_MAX_LEN (64)




#define LOG_SYSLEVEL ((uint8_t)MYNEWT_VAL_LOG_LEVEL)



#define LOGS_NMGR_OP_READ (0)
#define LOGS_NMGR_OP_CLEAR (1)
#define LOGS_NMGR_OP_APPEND (2)
#define LOGS_NMGR_OP_MODULE_LIST (3)
#define LOGS_NMGR_OP_LEVEL_LIST (4)
#define LOGS_NMGR_OP_LOGS_LIST (5)
#define LOGS_NMGR_OP_SET_WATERMARK (6)
#define LOGS_NMGR_OP_MODLEVEL (8)

#define LOG_PRINTF_MAX_ENTRY_LEN (128)


struct log_info {
    uint32_t li_next_index;
    uint8_t li_version;
};

extern struct log_info g_log_info;
# 118 "repos/apache-mynewt-core/sys/log/common/include/log_common/log_common.h"
typedef void log_append_cb(struct log *log, uint32_t idx);
# 25 "repos/apache-mynewt-core/sys/log/stub/include/log/log.h" 2





#define LOG_DEBUG(__l,__mod,...) IGNORE(__VA_ARGS__)
#define LOG_INFO(__l,__mod,...) IGNORE(__VA_ARGS__)
#define LOG_WARN(__l,__mod,...) IGNORE(__VA_ARGS__)
#define LOG_ERROR(__l,__mod,...) IGNORE(__VA_ARGS__)
#define LOG_CRITICAL(__l,__mod,...) IGNORE(__VA_ARGS__)

struct log {
};

struct log_handler {
};

static inline int
log_register(char *name, struct log *log, const struct log_handler *h,
             void *arg, uint8_t level)
{
    return 0;
}

static inline void
log_set_append_cb(struct log *log, log_append_cb *cb)
{
}

static inline struct log *
log_find(const char *name)
{
    return 
# 57 "repos/apache-mynewt-core/sys/log/stub/include/log/log.h" 3 4
          ((void *)0)
# 57 "repos/apache-mynewt-core/sys/log/stub/include/log/log.h"
              ;
}

static inline int
log_append_typed(struct log *log, uint8_t module, uint8_t level, uint8_t etype,
                 void *data, uint16_t len)
{
    return 0;
}

static inline int
log_append_mbuf_typed_no_free(struct log *log, uint8_t module, uint8_t level,
                              uint8_t etype, struct os_mbuf **om_ptr)
{
    return 0;
}

static inline int
log_append_mbuf_typed(struct log *log, uint8_t module, uint8_t level,
                      uint8_t etype, struct os_mbuf *om)
{
    os_mbuf_free_chain(om);
    return 0;
}

static inline int
log_append_mbuf_body_no_free(struct log *log, uint8_t module, uint8_t level,
                             uint8_t etype, struct os_mbuf *om)
{
    return 0;
}

static inline int
log_append_mbuf_body(struct log *log, uint8_t module, uint8_t level,
                     uint8_t etype, struct os_mbuf *om)
{
    os_mbuf_free_chain(om);
    return 0;
}

static inline void
log_init(void)
{
}

static inline void log_set_level(struct log *log, uint8_t level)
{
    return;
}

static inline uint8_t log_get_level(const struct log *log)
{
    return 0;
}

#define log_printf(...) 




extern const struct log_handler log_console_handler;
extern const struct log_handler log_cbmem_handler;
extern const struct log_handler log_fcb_handler;





static inline struct log *
log_console_get(void)
{
    return 
# 128 "repos/apache-mynewt-core/sys/log/stub/include/log/log.h" 3 4
          ((void *)0)
# 128 "repos/apache-mynewt-core/sys/log/stub/include/log/log.h"
              ;
}
# 14 "repos/apache-mynewt-core/net/oic/include/oic/port/mynewt/config.h" 2
# 22 "repos/apache-mynewt-core/net/oic/include/oic/port/mynewt/config.h"
#define OC_CLIENT 






typedef os_time_t oc_clock_time_t;
#define OC_CLOCK_CONF_TICKS_PER_SECOND (OS_TICKS_PER_SEC)



#define OC_CLK_FMT "%lu"




#define MAX_APP_RESOURCES MYNEWT_VAL(OC_APP_RESOURCES)



#define MAX_NUM_CONCURRENT_REQUESTS MYNEWT_VAL(OC_CONCURRENT_REQUESTS)


#define EST_NUM_REP_OBJECTS MYNEWT_VAL(OC_NUM_REP_OBJECTS)


#define MAX_PAYLOAD_SIZE MYNEWT_VAL(OC_MAX_PAYLOAD_SIZE)


#define MAX_NUM_DEVICES MYNEWT_VAL(OC_NUM_DEVICES)


#define MAX_PLATFORM_PAYLOAD_SIZE MYNEWT_VAL(OC_MAX_PAYLOAD)


#define MAX_DEVICE_PAYLOAD_SIZE MYNEWT_VAL(OC_MAX_PAYLOAD)
# 27 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h" 2





extern CborEncoder g_encoder, root_map, links_array;
extern CborError g_err;

struct os_mbuf;
void oc_rep_new(struct os_mbuf *m);
void oc_rep_reset(void);
int oc_rep_finalize(void);

#define oc_rep_object(name) &name ##_map
#define oc_rep_array(name) &name ##_array

#define oc_rep_set_double(object,key,value) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); g_err |= cbor_encode_double(&object ##_map, value); } while (0)





#define oc_rep_set_int(object,key,value) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); g_err |= cbor_encode_int(&object ##_map, value); } while (0)





#define oc_rep_set_uint(object,key,value) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); g_err |= cbor_encode_uint(&object ##_map, value); } while (0)





#define oc_rep_set_boolean(object,key,value) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); g_err |= cbor_encode_boolean(&object ##_map, value); } while (0)





#define oc_rep_set_text_string(object,key,value) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); g_err |= cbor_encode_text_string(&object ##_map, value, strlen(value)); } while (0)





#define oc_rep_set_byte_string(object,key,value,length) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); g_err |= cbor_encode_byte_string(&object ##_map, value, length); } while (0)





#define oc_rep_set_byte_string_iov(object,key,iov,iov_len) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); g_err |= cbor_encode_byte_iovec(&object ##_map, iov, iov_len); } while (0)





#define oc_rep_start_array(parent,key) do { CborEncoder key ##_array; g_err |= cbor_encoder_create_array(&parent, &key ##_array, CborIndefiniteLength)





#define oc_rep_end_array(parent,key) g_err |= cbor_encoder_close_container(&parent, &key ##_array); } while (0)




#define oc_rep_start_links_array() g_err |= cbor_encoder_create_array(&g_encoder, &links_array, CborIndefiniteLength)



#define oc_rep_end_links_array() g_err |= cbor_encoder_close_container(&g_encoder, &links_array)


#define oc_rep_start_root_object() g_err |= cbor_encoder_create_map(&g_encoder, &root_map, CborIndefiniteLength)


#define oc_rep_end_root_object() g_err |= cbor_encoder_close_container(&g_encoder, &root_map)


#define oc_rep_add_byte_string(parent,value) g_err |= cbor_encode_byte_string(&parent ##_array, value, strlen(value))


#define oc_rep_add_text_string(parent,value) g_err |= cbor_encode_text_string(&parent ##_array, value, strlen(value))


#define oc_rep_set_key(parent,key) g_err |= cbor_encode_text_string(&parent, key, strlen(key))


#define oc_rep_set_array(object,key) g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); oc_rep_start_array(object ##_map, key)



#define oc_rep_close_array(object,key) oc_rep_end_array(object ##_map, key)

#define oc_rep_start_object(parent,key) do { CborEncoder key ##_map; g_err |= cbor_encoder_create_map(&parent, &key ##_map, CborIndefiniteLength)




#define oc_rep_end_object(parent,key) g_err |= cbor_encoder_close_container(&parent, &key ##_map); } while (0)




#define oc_rep_object_array_start_item(key) oc_rep_start_object(key ##_array, key)


#define oc_rep_object_array_end_item(key) oc_rep_end_object(key ##_array, key)

#define oc_rep_set_object(object,key) g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); oc_rep_start_object(object ##_map, key)



#define oc_rep_close_object(object,key) oc_rep_end_object(object ##_map, key)

#define oc_rep_set_int_array(object,key,values,length) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); CborEncoder key ##_value_array; g_err |= cbor_encoder_create_array(&object ##_map, &key ##_value_array, length); int i; for (i = 0; i < length; i++) { g_err |= cbor_encode_int(&key ##_value_array, values[i]); } g_err |= cbor_encoder_close_container(&object ##_map, &key ##_value_array); } while (0)
# 158 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h"
#define oc_rep_set_bool_array(object,key,values,length) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); CborEncoder key ##_value_array; g_err |= cbor_encoder_create_array(&object ##_map, &key ##_value_array, length); int i; for (i = 0; i < length; i++) { g_err |= cbor_encode_boolean(&key ##_value_array, values[i]); } g_err |= cbor_encoder_close_container(&object ##_map, &key ##_value_array); } while (0)
# 171 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h"
#define oc_rep_set_double_array(object,key,values,length) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); CborEncoder key ##_value_array; g_err |= cbor_encoder_create_array(&object ##_map, &key ##_value_array, length); int i; for (i = 0; i < length; i++) { g_err |= cbor_encode_floating_point(&key ##_value_array, CborDoubleType, &values[i]); } g_err |= cbor_encoder_close_container(&object ##_map, &key ##_value_array); } while (0)
# 185 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h"
#define oc_rep_set_string_array(object,key,values) do { g_err |= cbor_encode_text_string(&object ##_map, #key, strlen(#key)); CborEncoder key ##_value_array; g_err |= cbor_encoder_create_array(&object ##_map, &key ##_value_array, oc_string_array_get_allocated_size(values)); int i; for (i = 0; i < oc_string_array_get_allocated_size(values); i++) { g_err |= cbor_encode_text_string( &key ##_value_array, oc_string_array_get_item(values, i), oc_string_array_get_item_size(values, i)); } g_err |= cbor_encoder_close_container(&object ##_map, &key ##_value_array); } while (0)
# 202 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h"
typedef enum {
  NIL = 0,
  INT = 0x01,
  DOUBLE = 0x02,
  BOOL = 0x03,
  BYTE_STRING = 0x04,
  STRING = 0x05,
  OBJECT = 0x06,
  ARRAY = 0x08,
  INT_ARRAY = 0x09,
  DOUBLE_ARRAY = 0x0A,
  BOOL_ARRAY = 0x0B,
  BYTE_STRING_ARRAY = 0x0C,
  STRING_ARRAY = 0x0D,
  OBJECT_ARRAY = 0x0E
} oc_rep_value_type_t;

typedef struct oc_rep_s
{
  oc_rep_value_type_t type;
  struct oc_rep_s *next;
  oc_string_t name;
  union
  {
    int64_t value_int;
    
# 227 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h" 3 4
   _Bool 
# 227 "repos/apache-mynewt-core/net/oic/include/oic/oc_rep.h"
        value_boolean;
    double value_double;
    oc_string_t value_string;
    oc_array_t value_array;
    oc_string_array_t value_string_array;
    struct oc_rep_s *value_object;
    struct oc_rep_s *value_object_array;
  };
} oc_rep_t;

uint16_t oc_parse_rep(struct os_mbuf *m, uint16_t payload_off,
                      uint16_t payload_size, oc_rep_t **out_rep);

void oc_free_rep(oc_rep_t *rep);
# 149 "libs/sensor_coap/include/sensor_coap/sensor_coap.h" 2
# 1 "repos/apache-mynewt-core/net/oic/include/oic/messaging/coap/constants.h" 1
# 35 "repos/apache-mynewt-core/net/oic/include/oic/messaging/coap/constants.h"
#define CONSTANTS_H 





#define COAP_DEFAULT_PORT 5683

#define COAP_DEFAULT_MAX_AGE 60
#define COAP_RESPONSE_TIMEOUT MYNEWT_VAL(OC_COAP_RESPONSE_TIMEOUT)
#define COAP_RESPONSE_RANDOM_FACTOR 1.5
#define COAP_MAX_RETRANSMIT 4

#define COAP_HEADER_LEN 4

#define COAP_TOKEN_LEN 8
#define COAP_ETAG_LEN 8
#define COAP_MAX_URI 32
#define COAP_MAX_URI_QUERY 32




struct coap_udp_hdr {





    uint8_t token_len:4;
    uint8_t type:2;
    uint8_t version:2;

    uint8_t code;
    uint16_t id;
};





#define COAP_TCP_LENGTH8_OFF 13
#define COAP_TCP_LENGTH16_OFF 269
#define COAP_TCP_LENGTH32_OFF 65805

#define COAP_TCP_TYPE0 0
#define COAP_TCP_TYPE8 13
#define COAP_TCP_TYPE16 14
#define COAP_TCP_TYPE32 15

struct coap_tcp_hdr0 {




    uint8_t token_len:4;
    uint8_t data_len:4;

    uint8_t code;
};

struct coap_tcp_hdr8 {




    uint8_t token_len:4;
    uint8_t type:4;

    uint8_t data_len;
    uint8_t code;
};

struct coap_tcp_hdr16 {




    uint8_t token_len:4;
    uint8_t type:4;

    uint16_t data_len;
    uint8_t code;
} __attribute__((packed));

struct coap_tcp_hdr32 {




    uint8_t token_len:4;
    uint8_t type:4;

    uint32_t data_len;
    uint8_t code;
} __attribute__((packed));

#define COAP_TCP_TYPE8 13
#define COAP_TCP_TYPE16 14
#define COAP_TCP_TYPE32 15


#define COAP_HEADER_OPTION_DELTA_MASK 0xF0
#define COAP_HEADER_OPTION_SHORT_LENGTH_MASK 0x0F


typedef enum {
  COAP_TYPE_CON,
  COAP_TYPE_NON,
  COAP_TYPE_ACK,
  COAP_TYPE_RST
} coap_message_type_t;


typedef enum { COAP_GET = 1, COAP_POST, COAP_PUT, COAP_DELETE } coap_method_t;


typedef enum {
  NO_ERROR = 0,

  CREATED_2_01 = 65,
  DELETED_2_02 = 66,
  VALID_2_03 = 67,
  CHANGED_2_04 = 68,
  CONTENT_2_05 = 69,
  CONTINUE_2_31 = 95,

  BAD_REQUEST_4_00 = 128,
  UNAUTHORIZED_4_01 = 129,
  BAD_OPTION_4_02 = 130,
  FORBIDDEN_4_03 = 131,
  NOT_FOUND_4_04 = 132,
  METHOD_NOT_ALLOWED_4_05 = 133,
  NOT_ACCEPTABLE_4_06 = 134,
  PRECONDITION_FAILED_4_12 = 140,
  REQUEST_ENTITY_TOO_LARGE_4_13 = 141,
  UNSUPPORTED_MEDIA_TYPE_4_15 = 143,

  INTERNAL_SERVER_ERROR_5_00 = 160,
  NOT_IMPLEMENTED_5_01 = 161,
  BAD_GATEWAY_5_02 = 162,
  SERVICE_UNAVAILABLE_5_03 = 163,
  GATEWAY_TIMEOUT_5_04 = 164,
  PROXYING_NOT_SUPPORTED_5_05 = 165,


  MEMORY_ALLOCATION_ERROR = 192,
  PACKET_SERIALIZATION_ERROR,


  CLEAR_TRANSACTION,
  EMPTY_ACK_RESPONSE
} coap_status_t;


typedef enum {
  COAP_OPTION_IF_MATCH = 1,
  COAP_OPTION_URI_HOST = 3,
  COAP_OPTION_ETAG = 4,
  COAP_OPTION_IF_NONE_MATCH = 5,
  COAP_OPTION_OBSERVE = 6,
  COAP_OPTION_URI_PORT = 7,
  COAP_OPTION_LOCATION_PATH = 8,
  COAP_OPTION_URI_PATH = 11,
  COAP_OPTION_CONTENT_FORMAT = 12,
  COAP_OPTION_MAX_AGE = 14,
  COAP_OPTION_URI_QUERY = 15,
  COAP_OPTION_ACCEPT = 17,
  COAP_OPTION_LOCATION_QUERY = 20,
  COAP_OPTION_BLOCK2 = 23,
  COAP_OPTION_BLOCK1 = 27,
  COAP_OPTION_SIZE2 = 28,
  COAP_OPTION_PROXY_URI = 35,
  COAP_OPTION_PROXY_SCHEME = 39,
  COAP_OPTION_SIZE1 = 60,
} coap_option_t;


typedef enum {
  TEXT_PLAIN = 0,
  TEXT_XML = 1,
  TEXT_CSV = 2,
  TEXT_HTML = 3,
  IMAGE_GIF = 21,
  IMAGE_JPEG = 22,
  IMAGE_PNG = 23,
  IMAGE_TIFF = 24,
  AUDIO_RAW = 25,
  VIDEO_RAW = 26,
  APPLICATION_LINK_FORMAT = 40,
  APPLICATION_XML = 41,
  APPLICATION_OCTET_STREAM = 42,
  APPLICATION_RDF_XML = 43,
  APPLICATION_SOAP_XML = 44,
  APPLICATION_ATOM_XML = 45,
  APPLICATION_XMPP_XML = 46,
  APPLICATION_EXI = 47,
  APPLICATION_FASTINFOSET = 48,
  APPLICATION_SOAP_FASTINFOSET = 49,
  APPLICATION_JSON = 50,
  APPLICATION_X_OBIX_BINARY = 51,
  APPLICATION_CBOR = 60
} coap_content_format_t;
# 150 "libs/sensor_coap/include/sensor_coap/sensor_coap.h" 2

#undef COAP_CONTENT_FORMAT
extern int oc_content_format;
#define JSON_ENC (oc_content_format == APPLICATION_JSON)




#define oc_rep_set_int_k(object,key,value) do { g_err |= cbor_encode_text_string(&object ##_map, key, strlen(key)); g_err |= cbor_encode_int(&object ##_map, value); } while (0)





#define oc_rep_set_uint_k(object,key,value) do { g_err |= cbor_encode_text_string(&object ##_map, key, strlen(key)); g_err |= cbor_encode_uint(&object ##_map, value); } while (0)





#define oc_rep_set_float_k(object,key,value) do { g_err |= cbor_encode_text_string(&object ##_map, key, strlen(key)); g_err |= cbor_encode_float(&object ##_map, value); } while (0)





#define oc_rep_set_text_string_k(object,key,value) do { g_err |= cbor_encode_text_string(&object ##_map, key, strlen(key)); g_err |= cbor_encode_text_string(&object ##_map, value, strlen(value)); } while (0)





#define rep_start_root_object() oc_rep_start_root_object(); if (JSON_ENC) { json_rep_start_root_object(); }


#define rep_end_root_object() if (JSON_ENC) { json_rep_end_root_object(); } oc_rep_end_root_object();


#define rep_set_array(object,key) oc_rep_set_array(object, key); if (JSON_ENC) { json_rep_set_array(object, key); }


#define rep_close_array(object,key) if (JSON_ENC) { json_rep_close_array(object, key); } oc_rep_close_array(object, key);


#define rep_object_array_start_item(key) oc_rep_object_array_start_item(key); if (JSON_ENC) { json_rep_object_array_start_item(key); }


#define rep_object_array_end_item(key) if (JSON_ENC) { json_rep_object_array_end_item(key); } oc_rep_object_array_end_item(key);
# 206 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
#define rep_set_int(object,key,value) { if (JSON_ENC) { json_rep_set_int(object, key, value); } else { oc_rep_set_int(object, key, value); } }
#define rep_set_uint(object,key,value) { if (JSON_ENC) { json_rep_set_uint(object, key, value); } else { oc_rep_set_uint(object, key, value); } }
#define rep_set_float(object,key,value) { if (JSON_ENC) { json_rep_set_float(object, key, value); } else { oc_rep_set_double(object, key, value); } }
#define rep_set_text_string(object,key,value) { if (JSON_ENC) { json_rep_set_text_string(object, key, value); } else { oc_rep_set_text_string(object, key, value); } }


#define rep_set_int_k(object,key,value) { if (JSON_ENC) { json_rep_set_int(object, key, value); } else { oc_rep_set_int_k(object, key, value); } }
#define rep_set_uint_k(object,key,value) { if (JSON_ENC) { json_rep_set_uint(object, key, value); } else { oc_rep_set_uint_k(object, key, value); } }
#define rep_set_float_k(object,key,value) { if (JSON_ENC) { json_rep_set_float(object, key, value); } else { oc_rep_set_double_k(object, key, value); } }
#define rep_set_text_string_k(object,key,value) { if (JSON_ENC) { json_rep_set_text_string(object, key, value); } else { oc_rep_set_text_string_k(object, key, value); } }
# 224 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
#define CP_ROOT(children0) { rep_start_root_object(); { children0; } rep_end_root_object(); }






#define CP_SET_INT_VAL(parent0,val0) { assert(val0->val_type == SENSOR_VALUE_TYPE_INT32); rep_set_int_k(parent0, val0->key, val0->int_val); }





#define CP_SET_FLOAT_VAL(parent0,val0) { assert(val0->val_type == SENSOR_VALUE_TYPE_FLOAT); rep_set_int_k(parent0, val0->key, val0->float_val); }





#define CP_SET_INT(parent0,key0,value0) { rep_set_int(parent0, key0, value0); }




#define CP_SET_FLOAT(parent0,key0,value0) { rep_set_float(parent0, key0, value0); }





#define CP_ITEM_VAL(parent0,val0) { switch (val0->val_type) { case SENSOR_VALUE_TYPE_INT32: { CP_ITEM_INT_VAL(parent0, val0); break; } case SENSOR_VALUE_TYPE_FLOAT: { CP_ITEM_FLOAT_VAL(parent0, val0); break; } default: { assert(0); } } }
# 263 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
#define CP_ITEM_INT_VAL(parent0,val0) { assert(val0->val_type == SENSOR_VALUE_TYPE_INT32); CP_ITEM_INT(parent0, val0->key, val0->int_val); }





#define CP_ITEM_FLOAT_VAL(parent0,val0) { assert(val0->val_type == SENSOR_VALUE_TYPE_FLOAT); CP_ITEM_FLOAT(parent0, val0->key, val0->float_val); }





#define CP_ARRAY(object0,key0,children0) { rep_set_array(object0, key0); { children0; } rep_close_array(object0, key0); }







#define CP_ITEM(array0,children0) { rep_object_array_start_item(array0); { children0; } rep_object_array_end_item(array0); }







#define CP_ITEM_INT(array0,key0,value0) { CP_ITEM(array0, { rep_set_text_string(array0, key, key0); rep_set_int( array0, value, value0); }) }
# 300 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
#define CP_ITEM_UINT(array0,key0,value0) { CP_ITEM(array0, { rep_set_text_string(array0, key, key0); rep_set_uint( array0, value, value0); }) }
# 309 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
#define CP_ITEM_FLOAT(array0,key0,value0) { CP_ITEM(array0, { rep_set_text_string(array0, key, key0); rep_set_float( array0, value, value0); }) }
# 318 "libs/sensor_coap/include/sensor_coap/sensor_coap.h"
#define CP_ITEM_STR(array0,key0,value0) { CP_ITEM(array0, { rep_set_text_string(array0, key, key0); rep_set_text_string(array0, value, value0); }) }
# 19 "apps/my_sensor_app/src/send_coap.c" 2
# 1 "apps/my_sensor_app/src/geolocate.h" 1



#define __GEOLOCATE_H__ 
# 20 "apps/my_sensor_app/src/send_coap.c" 2
# 1 "apps/my_sensor_app/src/send_coap.h" 1



#define __SEND_COAP_H__ 






# 1 "libs/esp8266/include/esp8266/esp8266.h" 1



#define __ESP8266_DRIVER_H__ 

# 1 "libs/esp8266/include/esp8266/network.h" 1


#define __ESP8266_NETWORK_H__ 
# 16 "libs/esp8266/include/esp8266/network.h"
typedef enum nsapi_protocol {
    NSAPI_TCP,
    NSAPI_UDP,
} nsapi_protocol_t;
# 28 "libs/esp8266/include/esp8266/network.h"
enum nsapi_error {
    NSAPI_ERROR_OK = 0,
    NSAPI_ERROR_WOULD_BLOCK = -3001,
    NSAPI_ERROR_UNSUPPORTED = -3002,
    NSAPI_ERROR_PARAMETER = -3003,
    NSAPI_ERROR_NO_CONNECTION = -3004,
    NSAPI_ERROR_NO_SOCKET = -3005,
    NSAPI_ERROR_NO_ADDRESS = -3006,
    NSAPI_ERROR_NO_MEMORY = -3007,
    NSAPI_ERROR_NO_SSID = -3008,
    NSAPI_ERROR_DNS_FAILURE = -3009,
    NSAPI_ERROR_DHCP_FAILURE = -3010,
    NSAPI_ERROR_AUTH_FAILURE = -3011,
    NSAPI_ERROR_DEVICE_ERROR = -3012,
    NSAPI_ERROR_IN_PROGRESS = -3013,
    NSAPI_ERROR_ALREADY = -3014,
    NSAPI_ERROR_IS_CONNECTED = -3015,
    NSAPI_ERROR_CONNECTION_LOST = -3016,
    NSAPI_ERROR_CONNECTION_TIMEOUT = -3017,
    NSAPI_ERROR_ADDRESS_IN_USE = -3018,
    NSAPI_ERROR_TIMEOUT = -3019,
    NSAPI_ERROR_BUSY = -3020,
};
# 7 "libs/esp8266/include/esp8266/esp8266.h" 2
# 1 "libs/esp8266/include/esp8266/wifi.h" 1

#define __ESP8266_WIFI_H__ 
# 14 "libs/esp8266/include/esp8266/wifi.h"
typedef enum nsapi_security {
    NSAPI_SECURITY_NONE = 0x0,
    NSAPI_SECURITY_WEP = 0x1,
    NSAPI_SECURITY_WPA = 0x2,
    NSAPI_SECURITY_WPA2 = 0x3,
    NSAPI_SECURITY_WPA_WPA2 = 0x4,
    NSAPI_SECURITY_PAP = 0x5,
    NSAPI_SECURITY_CHAP = 0x6,
    NSAPI_SECURITY_UNKNOWN = 0xFF,
} nsapi_security_t;





typedef struct nsapi_wifi_ap {
    char ssid[33];
    uint8_t bssid[6];
    nsapi_security_t security;
    int8_t rssi;
    uint8_t channel;
} nsapi_wifi_ap_t;
# 8 "libs/esp8266/include/esp8266/esp8266.h" 2





#define ESP8266_DEVICE "esp8266_0"
#define ESP8266_SOCKET_COUNT 2


#define ESP8266_TX_BUFFER_SIZE 400
#define ESP8266_RX_BUFFER_SIZE 256
#define ESP8266_PARSER_BUFFER_SIZE 256


#define ESP8266_CONNECT_TIMEOUT 10000
#define ESP8266_SEND_TIMEOUT 10000
#define ESP8266_RECV_TIMEOUT 0
#define ESP8266_SCAN_TIMEOUT 30000
#define ESP8266_MISC_TIMEOUT 2000

typedef 
# 28 "libs/esp8266/include/esp8266/esp8266.h" 3 4
       _Bool 
# 28 "libs/esp8266/include/esp8266/esp8266.h"
            filter_func_t0(nsapi_wifi_ap_t *, unsigned);


struct esp8266_socket {
    int id;
    nsapi_protocol_t proto;
    
# 34 "libs/esp8266/include/esp8266/esp8266.h" 3 4
   _Bool 
# 34 "libs/esp8266/include/esp8266/esp8266.h"
        connected;
    const char *host;
    uint16_t port;
};


struct esp8266_cfg {

    int uart;


    char ap_ssid[33];
    nsapi_security_t ap_sec;
    uint8_t ap_ch;
    char ap_pass[64];


    uint8_t _ids[2];
    struct esp8266_socket _sockets[2];
    struct {
        void (*callback)(void *);
        void *data;
    } _cbs[2];
};


struct esp8266 {
    struct os_dev dev;
    struct esp8266_cfg cfg;
    void *controller;
};



void esp8266_create(void);


int esp8266_default_cfg(struct esp8266_cfg *cfg);


int esp8266_init(struct os_dev *dev0, void *arg);


int esp8266_config(struct esp8266 *dev, struct esp8266_cfg *cfg);






int esp8266_scan(struct esp8266 *dev, nsapi_wifi_ap_t *res, unsigned limit, filter_func_t0 *filter_func);


int esp8266_connect(struct esp8266 *dev, const char *ssid, const char *pass);


int esp8266_set_credentials(struct esp8266 *dev, const char *ssid, const char *pass, nsapi_security_t security);


int esp8266_disconnect(struct esp8266 *dev);


int esp8266_socket_open(struct esp8266 *dev, void **handle, nsapi_protocol_t proto);


int esp8266_socket_close(struct esp8266 *dev, void *handle);



int esp8266_socket_connect(struct esp8266 *dev, void *handle, const char *host, uint16_t port);


int esp8266_socket_send(struct esp8266 *dev, void *handle, const void *data, unsigned size);


int esp8266_socket_send_mbuf(struct esp8266 *dev, void *handle, struct os_mbuf *m);



int esp8266_socket_sendto(struct esp8266 *dev, void *handle, const char *host, uint16_t port, const void *data, unsigned size);


void esp8266_socket_attach(struct esp8266 *dev, void *handle, void (*callback)(void *), void *data);

const char *esp8266_get_ip_address(struct esp8266 *dev);
const char *esp8266_get_mac_address(struct esp8266 *dev);
const char *esp8266_get_gateway(struct esp8266 *dev);
const char *esp8266_get_netmask(struct esp8266 *dev);
int8_t esp8266_get_rssi(struct esp8266 *dev);
# 12 "apps/my_sensor_app/src/send_coap.h" 2
#define SERVER_NETWORK_INTERFACE ESP8266_DEVICE



# 1 "libs/nrf24l01/include/nrf24l01/nrf24l01.h" 1
# 22 "libs/nrf24l01/include/nrf24l01/nrf24l01.h"
#define __NRF24L01_DRIVER_H__ 


# 1 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h" 1
# 28 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
#define H_HAL_SPI_ 
# 37 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
#define HAL_SPI_TYPE_MASTER (0)

#define HAL_SPI_TYPE_SLAVE (1)


#define HAL_SPI_MODE0 (0)

#define HAL_SPI_MODE1 (1)

#define HAL_SPI_MODE2 (2)

#define HAL_SPI_MODE3 (3)


#define HAL_SPI_MSB_FIRST (0)

#define HAL_SPI_LSB_FIRST (1)


#define HAL_SPI_WORD_SIZE_8BIT (0)

#define HAL_SPI_WORD_SIZE_9BIT (1)


typedef void (*hal_spi_txrx_cb)(void *arg, int len);


struct hal_spi_hw_settings {
    int pin_sck;
    int pin_mosi;
    int pin_miso;
    int pin_ss;
};





struct hal_spi_settings {

    uint8_t data_mode;

    uint8_t data_order;

    uint8_t word_size;

    uint32_t baudrate;
};
# 97 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_init(int spi_num, void *cfg, uint8_t spi_type);
# 110 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_init_hw(uint8_t spi_num, uint8_t spi_type,
                    const struct hal_spi_hw_settings *cfg);
# 125 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_config(int spi_num, struct hal_spi_settings *psettings);
# 142 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_set_txrx_cb(int spi_num, hal_spi_txrx_cb txrx_cb, void *arg);
# 153 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_enable(int spi_num);
# 163 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_disable(int spi_num);
# 178 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
uint16_t hal_spi_tx_val(int spi_num, uint16_t val);
# 203 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_txrx(int spi_num, void *txbuf, void *rxbuf, int cnt);
# 237 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_txrx_noblock(int spi_num, void *txbuf, void *rxbuf, int cnt);
# 246 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_slave_set_def_tx_val(int spi_num, uint16_t val);
# 257 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_abort(int spi_num);
# 269 "repos/apache-mynewt-core/hw/hal/include/hal/hal_spi.h"
int hal_spi_data_mode_breakout(uint8_t data_mode,
                               int *out_cpol, int *out_cpha);
# 26 "libs/nrf24l01/include/nrf24l01/nrf24l01.h" 2





#define NRF24L01_DEVICE "nrf24l01_0"
#define NRL24L01_MAX_RX_PIPES 5


#define NRL24L01_MAX_SENSOR_NODE_NAMES NRL24L01_MAX_RX_PIPES
extern const char *nrf24l01_sensor_node_names[5];


struct nrf24l01_cfg {
    struct hal_spi_settings spi_settings;
    int spi_num;
    void *spi_cfg;
    int cs_pin;
    int ce_pin;
    int irq_pin;
    int freq;
    int power;
    int data_rate;
    int crc_width;

    int tx_size;
    uint8_t auto_ack;
    uint8_t auto_retransmit;

    unsigned long long tx_address;
    const unsigned long long *rx_addresses;
    uint8_t rx_addresses_len;
};


struct nrf24l01 {
    struct os_dev dev;
    struct nrf24l01_cfg cfg;
    uint8_t is_configured;
    void *controller;
};






void nrf24l01_create(void);


int nrf24l01_default_cfg(struct nrf24l01_cfg *cfg);


int nrf24l01_init(struct os_dev *dev0, void *arg);


int nrf24l01_config(struct nrf24l01 *dev, struct nrf24l01_cfg *cfg);





int nrf24l01_send(struct nrf24l01 *dev, uint8_t *buf, uint8_t size);


int nrf24l01_receive(struct nrf24l01 *dev, int pipe, uint8_t *buf, uint8_t size);


int nrf24l01_readable_pipe(struct nrf24l01 *dev);


unsigned long long nrf24l01_get_rx_address(struct nrf24l01 *dev, int pipe);





int nrf24l01_set_rx_callback(struct nrf24l01 *dev, void (*callback)(struct os_event *ev));





int nrf24l01_flush_tx(struct nrf24l01 *dev);


int nrf24l01_flush_rx(struct nrf24l01 *dev);


int nrf24l01_flush_txrx(struct nrf24l01 *dev);
# 17 "apps/my_sensor_app/src/send_coap.h" 2
#define SENSOR_NETWORK_INTERFACE NRF24L01_DEVICE






struct sensor_value;





int start_network_task(void);
# 41 "apps/my_sensor_app/src/send_coap.h"
int send_sensor_data(struct sensor_value *val, const char *device_name);
# 21 "apps/my_sensor_app/src/send_coap.c" 2

static int send_sensor_data_to_server(struct sensor_value *val, const char *sensor_node);
static int send_sensor_data_to_collector(struct sensor_value *val, const char *sensor_node);





#define NETWORK_TASK_STACK_SIZE OS_STACK_ALIGN(256)
static uint8_t network_task_stack[sizeof(os_stack_t) * (( ((((256)) & (((8)) - 1)) == 0) ? ((256)) : (((256)) + (((8)) - (((256)) & (((8)) - 1)))) ))];
static struct os_task network_task;
static 
# 32 "apps/my_sensor_app/src/send_coap.c" 3 4
      _Bool 
# 32 "apps/my_sensor_app/src/send_coap.c"
           network_is_ready = 
# 32 "apps/my_sensor_app/src/send_coap.c" 3 4
                              0
# 32 "apps/my_sensor_app/src/send_coap.c"
                                   ;

static void network_task_func(void *arg);

int start_network_task(void) {





    int rc = os_task_init(
        &network_task,
        "network",
        network_task_func,
        
# 46 "apps/my_sensor_app/src/send_coap.c" 3 4
       ((void *)0)
# 46 "apps/my_sensor_app/src/send_coap.c"
           ,
        10,
        (-1),
        (os_stack_t *) network_task_stack,
        (( ((((256)) & (((8)) - 1)) == 0) ? ((256)) : (((256)) + (((8)) - (((256)) & (((8)) - 1)))) )));
    ((rc == 0) ? (void)0 : __assert_func(
# 51 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 51 "apps/my_sensor_app/src/send_coap.c"
   , 0, 
# 51 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 51 "apps/my_sensor_app/src/send_coap.c"
   , 
# 51 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 51 "apps/my_sensor_app/src/send_coap.c"
   ));
    return rc;
}

static void network_task_func(void *arg) {







    console_printf("NET start\n"); ((!network_is_ready) ? (void)0 : __assert_func(
# 63 "apps/my_sensor_app/src/send_coap.c" 3 4
                                   ((void *)0)
# 63 "apps/my_sensor_app/src/send_coap.c"
                                   , 0, 
# 63 "apps/my_sensor_app/src/send_coap.c" 3 4
                                   ((void *)0)
# 63 "apps/my_sensor_app/src/send_coap.c"
                                   , 
# 63 "apps/my_sensor_app/src/send_coap.c" 3 4
                                   ((void *)0)
# 63 "apps/my_sensor_app/src/send_coap.c"
                                   ));
    int rc = 0;



    if (is_standalone_node() || is_collector_node()) {
        rc = register_server_transport(); ((rc == 0) ? (void)0 : __assert_func(
# 69 "apps/my_sensor_app/src/send_coap.c" 3 4
                                          ((void *)0)
# 69 "apps/my_sensor_app/src/send_coap.c"
                                          , 0, 
# 69 "apps/my_sensor_app/src/send_coap.c" 3 4
                                          ((void *)0)
# 69 "apps/my_sensor_app/src/send_coap.c"
                                          , 
# 69 "apps/my_sensor_app/src/send_coap.c" 3 4
                                          ((void *)0)
# 69 "apps/my_sensor_app/src/send_coap.c"
                                          ));
    }


    if (is_collector_node() || is_sensor_node()) {
        rc = register_collector_transport(); ((rc == 0) ? (void)0 : __assert_func(
# 74 "apps/my_sensor_app/src/send_coap.c" 3 4
                                             ((void *)0)
# 74 "apps/my_sensor_app/src/send_coap.c"
                                             , 0, 
# 74 "apps/my_sensor_app/src/send_coap.c" 3 4
                                             ((void *)0)
# 74 "apps/my_sensor_app/src/send_coap.c"
                                             , 
# 74 "apps/my_sensor_app/src/send_coap.c" 3 4
                                             ((void *)0)
# 74 "apps/my_sensor_app/src/send_coap.c"
                                             ));
    }
# 85 "apps/my_sensor_app/src/send_coap.c"
    network_is_ready = 
# 85 "apps/my_sensor_app/src/send_coap.c" 3 4
                      1
# 85 "apps/my_sensor_app/src/send_coap.c"
                          ;

    while (
# 87 "apps/my_sensor_app/src/send_coap.c" 3 4
          1
# 87 "apps/my_sensor_app/src/send_coap.c"
              ) {
        console_printf("NET free mbuf %d\n", os_msys_num_free());
        os_time_delay(10 * (1000));
    }
    ((
# 91 "apps/my_sensor_app/src/send_coap.c" 3 4
   0
# 91 "apps/my_sensor_app/src/send_coap.c"
   ) ? (void)0 : __assert_func(
# 91 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 91 "apps/my_sensor_app/src/send_coap.c"
   , 0, 
# 91 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 91 "apps/my_sensor_app/src/send_coap.c"
   , 
# 91 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 91 "apps/my_sensor_app/src/send_coap.c"
   ));
}

int send_sensor_data(struct sensor_value *val, const char *sensor_node) {
# 106 "apps/my_sensor_app/src/send_coap.c"
    if (should_send_to_collector(val, sensor_node)) {
        return send_sensor_data_to_collector(val, sensor_node);
    }

    return send_sensor_data_to_server(val, sensor_node);
}






static int send_sensor_data_to_server(struct sensor_value *val, const char *node_id) {
# 133 "apps/my_sensor_app/src/send_coap.c"
    ((val) ? (void)0 : __assert_func(
# 133 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 133 "apps/my_sensor_app/src/send_coap.c"
   , 0, 
# 133 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 133 "apps/my_sensor_app/src/send_coap.c"
   , 
# 133 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 133 "apps/my_sensor_app/src/send_coap.c"
   )); ((node_id) ? (void)0 : __assert_func(
# 133 "apps/my_sensor_app/src/send_coap.c" 3 4
                 ((void *)0)
# 133 "apps/my_sensor_app/src/send_coap.c"
                 , 0, 
# 133 "apps/my_sensor_app/src/send_coap.c" 3 4
                 ((void *)0)
# 133 "apps/my_sensor_app/src/send_coap.c"
                 , 
# 133 "apps/my_sensor_app/src/send_coap.c" 3 4
                 ((void *)0)
# 133 "apps/my_sensor_app/src/send_coap.c"
                 ));
    if (!network_is_ready) { return (-6); }
    const char *device_id = get_device_id(); ((device_id) ? (void)0 : __assert_func(
# 135 "apps/my_sensor_app/src/send_coap.c" 3 4
                                             ((void *)0)
# 135 "apps/my_sensor_app/src/send_coap.c"
                                             , 0, 
# 135 "apps/my_sensor_app/src/send_coap.c" 3 4
                                             ((void *)0)
# 135 "apps/my_sensor_app/src/send_coap.c"
                                             , 
# 135 "apps/my_sensor_app/src/send_coap.c" 3 4
                                             ((void *)0)
# 135 "apps/my_sensor_app/src/send_coap.c"
                                             ));




    int rc = init_server_post(
# 140 "apps/my_sensor_app/src/send_coap.c" 3 4
                             ((void *)0)
# 140 "apps/my_sensor_app/src/send_coap.c"
                                 ); ((rc != 0) ? (void)0 : __assert_func(
# 140 "apps/my_sensor_app/src/send_coap.c" 3 4
                                     ((void *)0)
# 140 "apps/my_sensor_app/src/send_coap.c"
                                     , 0, 
# 140 "apps/my_sensor_app/src/send_coap.c" 3 4
                                     ((void *)0)
# 140 "apps/my_sensor_app/src/send_coap.c"
                                     , 
# 140 "apps/my_sensor_app/src/send_coap.c" 3 4
                                     ((void *)0)
# 140 "apps/my_sensor_app/src/send_coap.c"
                                     ));


    { g_err |= cbor_encoder_create_map(&g_encoder, &root_map, CborIndefiniteLength); if ((oc_content_format == APPLICATION_JSON)) { json_rep_start_root_object(); }; { { { g_err |= cbor_encode_text_string(&root_map, "values", strlen("values")); do { CborEncoder values_array; g_err |= cbor_encoder_create_array(&root_map, &values_array, CborIndefiniteLength); if ((oc_content_format == APPLICATION_JSON)) { { json_encode_array_name(&coap_json_encoder, "values"); json_encode_array_start(&coap_json_encoder); }; }; { { { { do { CborEncoder values_map; g_err |= cbor_encoder_create_map(&values_array, &values_map, CborIndefiniteLength); if ((oc_content_format == APPLICATION_JSON)) { { json_encode_object_start(&coap_json_encoder); }; }; { { { if ((oc_content_format == APPLICATION_JSON)) { { (&coap_json_value)->jv_type = (3); (&coap_json_value)->jv_len = strlen((char *) "device"); (&coap_json_value)->jv_val.str = ((char *) "device");; json_encode_object_entry (&coap_json_encoder, "key", &coap_json_value); }; } else { do { g_err |= cbor_encode_text_string(&values_map, "key", strlen("key")); g_err |= cbor_encode_text_string(&values_map, "device", strlen("device")); } while (0); } }; { if ((oc_content_format == APPLICATION_JSON)) { { (&coap_json_value)->jv_type = (3); (&coap_json_value)->jv_len = strlen((char *) device_id); (&coap_json_value)->jv_val.str = ((char *) device_id);; json_encode_object_entry (&coap_json_encoder, "value", &coap_json_value); }; } else { do { g_err |= cbor_encode_text_string(&values_map, "value", strlen("value")); g_err |= cbor_encode_text_string(&values_map, device_id, strlen(device_id)); } while (0); } }; }; } if ((oc_content_format == APPLICATION_JSON)) { { json_encode_object_finish(&coap_json_encoder); }; } g_err |= cbor_encoder_close_container(&values_array, &values_map); } while (0);; } }; { { do { CborEncoder values_map; g_err |= cbor_encoder_create_map(&values_array, &values_map, CborIndefiniteLength); if ((oc_content_format == APPLICATION_JSON)) { { json_encode_object_start(&coap_json_encoder); }; }; { { { if ((oc_content_format == APPLICATION_JSON)) { { (&coap_json_value)->jv_type = (3); (&coap_json_value)->jv_len = strlen((char *) "node"); (&coap_json_value)->jv_val.str = ((char *) "node");; json_encode_object_entry (&coap_json_encoder, "key", &coap_json_value); }; } else { do { g_err |= cbor_encode_text_string(&values_map, "key", strlen("key")); g_err |= cbor_encode_text_string(&values_map, "node", strlen("node")); } while (0); } }; { if ((oc_content_format == APPLICATION_JSON)) { { (&coap_json_value)->jv_type = (3); (&coap_json_value)->jv_len = strlen((char *) node_id); (&coap_json_value)->jv_val.str = ((char *) node_id);; json_encode_object_entry (&coap_json_encoder, "value", &coap_json_value); }; } else { do { g_err |= cbor_encode_text_string(&values_map, "value", strlen("value")); g_err |= cbor_encode_text_string(&values_map, node_id, strlen(node_id)); } while (0); } }; }; } if ((oc_content_format == APPLICATION_JSON)) { { json_encode_object_finish(&coap_json_encoder); }; } g_err |= cbor_encoder_close_container(&values_array, &values_map); } while (0);; } }; { ((val->val_type == (1)) ? (void)0 : __assert_func(
# 143 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 143 "apps/my_sensor_app/src/send_coap.c"
   , 0, 
# 143 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 143 "apps/my_sensor_app/src/send_coap.c"
   , 
# 143 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 143 "apps/my_sensor_app/src/send_coap.c"
   )); { { do { CborEncoder values_map; g_err |= cbor_encoder_create_map(&values_array, &values_map, CborIndefiniteLength); if ((oc_content_format == APPLICATION_JSON)) { { json_encode_object_start(&coap_json_encoder); }; }; { { { if ((oc_content_format == APPLICATION_JSON)) { { (&coap_json_value)->jv_type = (3); (&coap_json_value)->jv_len = strlen((char *) val->key); (&coap_json_value)->jv_val.str = ((char *) val->key);; json_encode_object_entry (&coap_json_encoder, "key", &coap_json_value); }; } else { do { g_err |= cbor_encode_text_string(&values_map, "key", strlen("key")); g_err |= cbor_encode_text_string(&values_map, val->key, strlen(val->key)); } while (0); } }; { if ((oc_content_format == APPLICATION_JSON)) { { (&coap_json_value)->jv_type = (2); (&coap_json_value)->jv_val.u = (uint64_t) val->int_val;; json_encode_object_entry (&coap_json_encoder, "value", &coap_json_value); }; } else { do { g_err |= cbor_encode_text_string(&values_map, "value", strlen("value")); g_err |= cbor_encode_int(&values_map, val->int_val); } while (0); } }; }; } if ((oc_content_format == APPLICATION_JSON)) { { json_encode_object_finish(&coap_json_encoder); }; } g_err |= cbor_encoder_close_container(&values_array, &values_map); } while (0);; } }; }; }; } if ((oc_content_format == APPLICATION_JSON)) { json_encode_array_finish(&coap_json_encoder); } g_err |= cbor_encoder_close_container(&root_map, &values_array); } while (0);; }; }; } if ((oc_content_format == APPLICATION_JSON)) { json_rep_end_root_object(); } g_err |= cbor_encoder_close_container(&g_encoder, &root_map);; }
# 165 "apps/my_sensor_app/src/send_coap.c"
      ;




    rc = do_server_post(); ((rc != 0) ? (void)0 : __assert_func(
# 170 "apps/my_sensor_app/src/send_coap.c" 3 4
                           ((void *)0)
# 170 "apps/my_sensor_app/src/send_coap.c"
                           , 0, 
# 170 "apps/my_sensor_app/src/send_coap.c" 3 4
                           ((void *)0)
# 170 "apps/my_sensor_app/src/send_coap.c"
                           , 
# 170 "apps/my_sensor_app/src/send_coap.c" 3 4
                           ((void *)0)
# 170 "apps/my_sensor_app/src/send_coap.c"
                           ));

    console_printf("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n", device_id);




    return 0;
}
# 187 "apps/my_sensor_app/src/send_coap.c"
static int send_sensor_data_to_collector(struct sensor_value *val, const char *node_id) {
# 197 "apps/my_sensor_app/src/send_coap.c"
    ((val) ? (void)0 : __assert_func(
# 197 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 197 "apps/my_sensor_app/src/send_coap.c"
   , 0, 
# 197 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 197 "apps/my_sensor_app/src/send_coap.c"
   , 
# 197 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 197 "apps/my_sensor_app/src/send_coap.c"
   ));
    if (!network_is_ready) { return (-6); }




    int rc = init_collector_post(); ((rc != 0) ? (void)0 : __assert_func(
# 203 "apps/my_sensor_app/src/send_coap.c" 3 4
                                    ((void *)0)
# 203 "apps/my_sensor_app/src/send_coap.c"
                                    , 0, 
# 203 "apps/my_sensor_app/src/send_coap.c" 3 4
                                    ((void *)0)
# 203 "apps/my_sensor_app/src/send_coap.c"
                                    , 
# 203 "apps/my_sensor_app/src/send_coap.c" 3 4
                                    ((void *)0)
# 203 "apps/my_sensor_app/src/send_coap.c"
                                    ));


    { g_err |= cbor_encoder_create_map(&g_encoder, &root_map, CborIndefiniteLength); if ((oc_content_format == APPLICATION_JSON)) { json_rep_start_root_object(); }; { { { ((val->val_type == (1)) ? (void)0 : __assert_func(
# 206 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 206 "apps/my_sensor_app/src/send_coap.c"
   , 0, 
# 206 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 206 "apps/my_sensor_app/src/send_coap.c"
   , 
# 206 "apps/my_sensor_app/src/send_coap.c" 3 4
   ((void *)0)
# 206 "apps/my_sensor_app/src/send_coap.c"
   )); { if ((oc_content_format == APPLICATION_JSON)) { { (&coap_json_value)->jv_type = (2); (&coap_json_value)->jv_val.u = (uint64_t) val->int_val;; json_encode_object_entry (&coap_json_encoder, "val->key", &coap_json_value); }; } else { do { g_err |= cbor_encode_text_string(&root_map, val->key, strlen(val->key)); g_err |= cbor_encode_int(&root_map, val->int_val); } while (0); } }; }; }; } if ((oc_content_format == APPLICATION_JSON)) { json_rep_end_root_object(); } g_err |= cbor_encoder_close_container(&g_encoder, &root_map);; }


      ;




    rc = do_collector_post(); ((rc != 0) ? (void)0 : __assert_func(
# 214 "apps/my_sensor_app/src/send_coap.c" 3 4
                              ((void *)0)
# 214 "apps/my_sensor_app/src/send_coap.c"
                              , 0, 
# 214 "apps/my_sensor_app/src/send_coap.c" 3 4
                              ((void *)0)
# 214 "apps/my_sensor_app/src/send_coap.c"
                              , 
# 214 "apps/my_sensor_app/src/send_coap.c" 3 4
                              ((void *)0)
# 214 "apps/my_sensor_app/src/send_coap.c"
                              ));

    console_printf("NRF send to collector: rawtmp %d\n", val->int_val);



    return 0;
}






int __wrap_coap_receive( ) {




    console_printf("coap_receive NOT IMPLEMENTED\n");
    return -1;
}
