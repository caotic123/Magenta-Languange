%struct.__crt_locale_pointers = type { %struct.__crt_locale_data*, %struct.__crt_multibyte_data* }
%struct.__crt_locale_data = type opaque
%struct.__crt_multibyte_data = type opaque
%struct._iobuf = type { i8* }

$sprintf = comdat any

$vsprintf = comdat any

$_snprintf = comdat any

$_vsnprintf = comdat any

$printf = comdat any

$scanf = comdat any

$_vsprintf_l = comdat any

$_vsnprintf_l = comdat any

$__local_stdio_printf_options = comdat any

$_vfprintf_l = comdat any

$_vfscanf_l = comdat any

$__local_stdio_scanf_options = comdat any

$"\01??_C@_03OFAPEBGM@?$CFs?6?$AA@" = comdat any

$"\01??_C@_03PMGGPEJJ@?$CFd?6?$AA@" = comdat any

$"\01??_C@_04HCKIJMKE@?$CF79s?$AA@" = comdat any

$"\01??_C@_02DPKJAMEF@?$CFd?$AA@" = comdat any

@"\01??_C@_03OFAPEBGM@?$CFs?6?$AA@" = linkonce_odr unnamed_addr constant [4 x i8] c"%s\0A\00", comdat, align 1
@"\01??_C@_03PMGGPEJJ@?$CFd?6?$AA@" = linkonce_odr unnamed_addr constant [4 x i8] c"%d\0A\00", comdat, align 1
@"\01??_C@_04HCKIJMKE@?$CF79s?$AA@" = linkonce_odr unnamed_addr constant [5 x i8] c"%79s\00", comdat, align 1
@"\01??_C@_02DPKJAMEF@?$CFd?$AA@" = linkonce_odr unnamed_addr constant [3 x i8] c"%d\00", comdat, align 1
@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8
@__local_stdio_scanf_options._OptionsStorage = internal global i64 0, align 8

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @sprintf(i8* %_Buffer, i8* %_Format, ...) #0 comdat {
entry:
  %_Format.addr = alloca i8*, align 8
  %_Buffer.addr = alloca i8*, align 8
  %_Result = alloca i32, align 4
  %_ArgList = alloca i8*, align 8
  store i8* %_Format, i8** %_Format.addr, align 8
  store i8* %_Buffer, i8** %_Buffer.addr, align 8
  %_ArgList1 = bitcast i8** %_ArgList to i8*
  call void @llvm.va_start(i8* %_ArgList1)
  %0 = load i8*, i8** %_ArgList, align 8
  %1 = load i8*, i8** %_Format.addr, align 8
  %2 = load i8*, i8** %_Buffer.addr, align 8
  %call = call i32 @_vsprintf_l(i8* %2, i8* %1, %struct.__crt_locale_pointers* null, i8* %0)
  store i32 %call, i32* %_Result, align 4
  %_ArgList2 = bitcast i8** %_ArgList to i8*
  call void @llvm.va_end(i8* %_ArgList2)
  %3 = load i32, i32* %_Result, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @vsprintf(i8* %_Buffer, i8* %_Format, i8* %_ArgList) #0 comdat {
entry:
  %_ArgList.addr = alloca i8*, align 8
  %_Format.addr = alloca i8*, align 8
  %_Buffer.addr = alloca i8*, align 8
  store i8* %_ArgList, i8** %_ArgList.addr, align 8
  store i8* %_Format, i8** %_Format.addr, align 8
  store i8* %_Buffer, i8** %_Buffer.addr, align 8
  %0 = load i8*, i8** %_ArgList.addr, align 8
  %1 = load i8*, i8** %_Format.addr, align 8
  %2 = load i8*, i8** %_Buffer.addr, align 8
  %call = call i32 @_vsnprintf_l(i8* %2, i64 -1, i8* %1, %struct.__crt_locale_pointers* null, i8* %0)
  ret i32 %call
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @_snprintf(i8* %_Buffer, i64 %_BufferCount, i8* %_Format, ...) #0 comdat {
entry:
  %_Format.addr = alloca i8*, align 8
  %_BufferCount.addr = alloca i64, align 8
  %_Buffer.addr = alloca i8*, align 8
  %_Result = alloca i32, align 4
  %_ArgList = alloca i8*, align 8
  store i8* %_Format, i8** %_Format.addr, align 8
  store i64 %_BufferCount, i64* %_BufferCount.addr, align 8
  store i8* %_Buffer, i8** %_Buffer.addr, align 8
  %_ArgList1 = bitcast i8** %_ArgList to i8*
  call void @llvm.va_start(i8* %_ArgList1)
  %0 = load i8*, i8** %_ArgList, align 8
  %1 = load i8*, i8** %_Format.addr, align 8
  %2 = load i64, i64* %_BufferCount.addr, align 8
  %3 = load i8*, i8** %_Buffer.addr, align 8
  %call = call i32 @_vsnprintf(i8* %3, i64 %2, i8* %1, i8* %0)
  store i32 %call, i32* %_Result, align 4
  %_ArgList2 = bitcast i8** %_ArgList to i8*
  call void @llvm.va_end(i8* %_ArgList2)
  %4 = load i32, i32* %_Result, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @_vsnprintf(i8* %_Buffer, i64 %_BufferCount, i8* %_Format, i8* %_ArgList) #0 comdat {
