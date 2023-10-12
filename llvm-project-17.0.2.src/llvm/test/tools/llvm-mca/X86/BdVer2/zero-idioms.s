# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=bdver2 -timeline -register-file-stats -iterations=1 < %s | FileCheck %s

subl  %eax, %eax
subq  %rax, %rax
xorl  %eax, %eax
xorq  %rax, %rax

pcmpgtb   %mm2, %mm2
pcmpgtd   %mm2, %mm2
# pcmpgtq   %mm2, %mm2 # invalid operand for instruction
pcmpgtw   %mm2, %mm2

pcmpgtb   %xmm2, %xmm2
pcmpgtd   %xmm2, %xmm2
pcmpgtq   %xmm2, %xmm2
pcmpgtw   %xmm2, %xmm2

vpcmpgtb  %xmm3, %xmm3, %xmm3
vpcmpgtd  %xmm3, %xmm3, %xmm3
vpcmpgtq  %xmm3, %xmm3, %xmm3
vpcmpgtw  %xmm3, %xmm3, %xmm3

vpcmpgtb  %xmm3, %xmm3, %xmm5
vpcmpgtd  %xmm3, %xmm3, %xmm5
vpcmpgtq  %xmm3, %xmm3, %xmm5
vpcmpgtw  %xmm3, %xmm3, %xmm5

psubb   %mm2, %mm2
psubd   %mm2, %mm2
psubq   %mm2, %mm2
psubw   %mm2, %mm2
psubb   %xmm2, %xmm2
psubd   %xmm2, %xmm2
psubq   %xmm2, %xmm2
psubw   %xmm2, %xmm2
vpsubb  %xmm3, %xmm3, %xmm3
vpsubd  %xmm3, %xmm3, %xmm3
vpsubq  %xmm3, %xmm3, %xmm3
vpsubw  %xmm3, %xmm3, %xmm3

vpsubb  %xmm3, %xmm3, %xmm5
vpsubd  %xmm3, %xmm3, %xmm5
vpsubq  %xmm3, %xmm3, %xmm5
vpsubw  %xmm3, %xmm3, %xmm5

psubsb   %mm2, %mm2
psubsw   %mm2, %mm2
psubsb   %xmm2, %xmm2
psubsw   %xmm2, %xmm2
vpsubsb  %xmm3, %xmm3, %xmm3
vpsubsw  %xmm3, %xmm3, %xmm3

vpsubsb  %xmm3, %xmm3, %xmm5
vpsubsw  %xmm3, %xmm3, %xmm5

psubusb   %mm2, %mm2
psubusw   %mm2, %mm2
psubusb   %xmm2, %xmm2
psubusw   %xmm2, %xmm2
vpsubusb  %xmm3, %xmm3, %xmm3
vpsubusw  %xmm3, %xmm3, %xmm3

vpsubsb  %xmm3, %xmm3, %xmm5
vpsubsw  %xmm3, %xmm3, %xmm5

andnps  %xmm0, %xmm0
andnpd  %xmm1, %xmm1
vandnps %xmm2, %xmm2, %xmm2
vandnpd %xmm1, %xmm1, %xmm1
pandn   %mm2, %mm2
pandn   %xmm2, %xmm2
vpandn  %xmm3, %xmm3, %xmm3

vandnps %xmm2, %xmm2, %xmm5
vandnpd %xmm1, %xmm1, %xmm5
vpandn  %xmm3, %xmm3, %xmm5

xorps  %xmm0, %xmm0
xorpd  %xmm1, %xmm1
vxorps %xmm2, %xmm2, %xmm2
vxorpd %xmm1, %xmm1, %xmm1
pxor   %mm2, %mm2
pxor   %xmm2, %xmm2
vpxor  %xmm3, %xmm3, %xmm3

vxorps %xmm4, %xmm4, %xmm5
vxorpd %xmm1, %xmm1, %xmm3
vpxor  %xmm3, %xmm3, %xmm5

# CHECK:      Iterations:        1
# CHECK-NEXT: Instructions:      71
# CHECK-NEXT: Total Cycles:      26
# CHECK-NEXT: Total uOps:        71

