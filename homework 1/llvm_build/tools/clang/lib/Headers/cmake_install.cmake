# Install script for directory: /Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "clang-resource-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/builtins.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/float.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/inttypes.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/iso646.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/limits.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/module.modulemap"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdalign.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdarg.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdatomic.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdbool.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stddef.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__stddef_max_align_t.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdint.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdnoreturn.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/tgmath.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/unwind.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/varargs.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/arm_acle.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/arm_cmse.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/armintr.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/arm64intr.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/arm_neon_sve_bridge.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_builtin_vars.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_math.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_cmath.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_complex_builtins.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_device_functions.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_intrinsics.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_texture_intrinsics.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_libdevice_declares.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_math_forward_declares.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_runtime_wrapper.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hexagon_circ_brev_intrinsics.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hexagon_protos.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hexagon_types.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hvx_hexagon_protos.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_hip_libdevice_declares.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_hip_cmath.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_hip_math.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_hip_stdlib.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_hip_runtime_wrapper.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/larchintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/msa.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/opencl-c.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/opencl-c-base.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/altivec.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/htmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/htmxlintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/riscv_ntlh.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/sifive_vector.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/s390intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/vecintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/velintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/velintrin_gen.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/velintrin_approx.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/adxintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ammintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/amxcomplexintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/amxfp16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/amxintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx2intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512bf16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512bitalgintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512bwintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512cdintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512dqintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512erintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512fintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512fp16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512ifmaintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512ifmavlintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512pfintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vbmi2intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vbmiintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vbmivlintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlbf16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlbitalgintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlbwintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlcdintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vldqintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlfp16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlvbmi2intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlvnniintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlvp2intersectintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vnniintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vp2intersectintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vpopcntdqintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vpopcntdqvlintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxifmaintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxneconvertintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxvnniint16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxvnniint8intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxvnniintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/bmi2intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/bmiintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cetintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cldemoteintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/clflushoptintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/clwbintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/clzerointrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cmpccxaddintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/crc32intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/emmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/enqcmdintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/f16cintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/fma4intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/fmaintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/fxsrintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/gfniintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hresetintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ia32intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/immintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/invpcidintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/keylockerintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/lwpintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/lzcntintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/mm3dnow.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/mmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/movdirintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/mwaitxintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/nmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/pconfigintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/pkuintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/pmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/popcntintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/prfchiintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/prfchwintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ptwriteintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/raointintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/rdpruintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/rdseedintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/rtmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/serializeintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/sgxintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/sha512intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/shaintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/sm3intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/sm4intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/smmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/tbmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/tmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/tsxldtrkintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/uintrintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/vaesintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/vpclmulqdqintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/waitpkgintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/wbnoinvdintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__wmmintrin_aes.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/wmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__wmmintrin_pclmul.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/x86gprintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/x86intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xopintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xsavecintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xsaveintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xsaveoptintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xsavesintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xtestintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cet.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cpuid.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/wasm_simd128.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/vadefs.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/mm_malloc.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_neon.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_fp16.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_sve.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_sme_draft_spec_subject_to_change.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_bf16.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_mve.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_cde.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "clang-resource-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/cuda_wrappers" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/algorithm"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/cmath"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/complex"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/new"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "clang-resource-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/cuda_wrappers/bits" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/bits/shared_ptr_base.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/bits/basic_string.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/bits/basic_string.tcc"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "clang-resource-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/ppc_wrappers" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/mmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/xmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/mm_malloc.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/emmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/pmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/tmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/smmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/bmiintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/bmi2intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/immintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/x86intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/x86gprintrin.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "clang-resource-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/llvm_libc_wrappers" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/llvm_libc_wrappers/stdio.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/llvm_libc_wrappers/stdlib.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/llvm_libc_wrappers/string.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/llvm_libc_wrappers/ctype.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/llvm_libc_wrappers/inttypes.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "clang-resource-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/openmp_wrappers" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/math.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/cmath"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/complex.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/complex"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/__clang_openmp_device_functions.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/complex_cmath.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/new"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "core-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/builtins.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/float.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/inttypes.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/iso646.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/limits.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/module.modulemap"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdalign.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdarg.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdatomic.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdbool.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stddef.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__stddef_max_align_t.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdint.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/stdnoreturn.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/tgmath.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/unwind.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/varargs.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "arm-common-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/arm_acle.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_neon.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_fp16.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "arm-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/arm_cmse.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/armintr.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_mve.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_cde.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "aarch64-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/arm64intr.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/arm_neon_sve_bridge.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_sve.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_sme_draft_spec_subject_to_change.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm_build/tools/clang/lib/Headers/arm_bf16.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "cuda-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/cuda_wrappers" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/algorithm"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/cmath"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/complex"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/new"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "cuda-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/cuda_wrappers/bits" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/bits/shared_ptr_base.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/bits/basic_string.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cuda_wrappers/bits/basic_string.tcc"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "cuda-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_builtin_vars.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_math.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_cmath.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_complex_builtins.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_device_functions.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_intrinsics.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_texture_intrinsics.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_libdevice_declares.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_math_forward_declares.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_cuda_runtime_wrapper.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "hexagon-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hexagon_circ_brev_intrinsics.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hexagon_protos.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hexagon_types.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hvx_hexagon_protos.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "hip-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_hip_libdevice_declares.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_hip_cmath.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_hip_math.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_hip_stdlib.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__clang_hip_runtime_wrapper.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "loongarch-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/larchintrin.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "mips-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/msa.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "ppc-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/ppc_wrappers" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/mmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/xmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/mm_malloc.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/emmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/pmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/tmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/smmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/bmiintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/bmi2intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/immintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/x86intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ppc_wrappers/x86gprintrin.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "ppc-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/altivec.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "ppc-htm-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/htmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/htmxlintrin.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "riscv-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/riscv_ntlh.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "systemz-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/s390intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/vecintrin.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "ve-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/velintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/velintrin_gen.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/velintrin_approx.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "webassembly-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/wasm_simd128.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "x86-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/adxintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ammintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/amxcomplexintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/amxfp16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/amxintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx2intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512bf16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512bitalgintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512bwintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512cdintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512dqintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512erintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512fintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512fp16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512ifmaintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512ifmavlintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512pfintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vbmi2intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vbmiintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vbmivlintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlbf16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlbitalgintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlbwintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlcdintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vldqintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlfp16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlvbmi2intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlvnniintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vlvp2intersectintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vnniintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vp2intersectintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vpopcntdqintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avx512vpopcntdqvlintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxifmaintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxneconvertintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxvnniint16intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxvnniint8intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/avxvnniintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/bmi2intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/bmiintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cetintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cldemoteintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/clflushoptintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/clwbintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/clzerointrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cmpccxaddintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/crc32intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/emmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/enqcmdintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/f16cintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/fma4intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/fmaintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/fxsrintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/gfniintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hresetintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ia32intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/immintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/invpcidintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/keylockerintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/lwpintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/lzcntintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/mm3dnow.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/mmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/movdirintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/mwaitxintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/nmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/pconfigintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/pkuintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/pmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/popcntintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/prfchiintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/prfchwintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/ptwriteintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/raointintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/rdpruintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/rdseedintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/rtmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/serializeintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/sgxintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/sha512intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/shaintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/sm3intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/sm4intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/smmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/tbmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/tmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/tsxldtrkintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/uintrintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/vaesintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/vpclmulqdqintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/waitpkgintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/wbnoinvdintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__wmmintrin_aes.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/wmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/__wmmintrin_pclmul.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/x86gprintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/x86intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xmmintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xopintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xsavecintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xsaveintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xsaveoptintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xsavesintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/xtestintrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cet.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/cpuid.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "hlsl-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hlsl.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "hlsl-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/hlsl" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hlsl/hlsl_basic_types.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/hlsl/hlsl_intrinsics.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "opencl-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/opencl-c.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/opencl-c-base.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "openmp-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/openmp_wrappers" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/math.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/cmath"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/complex.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/complex"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/__clang_openmp_device_functions.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/complex_cmath.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/new"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "openmp-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include/openmp_wrappers" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/math.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/cmath"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/complex.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/complex"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/__clang_openmp_device_functions.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/complex_cmath.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/openmp_wrappers/new"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "utility-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/mm_malloc.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "windows-resource-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/17/include" TYPE FILE FILES
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/intrin.h"
    "/Users/caipintang/git-tmp/Advanced-Compiler/homework 1/llvm-project-17.0.2.src/clang/lib/Headers/vadefs.h"
    )
endif()