entry:
  %_ArgList.addr = alloca i8*, align 8
  %_Format.addr = alloca i8*, align 8
  %_BufferCount.addr = alloca i64, align 8
  %_Buffer.addr = alloca i8*, align 8
  store i8* %_ArgList, i8** %_ArgList.addr, align 8
  store i8* %_Format, i8** %_Format.addr, align 8
  store i64 %_BufferCount, i64* %_BufferCount.addr, align 8
  store i8* %_Buffer, i8** %_Buffer.addr, align 8
  %0 = load i8*, i8** %_ArgList.addr, align 8
  %1 = load i8*, i8** %_Format.addr, align 8
  %2 = load i64, i64* %_BufferCount.addr, align 8
  %3 = load i8*, i8** %_Buffer.addr, align 8
  %call = call i32 @_vsnprintf_l(i8* %3, i64 %2, i8* %1, %struct.__crt_locale_pointers* null, i8* %0)
  ret i32 %call
}

; Function Attrs: noinline nounwind uwtable
define i8* @mod(i8* %n, i8* %y) #0 {
entry:
  %retval = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %n.addr = alloca i8*, align 8
  %ret = alloca i32*, align 8
  %r = alloca i32*, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %n, i8** %n.addr, align 8
  %0 = load i8*, i8** %n.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i8*, i8** %y.addr, align 8
  %4 = bitcast i8* %3 to i32*
  %5 = load i32, i32* %4, align 4
  %cmp1 = icmp eq i32 %5, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call = call noalias i8* @malloc(i64 4)
  %6 = bitcast i8* %call to i32*
  store i32* %6, i32** %ret, align 8
  %7 = load i32*, i32** %ret, align 8
  store i32 0, i32* %7, align 4
  %8 = load i32*, i32** %ret, align 8
  %9 = bitcast i32* %8 to i8*
  store i8* %9, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %call2 = call noalias i8* @malloc(i64 4)
  %10 = bitcast i8* %call2 to i32*
  store i32* %10, i32** %r, align 8
  %11 = load i8*, i8** %n.addr, align 8
  %12 = bitcast i8* %11 to i32*
  %13 = load i32, i32* %12, align 4
  %14 = load i8*, i8** %y.addr, align 8
  %15 = bitcast i8* %14 to i32*
  %16 = load i32, i32* %15, align 4
  %rem = srem i32 %13, %16
  %17 = load i32*, i32** %r, align 8
  store i32 %rem, i32* %17, align 4
  %18 = load i32*, i32** %r, align 8
  %19 = bitcast i32* %18 to i8*
  store i8* %19, i8** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %20 = load i8*, i8** %retval, align 8
  ret i8* %20
}

declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define i8* @print(i8* %str) #0 {
entry:
  %str.addr = alloca i8*, align 8
  %ret = alloca i32*, align 8
  store i8* %str, i8** %str.addr, align 8
  %call = call noalias i8* @malloc(i64 8)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %ret, align 8
  %1 = load i32*, i32** %ret, align 8
  store i32 1, i32* %1, align 4
  %2 = load i8*, i8** %str.addr, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"\01??_C@_03OFAPEBGM@?$CFs?6?$AA@", i32 0, i32 0), i8* %2)
  %3 = load i32*, i32** %ret, align 8
  %4 = bitcast i32* %3 to i8*
  ret i8* %4
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @printf(i8* %_Format, ...) #0 comdat {
entry:
  %_Format.addr = alloca i8*, align 8
  %_Result = alloca i32, align 4
  %_ArgList = alloca i8*, align 8
  store i8* %_Format, i8** %_Format.addr, align 8
  %_ArgList1 = bitcast i8** %_ArgList to i8*
  call void @llvm.va_start(i8* %_ArgList1)
  %0 = load i8*, i8** %_ArgList, align 8
  %1 = load i8*, i8** %_Format.addr, align 8
  %call = call %struct._iobuf* @__acrt_iob_func(i32 1)
  %call2 = call i32 @_vfprintf_l(%struct._iobuf* %call, i8* %1, %struct.__crt_locale_pointers* null, i8* %0)
  store i32 %call2, i32* %_Result, align 4
  %_ArgList3 = bitcast i8** %_ArgList to i8*
  call void @llvm.va_end(i8* %_ArgList3)
  %2 = load i32, i32* %_Result, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind uwtable
