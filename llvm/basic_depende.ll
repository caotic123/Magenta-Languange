; ModuleID = 'llvm/mag_lib.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%79s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"pause\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1

; Function Attrs: nounwind uwtable
define i8* @_abs(i8* %i) #0 {
  %1 = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %i, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 4) #7
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %r, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = call i32 @abs(i32 %6) #8
  %8 = load i32*, i32** %r, align 8
  store i32 %7, i32* %8, align 4
  %9 = load i32*, i32** %r, align 8
  %10 = bitcast i32* %9 to i8*
  ret i8* %10
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #2

; Function Attrs: nounwind uwtable
define i8* @_ceil(i8* %i) #0 {
  %1 = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %i, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 4) #7
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %r, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = sitofp i32 %6 to double
  %8 = call double @ceil(double %7) #8
  %9 = fptosi double %8 to i32
  %10 = load i32*, i32** %r, align 8
  store i32 %9, i32* %10, align 4
  %11 = load i32*, i32** %r, align 8
  %12 = bitcast i32* %11 to i8*
  ret i8* %12
}

; Function Attrs: nounwind readnone
declare double @ceil(double) #2

; Function Attrs: nounwind uwtable
define i8* @_floor(i8* %i) #0 {
  %1 = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %i, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 4) #7
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %r, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = sitofp i32 %6 to double
  %8 = call double @floor(double %7) #8
  %9 = fptosi double %8 to i32
  %10 = load i32*, i32** %r, align 8
  store i32 %9, i32* %10, align 4
  %11 = load i32*, i32** %r, align 8
  %12 = bitcast i32* %11 to i8*
  ret i8* %12
}

; Function Attrs: nounwind readnone
declare double @floor(double) #2

; Function Attrs: nounwind uwtable
define i8* @_pow(i8* %i, i8* %b) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %i, i8** %1, align 8
  store i8* %b, i8** %2, align 8
  %3 = call noalias i8* @malloc(i64 4) #7
  %4 = bitcast i8* %3 to i32*
  store i32* %4, i32** %r, align 8
  %5 = load i8*, i8** %1, align 8
  %6 = bitcast i8* %5 to i32*
  %7 = load i32, i32* %6, align 4
  %8 = sitofp i32 %7 to double
  %9 = load i8*, i8** %2, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i32, i32* %10, align 4
  %12 = sitofp i32 %11 to double
  %13 = call double @pow(double %8, double %12) #7
  %14 = fptosi double %13 to i32
  %15 = load i32*, i32** %r, align 8
  store i32 %14, i32* %15, align 4
  %16 = load i32*, i32** %r, align 8
  %17 = bitcast i32* %16 to i8*
  ret i8* %17
}

; Function Attrs: nounwind
declare double @pow(double, double) #1

; Function Attrs: nounwind uwtable
define i8* @mod(i8* %n, i8* %y) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %ret = alloca i32*, align 8
  %r = alloca i32*, align 8
  store i8* %n, i8** %2, align 8
  store i8* %y, i8** %3, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %13, label %8

; <label>:8                                       ; preds = %0
  %9 = load i8*, i8** %3, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %8, %0
  %14 = call noalias i8* @malloc(i64 4) #7
  %15 = bitcast i8* %14 to i32*
  store i32* %15, i32** %ret, align 8
  %16 = load i32*, i32** %ret, align 8
  store i32 0, i32* %16, align 4
  %17 = load i32*, i32** %ret, align 8
  %18 = bitcast i32* %17 to i8*
  store i8* %18, i8** %1, align 8
  br label %32

; <label>:19                                      ; preds = %8
  %20 = call noalias i8* @malloc(i64 4) #7
  %21 = bitcast i8* %20 to i32*
  store i32* %21, i32** %r, align 8
  %22 = load i8*, i8** %2, align 8
  %23 = bitcast i8* %22 to i32*
  %24 = load i32, i32* %23, align 4
  %25 = load i8*, i8** %3, align 8
  %26 = bitcast i8* %25 to i32*
  %27 = load i32, i32* %26, align 4
  %28 = srem i32 %24, %27
  %29 = load i32*, i32** %r, align 8
  store i32 %28, i32* %29, align 4
  %30 = load i32*, i32** %r, align 8
  %31 = bitcast i32* %30 to i8*
  store i8* %31, i8** %1, align 8
  br label %32

; <label>:32                                      ; preds = %19, %13
  %33 = load i8*, i8** %1, align 8
  ret i8* %33
}

