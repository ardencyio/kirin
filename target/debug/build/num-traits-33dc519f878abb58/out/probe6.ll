; ModuleID = 'probe6.f43c12f9-cgu.0'
source_filename = "probe6.f43c12f9-cgu.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx11.0.0"

@alloc3 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/core/src/num/mod.rs" }>, align 1
@alloc4 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc3, [16 x i8] c"K\00\00\00\00\00\00\00\99\03\00\00\05\00\00\00" }>, align 8
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"
@__covrec_97E1FDB2FB0ABA1Eu = linkonce_odr hidden constant <{ i64, i32, i64, i64, [9 x i8] }> <{ i64 -7502436559064745442, i32 9, i64 -4060701207058724431, i64 -2296551079064022709, [9 x i8] c"\01\01\00\01\01\01\01\002" }>, section "__LLVM_COV,__llvm_covfun", align 8
@__llvm_coverage_mapping = private constant { { i32, i32, i32, i32 }, [89 x i8] } { { i32, i32, i32, i32 } { i32 0, i32 89, i32 0, i32 5 }, [89 x i8] c"\02V\00N/Users/goose/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.15\06<anon>" }, section "__LLVM_COV,__llvm_covmap", align 8
@__llvm_profile_runtime = external hidden global i32
@__profc__RNvCse36BwqpAm7Z_6probe65probe = private global [2 x i64] zeroinitializer, section "__DATA,__llvm_prf_cnts", align 8
@__profd__RNvCse36BwqpAm7Z_6probe65probe = private global { i64, i64, i64, ptr, ptr, i32, [2 x i16] } { i64 -7502436559064745442, i64 -4060701207058724431, i64 sub (i64 ptrtoint (ptr @__profc__RNvCse36BwqpAm7Z_6probe65probe to i64), i64 ptrtoint (ptr @__profd__RNvCse36BwqpAm7Z_6probe65probe to i64)), ptr null, ptr null, i32 2, [2 x i16] zeroinitializer }, section "__DATA,__llvm_prf_data,regular,live_support", align 8
@__llvm_prf_nm = private constant [33 x i8] c"\1F\00_RNvCse36BwqpAm7Z_6probe65probe", section "__DATA,__llvm_prf_names", align 1
@llvm.compiler.used = appending global [2 x ptr] [ptr @__llvm_profile_runtime_user, ptr @__profd__RNvCse36BwqpAm7Z_6probe65probe], section "llvm.metadata"
@llvm.used = appending global [3 x ptr] [ptr @__covrec_97E1FDB2FB0ABA1Eu, ptr @__llvm_coverage_mapping, ptr @__llvm_prf_nm], section "llvm.metadata"
@__llvm_profile_filename = weak constant [22 x i8] c"default_%m_%p.profraw\00"

; probe6::probe
; Function Attrs: uwtable
define void @_RNvCse36BwqpAm7Z_6probe65probe() unnamed_addr #0 {
start:
  %pgocount = load i64, ptr @__profc__RNvCse36BwqpAm7Z_6probe65probe, align 8
  %0 = add i64 %pgocount, 1
  store i64 %0, ptr @__profc__RNvCse36BwqpAm7Z_6probe65probe, align 8
  %1 = call i1 @llvm.expect.i1(i1 false, i1 false)
  br i1 %1, label %panic.i, label %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hd5db2e7724f42ffeE.exit"

panic.i:                                          ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h5140de40daf56c24E(ptr align 1 @str.0, i64 25, ptr align 8 @alloc4) #5
  unreachable

"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hd5db2e7724f42ffeE.exit": ; preds = %start
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i1 @llvm.expect.i1(i1, i1) #1

; core::panicking::panic
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking5panic17h5140de40daf56c24E(ptr align 1, i64, ptr align 8) unnamed_addr #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(ptr, i64, i32, i32) #3

; Function Attrs: noinline
define linkonce_odr hidden i32 @__llvm_profile_runtime_user() #4 {
  %1 = load i32, ptr @__llvm_profile_runtime, align 4
  ret i32 %1
}

attributes #0 = { uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" "target-features"="+v8a" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #2 = { cold noinline noreturn uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" "target-features"="+v8a" }
attributes #3 = { nounwind }
attributes #4 = { noinline }
attributes #5 = { noreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIC Level", i32 2}