define i8* @print_n(i8* %i) #0 {
entry:
  %i.addr = alloca i8*, align 8
  %ret = alloca i32*, align 8
  store i8* %i, i8** %i.addr, align 8
  %call = call noalias i8* @malloc(i64 8)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %ret, align 8
  %1 = load i32*, i32** %ret, align 8
  store i32 1, i32* %1, align 4
  %2 = load i8*, i8** %i.addr, align 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"\01??_C@_03PMGGPEJJ@?$CFd?6?$AA@", i32 0, i32 0), i32 %4)
  %5 = load i32*, i32** %ret, align 8
  %6 = bitcast i32* %5 to i8*
  ret i8* %6
}

; Function Attrs: noinline nounwind uwtable
define i8* @scanf_insecure() #0 {
entry:
  %x = alloca i8*, align 8
  %call = call noalias i8* @malloc(i64 80)
  store i8* %call, i8** %x, align 8
  %0 = load i8*, i8** %x, align 8
  %call1 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @"\01??_C@_04HCKIJMKE@?$CF79s?$AA@", i32 0, i32 0), i8* %0)
  %1 = load i8*, i8** %x, align 8
  ret i8* %1
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @scanf(i8* %_Format, ...) #0 comdat {
entry:
  %_Format.addr = alloca i8*, align 8
  %_Result = alloca i32, align 4
  %_ArgList = alloca i8*, align 8
  store i8* %_Format, i8** %_Format.addr, align 8
  %_ArgList1 = bitcast i8** %_ArgList to i8*
  call void @llvm.va_start(i8* %_ArgList1)
  %0 = load i8*, i8** %_ArgList, align 8
  %1 = load i8*, i8** %_Format.addr, align 8
  %call = call %struct._iobuf* @__acrt_iob_func(i32 0)
  %call2 = call i32 @_vfscanf_l(%struct._iobuf* %call, i8* %1, %struct.__crt_locale_pointers* null, i8* %0)
  store i32 %call2, i32* %_Result, align 4
  %_ArgList3 = bitcast i8** %_ArgList to i8*
  call void @llvm.va_end(i8* %_ArgList3)
  %2 = load i32, i32* %_Result, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind uwtable
define i8* @get_scanf_int_insecure() #0 {
entry:
  %int_ = alloca i32*, align 8
  %call = call noalias i8* @malloc(i64 8)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %int_, align 8
  %1 = load i32*, i32** %int_, align 8
  %call1 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @"\01??_C@_02DPKJAMEF@?$CFd?$AA@", i32 0, i32 0), i32* %1)
  %2 = load i32*, i32** %int_, align 8
  %3 = bitcast i32* %2 to i8*
  ret i8* %3
}

; Function Attrs: noinline nounwind uwtable
define i8* @mag_alloc(i8* %len) #0 {
entry:
  %len.addr = alloca i8*, align 8
  %m = alloca i8**, align 8
  store i8* %len, i8** %len.addr, align 8
  %0 = load i8*, i8** %len.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 %conv, 8
  %call = call noalias i8* @malloc(i64 %mul)
  %3 = bitcast i8* %call to i8**
  store i8** %3, i8*** %m, align 8
  %4 = load i8**, i8*** %m, align 8
  %5 = bitcast i8** %4 to i8*
  ret i8* %5
}

; Function Attrs: noinline nounwind uwtable
define i8* @_aloc(i8* %vector, i8* %i, i8* %space) #0 {
entry:
  %space.addr = alloca i8*, align 8
  %i.addr = alloca i8*, align 8
  %vector.addr = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %space, i8** %space.addr, align 8
  store i8* %i, i8** %i.addr, align 8
  store i8* %vector, i8** %vector.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r, align 8
  %1 = load i32*, i32** %r, align 8
  store i32 0, i32* %1, align 4
  %2 = load i8*, i8** %space.addr, align 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4
  %conv = sext i32 %4 to i64
  %call1 = call noalias i8* @malloc(i64 %conv)
  %5 = load i8*, i8** %vector.addr, align 8
  %6 = bitcast i8* %5 to i8**
  %7 = load i8*, i8** %i.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %6, i64 %idxprom
  store i8* %call1, i8** %arrayidx, align 8
  %10 = load i32*, i32** %r, align 8
  %11 = bitcast i32* %10 to i8*
  ret i8* %11
}

