; ModuleID = 'llvm/mag_lib.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"%79s\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"pause\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"w\00", align 1

; Function Attrs: nounwind uwtable
define i32 @get_i(i8* %t) #0 {
  %1 = alloca i8*, align 8
  %x = alloca double, align 8
  store i8* %t, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = bitcast i8* %2 to double*
  %4 = load double, double* %3, align 8
  %5 = call double @modf(double %4, double* %x) #7
  %6 = load double, double* %x, align 8
  %7 = fptosi double %6 to i32
  ret i32 %7
}

; Function Attrs: nounwind
declare double @modf(double, double*) #1

; Function Attrs: nounwind uwtable
define i8* @_abs(i8* %i) #0 {
  %1 = alloca i8*, align 8
  %r = alloca double*, align 8
  store i8* %i, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %r, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load double, double* %5, align 8
  %7 = call double @fabs(double %6) #8
  %8 = load double*, double** %r, align 8
  store double %7, double* %8, align 8
  %9 = load double*, double** %r, align 8
  %10 = bitcast double* %9 to i8*
  ret i8* %10
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

; Function Attrs: nounwind uwtable
define i8* @_ceil(i8* %i) #0 {
  %1 = alloca i8*, align 8
  %r = alloca double*, align 8
  store i8* %i, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %r, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load double, double* %5, align 8
  %7 = call double @ceil(double %6) #8
  %8 = load double*, double** %r, align 8
  store double %7, double* %8, align 8
  %9 = load double*, double** %r, align 8
  %10 = bitcast double* %9 to i8*
  ret i8* %10
}

; Function Attrs: nounwind readnone
declare double @ceil(double) #2

; Function Attrs: nounwind uwtable
define i8* @_floor(i8* %i) #0 {
  %1 = alloca i8*, align 8
  %r = alloca double*, align 8
  store i8* %i, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %r, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load double, double* %5, align 8
  %7 = call double @floor(double %6) #8
  %8 = load double*, double** %r, align 8
  store double %7, double* %8, align 8
  %9 = load double*, double** %r, align 8
  %10 = bitcast double* %9 to i8*
  ret i8* %10
}

; Function Attrs: nounwind readnone
declare double @floor(double) #2

; Function Attrs: nounwind uwtable
define i8* @_pow(i8* %i, i8* %b) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %r = alloca double*, align 8
  store i8* %i, i8** %1, align 8
  store i8* %b, i8** %2, align 8
  %3 = call noalias i8* @malloc(i64 8) #7
  %4 = bitcast i8* %3 to double*
  store double* %4, double** %r, align 8
  %5 = load i8*, i8** %1, align 8
  %6 = bitcast i8* %5 to i32*
  %7 = load i32, i32* %6, align 4
  %8 = sitofp i32 %7 to double
  %9 = load i8*, i8** %2, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load double, double* %10, align 8
  %12 = call double @pow(double %8, double %11) #7
  %13 = load double*, double** %r, align 8
  store double %12, double* %13, align 8
  %14 = load double*, double** %r, align 8
  %15 = bitcast double* %14 to i8*
  ret i8* %15
}

; Function Attrs: nounwind
declare double @pow(double, double) #1

; Function Attrs: nounwind uwtable
define i8* @mod(i8* %n, i8* %y) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %ret = alloca double*, align 8
  %r = alloca double*, align 8
  store i8* %n, i8** %2, align 8
  store i8* %y, i8** %3, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load double, double* %5, align 8
  %7 = fcmp oeq double %6, 0.000000e+00
  br i1 %7, label %13, label %8

; <label>:8                                       ; preds = %0
  %9 = load i8*, i8** %3, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load double, double* %10, align 8
  %12 = fcmp oeq double %11, 0.000000e+00
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %8, %0
  %14 = call noalias i8* @malloc(i64 8) #7
  %15 = bitcast i8* %14 to double*
  store double* %15, double** %ret, align 8
  %16 = load double*, double** %ret, align 8
  store double 0.000000e+00, double* %16, align 8
  %17 = load double*, double** %ret, align 8
  %18 = bitcast double* %17 to i8*
  store i8* %18, i8** %1, align 8
  br label %31

; <label>:19                                      ; preds = %8
  %20 = call noalias i8* @malloc(i64 8) #7
  %21 = bitcast i8* %20 to double*
  store double* %21, double** %r, align 8
  %22 = load i8*, i8** %2, align 8
  %23 = call i32 @get_i(i8* %22)
  %24 = load i8*, i8** %3, align 8
  %25 = call i32 @get_i(i8* %24)
  %26 = srem i32 %23, %25
  %27 = sitofp i32 %26 to double
  %28 = load double*, double** %r, align 8
  store double %27, double* %28, align 8
  %29 = load double*, double** %r, align 8
  %30 = bitcast double* %29 to i8*
  store i8* %30, i8** %1, align 8
  br label %31