; Function Attrs: nounwind uwtable
define i8* @print(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %ret = alloca i32*, align 8
  store i8* %str, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 4) #7
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %ret, align 8
  %4 = load i32*, i32** %ret, align 8
  store i32 1, i32* %4, align 4
  %5 = load i8*, i8** %1, align 8
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %5)
  %7 = load i32*, i32** %ret, align 8
  %8 = bitcast i32* %7 to i8*
  ret i8* %8
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define i8* @print_n(i8* %i) #0 {
  %1 = alloca i8*, align 8
  %ret = alloca i32*, align 8
  store i8* %i, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 4) #7
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %ret, align 8
  %4 = load i32*, i32** %ret, align 8
  store i32 1, i32* %4, align 4
  %5 = load i8*, i8** %1, align 8
  %6 = bitcast i8* %5 to i32*
  %7 = load i32, i32* %6, align 4
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %7)
  %9 = load i32*, i32** %ret, align 8
  %10 = bitcast i32* %9 to i8*
  ret i8* %10
}

; Function Attrs: nounwind uwtable
define i8* @scanf_insecure() #0 {
  %x = alloca i8*, align 8
  %1 = call noalias i8* @malloc(i64 80) #7
  store i8* %1, i8** %x, align 8
  %2 = load i8*, i8** %x, align 8
  %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i8* %2)
  %4 = load i8*, i8** %x, align 8
  ret i8* %4
}

declare i32 @__isoc99_scanf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define i8* @get_scanf_int_insecure() #0 {
  %int_ = alloca i32*, align 8
  %1 = call noalias i8* @malloc(i64 4) #7
  %2 = bitcast i8* %1 to i32*
  store i32* %2, i32** %int_, align 8
  %3 = load i32*, i32** %int_, align 8
  %4 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %3)
  %5 = load i32*, i32** %int_, align 8
  %6 = bitcast i32* %5 to i8*
  ret i8* %6
}

; Function Attrs: nounwind uwtable
define i8* @mag_alloc(i8* %len) #0 {
  %1 = alloca i8*, align 8
  %m = alloca i8**, align 8
  store i8* %len, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4
  %5 = sext i32 %4 to i64
  %6 = mul i64 %5, 8
  %7 = call noalias i8* @malloc(i64 %6) #7
  %8 = bitcast i8* %7 to i8**
  store i8** %8, i8*** %m, align 8
  %9 = load i8**, i8*** %m, align 8
  %10 = bitcast i8** %9 to i8*
  ret i8* %10
}

; Function Attrs: nounwind uwtable
define i8* @mag_realloc(i8* %len) #0 {
  %1 = alloca i8*, align 8
  %m = alloca i8**, align 8
  store i8* %len, i8** %1, align 8
  %2 = load i8**, i8*** %m, align 8
  %3 = bitcast i8** %2 to i8*
  %4 = load i8*, i8** %1, align 8
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = sext i32 %6 to i64
  %8 = mul i64 %7, 8
  %9 = call i8* @realloc(i8* %3, i64 %8) #7
  %10 = bitcast i8* %9 to i8**
  store i8** %10, i8*** %m, align 8
  %11 = load i8**, i8*** %m, align 8
  %12 = bitcast i8** %11 to i8*
  ret i8* %12
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

; Function Attrs: nounwind uwtable
define i8* @_aloc(i8* %vector, i8* %i, i8* %space) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %vector, i8** %1, align 8
  store i8* %i, i8** %2, align 8
  store i8* %space, i8** %3, align 8
  %4 = call noalias i8* @malloc(i64 4) #7
  %5 = bitcast i8* %4 to i32*
  store i32* %5, i32** %r, align 8
  %6 = load i32*, i32** %r, align 8
  store i32 0, i32* %6, align 4
  %7 = load i8*, i8** %3, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 4
  %10 = sext i32 %9 to i64
  %11 = call noalias i8* @malloc(i64 %10) #7
  %12 = load i8*, i8** %2, align 8
  %13 = bitcast i8* %12 to i32*
  %14 = load i32, i32* %13, align 4
  %15 = sext i32 %14 to i64
  %16 = load i8*, i8** %1, align 8
  %17 = bitcast i8* %16 to i8**
  %18 = getelementptr inbounds i8*, i8** %17, i64 %15
  store i8* %11, i8** %18, align 8
  %19 = load i32*, i32** %r, align 8
  %20 = bitcast i32* %19 to i8*
  ret i8* %20
}

