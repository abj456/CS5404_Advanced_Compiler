; ModuleID = 'test3.ll'
source_filename = "test3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %A = alloca [40 x i32], align 16
  %B = alloca [40 x i32], align 16
  %C = alloca [40 x i32], align 16
  %D = alloca [40 x i32], align 16
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %i.01 = phi i32 [ 2, %entry ], [ %inc, %for.inc ]
  %mul = mul nsw i32 2, %i.01
  %sub = sub nsw i32 %mul, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds [40 x i32], ptr %C, i64 0, i64 %idxprom
  %0 = load i32, ptr %arrayidx, align 4
  %sub1 = sub nsw i32 %i.01, 1
  %idxprom2 = sext i32 %sub1 to i64
  %arrayidx3 = getelementptr inbounds [40 x i32], ptr %A, i64 0, i64 %idxprom2
  store i32 %0, ptr %arrayidx3, align 4
  %mul4 = mul nsw i32 3, %i.01
  %sub5 = sub nsw i32 %mul4, 4
  %idxprom6 = sext i32 %sub5 to i64
  %arrayidx7 = getelementptr inbounds [40 x i32], ptr %A, i64 0, i64 %idxprom6
  %1 = load i32, ptr %arrayidx7, align 4
  %idxprom8 = sext i32 %i.01 to i64
  %arrayidx9 = getelementptr inbounds [40 x i32], ptr %D, i64 0, i64 %idxprom8
  store i32 %1, ptr %arrayidx9, align 4
  %idxprom10 = sext i32 %i.01 to i64
  %arrayidx11 = getelementptr inbounds [40 x i32], ptr %B, i64 0, i64 %idxprom10
  %2 = load i32, ptr %arrayidx11, align 4
  %add = add nsw i32 %i.01, 1
  %idxprom12 = sext i32 %add to i64
  %arrayidx13 = getelementptr inbounds [40 x i32], ptr %D, i64 0, i64 %idxprom12
  store i32 %2, ptr %arrayidx13, align 4
  %add14 = add nsw i32 %i.01, 1
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds [40 x i32], ptr %C, i64 0, i64 %idxprom15
  %3 = load i32, ptr %arrayidx16, align 4
  %mul17 = mul nsw i32 2, %i.01
  %sub18 = sub nsw i32 %mul17, 1
  %idxprom19 = sext i32 %sub18 to i64
  %arrayidx20 = getelementptr inbounds [40 x i32], ptr %D, i64 0, i64 %idxprom19
  %4 = load i32, ptr %arrayidx20, align 4
  %add21 = add nsw i32 %3, %4
  %mul22 = mul nsw i32 2, %i.01
  %sub23 = sub nsw i32 %mul22, 2
  %idxprom24 = sext i32 %sub23 to i64
  %arrayidx25 = getelementptr inbounds [40 x i32], ptr %B, i64 0, i64 %idxprom24
  store i32 %add21, ptr %arrayidx25, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.01, 1
  %cmp = icmp slt i32 %inc, 20
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !6

for.end:                                          ; preds = %for.inc
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.2"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