; <label>:31                                      ; preds = %19, %13
  %32 = load i8*, i8** %1, align 8
  ret i8* %32
}

; Function Attrs: nounwind uwtable
define i8* @print(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %ret = alloca double*, align 8
  store i8* %str, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %ret, align 8
  %4 = load double*, double** %ret, align 8
  store double 1.000000e+00, double* %4, align 8
  %5 = load i8*, i8** %1, align 8
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %5)
  %7 = load double*, double** %ret, align 8
  %8 = bitcast double* %7 to i8*
  ret i8* %8
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define i8* @print_n(i8* %i) #0 {
  %1 = alloca i8*, align 8
  %ret = alloca double*, align 8
  store i8* %i, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %ret, align 8
  %4 = load double*, double** %ret, align 8
  store double 1.000000e+00, double* %4, align 8
  %5 = load i8*, i8** %1, align 8
  %6 = call i32 @get_i(i8* %5)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %6)
  %8 = load double*, double** %ret, align 8
  %9 = bitcast double* %8 to i8*
  ret i8* %9
}

; Function Attrs: nounwind uwtable
define i8* @print_f(i8* %i) #0 {
  %1 = alloca i8*, align 8
  %ret = alloca double*, align 8
  store i8* %i, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %ret, align 8
  %4 = load double*, double** %ret, align 8
  store double 1.000000e+00, double* %4, align 8
  %5 = load i8*, i8** %1, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load double, double* %6, align 8
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), double %7)
  %9 = load double*, double** %ret, align 8
  %10 = bitcast double* %9 to i8*
  ret i8* %10
}

; Function Attrs: nounwind uwtable
define i8* @scanf_insecure() #0 {
  %x = alloca i8*, align 8
  %1 = call noalias i8* @malloc(i64 80) #7
  store i8* %1, i8** %x, align 8
  %2 = load i8*, i8** %x, align 8
  %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), i8* %2)
  %4 = load i8*, i8** %x, align 8
  ret i8* %4
}

declare i32 @__isoc99_scanf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define i8* @get_scanf_int_insecure() #0 {
  %d = alloca double*, align 8
  %1 = call noalias i8* @malloc(i64 8) #7
  %2 = bitcast i8* %1 to double*
  store double* %2, double** %d, align 8
  %3 = load double*, double** %d, align 8
  %4 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), double* %3)
  %5 = load double*, double** %d, align 8
  %6 = bitcast double* %5 to i8*
  ret i8* %6
}

; Function Attrs: nounwind uwtable
define i8* @mag_alloc(i8* %len) #0 {
  %1 = alloca i8*, align 8
  %m = alloca i8**, align 8
  store i8* %len, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i32 @get_i(i8* %2)
  %4 = sext i32 %3 to i64
  %5 = mul i64 %4, 8
  %6 = call noalias i8* @malloc(i64 %5) #7
  %7 = bitcast i8* %6 to i8**
  store i8** %7, i8*** %m, align 8
  %8 = load i8**, i8*** %m, align 8
  %9 = bitcast i8** %8 to i8*
  ret i8* %9
}

; Function Attrs: nounwind uwtable
define i8* @m_realloc(i8* %vector, i8* %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store i8* %vector, i8** %1, align 8
  store i8* %len, i8** %2, align 8
  %3 = call noalias i8* @malloc(i64 8) #7
  store i8* %3, i8** %ret, align 8
  %4 = load i8*, i8** %ret, align 8
  %5 = bitcast i8* %4 to double*
  store double 0.000000e+00, double* %5, align 8
  %6 = load i8*, i8** %1, align 8
  %7 = load i8*, i8** %2, align 8
  %8 = call i32 @get_i(i8* %7)
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 8
  %11 = call i8* @realloc(i8* %6, i64 %10) #7
  store i8* %11, i8** %1, align 8
  %12 = load i8*, i8** %ret, align 8
  ret i8* %12
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

; Function Attrs: nounwind uwtable
define i8* @mag_realloc(i8* %vector, i8* %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %vector, i8** %1, align 8
  store i8* %len, i8** %2, align 8
  %3 = load i8*, i8** %1, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i32 @get_i(i8* %4)
  %6 = sext i32 %5 to i64
  %7 = mul i64 %6, 8
  %8 = call i8* @realloc(i8* %3, i64 %7) #7
  ret i8* %8
}

; Function Attrs: nounwind uwtable
define i8* @_aloc(i8* %vector, i8* %i, i8* %space) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %r = alloca double*, align 8
  store i8* %vector, i8** %1, align 8
  store i8* %i, i8** %2, align 8
  store i8* %space, i8** %3, align 8
  %4 = call noalias i8* @malloc(i64 8) #7
  %5 = bitcast i8* %4 to double*
  store double* %5, double** %r, align 8
  %6 = load double*, double** %r, align 8
  store double 0.000000e+00, double* %6, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = call i32 @get_i(i8* %7)
  %9 = sext i32 %8 to i64
  %10 = call noalias i8* @malloc(i64 %9) #7
  %11 = load i8*, i8** %2, align 8
  %12 = call i32 @get_i(i8* %11)
  %13 = sext i32 %12 to i64
  %14 = load i8*, i8** %1, align 8
  %15 = bitcast i8* %14 to i8**
  %16 = getelementptr inbounds i8*, i8** %15, i64 %13
  store i8* %10, i8** %16, align 8
  %17 = load double*, double** %r, align 8
  %18 = bitcast double* %17 to i8*
  ret i8* %18
}