; Function Attrs: nounwind uwtable
define i8* @_set(i8* %vector, i8* %i, i8* %r, i8* %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %r_ = alloca i32*, align 8
  store i8* %vector, i8** %1, align 8
  store i8* %i, i8** %2, align 8
  store i8* %r, i8** %3, align 8
  store i8* %len, i8** %4, align 8
  %5 = call noalias i8* @malloc(i64 4) #7
  %6 = bitcast i8* %5 to i32*
  store i32* %6, i32** %r_, align 8
  %7 = load i32*, i32** %r_, align 8
  store i32 0, i32* %7, align 4
  %8 = load i8*, i8** %2, align 8
  %9 = bitcast i8* %8 to i32*
  %10 = load i32, i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = load i8*, i8** %1, align 8
  %13 = bitcast i8* %12 to i8**
  %14 = getelementptr inbounds i8*, i8** %13, i64 %11
  %15 = load i8*, i8** %14, align 8
  %16 = load i8*, i8** %3, align 8
  %17 = load i8*, i8** %4, align 8
  %18 = bitcast i8* %17 to i32*
  %19 = load i32, i32* %18, align 4
  %20 = sext i32 %19 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %16, i64 %20, i32 1, i1 false)
  %21 = load i32*, i32** %r_, align 8
  %22 = bitcast i32* %21 to i8*
  ret i8* %22
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define i8* @_put(i8* %vector, i8* %i, i8* %r) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %r_ = alloca i32*, align 8
  store i8* %vector, i8** %1, align 8
  store i8* %i, i8** %2, align 8
  store i8* %r, i8** %3, align 8
  %4 = call noalias i8* @malloc(i64 4) #7
  %5 = bitcast i8* %4 to i32*
  store i32* %5, i32** %r_, align 8
  %6 = load i32*, i32** %r_, align 8
  store i32 0, i32* %6, align 4
  %7 = load i8*, i8** %3, align 8
  %8 = load i8*, i8** %2, align 8
  %9 = bitcast i8* %8 to i32*
  %10 = load i32, i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = load i8*, i8** %1, align 8
  %13 = bitcast i8* %12 to i8**
  %14 = getelementptr inbounds i8*, i8** %13, i64 %11
  store i8* %7, i8** %14, align 8
  %15 = load i32*, i32** %r_, align 8
  %16 = bitcast i32* %15 to i8*
  ret i8* %16
}

; Function Attrs: nounwind uwtable
define i8* @_get(i8* %vector, i8* %i) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %vector, i8** %1, align 8
  store i8* %i, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = bitcast i8* %3 to i32*
  %5 = load i32, i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = load i8*, i8** %1, align 8
  %8 = bitcast i8* %7 to i8**
  %9 = getelementptr inbounds i8*, i8** %8, i64 %6
  %10 = load i8*, i8** %9, align 8
  ret i8* %10
}

; Function Attrs: nounwind uwtable
define i8* @new_int() #0 {
  %p_ = alloca i32*, align 8
  %1 = call noalias i8* @malloc(i64 4) #7
  %2 = bitcast i8* %1 to i32*
  store i32* %2, i32** %p_, align 8
  %3 = load i32*, i32** %p_, align 8
  store i32 0, i32* %3, align 4
  %4 = load i32*, i32** %p_, align 8
  %5 = bitcast i32* %4 to i8*
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
  %p_ = alloca i32*, align 8
  store i8* %len, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4
  %5 = sext i32 %4 to i64
  %6 = mul i64 1, %5
  %7 = call noalias i8* @malloc(i64 %6) #7
  %8 = bitcast i8* %7 to i32*
  store i32* %8, i32** %p_, align 8
  %9 = load i32*, i32** %p_, align 8
  %10 = bitcast i32* %9 to i8*
  ret i8* %10
}

; Function Attrs: nounwind uwtable
define i8* @l_str(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %str, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 4) #7
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %r, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = call i64 @strlen(i8* %4) #9
  %6 = trunc i64 %5 to i32
  %7 = load i32*, i32** %r, align 8
  store i32 %6, i32* %7, align 4
  %8 = load i32*, i32** %r, align 8
  %9 = bitcast i32* %8 to i8*
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
  %5 = call noalias i8* @malloc(i64 4) #7
  store i8* %5, i8** %return_, align 8
  %6 = load i8*, i8** %return_, align 8
  %7 = bitcast i8* %6 to i32*
  store i32 0, i32* %7, align 4
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
  %62 = bitcast i8* %61 to i32*
  %63 = load i32, i32* %62, align 4
  %64 = icmp sge i32 %60, %63
  br i1 %64, label %65, label %71

; <label>:65                                      ; preds = %59
  %66 = load i32, i32* %i, align 4
  %67 = add nsw i32 %66, 1
  %68 = load i8*, i8** %return_, align 8
  %69 = bitcast i8* %68 to i32*
  store i32 %67, i32* %69, align 4
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