# CHECK:      Dispatch Width:    4
# CHECK-NEXT: uOps Per Cycle:    2.73
# CHECK-NEXT: IPC:               2.73
# CHECK-NEXT: Block RThroughput: 17.8

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      0     0.25                        subl	%eax, %eax
# CHECK-NEXT:  1      0     0.25                        subq	%rax, %rax
# CHECK-NEXT:  1      0     0.25                        xorl	%eax, %eax
# CHECK-NEXT:  1      0     0.25                        xorq	%rax, %rax
# CHECK-NEXT:  1      0     0.25                        pcmpgtb	%mm2, %mm2
# CHECK-NEXT:  1      0     0.25                        pcmpgtd	%mm2, %mm2
# CHECK-NEXT:  1      0     0.25                        pcmpgtw	%mm2, %mm2
# CHECK-NEXT:  1      0     0.25                        pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT:  1      2     0.50                        pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        vpcmpgtb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.25                        vpcmpgtd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      2     0.50                        vpcmpgtq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.25                        vpcmpgtw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.25                        vpcmpgtb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.25                        vpcmpgtd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      2     0.50                        vpcmpgtq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.25                        vpcmpgtw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.25                        psubb	%mm2, %mm2
# CHECK-NEXT:  1      0     0.25                        psubd	%mm2, %mm2
# CHECK-NEXT:  1      0     0.25                        psubq	%mm2, %mm2
# CHECK-NEXT:  1      0     0.25                        psubw	%mm2, %mm2
# CHECK-NEXT:  1      0     0.25                        psubb	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        psubd	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        psubq	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        psubw	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        vpsubb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.25                        vpsubd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.25                        vpsubq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.25                        vpsubw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.25                        vpsubb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.25                        vpsubd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.25                        vpsubq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.25                        vpsubw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      2     0.50                        psubsb	%mm2, %mm2
# CHECK-NEXT:  1      2     0.50                        psubsw	%mm2, %mm2
# CHECK-NEXT:  1      2     0.50                        psubsb	%xmm2, %xmm2
# CHECK-NEXT:  1      2     0.50                        psubsw	%xmm2, %xmm2
# CHECK-NEXT:  1      2     0.50                        vpsubsb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      2     0.50                        vpsubsw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      2     0.50                        vpsubsb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      2     0.50                        vpsubsw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      2     0.50                        psubusb	%mm2, %mm2
# CHECK-NEXT:  1      2     0.50                        psubusw	%mm2, %mm2
# CHECK-NEXT:  1      2     0.50                        psubusb	%xmm2, %xmm2
# CHECK-NEXT:  1      2     0.50                        psubusw	%xmm2, %xmm2
# CHECK-NEXT:  1      2     0.50                        vpsubusb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      2     0.50                        vpsubusw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      2     0.50                        vpsubsb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      2     0.50                        vpsubsw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.25                        andnps	%xmm0, %xmm0
# CHECK-NEXT:  1      0     0.25                        andnpd	%xmm1, %xmm1
# CHECK-NEXT:  1      0     0.25                        vandnps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        vandnpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT:  1      0     0.25                        pandn	%mm2, %mm2
# CHECK-NEXT:  1      0     0.25                        pandn	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.25                        vandnps	%xmm2, %xmm2, %xmm5
# CHECK-NEXT:  1      0     0.25                        vandnpd	%xmm1, %xmm1, %xmm5
# CHECK-NEXT:  1      0     0.25                        vpandn	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.25                        xorps	%xmm0, %xmm0
# CHECK-NEXT:  1      0     0.25                        xorpd	%xmm1, %xmm1
# CHECK-NEXT:  1      0     0.25                        vxorps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        vxorpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT:  1      0     0.25                        pxor	%mm2, %mm2
# CHECK-NEXT:  1      0     0.25                        pxor	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.25                        vpxor	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.25                        vxorps	%xmm4, %xmm4, %xmm5
# CHECK-NEXT:  1      0     0.25                        vxorpd	%xmm1, %xmm1, %xmm3
# CHECK-NEXT:  1      0     0.25                        vpxor	%xmm3, %xmm3, %xmm5

# CHECK:      Register File statistics:
# CHECK-NEXT: Total number of mappings created:    1
# CHECK-NEXT: Max number of mappings used:         1

