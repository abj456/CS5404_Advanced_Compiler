; NOTE: Assertions have been autogenerated by utils/update_mir_test_checks.py
; FIXME(ndesaulniers): get this test to pass with -verify-machineinstrs
; enabled. https://github.com/llvm/llvm-project/issues/60827
; RUN: llc -mtriple=x86_64-linux-gnu %s -o - -stop-after=finalize-isel \
; RUN:   -verify-machineinstrs=0 -start-before=x86-isel | FileCheck %s

; One virtual register, w/o phi
define i32 @test0() {
  ; CHECK-LABEL: name: test0
  ; CHECK: bb.0 (%ir-block.0):
  ; CHECK-NEXT:   successors: %bb.1(0x80000000), %bb.2(0x00000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   INLINEASM_BR &"", 0 /* attdialect */, 2359306 /* regdef:GR32 */, def %1, 13 /* imm */, %bb.2
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:gr32 = COPY %1
  ; CHECK-NEXT:   JMP_1 %bb.1
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.cleanup:
  ; CHECK-NEXT:   [[MOV32ri:%[0-9]+]]:gr32 = MOV32ri 42
  ; CHECK-NEXT:   $eax = COPY [[MOV32ri]]
  ; CHECK-NEXT:   RET 0, $eax
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.2.z.split (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   $eax = COPY %1
  ; CHECK-NEXT:   RET 0, $eax
  %direct = callbr i32 asm "", "=r,!i"()
          to label %cleanup [label %z.split]

cleanup:
  ret i32 42
z.split:
  %indirect = call i32 @llvm.callbr.landingpad.i32(i32 %direct)
  ret i32 %indirect
}

; One virtual register, w/ phi
define i32 @test1() {
  ; CHECK-LABEL: name: test1
  ; CHECK: bb.0.entry:
  ; CHECK-NEXT:   successors: %bb.2(0x80000000), %bb.1(0x00000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[MOV32ri:%[0-9]+]]:gr32 = MOV32ri 42
  ; CHECK-NEXT:   INLINEASM_BR &"", 0 /* attdialect */, 2359306 /* regdef:GR32 */, def %4, 13 /* imm */, %bb.1
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:gr32 = COPY %4
  ; CHECK-NEXT:   JMP_1 %bb.2
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.z.split (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   successors: %bb.2(0x80000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY1:%[0-9]+]]:gr32 = COPY %4
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.2.cleanup:
  ; CHECK-NEXT:   [[PHI:%[0-9]+]]:gr32 = PHI [[MOV32ri]], %bb.0, [[COPY1]], %bb.1
  ; CHECK-NEXT:   $eax = COPY [[PHI]]
  ; CHECK-NEXT:   RET 0, $eax
entry:
  %direct = callbr i32 asm "", "=r,!i"()
          to label %cleanup [label %z.split]

z.split:
  %indirect = call i32 @llvm.callbr.landingpad.i32(i32 %direct)
  br label %cleanup

cleanup:
  %retval.0 = phi i32 [ %indirect, %z.split ], [ 42, %entry ]
  ret i32 %retval.0
}

; Two virtual registers
define i32 @test2() {
  ; CHECK-LABEL: name: test2
  ; CHECK: bb.0.entry:
  ; CHECK-NEXT:   successors: %bb.2(0x80000000), %bb.1(0x00000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[MOV32ri:%[0-9]+]]:gr32 = MOV32ri 42
  ; CHECK-NEXT:   INLINEASM_BR &"", 0 /* attdialect */, 2359306 /* regdef:GR32 */, def %5, 2359306 /* regdef:GR32 */, def %6, 13 /* imm */, %bb.1
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:gr32 = COPY %6
  ; CHECK-NEXT:   [[COPY1:%[0-9]+]]:gr32 = COPY %5
  ; CHECK-NEXT:   JMP_1 %bb.2
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.z.split (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   successors: %bb.2(0x80000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY2:%[0-9]+]]:gr32 = COPY %5
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.2.cleanup:
  ; CHECK-NEXT:   [[PHI:%[0-9]+]]:gr32 = PHI [[MOV32ri]], %bb.0, [[COPY2]], %bb.1
  ; CHECK-NEXT:   $eax = COPY [[PHI]]
  ; CHECK-NEXT:   RET 0, $eax
entry:
  %direct = callbr { i32, i32 } asm "", "=r,=r,!i"()
          to label %cleanup [label %z.split]

z.split:
  %indirect = call { i32, i32 } @llvm.callbr.landingpad.sl_i32i32s({ i32, i32 } %direct)
  %asmresult2 = extractvalue { i32, i32 } %indirect, 0
  br label %cleanup

cleanup:
  %retval.0 = phi i32 [ %asmresult2, %z.split ], [ 42, %entry ]
  ret i32 %retval.0
}

; One physical register
define i32 @test3() {
  ; CHECK-LABEL: name: test3
  ; CHECK: bb.0.entry:
  ; CHECK-NEXT:   successors: %bb.2(0x80000000), %bb.1(0x00000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[MOV32ri:%[0-9]+]]:gr32 = MOV32ri 42
  ; CHECK-NEXT:   INLINEASM_BR &"", 0 /* attdialect */, 10 /* regdef */, implicit-def $ebx, 13 /* imm */, %bb.1
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:gr32 = COPY $ebx
  ; CHECK-NEXT:   [[COPY1:%[0-9]+]]:gr32 = COPY [[COPY]]
  ; CHECK-NEXT:   JMP_1 %bb.2
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.z.split (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   successors: %bb.2(0x80000000)
  ; CHECK-NEXT:   liveins: $ebx
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY2:%[0-9]+]]:gr32 = COPY $ebx
  ; CHECK-NEXT:   [[COPY3:%[0-9]+]]:gr32 = COPY [[COPY2]]
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.2.cleanup:
  ; CHECK-NEXT:   [[PHI:%[0-9]+]]:gr32 = PHI [[MOV32ri]], %bb.0, [[COPY3]], %bb.1
  ; CHECK-NEXT:   $eax = COPY [[PHI]]
  ; CHECK-NEXT:   RET 0, $eax
entry:
  %direct = callbr i32 asm "", "={bx},!i"()
          to label %cleanup [label %z.split]

z.split:
  %indirect = call i32 @llvm.callbr.landingpad.i32(i32 %direct)
  br label %cleanup

cleanup:
  %retval.0 = phi i32 [ %indirect, %z.split ], [ 42, %entry ]
  ret i32 %retval.0
}

; Two physical registers
define i32 @test4() {
  ; CHECK-LABEL: name: test4
  ; CHECK: bb.0.entry:
  ; CHECK-NEXT:   successors: %bb.2(0x80000000), %bb.1(0x00000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[MOV32ri:%[0-9]+]]:gr32 = MOV32ri 42
  ; CHECK-NEXT:   INLINEASM_BR &"", 0 /* attdialect */, 10 /* regdef */, implicit-def $ebx, 10 /* regdef */, implicit-def $edx, 13 /* imm */, %bb.1
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:gr32 = COPY $ebx
  ; CHECK-NEXT:   [[COPY1:%[0-9]+]]:gr32 = COPY $edx
  ; CHECK-NEXT:   [[COPY2:%[0-9]+]]:gr32 = COPY [[COPY1]]
  ; CHECK-NEXT:   [[COPY3:%[0-9]+]]:gr32 = COPY [[COPY]]
  ; CHECK-NEXT:   JMP_1 %bb.2
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.z.split (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   successors: %bb.2(0x80000000)
  ; CHECK-NEXT:   liveins: $ebx, $edx
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY4:%[0-9]+]]:gr32 = COPY $ebx
  ; CHECK-NEXT:   [[COPY5:%[0-9]+]]:gr32 = COPY [[COPY4]]
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.2.cleanup:
  ; CHECK-NEXT:   [[PHI:%[0-9]+]]:gr32 = PHI [[MOV32ri]], %bb.0, [[COPY5]], %bb.1
  ; CHECK-NEXT:   $eax = COPY [[PHI]]
  ; CHECK-NEXT:   RET 0, $eax
entry:
  %direct = callbr { i32, i32 } asm "", "={bx},={dx},!i"()
          to label %cleanup [label %z.split]

z.split:
  %indirect = call { i32, i32 } @llvm.callbr.landingpad.sl_i32i32s({ i32, i32 } %direct)
  %asmresult2 = extractvalue { i32, i32 } %indirect, 0
  br label %cleanup

cleanup:
  %retval.0 = phi i32 [ %asmresult2, %z.split ], [ 42, %entry ]
  ret i32 %retval.0
}