; Function Attrs: nounwind uwtable
define i8* @_set(i8* %vector, i8* %i, i8* %r, i8* %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %r_ = alloca double*, align 8
  store i8* %vector, i8** %1, align 8
  store i8* %i, i8** %2, align 8
  store i8* %r, i8** %3, align 8
  store i8* %len, i8** %4, align 8
  %5 = call noalias i8* @malloc(i64 8) #7
  %6 = bitcast i8* %5 to double*
  store double* %6, double** %r_, align 8
  %7 = load double*, double** %r_, align 8
  store double 0.000000e+00, double* %7, align 8
  %8 = load i8*, i8** %2, align 8
  %9 = call i32 @get_i(i8* %8)
  %10 = sext i32 %9 to i64
  %11 = load i8*, i8** %1, align 8
  %12 = bitcast i8* %11 to i8**
  %13 = getelementptr inbounds i8*, i8** %12, i64 %10
  %14 = load i8*, i8** %13, align 8
  %15 = load i8*, i8** %3, align 8
  %16 = load i8*, i8** %4, align 8
  %17 = call i32 @get_i(i8* %16)
  %18 = sext i32 %17 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 %18, i32 1, i1 false)
  %19 = load double*, double** %r_, align 8
  %20 = bitcast double* %19 to i8*
  ret i8* %20
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define i8* @_put(i8* %vector, i8* %i, i8* %r) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %r_ = alloca double*, align 8
  store i8* %vector, i8** %1, align 8
  store i8* %i, i8** %2, align 8
  store i8* %r, i8** %3, align 8
  %4 = call noalias i8* @malloc(i64 8) #7
  %5 = bitcast i8* %4 to double*
  store double* %5, double** %r_, align 8
  %6 = load double*, double** %r_, align 8
  store double 0.000000e+00, double* %6, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = load i8*, i8** %2, align 8
  %9 = call i32 @get_i(i8* %8)
  %10 = sext i32 %9 to i64
  %11 = load i8*, i8** %1, align 8
  %12 = bitcast i8* %11 to i8**
  %13 = getelementptr inbounds i8*, i8** %12, i64 %10
  store i8* %7, i8** %13, align 8
  %14 = load double*, double** %r_, align 8
  %15 = bitcast double* %14 to i8*
  ret i8* %15
}

; Function Attrs: nounwind uwtable
define i8* @_get(i8* %vector, i8* %i) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %vector, i8** %1, align 8
  store i8* %i, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i32 @get_i(i8* %3)
  %5 = sext i32 %4 to i64
  %6 = load i8*, i8** %1, align 8
  %7 = bitcast i8* %6 to i8**
  %8 = getelementptr inbounds i8*, i8** %7, i64 %5
  %9 = load i8*, i8** %8, align 8
  ret i8* %9
}

; Function Attrs: nounwind uwtable
define i8* @number() #0 {
  %p_ = alloca double*, align 8
  %1 = call noalias i8* @malloc(i64 8) #7
  %2 = bitcast i8* %1 to double*
  store double* %2, double** %p_, align 8
  %3 = load double*, double** %p_, align 8
  store double 0.000000e+00, double* %3, align 8
  %4 = load double*, double** %p_, align 8
  %5 = bitcast double* %4 to i8*
  ret i8* %5
}

; Function Attrs: nounwind uwtable
define i8* @new_bool() #0 {
  %p_ = alloca i8*, align 8
  %1 = call noalias i8* @malloc(i64 1) #7
  store i8* %1, i8** %p_, align 8
  %2 = load i8*, i8** %p_, align 8
  store i8 1, i8* %2, align 1
  %3 = load i8*, i8** %p_, align 8
  ret i8* %3
}

; Function Attrs: nounwind uwtable
define i8* @new_str(i8* %len) #0 {
  %1 = alloca i8*, align 8
  %p_ = alloca double*, align 8
  store i8* %len, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i32 @get_i(i8* %2)
  %4 = sext i32 %3 to i64
  %5 = mul i64 1, %4
  %6 = call noalias i8* @malloc(i64 %5) #7
  %7 = bitcast i8* %6 to double*
  store double* %7, double** %p_, align 8
  %8 = load double*, double** %p_, align 8
  %9 = bitcast double* %8 to i8*
  ret i8* %9
}

