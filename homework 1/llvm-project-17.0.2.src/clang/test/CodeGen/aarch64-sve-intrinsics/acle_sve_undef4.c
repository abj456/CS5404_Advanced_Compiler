// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %clang_cc1 -triple aarch64-none-linux-gnu -target-feature +sve -S -O2 -Werror -Wall -emit-llvm -o - %s | opt -S -passes=mem2reg,tailcallelim | FileCheck %s
// RUN: %clang_cc1 -triple aarch64-none-linux-gnu -target-feature +sve -S -O2 -Werror -Wall -emit-llvm -o - -x c++ %s | opt -S -passes=mem2reg,tailcallelim | FileCheck %s -check-prefix=CPP-CHECK

// REQUIRES: aarch64-registered-target

#include <arm_sve.h>

// CHECK-LABEL: @test_svundef4_s8(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 64 x i8> undef
//
// CPP-CHECK-LABEL: @_Z16test_svundef4_s8v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 64 x i8> undef
//
svint8x4_t test_svundef4_s8()
{
  return svundef4_s8();
}

// CHECK-LABEL: @test_svundef4_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 32 x i16> undef
//
// CPP-CHECK-LABEL: @_Z17test_svundef4_s16v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 32 x i16> undef
//
svint16x4_t test_svundef4_s16()
{
  return svundef4_s16();
}

// CHECK-LABEL: @test_svundef4_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 16 x i32> undef
//
// CPP-CHECK-LABEL: @_Z17test_svundef4_s32v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 16 x i32> undef
//
svint32x4_t test_svundef4_s32()
{
  return svundef4_s32();
}

// CHECK-LABEL: @test_svundef4_s64(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 8 x i64> undef
//
// CPP-CHECK-LABEL: @_Z17test_svundef4_s64v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 8 x i64> undef
//
svint64x4_t test_svundef4_s64()
{
  return svundef4_s64();
}

// CHECK-LABEL: @test_svundef4_u8(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 64 x i8> undef
//
// CPP-CHECK-LABEL: @_Z16test_svundef4_u8v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 64 x i8> undef
//
svuint8x4_t test_svundef4_u8()
{
  return svundef4_u8();
}

// CHECK-LABEL: @test_svundef4_u16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 32 x i16> undef
//
// CPP-CHECK-LABEL: @_Z17test_svundef4_u16v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 32 x i16> undef
//
svuint16x4_t test_svundef4_u16()
{
  return svundef4_u16();
}

// CHECK-LABEL: @test_svundef4_u32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 16 x i32> undef
//
// CPP-CHECK-LABEL: @_Z17test_svundef4_u32v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 16 x i32> undef
//
svuint32x4_t test_svundef4_u32()
{
  return svundef4_u32();
}

// CHECK-LABEL: @test_svundef4_u64(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 8 x i64> undef
//
// CPP-CHECK-LABEL: @_Z17test_svundef4_u64v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 8 x i64> undef
//
svuint64x4_t test_svundef4_u64()
{
  return svundef4_u64();
}

// CHECK-LABEL: @test_svundef4_f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 32 x half> undef
//
// CPP-CHECK-LABEL: @_Z17test_svundef4_f16v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 32 x half> undef
//
svfloat16x4_t test_svundef4_f16()
{
  return svundef4_f16();
}

// CHECK-LABEL: @test_svundef4_f32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 16 x float> undef
//
// CPP-CHECK-LABEL: @_Z17test_svundef4_f32v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 16 x float> undef
//
svfloat32x4_t test_svundef4_f32()
{
  return svundef4_f32();
}

// CHECK-LABEL: @test_svundef4_f64(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <vscale x 8 x double> undef
//
// CPP-CHECK-LABEL: @_Z17test_svundef4_f64v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    ret <vscale x 8 x double> undef
//
svfloat64x4_t test_svundef4_f64()
{
  return svundef4_f64();
}