; <label>:80                                      ; preds = %78, %65
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
  %r = alloca i32*, align 8
  store i8* %s, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 4) #7
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %r, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 0
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = load i32*, i32** %r, align 8
  store i32 %7, i32* %8, align 4
  %9 = load i32*, i32** %r, align 8
  %10 = bitcast i32* %9 to i8*
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
  %4 = bitcast i8* %3 to i32*
  %5 = load i32, i32* %4, align 4
  %6 = trunc i32 %5 to i8
  %7 = load i8*, i8** %r, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 0
  store i8 %6, i8* %8, align 1
  %9 = load i8*, i8** %r, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 1
  store i8 48, i8* %10, align 1
  %11 = load i8*, i8** %r, align 8
  ret i8* %11
}

; Function Attrs: nounwind uwtable
define i8* @g_str(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %___ = alloca i32*, align 8
  store i8* %str, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 4) #7
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %___, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = call i64 @strlen(i8* %4) #9
  %6 = trunc i64 %5 to i32
  %7 = load i32*, i32** %___, align 8
  store i32 %6, i32* %7, align 4
  %8 = load i32*, i32** %___, align 8
  %9 = bitcast i32* %8 to i8*
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
  %4 = bitcast i8* %3 to i32*
  %5 = load i32, i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = mul i64 1, %6
  %8 = call noalias i8* @malloc(i64 %7) #7
  store i8* %8, i8** %buffer, align 8
  %9 = load i8*, i8** %buffer, align 8
  %10 = load i8*, i8** %1, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32, i32* %11, align 4
  %13 = call i32 (i8*, i8*, ...) @sprintf(i8* %9, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32 %12) #7
  %14 = load i8*, i8** %buffer, align 8
  ret i8* %14
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #1

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
  %50 = load i8*, i8** %3, align 8
  %51 = bitcast i8* %50 to i32*
  store i32 %49, i32* %51, align 4
  %52 = load i8**, i8*** %r_, align 8
  %53 = bitcast i8** %52 to i8*
  ret i8* %53
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
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = sext i32 %6 to i64
  %8 = mul i64 1, %7
  %9 = add i64 %8, 1
  %10 = call noalias i8* @malloc(i64 %9) #7
  store i8* %10, i8** %str, align 8
  %11 = load i8*, i8** %2, align 8
  %12 = bitcast i8* %11 to i32*
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %s, align 4
  br label %14

; <label>:14                                      ; preds = %37, %0
  %15 = load i32, i32* %s, align 4
  %16 = load i8*, i8** %2, align 8
  %17 = bitcast i8* %16 to i32*
  %18 = load i32, i32* %17, align 4
  %19 = load i8*, i8** %3, align 8
  %20 = bitcast i8* %19 to i32*
  %21 = load i32, i32* %20, align 4
  %22 = add nsw i32 %18, %21
  %23 = sub nsw i32 %22, 1
  %24 = icmp sle i32 %15, %23
  br i1 %24, label %25, label %40

; <label>:25                                      ; preds = %14
  %26 = load i32, i32* %s, align 4
  %27 = sext i32 %26 to i64
  %28 = load i8*, i8** %1, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 %27
  %30 = load i8, i8* %29, align 1
  %31 = load i32, i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = load i8*, i8** %str, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 %32
  store i8 %30, i8* %34, align 1
  %35 = load i32, i32* %i, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %i, align 4
  br label %37

; <label>:37                                      ; preds = %25
  %38 = load i32, i32* %s, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %s, align 4
  br label %14

; <label>:40                                      ; preds = %14
  %41 = load i32, i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = load i8*, i8** %str, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 %42
  store i8 0, i8* %44, align 1
  %45 = load i8*, i8** %str, align 8
  ret i8* %45
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
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = trunc i32 %6 to i8
  %8 = load i8*, i8** %s_, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 0
  store i8 %7, i8* %9, align 1
  %10 = load i8*, i8** %s_, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 1
  store i8 0, i8* %11, align 1
  %12 = load i8*, i8** %1, align 8
  %13 = load i8*, i8** %s_, align 8
  %14 = load i8*, i8** %1, align 8
  %15 = call i64 @strlen(i8* %14) #9
  %16 = add i64 %15, 2
  %17 = call i8* @strncat(i8* %12, i8* %13, i64 %16) #7
  %18 = load i8*, i8** %s_, align 8
  call void @free(i8* %18) #7
  %19 = load i8*, i8** %1, align 8
  ret i8* %19
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
  %3 = call noalias i8* @malloc(i64 4) #7
  store i8* %3, i8** %s, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = bitcast i8* %5 to i32*
  %7 = load i32, i32* %6, align 4
  %8 = call i64 @strtol(i8* %4, i8** null, i32 %7) #7
  %9 = trunc i64 %8 to i32
  %10 = load i8*, i8** %s, align 8
  %11 = bitcast i8* %10 to i32*
  store i32 %9, i32* %11, align 4
  %12 = load i8*, i8** %s, align 8
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %0
  %15 = load i8*, i8** %s, align 8
  %16 = bitcast i8* %15 to i32*
  store i32 0, i32* %16, align 4
  br label %17

