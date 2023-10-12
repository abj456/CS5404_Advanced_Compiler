; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown -mattr=+sse2 | FileCheck %s --check-prefixes=CHECK,X86
; RUN: llc < %s -mtriple=x86_64-unknown -mattr=+sse2 | FileCheck %s --check-prefixes=CHECK,X64

define <2 x i64> @t1(<2 x i64> %x1, i32 %bits) nounwind  {
; X86-LABEL: t1:
; X86:       # %bb.0: # %entry
; X86-NEXT:    movd {{.*#+}} xmm1 = mem[0],zero,zero,zero
; X86-NEXT:    psllq %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: t1:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movd %edi, %xmm1
; X64-NEXT:    psllq %xmm1, %xmm0
; X64-NEXT:    retq
entry:
	%tmp3 = tail call <2 x i64> @llvm.x86.sse2.pslli.q( <2 x i64> %x1, i32 %bits ) nounwind readnone 		; <<2 x i64>> [#uses=1]
	ret <2 x i64> %tmp3
}

define <2 x i64> @t2(<2 x i64> %x1) nounwind  {
; CHECK-LABEL: t2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    psllq $10, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
entry:
	%tmp3 = tail call <2 x i64> @llvm.x86.sse2.pslli.q( <2 x i64> %x1, i32 10 ) nounwind readnone 		; <<2 x i64>> [#uses=1]
	ret <2 x i64> %tmp3
}

define <2 x i64> @t3(<2 x i64> %x1, i32 %bits) nounwind  {
; X86-LABEL: t3:
; X86:       # %bb.0: # %entry
; X86-NEXT:    movd {{.*#+}} xmm1 = mem[0],zero,zero,zero
; X86-NEXT:    psraw %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: t3:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movd %edi, %xmm1
; X64-NEXT:    psraw %xmm1, %xmm0
; X64-NEXT:    retq
entry:
	%tmp2 = bitcast <2 x i64> %x1 to <8 x i16>		; <<8 x i16>> [#uses=1]
	%tmp4 = tail call <8 x i16> @llvm.x86.sse2.psrai.w( <8 x i16> %tmp2, i32 %bits ) nounwind readnone 		; <<8 x i16>> [#uses=1]
	%tmp5 = bitcast <8 x i16> %tmp4 to <2 x i64>		; <<2 x i64>> [#uses=1]
	ret <2 x i64> %tmp5
}

declare <8 x i16> @llvm.x86.sse2.psrai.w(<8 x i16>, i32) nounwind readnone
declare <2 x i64> @llvm.x86.sse2.pslli.q(<2 x i64>, i32) nounwind readnone