; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown -mattr=+avx512bw | FileCheck %s

declare <64 x i8> @llvm.x86.avx512.mask.pshuf.b.512(<64 x i8>, <64 x i8>, <64 x i8>, i64)

define <64 x i8> @combine_pshufb_identity(<64 x i8> %x0) {
; CHECK-LABEL: combine_pshufb_identity:
; CHECK:       # BB#0:
; CHECK-NEXT:    retq
  %select = bitcast <8 x i64> <i64 -1, i64 -1, i64 -1, i64 -1, i64 -1, i64 -1, i64 -1, i64 -1> to <64 x i8>
  %mask = bitcast <16 x i32> <i32 202182159, i32 134810123, i32 67438087, i32 66051, i32 202182159, i32 134810123, i32 67438087, i32 66051, i32 202182159, i32 134810123, i32 67438087, i32 66051, i32 202182159, i32 134810123, i32 67438087, i32 66051> to <64 x i8>
  %res0 = call <64 x i8> @llvm.x86.avx512.mask.pshuf.b.512(<64 x i8> %x0, <64 x i8> %mask, <64 x i8> %select, i64 -1)
  %res1 = call <64 x i8> @llvm.x86.avx512.mask.pshuf.b.512(<64 x i8> %res0, <64 x i8> %mask, <64 x i8> %select, i64 -1)
  ret <64 x i8> %res1
}