# CHECK:      *  Register File #1 -- PdFpuPRF:
# CHECK-NEXT:    Number of physical registers:     160
# CHECK-NEXT:    Total number of mappings created: 1
# CHECK-NEXT:    Max number of mappings used:      1

# CHECK:      *  Register File #2 -- PdIntegerPRF:
# CHECK-NEXT:    Number of physical registers:     96
# CHECK-NEXT:    Total number of mappings created: 0
# CHECK-NEXT:    Max number of mappings used:      0

# CHECK:      Resources:
# CHECK-NEXT: [0.0] - PdAGLU01
# CHECK-NEXT: [0.1] - PdAGLU01
# CHECK-NEXT: [1]   - PdBranch
# CHECK-NEXT: [2]   - PdCount
# CHECK-NEXT: [3]   - PdDiv
# CHECK-NEXT: [4]   - PdEX0
# CHECK-NEXT: [5]   - PdEX1
# CHECK-NEXT: [6]   - PdFPCVT
# CHECK-NEXT: [7.0] - PdFPFMA
# CHECK-NEXT: [7.1] - PdFPFMA
# CHECK-NEXT: [8.0] - PdFPMAL
# CHECK-NEXT: [8.1] - PdFPMAL
# CHECK-NEXT: [9]   - PdFPMMA
# CHECK-NEXT: [10]  - PdFPSTO
# CHECK-NEXT: [11]  - PdFPU0
# CHECK-NEXT: [12]  - PdFPU1
# CHECK-NEXT: [13]  - PdFPU2
# CHECK-NEXT: [14]  - PdFPU3
# CHECK-NEXT: [15]  - PdFPXBR
# CHECK-NEXT: [16.0] - PdLoad
# CHECK-NEXT: [16.1] - PdLoad
# CHECK-NEXT: [17]  - PdMul
# CHECK-NEXT: [18]  - PdStore

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0.0]  [0.1]  [1]    [2]    [3]    [4]    [5]    [6]    [7.0]  [7.1]  [8.0]  [8.1]  [9]    [10]   [11]   [12]   [13]   [14]   [15]   [16.0] [16.1] [17]   [18]
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -     9.00   10.00   -      -      -      -     9.00   10.00   -      -      -      -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0.0]  [0.1]  [1]    [2]    [3]    [4]    [5]    [6]    [7.0]  [7.1]  [8.0]  [8.1]  [9]    [10]   [11]   [12]   [13]   [14]   [15]   [16.0] [16.1] [17]   [18]   Instructions:
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     subl	%eax, %eax
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     subq	%rax, %rax
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     xorl	%eax, %eax
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     xorq	%rax, %rax
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtb	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtd	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtw	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -     pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -      -     vpcmpgtq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -     vpcmpgtq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubb	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubd	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubq	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubw	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubb	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubd	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubq	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubw	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -      -     psubsb	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -     psubsw	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -      -     psubsb	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -     psubsw	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -      -     vpsubsb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -     vpsubsw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -      -     vpsubsb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -     vpsubsw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -      -     psubusb	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -     psubusw	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -      -     psubusb	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -     psubusw	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -      -     vpsubusb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -     vpsubusw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -      -     vpsubsb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -      -      -      -     vpsubsw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     andnps	%xmm0, %xmm0
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     andnpd	%xmm1, %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vandnps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vandnpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     pandn	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     pandn	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vandnps	%xmm2, %xmm2, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vandnpd	%xmm1, %xmm1, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpandn	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     xorps	%xmm0, %xmm0
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     xorpd	%xmm1, %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vxorps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vxorpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     pxor	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     pxor	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpxor	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vxorps	%xmm4, %xmm4, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vxorpd	%xmm1, %xmm1, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpxor	%xmm3, %xmm3, %xmm5

# CHECK:      Timeline view:
# CHECK-NEXT:                     0123456789
# CHECK-NEXT: Index     0123456789          012345