; Function Attrs: noinline nounwind uwtable
define i8* @_set(i8* %vector, i8* %i, i8* %r, i8* %len) #0 {
entry:
  %len.addr = alloca i8*, align 8
  %r.addr = alloca i8*, align 8
  %i.addr = alloca i8*, align 8
  %vector.addr = alloca i8*, align 8
  %r_ = alloca i32*, align 8
  store i8* %len, i8** %len.addr, align 8
  store i8* %r, i8** %r.addr, align 8
  store i8* %i, i8** %i.addr, align 8
  store i8* %vector, i8** %vector.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r_, align 8
  %1 = load i32*, i32** %r_, align 8
  store i32 0, i32* %1, align 4
  %2 = load i8*, i8** %vector.addr, align 8
  %3 = bitcast i8* %2 to i8**
  %4 = load i8*, i8** %i.addr, align 8
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 %idxprom
  %7 = load i8*, i8** %arrayidx, align 8
  %8 = load i8*, i8** %r.addr, align 8
  %9 = load i8*, i8** %len.addr, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i32, i32* %10, align 4
  %conv = sext i32 %11 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 %conv, i32 1, i1 false)
  %12 = load i32*, i32** %r_, align 8
  %13 = bitcast i32* %12 to i8*
  ret i8* %13
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noinline nounwind uwtable
define i8* @_get(i8* %vector, i8* %i) #0 {
entry:
  %i.addr = alloca i8*, align 8
  %vector.addr = alloca i8*, align 8
  store i8* %i, i8** %i.addr, align 8
  store i8* %vector, i8** %vector.addr, align 8
  %0 = load i8*, i8** %vector.addr, align 8
  %1 = bitcast i8* %0 to i8**
  %2 = load i8*, i8** %i.addr, align 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 %idxprom
  %5 = load i8*, i8** %arrayidx, align 8
  ret i8* %5
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #3

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @_vsprintf_l(i8* %_Buffer, i8* %_Format, %struct.__crt_locale_pointers* %_Locale, i8* %_ArgList) #0 comdat {
entry:
  %_ArgList.addr = alloca i8*, align 8
  %_Locale.addr = alloca %struct.__crt_locale_pointers*, align 8
  %_Format.addr = alloca i8*, align 8
  %_Buffer.addr = alloca i8*, align 8
  store i8* %_ArgList, i8** %_ArgList.addr, align 8
  store %struct.__crt_locale_pointers* %_Locale, %struct.__crt_locale_pointers** %_Locale.addr, align 8
  store i8* %_Format, i8** %_Format.addr, align 8
  store i8* %_Buffer, i8** %_Buffer.addr, align 8
  %0 = load i8*, i8** %_ArgList.addr, align 8
  %1 = load %struct.__crt_locale_pointers*, %struct.__crt_locale_pointers** %_Locale.addr, align 8
  %2 = load i8*, i8** %_Format.addr, align 8
  %3 = load i8*, i8** %_Buffer.addr, align 8
  %call = call i32 @_vsnprintf_l(i8* %3, i64 -1, i8* %2, %struct.__crt_locale_pointers* %1, i8* %0)
  ret i32 %call
}

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #3

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @_vsnprintf_l(i8* %_Buffer, i64 %_BufferCount, i8* %_Format, %struct.__crt_locale_pointers* %_Locale, i8* %_ArgList) #0 comdat {
entry:
  %_ArgList.addr = alloca i8*, align 8
  %_Locale.addr = alloca %struct.__crt_locale_pointers*, align 8
  %_Format.addr = alloca i8*, align 8
  %_BufferCount.addr = alloca i64, align 8
  %_Buffer.addr = alloca i8*, align 8
  %_Result = alloca i32, align 4
  store i8* %_ArgList, i8** %_ArgList.addr, align 8
  store %struct.__crt_locale_pointers* %_Locale, %struct.__crt_locale_pointers** %_Locale.addr, align 8
  store i8* %_Format, i8** %_Format.addr, align 8
  store i64 %_BufferCount, i64* %_BufferCount.addr, align 8
  store i8* %_Buffer, i8** %_Buffer.addr, align 8
  %0 = load i8*, i8** %_ArgList.addr, align 8
  %1 = load %struct.__crt_locale_pointers*, %struct.__crt_locale_pointers** %_Locale.addr, align 8
  %2 = load i8*, i8** %_Format.addr, align 8
  %3 = load i64, i64* %_BufferCount.addr, align 8
  %4 = load i8*, i8** %_Buffer.addr, align 8
  %call = call i64* @__local_stdio_printf_options()
  %5 = load i64, i64* %call, align 8
  %or = or i64 %5, 1
  %call1 = call i32 @__stdio_common_vsprintf(i64 %or, i8* %4, i64 %3, i8* %2, %struct.__crt_locale_pointers* %1, i8* %0)
  store i32 %call1, i32* %_Result, align 4
  %6 = load i32, i32* %_Result, align 4
  %cmp = icmp slt i32 %6, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %7 = load i32, i32* %_Result, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %7, %cond.false ]
  ret i32 %cond
}

