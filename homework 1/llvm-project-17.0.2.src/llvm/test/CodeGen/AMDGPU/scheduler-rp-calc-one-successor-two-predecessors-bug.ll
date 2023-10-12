; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 2
; RUN: llc -march=amdgcn -mcpu=gfx900 < %s | FileCheck -check-prefix=GFX900 %s

declare void @llvm.amdgcn.kill(i1)
declare <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg)
declare <2 x half> @llvm.amdgcn.cvt.pkrtz(float, float)
declare void @llvm.amdgcn.exp.compr.v2f16(i32 immarg, i32 immarg, <2 x half>, <2 x half>, i1 immarg, i1 immarg)

define amdgpu_ps void @_amdgpu_ps_main(float %arg) {
; GFX900-LABEL: _amdgpu_ps_main:
; GFX900:       ; %bb.0: ; %bb
; GFX900-NEXT:    s_mov_b64 s[4:5], exec
; GFX900-NEXT:    s_wqm_b64 exec, exec
; GFX900-NEXT:    v_mov_b32_e32 v1, v0
; GFX900-NEXT:    s_mov_b32 s0, 0
; GFX900-NEXT:    v_cmp_ngt_f32_e32 vcc, 0, v1
; GFX900-NEXT:    ; implicit-def: $vgpr0
; GFX900-NEXT:    ; implicit-def: $sgpr2
; GFX900-NEXT:    s_and_saveexec_b64 s[6:7], vcc
; GFX900-NEXT:    s_xor_b64 s[6:7], exec, s[6:7]
; GFX900-NEXT:    s_cbranch_execz .LBB0_2
; GFX900-NEXT:  ; %bb.1: ; %bb1
; GFX900-NEXT:    v_mov_b32_e32 v0, 0
; GFX900-NEXT:    s_mov_b32 s1, s0
; GFX900-NEXT:    s_mov_b32 s2, s0
; GFX900-NEXT:    s_mov_b32 s3, s0
; GFX900-NEXT:    s_mov_b32 s8, s0
; GFX900-NEXT:    s_mov_b32 s9, s0
; GFX900-NEXT:    s_mov_b32 s10, s0
; GFX900-NEXT:    s_mov_b32 s11, s0
; GFX900-NEXT:    s_mov_b32 s12, s0
; GFX900-NEXT:    s_mov_b32 s13, s0
; GFX900-NEXT:    s_mov_b32 s14, s0
; GFX900-NEXT:    s_mov_b32 s15, s0
; GFX900-NEXT:    image_sample v[0:1], v[0:1], s[8:15], s[0:3] dmask:0x3
; GFX900-NEXT:    s_mov_b32 s2, 1.0
; GFX900-NEXT:  .LBB0_2: ; %Flow
; GFX900-NEXT:    s_or_saveexec_b64 s[0:1], s[6:7]
; GFX900-NEXT:    s_and_b64 exec, exec, s[4:5]
; GFX900-NEXT:    s_and_b64 s[0:1], exec, s[0:1]
; GFX900-NEXT:    v_mov_b32_e32 v2, s2
; GFX900-NEXT:    s_xor_b64 exec, exec, s[0:1]
; GFX900-NEXT:    s_cbranch_execz .LBB0_5
; GFX900-NEXT:  ; %bb.3: ; %bb5
; GFX900-NEXT:    s_andn2_b64 s[4:5], s[4:5], exec
; GFX900-NEXT:    s_cbranch_scc0 .LBB0_6
; GFX900-NEXT:  ; %bb.4: ; %bb5
; GFX900-NEXT:    s_mov_b64 exec, 0
; GFX900-NEXT:    s_waitcnt vmcnt(0)
; GFX900-NEXT:    v_mov_b32_e32 v1, 0
; GFX900-NEXT:    v_mov_b32_e32 v2, 0
; GFX900-NEXT:  .LBB0_5: ; %bb6
; GFX900-NEXT:    s_or_b64 exec, exec, s[0:1]
; GFX900-NEXT:    s_waitcnt vmcnt(0)
; GFX900-NEXT:    v_cvt_pkrtz_f16_f32 v1, 0, v1
; GFX900-NEXT:    v_cvt_pkrtz_f16_f32 v0, v2, v0
; GFX900-NEXT:    exp mrt0 off, off, off, off compr
; GFX900-NEXT:    s_endpgm
; GFX900-NEXT:  .LBB0_6:
; GFX900-NEXT:    s_mov_b64 exec, 0
; GFX900-NEXT:    exp null off, off, off, off done vm
; GFX900-NEXT:    s_endpgm
bb:
  %i = fcmp olt float %arg, 0.000000e+00
  br i1 %i, label %bb5, label %bb1

bb1:
  %i2 = call <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 15, float 0.000000e+00, float %arg, <8 x i32> zeroinitializer, <4 x i32> zeroinitializer, i1 false, i32 0, i32 0)
  %i3 = extractelement <4 x float> %i2, i64 1
  %i4 = extractelement <4 x float> %i2, i64 0
  br label %bb6

bb5:
  call void @llvm.amdgcn.kill(i1 false)
  br label %bb6

bb6:
  %i7 = phi float [ 0.000000e+00, %bb5 ], [ %i3, %bb1 ]
  %i8 = phi float [ 0.000000e+00, %bb5 ], [ 1.000000e+00, %bb1 ]
  %i9 = phi float [ undef, %bb5 ], [ %i4, %bb1 ]
  %i10 = call <2 x half> @llvm.amdgcn.cvt.pkrtz(float 0.000000e+00, float %i7)
  %i11 = call <2 x half> @llvm.amdgcn.cvt.pkrtz(float %i8, float %i9)
  call void @llvm.amdgcn.exp.compr.v2f16(i32 0, i32 0, <2 x half> %i10, <2 x half> %i11, i1 false, i1 false)
  ret void
}