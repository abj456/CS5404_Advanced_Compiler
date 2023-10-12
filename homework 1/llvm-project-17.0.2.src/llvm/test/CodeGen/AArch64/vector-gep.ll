; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=arm64_32-apple-watchos2.0.0 --aarch64-neon-syntax=generic | FileCheck %s

target datalayout = "e-m:o-p:32:32-i64:64-i128:128-n32:64-S128"
target triple = "arm64_32-apple-watchos2.0.0"

; CHECK-LABEL: lCPI0_0:
; CHECK-NEXT:    .quad 36
; CHECK-NEXT:    .quad 4804

define <2 x ptr> @vector_gep(<2 x ptr> %0) {
; CHECK-LABEL: vector_gep:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:  Lloh0:
; CHECK-NEXT:    adrp x8, lCPI0_0@PAGE
; CHECK-NEXT:    movi v2.2d, #0x000000ffffffff
; CHECK-NEXT:  Lloh1:
; CHECK-NEXT:    ldr q1, [x8, lCPI0_0@PAGEOFF]
; CHECK-NEXT:    add v0.2d, v0.2d, v1.2d
; CHECK-NEXT:    and v0.16b, v0.16b, v2.16b
; CHECK-NEXT:    ret
; CHECK-NEXT:    .loh AdrpLdr Lloh0, Lloh1
entry:
  %1 = getelementptr i8, <2 x ptr> %0, <2 x i32> <i32 36, i32 4804>
  ret <2 x ptr> %1
}