declare i32 @__stdio_common_vsprintf(i64, i8*, i64, i8*, %struct.__crt_locale_pointers*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i64* @__local_stdio_printf_options() #0 comdat {
entry:
  ret i64* @__local_stdio_printf_options._OptionsStorage
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @_vfprintf_l(%struct._iobuf* %_Stream, i8* %_Format, %struct.__crt_locale_pointers* %_Locale, i8* %_ArgList) #0 comdat {
entry:
  %_ArgList.addr = alloca i8*, align 8
  %_Locale.addr = alloca %struct.__crt_locale_pointers*, align 8
  %_Format.addr = alloca i8*, align 8
  %_Stream.addr = alloca %struct._iobuf*, align 8
  store i8* %_ArgList, i8** %_ArgList.addr, align 8
  store %struct.__crt_locale_pointers* %_Locale, %struct.__crt_locale_pointers** %_Locale.addr, align 8
  store i8* %_Format, i8** %_Format.addr, align 8
  store %struct._iobuf* %_Stream, %struct._iobuf** %_Stream.addr, align 8
  %0 = load i8*, i8** %_ArgList.addr, align 8
  %1 = load %struct.__crt_locale_pointers*, %struct.__crt_locale_pointers** %_Locale.addr, align 8
  %2 = load i8*, i8** %_Format.addr, align 8
  %3 = load %struct._iobuf*, %struct._iobuf** %_Stream.addr, align 8
  %call = call i64* @__local_stdio_printf_options()
  %4 = load i64, i64* %call, align 8
  %call1 = call i32 @__stdio_common_vfprintf(i64 %4, %struct._iobuf* %3, i8* %2, %struct.__crt_locale_pointers* %1, i8* %0)
  ret i32 %call1
}

declare %struct._iobuf* @__acrt_iob_func(i32) #1

declare i32 @__stdio_common_vfprintf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @_vfscanf_l(%struct._iobuf* %_Stream, i8* %_Format, %struct.__crt_locale_pointers* %_Locale, i8* %_ArgList) #0 comdat {
entry:
  %_ArgList.addr = alloca i8*, align 8
  %_Locale.addr = alloca %struct.__crt_locale_pointers*, align 8
  %_Format.addr = alloca i8*, align 8
  %_Stream.addr = alloca %struct._iobuf*, align 8
  store i8* %_ArgList, i8** %_ArgList.addr, align 8
  store %struct.__crt_locale_pointers* %_Locale, %struct.__crt_locale_pointers** %_Locale.addr, align 8
  store i8* %_Format, i8** %_Format.addr, align 8
  store %struct._iobuf* %_Stream, %struct._iobuf** %_Stream.addr, align 8
  %0 = load i8*, i8** %_ArgList.addr, align 8
  %1 = load %struct.__crt_locale_pointers*, %struct.__crt_locale_pointers** %_Locale.addr, align 8
  %2 = load i8*, i8** %_Format.addr, align 8
  %3 = load %struct._iobuf*, %struct._iobuf** %_Stream.addr, align 8
  %call = call i64* @__local_stdio_scanf_options()
  %4 = load i64, i64* %call, align 8
  %call1 = call i32 @__stdio_common_vfscanf(i64 %4, %struct._iobuf* %3, i8* %2, %struct.__crt_locale_pointers* %1, i8* %0)
  ret i32 %call1
}

declare i32 @__stdio_common_vfscanf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i64* @__local_stdio_scanf_options() #0 comdat {
entry:
  ret i64* @__local_stdio_scanf_options._OptionsStorage
}