# CHECK:      [0,0]     DR   .    .    .    .    .   subl	%eax, %eax
# CHECK-NEXT: [0,1]     DR   .    .    .    .    .   subq	%rax, %rax
# CHECK-NEXT: [0,2]     DR   .    .    .    .    .   xorl	%eax, %eax
# CHECK-NEXT: [0,3]     DR   .    .    .    .    .   xorq	%rax, %rax
# CHECK-NEXT: [0,4]     .DR  .    .    .    .    .   pcmpgtb	%mm2, %mm2
# CHECK-NEXT: [0,5]     .DR  .    .    .    .    .   pcmpgtd	%mm2, %mm2
# CHECK-NEXT: [0,6]     .DR  .    .    .    .    .   pcmpgtw	%mm2, %mm2
# CHECK-NEXT: [0,7]     .DR  .    .    .    .    .   pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT: [0,8]     . DR .    .    .    .    .   pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT: [0,9]     . DeeER   .    .    .    .   pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT: [0,10]    . D---R   .    .    .    .   pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT: [0,11]    . D---R   .    .    .    .   vpcmpgtb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,12]    .  D--R   .    .    .    .   vpcmpgtd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,13]    .  DeeER  .    .    .    .   vpcmpgtq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,14]    .  D---R  .    .    .    .   vpcmpgtw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,15]    .  D---R  .    .    .    .   vpcmpgtb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,16]    .   D--R  .    .    .    .   vpcmpgtd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,17]    .   DeeER .    .    .    .   vpcmpgtq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,18]    .   D---R .    .    .    .   vpcmpgtw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,19]    .   D---R .    .    .    .   psubb	%mm2, %mm2
# CHECK-NEXT: [0,20]    .    D--R .    .    .    .   psubd	%mm2, %mm2
# CHECK-NEXT: [0,21]    .    D---R.    .    .    .   psubq	%mm2, %mm2
# CHECK-NEXT: [0,22]    .    D---R.    .    .    .   psubw	%mm2, %mm2
# CHECK-NEXT: [0,23]    .    D---R.    .    .    .   psubb	%xmm2, %xmm2
# CHECK-NEXT: [0,24]    .    .D--R.    .    .    .   psubd	%xmm2, %xmm2
# CHECK-NEXT: [0,25]    .    .D---R    .    .    .   psubq	%xmm2, %xmm2
# CHECK-NEXT: [0,26]    .    .D---R    .    .    .   psubw	%xmm2, %xmm2
# CHECK-NEXT: [0,27]    .    .D---R    .    .    .   vpsubb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,28]    .    . D--R    .    .    .   vpsubd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,29]    .    . D---R   .    .    .   vpsubq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,30]    .    . D---R   .    .    .   vpsubw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,31]    .    . D---R   .    .    .   vpsubb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,32]    .    .  D--R   .    .    .   vpsubd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,33]    .    .  D---R  .    .    .   vpsubq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,34]    .    .  D---R  .    .    .   vpsubw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,35]    .    .  DeeER  .    .    .   psubsb	%mm2, %mm2
# CHECK-NEXT: [0,36]    .    .   DeeER .    .    .   psubsw	%mm2, %mm2
# CHECK-NEXT: [0,37]    .    .   DeeER .    .    .   psubsb	%xmm2, %xmm2
# CHECK-NEXT: [0,38]    .    .   D=eeER.    .    .   psubsw	%xmm2, %xmm2
# CHECK-NEXT: [0,39]    .    .   D=eeER.    .    .   vpsubsb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,40]    .    .    D=eeER    .    .   vpsubsw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,41]    .    .    D=eeER    .    .   vpsubsb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,42]    .    .    D==eeER   .    .   vpsubsw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,43]    .    .    D==eeER   .    .   psubusb	%mm2, %mm2
# CHECK-NEXT: [0,44]    .    .    .D==eeER  .    .   psubusw	%mm2, %mm2
# CHECK-NEXT: [0,45]    .    .    .D==eeER  .    .   psubusb	%xmm2, %xmm2
# CHECK-NEXT: [0,46]    .    .    .D===eeER .    .   psubusw	%xmm2, %xmm2
# CHECK-NEXT: [0,47]    .    .    .D===eeER .    .   vpsubusb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,48]    .    .    . D===eeER.    .   vpsubusw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,49]    .    .    . D===eeER.    .   vpsubsb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,50]    .    .    . D====eeER    .   vpsubsw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,51]    .    .    . D-------R    .   andnps	%xmm0, %xmm0
# CHECK-NEXT: [0,52]    .    .    .  D------R    .   andnpd	%xmm1, %xmm1
# CHECK-NEXT: [0,53]    .    .    .  D------R    .   vandnps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: [0,54]    .    .    .  D-------R   .   vandnpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: [0,55]    .    .    .  D-------R   .   pandn	%mm2, %mm2
# CHECK-NEXT: [0,56]    .    .    .   D------R   .   pandn	%xmm2, %xmm2
# CHECK-NEXT: [0,57]    .    .    .   D------R   .   vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,58]    .    .    .   D-------R  .   vandnps	%xmm2, %xmm2, %xmm5
# CHECK-NEXT: [0,59]    .    .    .   D-------R  .   vandnpd	%xmm1, %xmm1, %xmm5
# CHECK-NEXT: [0,60]    .    .    .    D------R  .   vpandn	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,61]    .    .    .    D------R  .   xorps	%xmm0, %xmm0
# CHECK-NEXT: [0,62]    .    .    .    D-------R .   xorpd	%xmm1, %xmm1
# CHECK-NEXT: [0,63]    .    .    .    D-------R .   vxorps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: [0,64]    .    .    .    .D------R .   vxorpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: [0,65]    .    .    .    .D------R .   pxor	%mm2, %mm2
# CHECK-NEXT: [0,66]    .    .    .    .D-------R.   pxor	%xmm2, %xmm2
# CHECK-NEXT: [0,67]    .    .    .    .D-------R.   vpxor	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,68]    .    .    .    . D------R.   vxorps	%xmm4, %xmm4, %xmm5
# CHECK-NEXT: [0,69]    .    .    .    . D------R.   vxorpd	%xmm1, %xmm1, %xmm3
# CHECK-NEXT: [0,70]    .    .    .    . D-------R   vpxor	%xmm3, %xmm3, %xmm5