; Function Attrs: nounwind uwtable
define i8* @l_str(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %r = alloca double*, align 8
  store i8* %str, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %r, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = call i64 @strlen(i8* %4) #9
  %6 = uitofp i64 %5 to double
  %7 = load double*, double** %r, align 8
  store double %6, double* %7, align 8
  %8 = load double*, double** %r, align 8
  %9 = bitcast double* %8 to i8*
  ret i8* %9
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #5

; Function Attrs: nounwind uwtable
define i8* @f_str(i8* %str, i8* %str_, i8* %r) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %t = alloca i8, align 1
  %y = alloca i32, align 4
  %s = alloca i32, align 4
  %return_ = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %str, i8** %2, align 8
  store i8* %str_, i8** %3, align 8
  store i8* %r, i8** %4, align 8
  store i32 0, i32* %y, align 4
  store i32 0, i32* %s, align 4
  %5 = call noalias i8* @malloc(i64 8) #7
  store i8* %5, i8** %return_, align 8
  %6 = load i8*, i8** %return_, align 8
  %7 = bitcast i8* %6 to double*
  store double 0.000000e+00, double* %7, align 8
  store i32 0, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %75, %0
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load i8*, i8** %2, align 8
  %12 = call i64 @strlen(i8* %11) #9
  %13 = icmp ule i64 %10, %12
  br i1 %13, label %14, label %78

; <label>:14                                      ; preds = %8
  %15 = load i8, i8* %t, align 1
  %16 = trunc i8 %15 to i1
  br i1 %16, label %17, label %34

; <label>:17                                      ; preds = %14
  %18 = load i32, i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = load i8*, i8** %2, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 %19
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = load i32, i32* %y, align 4
  %25 = sext i32 %24 to i64
  %26 = load i8*, i8** %3, align 8
  %27 = getelementptr inbounds i8, i8* %26, i64 %25
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp eq i32 %23, %29
  br i1 %30, label %31, label %34

; <label>:31                                      ; preds = %17
  store i8 1, i8* %t, align 1
  %32 = load i32, i32* %y, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %y, align 4
  br label %35

; <label>:34                                      ; preds = %17, %14
  store i8 0, i8* %t, align 1
  store i32 0, i32* %y, align 4
  br label %35

; <label>:35                                      ; preds = %34, %31
  %36 = load i8, i8* %t, align 1
  %37 = trunc i8 %36 to i1
  br i1 %37, label %53, label %38

; <label>:38                                      ; preds = %35
  %39 = load i32, i32* %i, align 4
  %40 = sext i32 %39 to i64
  %41 = load i8*, i8** %2, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 %40
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = load i8*, i8** %3, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 0
  %47 = load i8, i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %44, %48
  br i1 %49, label %50, label %53

; <label>:50                                      ; preds = %38
  store i8 1, i8* %t, align 1
  %51 = load i32, i32* %y, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %y, align 4
  br label %53

; <label>:53                                      ; preds = %50, %38, %35
  %54 = load i32, i32* %y, align 4
  %55 = sext i32 %54 to i64
  %56 = load i8*, i8** %3, align 8
  %57 = call i64 @strlen(i8* %56) #9
  %58 = icmp eq i64 %55, %57
  br i1 %58, label %59, label %74

; <label>:59                                      ; preds = %53
  %60 = load i32, i32* %s, align 4
  %61 = load i8*, i8** %4, align 8
  %62 = call i32 @get_i(i8* %61)
  %63 = icmp sge i32 %60, %62
  br i1 %63, label %64, label %71

; <label>:64                                      ; preds = %59
  %65 = load i32, i32* %i, align 4
  %66 = add nsw i32 %65, 1
  %67 = sitofp i32 %66 to double
  %68 = load i8*, i8** %return_, align 8
  %69 = bitcast i8* %68 to double*
  store double %67, double* %69, align 8
  %70 = load i8*, i8** %return_, align 8
  store i8* %70, i8** %1, align 8
  br label %80

; <label>:71                                      ; preds = %59
  %72 = load i32, i32* %s, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %s, align 4
  store i8 0, i8* %t, align 1
  store i32 0, i32* %y, align 4
  br label %74

; <label>:74                                      ; preds = %71, %53
  br label %75

; <label>:75                                      ; preds = %74
  %76 = load i32, i32* %i, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %i, align 4
  br label %8

; <label>:78                                      ; preds = %8
  %79 = load i8*, i8** %return_, align 8
  store i8* %79, i8** %1, align 8
  br label %80

; <label>:80                                      ; preds = %78, %64
  %81 = load i8*, i8** %1, align 8
  ret i8* %81
}

; Function Attrs: nounwind uwtable
define i8* @e_str(i8* %_, i8* %__) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %r_ = alloca i8*, align 8
  store i8* %_, i8** %1, align 8
  store i8* %__, i8** %2, align 8
  %3 = call noalias i8* @malloc(i64 1) #7
  store i8* %3, i8** %r_, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = call i32 @strcmp(i8* %4, i8* %5) #9
  %7 = icmp eq i32 %6, 0
  %8 = select i1 %7, i32 1, i32 0
  %9 = icmp ne i32 %8, 0
  %10 = load i8*, i8** %r_, align 8
  %11 = zext i1 %9 to i8
  store i8 %11, i8* %10, align 1
  %12 = load i8*, i8** %r_, align 8
  ret i8* %12
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #5