; Test the same destination appearing in the direct/fallthrough branch as the
; indirect branch. Physreg.
define i32 @test5() {
  ; CHECK-LABEL: name: test5
  ; CHECK: bb.0.entry:
  ; CHECK-NEXT:   successors: %bb.1(0x80000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   INLINEASM_BR &"# $0", 0 /* attdialect */, 10 /* regdef */, implicit-def $ebx, 13 /* imm */, %bb.1
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:gr32 = COPY $ebx
  ; CHECK-NEXT:   [[COPY1:%[0-9]+]]:gr32 = COPY [[COPY]]
  ; CHECK-NEXT:   JMP_1 %bb.1
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.cleanup (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   liveins: $ebx
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY2:%[0-9]+]]:gr32 = COPY $ebx
  ; CHECK-NEXT:   $eax = COPY [[COPY2]]
  ; CHECK-NEXT:   RET 0, $eax
entry:
  %direct = callbr i32 asm "# $0", "={bx},!i"()
          to label %cleanup [label %cleanup]

cleanup:
  %indirect = call i32 @llvm.callbr.landingpad.i32(i32 %direct)
  ret i32 %indirect
}

; "The Devil's cross" (i.e. two asm goto with conflicting physreg constraints
; going to the same destination) as expressed by clang.
define i64 @test6() {
  ; CHECK-LABEL: name: test6
  ; CHECK: bb.0.entry:
  ; CHECK-NEXT:   successors: %bb.1(0x80000000), %bb.3(0x00000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   INLINEASM_BR &"", 0 /* attdialect */, 10 /* regdef */, implicit-def $rdx, 13 /* imm */, %bb.3
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:gr64 = COPY $rdx
  ; CHECK-NEXT:   [[COPY1:%[0-9]+]]:gr64 = COPY [[COPY]]
  ; CHECK-NEXT:   JMP_1 %bb.1
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.asm.fallthrough:
  ; CHECK-NEXT:   successors: %bb.2(0x80000000), %bb.4(0x00000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   INLINEASM_BR &"", 0 /* attdialect */, 10 /* regdef */, implicit-def $rbx, 13 /* imm */, %bb.4
  ; CHECK-NEXT:   [[COPY2:%[0-9]+]]:gr64 = COPY $rbx
  ; CHECK-NEXT:   [[COPY3:%[0-9]+]]:gr64 = COPY [[COPY2]]
  ; CHECK-NEXT:   JMP_1 %bb.2
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.2.foo:
  ; CHECK-NEXT:   [[PHI:%[0-9]+]]:gr64 = PHI %3, %bb.3, [[COPY3]], %bb.1, %4, %bb.4
  ; CHECK-NEXT:   $rax = COPY [[PHI]]
  ; CHECK-NEXT:   RET 0, $rax
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.3.foo.split (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   successors: %bb.2(0x80000000)
  ; CHECK-NEXT:   liveins: $rdx
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY4:%[0-9]+]]:gr64 = COPY $rdx
  ; CHECK-NEXT:   %3:gr64 = COPY [[COPY4]]
  ; CHECK-NEXT:   JMP_1 %bb.2
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.4.foo.split2 (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   successors: %bb.2(0x80000000)
  ; CHECK-NEXT:   liveins: $rbx
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY6:%[0-9]+]]:gr64 = COPY $rbx
  ; CHECK-NEXT:   %4:gr64 = COPY [[COPY6]]
  ; CHECK-NEXT:   JMP_1 %bb.2
entry:
  %0 = callbr i64 asm "", "={dx},!i"()
          to label %asm.fallthrough [label %foo.split]

asm.fallthrough:
  %1 = callbr i64 asm "", "={bx},!i"()
          to label %foo [label %foo.split2]

foo:
  %x.0 = phi i64 [ %3, %foo.split2 ], [ %2, %foo.split ], [ %1, %asm.fallthrough ]
  ret i64 %x.0

foo.split:
  %2 = call i64 @llvm.callbr.landingpad.i64(i64 %0)
  br label %foo

foo.split2:
  %3 = call i64 @llvm.callbr.landingpad.i64(i64 %1)
  br label %foo
}


