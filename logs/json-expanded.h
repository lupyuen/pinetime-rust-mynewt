# 1 "repos/apache-mynewt-core/encoding/json/src/json_encode.c"
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
# 1 "repos/apache-mynewt-core/encoding/json/src/json_encode.c"
# 20 "repos/apache-mynewt-core/encoding/json/src/json_encode.c"
# 1 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 1





#define _STDIO_H 

# 1 "repos/apache-mynewt-core/libc/baselibc/include/klibc/extern.h" 1





#define _KLIBC_EXTERN_H 
# 15 "repos/apache-mynewt-core/libc/baselibc/include/klibc/extern.h"
#define __extern extern


#define __alias(x) __attribute__((weak, alias(x)))
# 9 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/klibc/inline.h" 1





#define _KLIBC_INLINE_H 






#define __extern_inline extern inline __attribute__((gnu_inline))
# 10 "repos/apache-mynewt-core/libc/baselibc/include/stdio.h" 2
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
# 21 "repos/apache-mynewt-core/encoding/json/src/json_encode.c" 2


# 1 "repos/apache-mynewt-core/encoding/json/include/json/json.h" 1
# 21 "repos/apache-mynewt-core/encoding/json/include/json/json.h"
#define _JSON_H_ 

# 1 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdbool.h" 1 3 4
# 29 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdbool.h" 3 4
#define _STDBOOL_H 



#define bool _Bool
#define true 1
#define false 0
# 52 "/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/lib/gcc/arm-none-eabi/7.3.1/include/stdbool.h" 3 4
#define __bool_true_false_are_defined 1
# 24 "repos/apache-mynewt-core/encoding/json/include/json/json.h" 2
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
# 25 "repos/apache-mynewt-core/encoding/json/include/json/json.h" 2
# 1 "repos/apache-mynewt-core/libc/baselibc/include/ctype.h" 1







#define _CTYPE_H 
# 17 "repos/apache-mynewt-core/libc/baselibc/include/ctype.h"

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





#define __has_builtin(x) 0






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
# 24 "repos/apache-mynewt-core/encoding/json/src/json_encode.c" 2

#define JSON_ENCODE_OBJECT_START(__e) (__e)->je_write((__e)->je_arg, "{", sizeof("{")-1);


#define JSON_ENCODE_OBJECT_END(__e) (__e)->je_write((__e)->je_arg, "}", sizeof("}")-1);


#define JSON_ENCODE_ARRAY_START(__e) (__e)->je_write((__e)->je_arg, "[", sizeof("[")-1);


#define JSON_ENCODE_ARRAY_END(__e) (__e)->je_write((__e)->je_arg, "]", sizeof("]")-1);



int
json_encode_object_start(struct json_encoder *encoder)
{
    if (encoder->je_wr_commas) {
        encoder->je_write(encoder->je_arg, ",", sizeof(",")-1);
        encoder->je_wr_commas = 0;
    }
    (encoder)->je_write((encoder)->je_arg, "{", sizeof("{")-1);;
    encoder->je_wr_commas = 0;

    return (0);
}