; Function Attrs: nounwind uwtable
define i8* @to_c(i8* %s) #0 {
  %1 = alloca i8*, align 8
  %r = alloca double*, align 8
  store i8* %s, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %r, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 0
  %6 = load i8, i8* %5, align 1
  %7 = sitofp i8 %6 to double
  %8 = load double*, double** %r, align 8
  store double %7, double* %8, align 8
  %9 = load double*, double** %r, align 8
  %10 = bitcast double* %9 to i8*
  ret i8* %10
}

; Function Attrs: nounwind uwtable
define i8* @to_ch(i8* %_) #0 {
  %1 = alloca i8*, align 8
  %r = alloca i8*, align 8
  store i8* %_, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 2) #7
  store i8* %2, i8** %r, align 8
  %3 = load i8*, i8** %1, align 8
  %4 = call i32 @get_i(i8* %3)
  %5 = trunc i32 %4 to i8
  %6 = load i8*, i8** %r, align 8
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  store i8 %5, i8* %7, align 1
  %8 = load i8*, i8** %r, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 1
  store i8 0, i8* %9, align 1
  %10 = load i8*, i8** %r, align 8
  ret i8* %10
}

; Function Attrs: nounwind uwtable
define i8* @g_str(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %___ = alloca double*, align 8
  store i8* %str, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %___, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = call i64 @strlen(i8* %4) #9
  %6 = uitofp i64 %5 to double
  %7 = load double*, double** %___, align 8
  store double %6, double* %7, align 8
  %8 = load double*, double** %___, align 8
  %9 = bitcast double* %8 to i8*
  ret i8* %9
}

; Function Attrs: nounwind uwtable
define i8* @ad_str(i8* %s, i8* %y) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  store i8* %y, i8** %2, align 8
  %3 = load i8*, i8** %1, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i8* @strcat(i8* %3, i8* %4) #7
  %6 = load i8*, i8** %1, align 8
  ret i8* %6
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define i8* @p_str(i8* %s, i8* %y) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  store i8* %y, i8** %2, align 8
  %3 = load i8*, i8** %1, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i8* @strcpy(i8* %3, i8* %4) #7
  %6 = load i8*, i8** %1, align 8
  ret i8* %6
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define i8* @em_str(i8* %s, i8* %y) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %_ = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  store i8* %y, i8** %2, align 8
  %3 = call noalias i8* @malloc(i64 1) #7
  store i8* %3, i8** %_, align 8
  %4 = load i8*, i8** %_, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 0
  store i8 0, i8* %5, align 1
  %6 = load i8*, i8** %1, align 8
  %7 = load i8*, i8** %_, align 8
  %8 = call i8* @strcpy(i8* %6, i8* %7) #7
  %9 = load i8*, i8** %_, align 8
  call void @free(i8* %9) #7
  %10 = load i8*, i8** %1, align 8
  ret i8* %10
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i8* @s_str(i8* %t, i8* %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %buffer = alloca i8*, align 8
  store i8* %t, i8** %1, align 8
  store i8* %len, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i32 @get_i(i8* %3)
  %5 = sext i32 %4 to i64
  %6 = mul i64 1, %5
  %7 = call noalias i8* @malloc(i64 %6) #7
  store i8* %7, i8** %buffer, align 8
  %8 = load i8*, i8** %buffer, align 8
  %9 = load i8*, i8** %1, align 8
  %10 = call i32 @get_i(i8* %9)
  %11 = call i32 (i8*, i8*, ...) @sprintf(i8* %8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i32 %10) #7
  %12 = load i8*, i8** %buffer, align 8
  ret i8* %12
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i8* @s__str(i8* %t, i8* %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %buffer = alloca i8*, align 8
  store i8* %t, i8** %1, align 8
  store i8* %len, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i32 @get_i(i8* %3)
  %5 = sext i32 %4 to i64
  %6 = mul i64 1, %5
  %7 = call noalias i8* @malloc(i64 %6) #7
  store i8* %7, i8** %buffer, align 8
  %8 = load i8*, i8** %buffer, align 8
  %9 = load i8*, i8** %1, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load double, double* %10, align 8
  %12 = call i32 (i8*, i8*, ...) @sprintf(i8* %8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), double %11) #7
  %13 = load i8*, i8** %buffer, align 8
  ret i8* %13
}