; Test a callbr looping back on itself.
define i32 @test7() {
  ; CHECK-LABEL: name: test7
  ; CHECK: bb.0.entry:
  ; CHECK-NEXT:   successors: %bb.1(0x80000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[DEF:%[0-9]+]]:gr32 = IMPLICIT_DEF
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.retry:
  ; CHECK-NEXT:   successors: %bb.2(0x80000000), %bb.3(0x00000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[PHI:%[0-9]+]]:gr32 = PHI [[DEF]], %bb.0, %2, %bb.3
  ; CHECK-NEXT:   [[COPY:%[0-9]+]]:gr32 = COPY [[PHI]]
  ; CHECK-NEXT:   INLINEASM_BR &"", 0 /* attdialect */, 10 /* regdef */, implicit-def $edx, 2147483657 /* reguse tiedto:$0 */, [[COPY]](tied-def 3), 13 /* imm */, %bb.3
  ; CHECK-NEXT:   [[COPY1:%[0-9]+]]:gr32 = COPY $edx
  ; CHECK-NEXT:   [[COPY2:%[0-9]+]]:gr32 = COPY [[COPY1]]
  ; CHECK-NEXT:   JMP_1 %bb.2
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.2.asm.fallthrough:
  ; CHECK-NEXT:   $eax = COPY [[COPY2]]
  ; CHECK-NEXT:   RET 0, $eax
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.3.retry.split (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   successors: %bb.1(0x80000000)
  ; CHECK-NEXT:   liveins: $edx
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[COPY3:%[0-9]+]]:gr32 = COPY $edx
  ; CHECK-NEXT:   %2:gr32 = COPY [[COPY3]]
  ; CHECK-NEXT:   JMP_1 %bb.1
entry:
  br label %retry

retry:
  %x.0 = phi i32 [ undef, %entry ], [ %1, %retry.split ]
  %0 = callbr i32 asm "", "={dx},0,!i"(i32 %x.0)
          to label %asm.fallthrough [label %retry.split]

asm.fallthrough:
  ret i32 %0

retry.split:
  %1 = call i32 @llvm.callbr.landingpad.i32(i32 %0)
  br label %retry
}

