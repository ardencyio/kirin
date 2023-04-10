; ModuleID = 'probe5.e1614ca6-cgu.0'
source_filename = "probe5.e1614ca6-cgu.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx11.0.0"

@alloc5 = private unnamed_addr constant <{ [77 x i8] }> <{ [77 x i8] c"/rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/core/src/ops/arith.rs" }>, align 1
@alloc6 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc5, [16 x i8] c"M\00\00\00\00\00\00\00\FB\02\00\003\00\00\00" }>, align 8
@str.0 = internal constant [28 x i8] c"attempt to add with overflow"
@alloc3 = private unnamed_addr constant <{ [4 x i8] }> <{ [4 x i8] c"\02\00\00\00" }>, align 4
@__covrec_EF23A9C2D600B7EEu = linkonce_odr hidden constant <{ i64, i32, i64, i64, [9 x i8] }> <{ i64 -1214940820180781074, i32 9, i64 1159614808416932716, i64 -2296551079064022709, [9 x i8] c"\01\01\00\01\01\01\01\008" }>, section "__LLVM_COV,__llvm_covfun", align 8
@__llvm_coverage_mapping = private constant { { i32, i32, i32, i32 }, [89 x i8] } { { i32, i32, i32, i32 } { i32 0, i32 89, i32 0, i32 5 }, [89 x i8] c"\02V\00N/Users/goose/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.15\06<anon>" }, section "__LLVM_COV,__llvm_covmap", align 8
@__llvm_profile_runtime = external hidden global i32
@__profc__RNvCsijCaW0hItNy_6probe55probe = private global [2 x i64] zeroinitializer, section "__DATA,__llvm_prf_cnts", align 8
@__profd__RNvCsijCaW0hItNy_6probe55probe = private global { i64, i64, i64, ptr, ptr, i32, [2 x i16] } { i64 -1214940820180781074, i64 1159614808416932716, i64 sub (i64 ptrtoint (ptr @__profc__RNvCsijCaW0hItNy_6probe55probe to i64), i64 ptrtoint (ptr @__profd__RNvCsijCaW0hItNy_6probe55probe to i64)), ptr null, ptr null, i32 2, [2 x i16] zeroinitializer }, section "__DATA,__llvm_prf_data,regular,live_support", align 8
@__llvm_prf_nm = private constant [33 x i8] c"\1F\00_RNvCsijCaW0hItNy_6probe55probe", section "__DATA,__llvm_prf_names", align 1
@llvm.compiler.used = appending global [2 x ptr] [ptr @__llvm_profile_runtime_user, ptr @__profd__RNvCsijCaW0hItNy_6probe55probe], section "llvm.metadata"
@llvm.used = appending global [3 x ptr] [ptr @__covrec_EF23A9C2D600B7EEu, ptr @__llvm_coverage_mapping, ptr @__llvm_prf_nm], section "llvm.metadata"
@__llvm_profile_filename = weak constant [22 x i8] c"default_%m_%p.profraw\00"

; <i32 as core::ops::arith::AddAssign<&i32>>::add_assign
; Function Attrs: inlinehint uwtable
define internal void @_RNvXs57_NtNtCshK8OBttEMs0_4core3ops5arithlINtB6_9AddAssignRlE10add_assignCsijCaW0hItNy_6probe5(ptr align 4 %self, ptr align 4 %other) unnamed_addr #0 {
start:
  %other1 = load i32, ptr %other, align 4, !noundef !1
  %0 = load i32, ptr %self, align 4, !noundef !1
  %1 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %0, i32 %other1)
  %_6.0 = extractvalue { i32, i1 } %1, 0
  %_6.1 = extractvalue { i32, i1 } %1, 1
  %2 = call i1 @llvm.expect.i1(i1 %_6.1, i1 false)
  br i1 %2, label %panic, label %bb1

bb1:                                              ; preds = %start
  store i32 %_6.0, ptr %self, align 4
  ret void

panic:                                            ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h5140de40daf56c24E(ptr align 1 @str.0, i64 28, ptr align 8 @alloc6) #7
  unreachable
}

; probe5::probe
; Function Attrs: uwtable
define void @_RNvCsijCaW0hItNy_6probe55probe() unnamed_addr #1 {
start:
  %x = alloca i32, align 4
  %pgocount = load i64, ptr @__profc__RNvCsijCaW0hItNy_6probe55probe, align 8
  %0 = add i64 %pgocount, 1
  store i64 %0, ptr @__profc__RNvCsijCaW0hItNy_6probe55probe, align 8
  store i32 1, ptr %x, align 4
; call <i32 as core::ops::arith::AddAssign<&i32>>::add_assign
  call void @_RNvXs57_NtNtCshK8OBttEMs0_4core3ops5arithlINtB6_9AddAssignRlE10add_assignCsijCaW0hItNy_6probe5(ptr align 4 %x, ptr align 4 @alloc3)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i1 @llvm.expect.i1(i1, i1) #3

; core::panicking::panic
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking5panic17h5140de40daf56c24E(ptr align 1, i64, ptr align 8) unnamed_addr #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(ptr, i64, i32, i32) #5

; Function Attrs: noinline
define linkonce_odr hidden i32 @__llvm_profile_runtime_user() #6 {
  %1 = load i32, ptr @__llvm_profile_runtime, align 4
  ret i32 %1
}

attributes #0 = { inlinehint uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" "target-features"="+v8a" }
attributes #1 = { uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" "target-features"="+v8a" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #4 = { cold noinline noreturn uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" "target-features"="+v8a" }
attributes #5 = { nounwind }
attributes #6 = { noinline }
attributes #7 = { noreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{}