static int
json_encode_value(struct json_encoder *encoder, struct json_value *jv)
{
    int rc;
    int i;
    int len;

    switch (jv->jv_type) {
        case (0):
            len = sprintf(encoder->je_encode_buf, "%s",
                    jv->jv_val.u > 0 ? "true" : "false");
            encoder->je_write(encoder->je_arg, encoder->je_encode_buf, len);
            break;
        case (1):
            len = sprintf(encoder->je_encode_buf, "%llu",
                    jv->jv_val.u);
            encoder->je_write(encoder->je_arg, encoder->je_encode_buf, len);
            break;
        case (2):
            len = sprintf(encoder->je_encode_buf, "%lld",
                    jv->jv_val.u);
            encoder->je_write(encoder->je_arg, encoder->je_encode_buf, len);
            break;
        case (3):
            encoder->je_write(encoder->je_arg, "\"", sizeof("\"")-1);
            for (i = 0; i < jv->jv_len; i++) {
                switch (jv->jv_val.str[i]) {
                    case '"':
                    case '/':
                    case '\\':
                        encoder->je_write(encoder->je_arg, "\\",
                                sizeof("\\")-1);
                        encoder->je_write(encoder->je_arg,
                                (char *) &jv->jv_val.str[i], 1);

                        break;
                    case '\t':
                        encoder->je_write(encoder->je_arg, "\\t",
                                sizeof("\\t")-1);
                        break;
                    case '\r':
                        encoder->je_write(encoder->je_arg, "\\r",
                                sizeof("\\r")-1);
                        break;
                    case '\n':
                        encoder->je_write(encoder->je_arg, "\\n",
                                sizeof("\\n")-1);
                        break;
                    case '\f':
                        encoder->je_write(encoder->je_arg, "\\f",
                                sizeof("\\f")-1);
                        break;
                    case '\b':
                        encoder->je_write(encoder->je_arg, "\\b",
                                sizeof("\\b")-1);
                        break;
                   default:
                        encoder->je_write(encoder->je_arg,
                                (char *) &jv->jv_val.str[i], 1);
                        break;
                }

            }
            encoder->je_write(encoder->je_arg, "\"", sizeof("\"")-1);
            break;
        case (4):
            (encoder)->je_write((encoder)->je_arg, "[", sizeof("[")-1);;
            for (i = 0; i < jv->jv_len; i++) {
                rc = json_encode_value(encoder, jv->jv_val.composite.values[i]);
                if (rc != 0) {
                    goto err;
                }
                if (i != jv->jv_len - 1) {
                    encoder->je_write(encoder->je_arg, ",", sizeof(",")-1);
                }
            }
            (encoder)->je_write((encoder)->je_arg, "]", sizeof("]")-1);;
            break;
        case (5):
            (encoder)->je_write((encoder)->je_arg, "{", sizeof("{")-1);;
            for (i = 0; i < jv->jv_len; i++) {
                rc = json_encode_object_entry(encoder,
                        jv->jv_val.composite.keys[i],
                        jv->jv_val.composite.values[i]);
                if (rc != 0) {
                    goto err;
                }
            }
            (encoder)->je_write((encoder)->je_arg, "}", sizeof("}")-1);;
            break;
        default:
            rc = -1;
            goto err;
    }


    return (0);
err:
    return (rc);
}

int
json_encode_object_key(struct json_encoder *encoder, char *key)
{
    if (encoder->je_wr_commas) {
        encoder->je_write(encoder->je_arg, ",", sizeof(",")-1);
        encoder->je_wr_commas = 0;
    }


    encoder->je_write(encoder->je_arg, "\"", sizeof("\"")-1);
    encoder->je_write(encoder->je_arg, key, strlen(key));
    encoder->je_write(encoder->je_arg, "\": ", sizeof("\": ")-1);

    return (0);
}

int
json_encode_object_entry(struct json_encoder *encoder, char *key,
        struct json_value *val)
{
    int rc;

    if (encoder->je_wr_commas) {
        encoder->je_write(encoder->je_arg, ",", sizeof(",")-1);
        encoder->je_wr_commas = 0;
    }

    encoder->je_write(encoder->je_arg, "\"", sizeof("\"")-1);
    encoder->je_write(encoder->je_arg, key, strlen(key));
    encoder->je_write(encoder->je_arg, "\": ", sizeof("\": ")-1);

    rc = json_encode_value(encoder, val);
    if (rc != 0) {
        goto err;
    }
    encoder->je_wr_commas = 1;

    return (0);
err:
    return (rc);
}

int
json_encode_object_finish(struct json_encoder *encoder)
{
    (encoder)->je_write((encoder)->je_arg, "}", sizeof("}")-1);;

    encoder->je_wr_commas = 1;

    return (0);
}

int
json_encode_array_name(struct json_encoder *encoder, char *name)
{
    return json_encode_object_key(encoder, name);
}

int
json_encode_array_start(struct json_encoder *encoder)
{
    (encoder)->je_write((encoder)->je_arg, "[", sizeof("[")-1);;
    encoder->je_wr_commas = 0;

    return (0);
}

int
json_encode_array_value(struct json_encoder *encoder, struct json_value *jv)
{
    int rc;

    if (encoder->je_wr_commas) {
        encoder->je_write(encoder->je_arg, ",", sizeof(",")-1);
        encoder->je_wr_commas = 0;
    }

    rc = json_encode_value(encoder, jv);
    if (rc != 0) {
        goto err;
    }
    encoder->je_wr_commas = 1;

    return (0);
err:
    return (rc);
}


int
json_encode_array_finish(struct json_encoder *encoder)
{
    encoder->je_wr_commas = 1;
    (encoder)->je_write((encoder)->je_arg, "]", sizeof("]")-1);;

    return (0);
}
