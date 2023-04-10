; ModuleID = 'probe4.48199a28-cgu.0'
source_filename = "probe4.48199a28-cgu.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx11.0.0"

@__covrec_454B53E8A6A9DFDBu = linkonce_odr hidden constant <{ i64, i32, i64, i64, [9 x i8] }> <{ i64 4993176870563995611, i32 9, i64 -4740764441685779923, i64 -2296551079064022709, [9 x i8] c"\01\01\00\01\01\01\01\001" }>, section "__LLVM_COV,__llvm_covfun", align 8
@__llvm_coverage_mapping = private constant { { i32, i32, i32, i32 }, [89 x i8] } { { i32, i32, i32, i32 } { i32 0, i32 89, i32 0, i32 5 }, [89 x i8] c"\02V\00N/Users/goose/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.15\06<anon>" }, section "__LLVM_COV,__llvm_covmap", align 8
@__llvm_profile_runtime = external hidden global i32
@__profc__RNvCsl5KyFFJRsTs_6probe45probe = private global [2 x i64] zeroinitializer, section "__DATA,__llvm_prf_cnts", align 8
@__profd__RNvCsl5KyFFJRsTs_6probe45probe = private global { i64, i64, i64, ptr, ptr, i32, [2 x i16] } { i64 4993176870563995611, i64 -4740764441685779923, i64 sub (i64 ptrtoint (ptr @__profc__RNvCsl5KyFFJRsTs_6probe45probe to i64), i64 ptrtoint (ptr @__profd__RNvCsl5KyFFJRsTs_6probe45probe to i64)), ptr null, ptr null, i32 2, [2 x i16] zeroinitializer }, section "__DATA,__llvm_prf_data,regular,live_support", align 8
@__llvm_prf_nm = private constant [33 x i8] c"\1F\00_RNvCsl5KyFFJRsTs_6probe45probe", section "__DATA,__llvm_prf_names", align 1
@llvm.compiler.used = appending global [2 x ptr] [ptr @__llvm_profile_runtime_user, ptr @__profd__RNvCsl5KyFFJRsTs_6probe45probe], section "llvm.metadata"
@llvm.used = appending global [3 x ptr] [ptr @__covrec_454B53E8A6A9DFDBu, ptr @__llvm_coverage_mapping, ptr @__llvm_prf_nm], section "llvm.metadata"
@__llvm_profile_filename = weak constant [22 x i8] c"default_%m_%p.profraw\00"

; probe4::probe
; Function Attrs: uwtable
define void @_RNvCsl5KyFFJRsTs_6probe45probe() unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  %pgocount = load i64, ptr @__profc__RNvCsl5KyFFJRsTs_6probe45probe, align 8
  %1 = add i64 %pgocount, 1
  store i64 %1, ptr @__profc__RNvCsl5KyFFJRsTs_6probe45probe, align 8
  store i32 1, ptr %0, align 4
  %2 = load i32, ptr %0, align 4, !noundef !1
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.cttz.i32(i32, i1 immarg) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(ptr, i64, i32, i32) #2

; Function Attrs: noinline
define linkonce_odr hidden i32 @__llvm_profile_runtime_user() #3 {
  %1 = load i32, ptr @__llvm_profile_runtime, align 4
  ret i32 %1
}

attributes #0 = { uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" "target-features"="+v8a" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }
attributes #3 = { noinline }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{}