; <label>:17                                      ; preds = %14, %0
  %18 = load i8*, i8** %s, align 8
  ret i8* %18
}

; Function Attrs: nounwind
declare i64 @strtol(i8*, i8**, i32) #1

; Function Attrs: nounwind uwtable
define i8* @pause() #0 {
  %r = alloca i32*, align 8
  %1 = call noalias i8* @malloc(i64 4) #7
  %2 = bitcast i8* %1 to i32*
  store i32* %2, i32** %r, align 8
  %3 = load i32*, i32** %r, align 8
  store i32 0, i32* %3, align 4
  %4 = call i32 @system(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0))
  %5 = load i32*, i32** %r, align 8
  %6 = bitcast i32* %5 to i8*
  ret i8* %6
}

declare i32 @system(i8*) #3

; Function Attrs: nounwind uwtable
define i8* @exit_() #0 {
  %1 = alloca i8*, align 8
  %r = alloca i32*, align 8
  %2 = call noalias i8* @malloc(i64 4) #7
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %r, align 8
  %4 = load i32*, i32** %r, align 8
  store i32 0, i32* %4, align 4
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
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0))
  store %struct._IO_FILE* %4, %struct._IO_FILE** %f_, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %6 = icmp eq %struct._IO_FILE* %5, null
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %0
  %8 = call noalias i8* @malloc(i64 4) #7
  store i8* %8, i8** %r, align 8
  %9 = load i8*, i8** %r, align 8
  %10 = bitcast i8* %9 to i32*
  store i32 0, i32* %10, align 4
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
  %5 = call %struct._IO_FILE* @fopen(i8* %4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  store %struct._IO_FILE* %5, %struct._IO_FILE** %f_, align 8
  %6 = call noalias i8* @malloc(i64 4) #7
  store i8* %6, i8** %r, align 8
  %7 = load i8*, i8** %r, align 8
  %8 = bitcast i8* %7 to i32*
  store i32 1, i32* %8, align 4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %f_, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %0
  %12 = call noalias i8* @malloc(i64 4) #7
  store i8* %12, i8** %r1, align 8
  %13 = load i8*, i8** %r1, align 8
  %14 = bitcast i8* %13 to i32*
  store i32 0, i32* %14, align 4
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
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4
  %5 = sext i32 %4 to i64
  %6 = call i8* @mmap(i8* null, i64 %5, i32 3, i32 33, i32 -1, i64 0) #7
  store i8* %6, i8** %b_, align 8
  %7 = load i8*, i8** %b_, align 8
  ret i8* %7
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
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = sext i32 %6 to i64
  %8 = call i32 @munmap(i8* %3, i64 %7) #7
  %9 = load i8*, i8** %1, align 8
  ret i8* %9
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
  %7 = bitcast i8* %6 to i32*
  %8 = load i32, i32* %7, align 4
  %9 = sdiv i32 %8, 1024
  %10 = sext i32 %9 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 %10, i32 1, i1 false)
  %11 = load i8*, i8** %1, align 8
  ret i8* %11
}

; Function Attrs: nounwind uwtable
define i8* @sys_acess(i8* %t) #0 {
  %1 = alloca i8*, align 8
  %t_ = alloca i8*, align 8
  store i8* %t, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4
  %5 = sext i32 %4 to i64
  %6 = inttoptr i64 %5 to i8*
  store i8* %6, i8** %t_, align 8
  %7 = load i8*, i8** %t_, align 8
  ret i8* %7
}

; Function Attrs: nounwind uwtable
define i8* @sys_t(i8* %_) #0 {
  %1 = alloca i8*, align 8
  %a = alloca i32*, align 8
  store i8* %_, i8** %1, align 8
  %2 = call noalias i8* @malloc(i64 4) #7
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %a, align 8
  %4 = load i8*, i8** %1, align 8
  %5 = ptrtoint i8* %4 to i64
  %6 = trunc i64 %5 to i32
  %7 = load i32*, i32** %a, align 8
  store i32 %6, i32* %7, align 4
  %8 = load i32*, i32** %a, align 8
  %9 = bitcast i32* %8 to i8*
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