; Function Attrs: nounwind uwtable
define i8* @t_str(i8* %s, i8* %y, i8* %_r) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %buf__ = alloca i8*, align 8
  %i = alloca i32, align 4
  %r_ = alloca i8**, align 8
  store i8* %s, i8** %1, align 8
  store i8* %y, i8** %2, align 8
  store i8* %_r, i8** %3, align 8
  store i32 0, i32* %i, align 4
  %4 = load i32, i32* %i, align 4
  %5 = sext i32 %4 to i64
  %6 = call noalias i8* @malloc(i64 %5) #7
  %7 = bitcast i8* %6 to i8**
  store i8** %7, i8*** %r_, align 8
  %8 = load i8*, i8** %1, align 8
  %9 = load i8*, i8** %2, align 8
  %10 = call i8* @strtok(i8* %8, i8* %9) #7
  store i8* %10, i8** %buf__, align 8
  store i32 1, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %44, %0
  %12 = load i8*, i8** %buf__, align 8
  %13 = icmp ne i8* %12, null
  br i1 %13, label %14, label %47

; <label>:14                                      ; preds = %11
  %15 = load i8**, i8*** %r_, align 8
  %16 = bitcast i8** %15 to i8*
  %17 = load i32, i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = mul i64 8, %18
  %20 = call i8* @realloc(i8* %16, i64 %19) #7
  %21 = bitcast i8* %20 to i8**
  store i8** %21, i8*** %r_, align 8
  %22 = load i8*, i8** %buf__, align 8
  %23 = call i64 @strlen(i8* %22) #9
  %24 = sub i64 %23, 1
  %25 = call noalias i8* @malloc(i64 %24) #7
  %26 = load i32, i32* %i, align 4
  %27 = sub nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = load i8**, i8*** %r_, align 8
  %30 = getelementptr inbounds i8*, i8** %29, i64 %28
  store i8* %25, i8** %30, align 8
  %31 = load i32, i32* %i, align 4
  %32 = sub nsw i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = load i8**, i8*** %r_, align 8
  %35 = getelementptr inbounds i8*, i8** %34, i64 %33
  %36 = load i8*, i8** %35, align 8
  %37 = load i8*, i8** %buf__, align 8
  %38 = load i8*, i8** %buf__, align 8
  %39 = call i64 @strlen(i8* %38) #9
  %40 = add i64 %39, 1
  %41 = call i8* @strncpy(i8* %36, i8* %37, i64 %40) #7
  %42 = load i8*, i8** %2, align 8
  %43 = call i8* @strtok(i8* null, i8* %42) #7
  store i8* %43, i8** %buf__, align 8
  br label %44

; <label>:44                                      ; preds = %14
  %45 = load i32, i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %11

; <label>:47                                      ; preds = %11
  %48 = load i32, i32* %i, align 4
  %49 = sub nsw i32 %48, 1
  %50 = sitofp i32 %49 to double
  %51 = load i8*, i8** %3, align 8
  %52 = bitcast i8* %51 to double*
  store double %50, double* %52, align 8
  %53 = load i8**, i8*** %r_, align 8
  %54 = bitcast i8** %53 to i8*
  ret i8* %54
}

; Function Attrs: nounwind
declare i8* @strtok(i8*, i8*) #1

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #1

; Function Attrs: nounwind uwtable
define i8* @c_str(i8* %y, i8* %t, i8* %a) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %str = alloca i8*, align 8
  %s = alloca i32, align 4
  store i8* %y, i8** %1, align 8
  store i8* %t, i8** %2, align 8
  store i8* %a, i8** %3, align 8
  store i32 0, i32* %i, align 4
  %4 = load i8*, i8** %3, align 8
  %5 = call i32 @get_i(i8* %4)
  %6 = sext i32 %5 to i64
  %7 = mul i64 1, %6
  %8 = add i64 %7, 1
  %9 = call noalias i8* @malloc(i64 %8) #7
  store i8* %9, i8** %str, align 8
  %10 = load i8*, i8** %2, align 8
  %11 = call i32 @get_i(i8* %10)
  store i32 %11, i32* %s, align 4
  br label %12

; <label>:12                                      ; preds = %33, %0
  %13 = load i32, i32* %s, align 4
  %14 = load i8*, i8** %2, align 8
  %15 = call i32 @get_i(i8* %14)
  %16 = load i8*, i8** %3, align 8
  %17 = call i32 @get_i(i8* %16)
  %18 = add nsw i32 %15, %17
  %19 = sub nsw i32 %18, 1
  %20 = icmp sle i32 %13, %19
  br i1 %20, label %21, label %36

; <label>:21                                      ; preds = %12
  %22 = load i32, i32* %s, align 4
  %23 = sext i32 %22 to i64
  %24 = load i8*, i8** %1, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 %23
  %26 = load i8, i8* %25, align 1
  %27 = load i32, i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = load i8*, i8** %str, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 %28
  store i8 %26, i8* %30, align 1
  %31 = load i32, i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %33

; <label>:33                                      ; preds = %21
  %34 = load i32, i32* %s, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %s, align 4
  br label %12

; <label>:36                                      ; preds = %12
  %37 = load i32, i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = load i8*, i8** %str, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 %38
  store i8 0, i8* %40, align 1
  %41 = load i8*, i8** %str, align 8
  ret i8* %41
}