# CHECK:      Average Wait times (based on the timeline view):
# CHECK-NEXT: [0]: Executions
# CHECK-NEXT: [1]: Average time spent waiting in a scheduler's queue
# CHECK-NEXT: [2]: Average time spent waiting in a scheduler's queue while ready
# CHECK-NEXT: [3]: Average time elapsed from WB until retire stage

# CHECK:            [0]    [1]    [2]    [3]
# CHECK-NEXT: 0.     1     0.0    0.0    0.0       subl	%eax, %eax
# CHECK-NEXT: 1.     1     0.0    0.0    0.0       subq	%rax, %rax
# CHECK-NEXT: 2.     1     0.0    0.0    0.0       xorl	%eax, %eax
# CHECK-NEXT: 3.     1     0.0    0.0    0.0       xorq	%rax, %rax
# CHECK-NEXT: 4.     1     0.0    0.0    0.0       pcmpgtb	%mm2, %mm2
# CHECK-NEXT: 5.     1     0.0    0.0    0.0       pcmpgtd	%mm2, %mm2
# CHECK-NEXT: 6.     1     0.0    0.0    0.0       pcmpgtw	%mm2, %mm2
# CHECK-NEXT: 7.     1     0.0    0.0    0.0       pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT: 8.     1     0.0    0.0    0.0       pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT: 9.     1     1.0    1.0    0.0       pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT: 10.    1     0.0    0.0    3.0       pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT: 11.    1     0.0    0.0    3.0       vpcmpgtb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 12.    1     0.0    0.0    2.0       vpcmpgtd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 13.    1     1.0    1.0    0.0       vpcmpgtq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 14.    1     0.0    0.0    3.0       vpcmpgtw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 15.    1     0.0    0.0    3.0       vpcmpgtb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 16.    1     0.0    0.0    2.0       vpcmpgtd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 17.    1     1.0    1.0    0.0       vpcmpgtq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 18.    1     0.0    0.0    3.0       vpcmpgtw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 19.    1     0.0    0.0    3.0       psubb	%mm2, %mm2
# CHECK-NEXT: 20.    1     0.0    0.0    2.0       psubd	%mm2, %mm2
# CHECK-NEXT: 21.    1     0.0    0.0    3.0       psubq	%mm2, %mm2
# CHECK-NEXT: 22.    1     0.0    0.0    3.0       psubw	%mm2, %mm2
# CHECK-NEXT: 23.    1     0.0    0.0    3.0       psubb	%xmm2, %xmm2
# CHECK-NEXT: 24.    1     0.0    0.0    2.0       psubd	%xmm2, %xmm2
# CHECK-NEXT: 25.    1     0.0    0.0    3.0       psubq	%xmm2, %xmm2
# CHECK-NEXT: 26.    1     0.0    0.0    3.0       psubw	%xmm2, %xmm2
# CHECK-NEXT: 27.    1     0.0    0.0    3.0       vpsubb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 28.    1     0.0    0.0    2.0       vpsubd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 29.    1     0.0    0.0    3.0       vpsubq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 30.    1     0.0    0.0    3.0       vpsubw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 31.    1     0.0    0.0    3.0       vpsubb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 32.    1     0.0    0.0    2.0       vpsubd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 33.    1     0.0    0.0    3.0       vpsubq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 34.    1     0.0    0.0    3.0       vpsubw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 35.    1     1.0    1.0    0.0       psubsb	%mm2, %mm2
# CHECK-NEXT: 36.    1     1.0    1.0    0.0       psubsw	%mm2, %mm2
# CHECK-NEXT: 37.    1     1.0    1.0    0.0       psubsb	%xmm2, %xmm2
# CHECK-NEXT: 38.    1     2.0    2.0    0.0       psubsw	%xmm2, %xmm2
# CHECK-NEXT: 39.    1     2.0    2.0    0.0       vpsubsb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 40.    1     2.0    2.0    0.0       vpsubsw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 41.    1     2.0    2.0    0.0       vpsubsb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 42.    1     3.0    3.0    0.0       vpsubsw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 43.    1     3.0    3.0    0.0       psubusb	%mm2, %mm2
# CHECK-NEXT: 44.    1     3.0    3.0    0.0       psubusw	%mm2, %mm2
# CHECK-NEXT: 45.    1     3.0    3.0    0.0       psubusb	%xmm2, %xmm2
# CHECK-NEXT: 46.    1     4.0    4.0    0.0       psubusw	%xmm2, %xmm2
# CHECK-NEXT: 47.    1     4.0    4.0    0.0       vpsubusb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 48.    1     4.0    4.0    0.0       vpsubusw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 49.    1     4.0    4.0    0.0       vpsubsb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 50.    1     5.0    5.0    0.0       vpsubsw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 51.    1     0.0    0.0    7.0       andnps	%xmm0, %xmm0
# CHECK-NEXT: 52.    1     0.0    0.0    6.0       andnpd	%xmm1, %xmm1
# CHECK-NEXT: 53.    1     0.0    0.0    6.0       vandnps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: 54.    1     0.0    0.0    7.0       vandnpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: 55.    1     0.0    0.0    7.0       pandn	%mm2, %mm2
# CHECK-NEXT: 56.    1     0.0    0.0    6.0       pandn	%xmm2, %xmm2
# CHECK-NEXT: 57.    1     0.0    0.0    6.0       vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 58.    1     0.0    0.0    7.0       vandnps	%xmm2, %xmm2, %xmm5
# CHECK-NEXT: 59.    1     0.0    0.0    7.0       vandnpd	%xmm1, %xmm1, %xmm5
# CHECK-NEXT: 60.    1     0.0    0.0    6.0       vpandn	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 61.    1     0.0    0.0    6.0       xorps	%xmm0, %xmm0
# CHECK-NEXT: 62.    1     0.0    0.0    7.0       xorpd	%xmm1, %xmm1
# CHECK-NEXT: 63.    1     0.0    0.0    7.0       vxorps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: 64.    1     0.0    0.0    6.0       vxorpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: 65.    1     0.0    0.0    6.0       pxor	%mm2, %mm2
# CHECK-NEXT: 66.    1     0.0    0.0    7.0       pxor	%xmm2, %xmm2
# CHECK-NEXT: 67.    1     0.0    0.0    7.0       vpxor	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 68.    1     0.0    0.0    6.0       vxorps	%xmm4, %xmm4, %xmm5
# CHECK-NEXT: 69.    1     0.0    0.0    6.0       vxorpd	%xmm1, %xmm1, %xmm3
# CHECK-NEXT: 70.    1     0.0    0.0    7.0       vpxor	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:        1     0.7    0.7    2.7       <total>