; Test the same destination appearing in the direct/fallthrough branch as the
; indirect branch. Same as test5 but with a virtreg rather than a physreg
; constraint.
define i32 @test8() {
  ; CHECK-LABEL: name: test8
  ; CHECK: bb.0.entry:
  ; CHECK-NEXT:   successors: %bb.1(0x80000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   INLINEASM_BR &"# $0", 0 /* attdialect */, 2359306 /* regdef:GR32 */, def %1, 13 /* imm */, %bb.1
  ; CHECK-NEXT:   %0:gr32 = COPY %1
  ; CHECK-NEXT:   JMP_1 %bb.1
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.cleanup (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   $eax = COPY %1
  ; CHECK-NEXT:   RET 0, $eax
entry:
  %direct = callbr i32 asm "# $0", "=r,!i"()
          to label %cleanup [label %cleanup]

cleanup:
  %indirect = call i32 @llvm.callbr.landingpad.i32(i32 %direct)
  ret i32 %indirect
}

define i64 @condition_code() {
  ; CHECK-LABEL: name: condition_code
  ; CHECK: bb.0 (%ir-block.0):
  ; CHECK-NEXT:   successors: %bb.1(0x80000000), %bb.2(0x00000000)
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   INLINEASM_BR &"", 16 /* maystore attdialect */, 2359306 /* regdef:GR32 */, def %1, 13 /* imm */, %bb.2
  ; CHECK-NEXT:   [[SETCCr:%[0-9]+]]:gr8 = SETCCr 4, implicit $eflags
  ; CHECK-NEXT:   [[MOVZX32rr8_:%[0-9]+]]:gr32 = MOVZX32rr8 killed [[SETCCr]]
  ; CHECK-NEXT:   [[SUBREG_TO_REG:%[0-9]+]]:gr64 = SUBREG_TO_REG 0, killed [[MOVZX32rr8_]], %subreg.sub_32bit
  ; CHECK-NEXT:   JMP_1 %bb.1
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.1.b:
  ; CHECK-NEXT:   $rax = COPY [[SUBREG_TO_REG]]
  ; CHECK-NEXT:   RET 0, $rax
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT: bb.2.c (machine-block-address-taken, inlineasm-br-indirect-target):
  ; CHECK-NEXT:   [[SETCCr1:%[0-9]+]]:gr8 = SETCCr 4, implicit $eflags
  ; CHECK-NEXT:   [[MOVZX32rr8_1:%[0-9]+]]:gr32 = MOVZX32rr8 killed [[SETCCr1]]
  ; CHECK-NEXT:   [[SUBREG_TO_REG1:%[0-9]+]]:gr64 = SUBREG_TO_REG 0, killed [[MOVZX32rr8_1]], %subreg.sub_32bit
  ; CHECK-NEXT:   $rax = COPY [[SUBREG_TO_REG1]]
  ; CHECK-NEXT:   RET 0, $rax
  %a = callbr i64 asm "", "={@ccz},!i"()
       to label %b [label %c]

b:
  ret i64 %a

c:
  %1 = call i64 @llvm.callbr.landingpad.i64(i64 %a)
  ret i64 %1
}

declare i64 @llvm.callbr.landingpad.i64(i64)
declare i32 @llvm.callbr.landingpad.i32(i32)
declare { i32, i32 } @llvm.callbr.landingpad.sl_i32i32s({ i32, i32 })