; Function Attrs: nounwind uwtable
define i8* @ch_str(i8* %s, i8* %i) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %s_ = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  store i8* %i, i8** %2, align 8
  %3 = call noalias i8* @malloc(i64 2) #7
  store i8* %3, i8** %s_, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i32 @get_i(i8* %4)
  %6 = trunc i32 %5 to i8
  %7 = load i8*, i8** %s_, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 0
  store i8 %6, i8* %8, align 1
  %9 = load i8*, i8** %s_, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 1
  store i8 0, i8* %10, align 1
  %11 = load i8*, i8** %1, align 8
  %12 = load i8*, i8** %s_, align 8
  %13 = load i8*, i8** %1, align 8
  %14 = call i64 @strlen(i8* %13) #9
  %15 = add i64 %14, 2
  %16 = call i8* @strncat(i8* %11, i8* %12, i64 %15) #7
  %17 = load i8*, i8** %s_, align 8
  call void @free(i8* %17) #7
  %18 = load i8*, i8** %1, align 8
  ret i8* %18
}

; Function Attrs: nounwind
declare i8* @strncat(i8*, i8*, i64) #1

; Function Attrs: nounwind uwtable
define i8* @n_str(i8* %t, i8* %b_) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %s = alloca i8*, align 8
  store i8* %t, i8** %1, align 8
  store i8* %b_, i8** %2, align 8
  %3 = call noalias i8* @malloc(i64 8) #7
  store i8* %3, i8** %s, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = call i32 @get_i(i8* %5)
  %7 = call i64 @strtol(i8* %4, i8** null, i32 %6) #7
  %8 = sitofp i64 %7 to double
  %9 = load i8*, i8** %s, align 8
  %10 = bitcast i8* %9 to double*
  store double %8, double* %10, align 8
  %11 = load i8*, i8** %s, align 8
  %12 = icmp eq i8* %11, null
  br i1 %12, label %13, label %16

; <label>:13                                      ; preds = %0
  %14 = load i8*, i8** %s, align 8
  %15 = bitcast i8* %14 to double*
  store double 0.000000e+00, double* %15, align 8
  br label %16

; <label>:16                                      ; preds = %13, %0
  %17 = load i8*, i8** %s, align 8
  ret i8* %17
}

; Function Attrs: nounwind
declare i64 @strtol(i8*, i8**, i32) #1

; Function Attrs: nounwind uwtable
define i8* @pause() #0 {
  %r = alloca double*, align 8
  %1 = call noalias i8* @malloc(i64 8) #7
  %2 = bitcast i8* %1 to double*
  store double* %2, double** %r, align 8
  %3 = load double*, double** %r, align 8
  store double 0.000000e+00, double* %3, align 8
  %4 = call i32 @system(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0))
  %5 = load double*, double** %r, align 8
  %6 = bitcast double* %5 to i8*
  ret i8* %6
}

declare i32 @system(i8*) #3

; Function Attrs: nounwind uwtable
define i8* @exit_() #0 {
  %1 = alloca i8*, align 8
  %r = alloca double*, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %r, align 8
  %4 = load double*, double** %r, align 8
  store double 0.000000e+00, double* %4, align 8
  call void @exit(i32 1) #10
  unreachable
                                                  ; No predecessors!
  %6 = load i8*, i8** %1, align 8
  ret i8* %6
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #6

; Function Attrs: nounwind uwtable
define i8* @read(i8* %name) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %f_ = alloca %struct._IO_FILE*, align 8
  %r = alloca i8*, align 8
  %s = alloca i64, align 8
  %str = alloca i8*, align 8
  store i8* %name, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0))
  store %struct._IO_FILE* %4, %struct._IO_FILE** %f_, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %6 = icmp eq %struct._IO_FILE* %5, null
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %0
  %8 = call noalias i8* @malloc(i64 8) #7
  store i8* %8, i8** %r, align 8
  %9 = load i8*, i8** %r, align 8
  %10 = bitcast i8* %9 to double*
  store double 0.000000e+00, double* %10, align 8
  %11 = load i8*, i8** %r, align 8
  store i8* %11, i8** %1, align 8
  br label %32

; <label>:12                                      ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %14 = call i32 @fseek(%struct._IO_FILE* %13, i64 0, i32 2)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %16 = call i64 @ftell(%struct._IO_FILE* %15)
  store i64 %16, i64* %s, align 8
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %18 = call i32 @fseek(%struct._IO_FILE* %17, i64 0, i32 0)
  %19 = load i64, i64* %s, align 8
  %20 = add nsw i64 %19, 1
  %21 = call noalias i8* @malloc(i64 %20) #7
  store i8* %21, i8** %str, align 8
  %22 = load i8*, i8** %str, align 8
  %23 = load i64, i64* %s, align 8
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %25 = call i64 @fread(i8* %22, i64 %23, i64 1, %struct._IO_FILE* %24)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %27 = call i32 @fclose(%struct._IO_FILE* %26)
  %28 = load i64, i64* %s, align 8
  %29 = load i8*, i8** %str, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 %28
  store i8 0, i8* %30, align 1
  %31 = load i8*, i8** %str, align 8
  store i8* %31, i8** %1, align 8
  br label %32

