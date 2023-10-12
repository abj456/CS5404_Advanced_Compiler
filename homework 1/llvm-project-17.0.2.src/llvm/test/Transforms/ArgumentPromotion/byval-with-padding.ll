; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature
; RUN: opt -passes=argpromotion -S %s | FileCheck %s

%struct.A = type { float, [12 x i8], i64, [8 x i8] }

define internal float @callee(ptr byval(%struct.A) align 32 %0) {
; CHECK-LABEL: define {{[^@]+}}@callee
; CHECK-SAME: (float [[DOT0_VAL:%.*]], i64 [[DOT16_VAL:%.*]]) {
; CHECK-NEXT:    [[TMP1:%.*]] = fadd float 0.000000e+00, [[DOT0_VAL]]
; CHECK-NEXT:    [[TMP2:%.*]] = uitofp i64 [[DOT16_VAL]] to float
; CHECK-NEXT:    [[TMP3:%.*]] = fmul float [[TMP1]], [[TMP2]]
; CHECK-NEXT:    ret float [[TMP3]]
;
  %2 = load float, ptr %0, align 32
  %3 = fadd float 0.000000e+00, %2
  %4 = getelementptr inbounds %struct.A, ptr %0, i32 0, i32 2
  %5 = load i64, ptr %4, align 16
  %6 = uitofp i64 %5 to float
  %7 = fmul float %3, %6
  ret float %7
}

define float @caller(float %0) {
; CHECK-LABEL: define {{[^@]+}}@caller
; CHECK-SAME: (float [[TMP0:%.*]]) {
; CHECK-NEXT:    [[TMP2:%.*]] = alloca [[STRUCT_A:%.*]], align 32
; CHECK-NEXT:    store float [[TMP0]], ptr [[TMP2]], align 32
; CHECK-NEXT:    [[TMP3:%.*]] = getelementptr inbounds [[STRUCT_A]], ptr [[TMP2]], i32 0, i32 2
; CHECK-NEXT:    store i64 2, ptr [[TMP3]], align 16
; CHECK-NEXT:    [[DOTVAL:%.*]] = load float, ptr [[TMP2]], align 32
; CHECK-NEXT:    [[TMP4:%.*]] = getelementptr i8, ptr [[TMP2]], i64 16
; CHECK-NEXT:    [[DOTVAL1:%.*]] = load i64, ptr [[TMP4]], align 16
; CHECK-NEXT:    [[TMP5:%.*]] = call noundef float @callee(float [[DOTVAL]], i64 [[DOTVAL1]])
; CHECK-NEXT:    ret float [[TMP5]]
;
  %2 = alloca %struct.A, align 32
  store float %0, ptr %2, align 32
  %3 = getelementptr inbounds %struct.A, ptr %2, i32 0, i32 2
  store i64 2, ptr %3, align 16
  %4 = call noundef float @callee(ptr byval(%struct.A) align 32 %2)
  ret float %4
}