; <label>:32                                      ; preds = %12, %7
  %33 = load i8*, i8** %1, align 8
  ret i8* %33
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #3

declare i64 @ftell(%struct._IO_FILE*) #3

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: nounwind uwtable
define i8* @write(i8* %file, i8* %c__) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %f_ = alloca %struct._IO_FILE*, align 8
  %r = alloca i8*, align 8
  %r1 = alloca i8*, align 8
  store i8* %file, i8** %2, align 8
  store i8* %c__, i8** %3, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call %struct._IO_FILE* @fopen(i8* %4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  store %struct._IO_FILE* %5, %struct._IO_FILE** %f_, align 8
  %6 = call noalias i8* @malloc(i64 8) #7
  store i8* %6, i8** %r, align 8
  %7 = load i8*, i8** %r, align 8
  %8 = bitcast i8* %7 to double*
  store double 1.000000e+00, double* %8, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %0
  %12 = call noalias i8* @malloc(i64 8) #7
  store i8* %12, i8** %r1, align 8
  %13 = load i8*, i8** %r1, align 8
  %14 = bitcast i8* %13 to double*
  store double 0.000000e+00, double* %14, align 8
  %15 = load i8*, i8** %r1, align 8
  store i8* %15, i8** %1, align 8
  br label %23

; <label>:16                                      ; preds = %0
  %17 = load i8*, i8** %3, align 8
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %19 = call i32 @fputs(i8* %17, %struct._IO_FILE* %18)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %21 = call i32 @fclose(%struct._IO_FILE* %20)
  %22 = load i8*, i8** %r, align 8
  store i8* %22, i8** %1, align 8
  br label %23

; <label>:23                                      ; preds = %16, %11
  %24 = load i8*, i8** %1, align 8
  ret i8* %24
}

declare i32 @fputs(i8*, %struct._IO_FILE*) #3

; Function Attrs: nounwind uwtable
define i8* @sys_dr__alloca(i8* %len) #0 {
  %1 = alloca i8*, align 8
  %b_ = alloca i8*, align 8
  store i8* %len, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i32 @get_i(i8* %2)
  %4 = sext i32 %3 to i64
  %5 = call i8* @mmap(i8* null, i64 %4, i32 3, i32 33, i32 -1, i64 0) #7
  store i8* %5, i8** %b_, align 8
  %6 = load i8*, i8** %b_, align 8
  ret i8* %6
}

; Function Attrs: nounwind
declare i8* @mmap(i8*, i64, i32, i32, i32, i64) #1

; Function Attrs: nounwind uwtable
define i8* @sys_dr__free(i8* %i, i8* %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %i, i8** %1, align 8
  store i8* %len, i8** %2, align 8
  %3 = load i8*, i8** %1, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i32 @get_i(i8* %4)
  %6 = sext i32 %5 to i64
  %7 = call i32 @munmap(i8* %3, i64 %6) #7
  %8 = load i8*, i8** %1, align 8
  ret i8* %8
}

; Function Attrs: nounwind
declare i32 @munmap(i8*, i64) #1

; Function Attrs: nounwind uwtable
define i8* @sys_p(i8* %c, i8* %t, i8* %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %c, i8** %1, align 8
  store i8* %t, i8** %2, align 8
  store i8* %len, i8** %3, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = call i32 @get_i(i8* %6)
  %8 = sdiv i32 %7, 1024
  %9 = sext i32 %8 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 %9, i32 1, i1 false)
  %10 = load i8*, i8** %1, align 8
  ret i8* %10
}

; Function Attrs: nounwind uwtable
define i8* @sys_acess(i8* %t) #0 {
  %1 = alloca i8*, align 8
  %t_ = alloca i8*, align 8
  store i8* %t, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i32 @get_i(i8* %2)
  %4 = sext i32 %3 to i64
  %5 = inttoptr i64 %4 to i8*
  store i8* %5, i8** %t_, align 8
  %6 = load i8*, i8** %t_, align 8
  ret i8* %6
}

; Function Attrs: nounwind uwtable
define i8* @sys_t(i8* %_) #0 {
  %1 = alloca i8*, align 8
  %a = alloca double*, align 8
  store i8* %_, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 8) #7
  %3 = bitcast i8* %2 to double*
  store double* %3, double** %a, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = ptrtoint i8* %4 to i64
  %6 = sitofp i64 %5 to double
  %7 = load double*, double** %a, align 8
  store double %6, double* %7, align 8
  %8 = load double*, double** %a, align 8
  %9 = bitcast double* %8 to i8*
  ret i8* %9
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone }
attributes #9 = { nounwind readonly }
attributes #10 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
