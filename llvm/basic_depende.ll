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

$"\01??_C@_05PDJBBECF@pause?$AA@" = comdat any

$"\01??_C@_02JDPG@rb?$AA@" = comdat any

$"\01??_C@_01NOFIACDB@w?$AA@" = comdat any

@"\01??_C@_03OFAPEBGM@?$CFs?6?$AA@" = linkonce_odr unnamed_addr constant [4 x i8] c"%s\0A\00", comdat, align 1
@"\01??_C@_03PMGGPEJJ@?$CFd?6?$AA@" = linkonce_odr unnamed_addr constant [4 x i8] c"%d\0A\00", comdat, align 1
@"\01??_C@_04HCKIJMKE@?$CF79s?$AA@" = linkonce_odr unnamed_addr constant [5 x i8] c"%79s\00", comdat, align 1
@"\01??_C@_02DPKJAMEF@?$CFd?$AA@" = linkonce_odr unnamed_addr constant [3 x i8] c"%d\00", comdat, align 1
@"\01??_C@_05PDJBBECF@pause?$AA@" = linkonce_odr unnamed_addr constant [6 x i8] c"pause\00", comdat, align 1
@"\01??_C@_02JDPG@rb?$AA@" = linkonce_odr unnamed_addr constant [3 x i8] c"rb\00", comdat, align 1
@"\01??_C@_01NOFIACDB@w?$AA@" = linkonce_odr unnamed_addr constant [2 x i8] c"w\00", comdat, align 1
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
define i8* @_abs(i8* %i) #0 {
entry:
  %i.addr = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %i, i8** %i.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r, align 8
  %1 = load i8*, i8** %i.addr, align 8
  %2 = bitcast i8* %1 to i32*
  %3 = load i32, i32* %2, align 4
  %call1 = call i32 @abs(i32 %3) #7
  %4 = load i32*, i32** %r, align 8
  store i32 %call1, i32* %4, align 4
  %5 = load i32*, i32** %r, align 8
  %6 = bitcast i32* %5 to i8*
  ret i8* %6
}

declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #2

; Function Attrs: noinline nounwind uwtable
define i8* @_ceil(i8* %i) #0 {
entry:
  %i.addr = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %i, i8** %i.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r, align 8
  %1 = load i8*, i8** %i.addr, align 8
  %2 = bitcast i8* %1 to i32*
  %3 = load i32, i32* %2, align 4
  %conv = sitofp i32 %3 to double
  %call1 = call double @ceil(double %conv) #7
  %conv2 = fptosi double %call1 to i32
  %4 = load i32*, i32** %r, align 8
  store i32 %conv2, i32* %4, align 4
  %5 = load i32*, i32** %r, align 8
  %6 = bitcast i32* %5 to i8*
  ret i8* %6
}

; Function Attrs: nounwind readnone
declare double @ceil(double) #2

; Function Attrs: noinline nounwind uwtable
define i8* @_floor(i8* %i) #0 {
entry:
  %i.addr = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %i, i8** %i.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r, align 8
  %1 = load i8*, i8** %i.addr, align 8
  %2 = bitcast i8* %1 to i32*
  %3 = load i32, i32* %2, align 4
  %conv = sitofp i32 %3 to double
  %call1 = call double @floor(double %conv) #7
  %conv2 = fptosi double %call1 to i32
  %4 = load i32*, i32** %r, align 8
  store i32 %conv2, i32* %4, align 4
  %5 = load i32*, i32** %r, align 8
  %6 = bitcast i32* %5 to i8*
  ret i8* %6
}

; Function Attrs: nounwind readnone
declare double @floor(double) #2

; Function Attrs: noinline nounwind uwtable
define i8* @_pow(i8* %i, i8* %b) #0 {
entry:
  %b.addr = alloca i8*, align 8
  %i.addr = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %i, i8** %i.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r, align 8
  %1 = load i8*, i8** %b.addr, align 8
  %2 = bitcast i8* %1 to i32*
  %3 = load i32, i32* %2, align 4
  %conv = sitofp i32 %3 to double
  %4 = load i8*, i8** %i.addr, align 8
  %5 = bitcast i8* %4 to i32*
  %6 = load i32, i32* %5, align 4
  %conv1 = sitofp i32 %6 to double
  %call2 = call double @pow(double %conv1, double %conv) #6
  %conv3 = fptosi double %call2 to i32
  %7 = load i32*, i32** %r, align 8
  store i32 %conv3, i32* %7, align 4
  %8 = load i32*, i32** %r, align 8
  %9 = bitcast i32* %8 to i8*
  ret i8* %9
}

; Function Attrs: nounwind
declare double @pow(double, double) #3

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

; Function Attrs: noinline nounwind uwtable
define i8* @print(i8* %str) #0 {
entry:
  %str.addr = alloca i8*, align 8
  %ret = alloca i32*, align 8
  store i8* %str, i8** %str.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
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
  %call = call noalias i8* @malloc(i64 4)
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
  %call = call noalias i8* @malloc(i64 4)
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
define i8* @mag_realloc(i8* %len) #0 {
entry:
  %len.addr = alloca i8*, align 8
  %m = alloca i8**, align 8
  store i8* %len, i8** %len.addr, align 8
  %0 = load i8*, i8** %len.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 %conv, 8
  %3 = load i8**, i8*** %m, align 8
  %4 = bitcast i8** %3 to i8*
  %call = call noalias i8* @realloc(i8* %4, i64 %mul)
  %5 = bitcast i8* %call to i8**
  store i8** %5, i8*** %m, align 8
  %6 = load i8**, i8*** %m, align 8
  %7 = bitcast i8** %6 to i8*
  ret i8* %7
}

declare noalias i8* @realloc(i8*, i64) #1

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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: noinline nounwind uwtable
define i8* @_put(i8* %vector, i8* %i, i8* %r) #0 {
entry:
  %r.addr = alloca i8*, align 8
  %i.addr = alloca i8*, align 8
  %vector.addr = alloca i8*, align 8
  %r_ = alloca i32*, align 8
  store i8* %r, i8** %r.addr, align 8
  store i8* %i, i8** %i.addr, align 8
  store i8* %vector, i8** %vector.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r_, align 8
  %1 = load i32*, i32** %r_, align 8
  store i32 0, i32* %1, align 4
  %2 = load i8*, i8** %r.addr, align 8
  %3 = load i8*, i8** %vector.addr, align 8
  %4 = bitcast i8* %3 to i8**
  %5 = load i8*, i8** %i.addr, align 8
  %6 = bitcast i8* %5 to i32*
  %7 = load i32, i32* %6, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %4, i64 %idxprom
  store i8* %2, i8** %arrayidx, align 8
  %8 = load i32*, i32** %r_, align 8
  %9 = bitcast i32* %8 to i8*
  ret i8* %9
}

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

; Function Attrs: noinline nounwind uwtable
define i8* @new_int() #0 {
entry:
  %p_ = alloca i32*, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %p_, align 8
  %1 = load i32*, i32** %p_, align 8
  store i32 0, i32* %1, align 4
  %2 = load i32*, i32** %p_, align 8
  %3 = bitcast i32* %2 to i8*
  ret i8* %3
}

; Function Attrs: noinline nounwind uwtable
define i8* @new_bool() #0 {
entry:
  %p_ = alloca i8*, align 8
  %call = call noalias i8* @malloc(i64 1)
  store i8* %call, i8** %p_, align 8
  %0 = load i8*, i8** %p_, align 8
  store i8 1, i8* %0, align 1
  %1 = load i8*, i8** %p_, align 8
  ret i8* %1
}

; Function Attrs: noinline nounwind uwtable
define i8* @new_str(i8* %len) #0 {
entry:
  %len.addr = alloca i8*, align 8
  %p_ = alloca i32*, align 8
  store i8* %len, i8** %len.addr, align 8
  %0 = load i8*, i8** %len.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 1, %conv
  %call = call noalias i8* @malloc(i64 %mul)
  %3 = bitcast i8* %call to i32*
  store i32* %3, i32** %p_, align 8
  %4 = load i32*, i32** %p_, align 8
  %5 = bitcast i32* %4 to i8*
  ret i8* %5
}

; Function Attrs: noinline nounwind uwtable
define i8* @l_str(i8* %str) #0 {
entry:
  %str.addr = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %str, i8** %str.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r, align 8
  %1 = load i8*, i8** %str.addr, align 8
  %call1 = call i64 @strlen(i8* %1)
  %conv = trunc i64 %call1 to i32
  %2 = load i32*, i32** %r, align 8
  store i32 %conv, i32* %2, align 4
  %3 = load i32*, i32** %r, align 8
  %4 = bitcast i32* %3 to i8*
  ret i8* %4
}

declare i64 @strlen(i8*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @f_str(i8* %str, i8* %str_, i8* %r) #0 {
entry:
  %retval = alloca i8*, align 8
  %r.addr = alloca i8*, align 8
  %str_.addr = alloca i8*, align 8
  %str.addr = alloca i8*, align 8
  %t = alloca i8, align 1
  %y = alloca i32, align 4
  %s = alloca i32, align 4
  %return_ = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %r, i8** %r.addr, align 8
  store i8* %str_, i8** %str_.addr, align 8
  store i8* %str, i8** %str.addr, align 8
  store i32 0, i32* %y, align 4
  store i32 0, i32* %s, align 4
  %call = call noalias i8* @malloc(i64 4)
  store i8* %call, i8** %return_, align 8
  %0 = load i8*, i8** %return_, align 8
  %1 = bitcast i8* %0 to i32*
  store i32 0, i32* %1, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %conv = sext i32 %2 to i64
  %3 = load i8*, i8** %str.addr, align 8
  %call1 = call i64 @strlen(i8* %3)
  %cmp = icmp ule i64 %conv, %call1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8, i8* %t, align 1
  %tobool = trunc i8 %4 to i1
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body
  %5 = load i8*, i8** %str.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom
  %7 = load i8, i8* %arrayidx, align 1
  %conv4 = sext i8 %7 to i32
  %8 = load i8*, i8** %str_.addr, align 8
  %9 = load i32, i32* %y, align 4
  %idxprom5 = sext i32 %9 to i64
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 %idxprom5
  %10 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %10 to i32
  %cmp8 = icmp eq i32 %conv4, %conv7
  br i1 %cmp8, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  store i8 1, i8* %t, align 1
  %11 = load i32, i32* %y, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %y, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %for.body
  store i8 0, i8* %t, align 1
  store i32 0, i32* %y, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %12 = load i8, i8* %t, align 1
  %tobool10 = trunc i8 %12 to i1
  br i1 %tobool10, label %if.end20, label %land.lhs.true11

land.lhs.true11:                                  ; preds = %if.end
  %13 = load i8*, i8** %str.addr, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %14 to i64
  %arrayidx13 = getelementptr inbounds i8, i8* %13, i64 %idxprom12
  %15 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %15 to i32
  %16 = load i8*, i8** %str_.addr, align 8
  %arrayidx15 = getelementptr inbounds i8, i8* %16, i64 0
  %17 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %17 to i32
  %cmp17 = icmp eq i32 %conv14, %conv16
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %land.lhs.true11
  store i8 1, i8* %t, align 1
  %18 = load i32, i32* %y, align 4
  %add = add nsw i32 %18, 1
  store i32 %add, i32* %y, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %land.lhs.true11, %if.end
  %19 = load i32, i32* %y, align 4
  %conv21 = sext i32 %19 to i64
  %20 = load i8*, i8** %str_.addr, align 8
  %call22 = call i64 @strlen(i8* %20)
  %cmp23 = icmp eq i64 %conv21, %call22
  br i1 %cmp23, label %if.then25, label %if.end32

if.then25:                                        ; preds = %if.end20
  %21 = load i32, i32* %s, align 4
  %22 = load i8*, i8** %r.addr, align 8
  %23 = bitcast i8* %22 to i32*
  %24 = load i32, i32* %23, align 4
  %cmp26 = icmp sge i32 %21, %24
  br i1 %cmp26, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.then25
  %25 = load i32, i32* %i, align 4
  %add29 = add nsw i32 %25, 1
  %26 = load i8*, i8** %return_, align 8
  %27 = bitcast i8* %26 to i32*
  store i32 %add29, i32* %27, align 4
  %28 = load i8*, i8** %return_, align 8
  store i8* %28, i8** %retval, align 8
  br label %return

if.end30:                                         ; preds = %if.then25
  %29 = load i32, i32* %s, align 4
  %inc31 = add nsw i32 %29, 1
  store i32 %inc31, i32* %s, align 4
  store i8 0, i8* %t, align 1
  store i32 0, i32* %y, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.end30, %if.end20
  br label %for.inc

for.inc:                                          ; preds = %if.end32
  %30 = load i32, i32* %i, align 4
  %inc33 = add nsw i32 %30, 1
  store i32 %inc33, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %31 = load i8*, i8** %return_, align 8
  store i8* %31, i8** %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then28
  %32 = load i8*, i8** %retval, align 8
  ret i8* %32
}

; Function Attrs: noinline nounwind uwtable
define i8* @e_str(i8* %_, i8* %__) #0 {
entry:
  %__.addr = alloca i8*, align 8
  %_.addr = alloca i8*, align 8
  %r_ = alloca i8*, align 8
  store i8* %__, i8** %__.addr, align 8
  store i8* %_, i8** %_.addr, align 8
  %call = call noalias i8* @malloc(i64 1)
  store i8* %call, i8** %r_, align 8
  %0 = load i8*, i8** %__.addr, align 8
  %1 = load i8*, i8** %_.addr, align 8
  %call1 = call i32 @strcmp(i8* %1, i8* %0)
  %cmp = icmp eq i32 %call1, 0
  %cond = select i1 %cmp, i32 1, i32 0
  %tobool = icmp ne i32 %cond, 0
  %2 = load i8*, i8** %r_, align 8
  %frombool = zext i1 %tobool to i8
  store i8 %frombool, i8* %2, align 1
  %3 = load i8*, i8** %r_, align 8
  ret i8* %3
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @to_c(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 8
  %r = alloca i32*, align 8
  store i8* %s, i8** %s.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r, align 8
  %1 = load i8*, i8** %s.addr, align 8
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %3 = load i32*, i32** %r, align 8
  store i32 %conv, i32* %3, align 4
  %4 = load i32*, i32** %r, align 8
  %5 = bitcast i32* %4 to i8*
  ret i8* %5
}

; Function Attrs: noinline nounwind uwtable
define i8* @to_ch(i8* %_) #0 {
entry:
  %_.addr = alloca i8*, align 8
  %r = alloca i8*, align 8
  store i8* %_, i8** %_.addr, align 8
  %call = call noalias i8* @malloc(i64 2)
  store i8* %call, i8** %r, align 8
  %0 = load i8*, i8** %_.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %conv = trunc i32 %2 to i8
  %3 = load i8*, i8** %r, align 8
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0
  store i8 %conv, i8* %arrayidx, align 1
  %4 = load i8*, i8** %r, align 8
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i64 1
  store i8 48, i8* %arrayidx1, align 1
  %5 = load i8*, i8** %r, align 8
  ret i8* %5
}

; Function Attrs: noinline nounwind uwtable
define i8* @g_str(i8* %str) #0 {
entry:
  %str.addr = alloca i8*, align 8
  %___ = alloca i32*, align 8
  store i8* %str, i8** %str.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %___, align 8
  %1 = load i8*, i8** %str.addr, align 8
  %call1 = call i64 @strlen(i8* %1)
  %conv = trunc i64 %call1 to i32
  %2 = load i32*, i32** %___, align 8
  store i32 %conv, i32* %2, align 4
  %3 = load i32*, i32** %___, align 8
  %4 = bitcast i32* %3 to i8*
  ret i8* %4
}

; Function Attrs: noinline nounwind uwtable
define i8* @ad_str(i8* %s, i8* %y) #0 {
entry:
  %y.addr = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %s, i8** %s.addr, align 8
  %0 = load i8*, i8** %y.addr, align 8
  %1 = load i8*, i8** %s.addr, align 8
  %call = call i8* @strcat(i8* %1, i8* %0)
  %2 = load i8*, i8** %s.addr, align 8
  ret i8* %2
}

declare i8* @strcat(i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @p_str(i8* %s, i8* %y) #0 {
entry:
  %y.addr = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %s, i8** %s.addr, align 8
  %0 = load i8*, i8** %y.addr, align 8
  %1 = load i8*, i8** %s.addr, align 8
  %call = call i8* @strcpy(i8* %1, i8* %0)
  %2 = load i8*, i8** %s.addr, align 8
  ret i8* %2
}

declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @em_str(i8* %s, i8* %y) #0 {
entry:
  %y.addr = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  %_ = alloca i8*, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %s, i8** %s.addr, align 8
  %call = call noalias i8* @malloc(i64 1)
  store i8* %call, i8** %_, align 8
  %0 = load i8*, i8** %_, align 8
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0
  store i8 0, i8* %arrayidx, align 1
  %1 = load i8*, i8** %_, align 8
  %2 = load i8*, i8** %s.addr, align 8
  %call1 = call i8* @strcpy(i8* %2, i8* %1)
  %3 = load i8*, i8** %_, align 8
  call void @free(i8* %3)
  %4 = load i8*, i8** %s.addr, align 8
  ret i8* %4
}

declare void @free(i8*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @s_str(i8* %t, i8* %len) #0 {
entry:
  %len.addr = alloca i8*, align 8
  %t.addr = alloca i8*, align 8
  %buffer = alloca i8*, align 8
  store i8* %len, i8** %len.addr, align 8
  store i8* %t, i8** %t.addr, align 8
  %0 = load i8*, i8** %len.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 1, %conv
  %call = call noalias i8* @malloc(i64 %mul)
  store i8* %call, i8** %buffer, align 8
  %3 = load i8*, i8** %t.addr, align 8
  %4 = bitcast i8* %3 to i32*
  %5 = load i32, i32* %4, align 4
  %6 = load i8*, i8** %buffer, align 8
  %call1 = call i32 (i8*, i8*, ...) @sprintf(i8* %6, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @"\01??_C@_02DPKJAMEF@?$CFd?$AA@", i32 0, i32 0), i32 %5)
  %7 = load i8*, i8** %buffer, align 8
  ret i8* %7
}

; Function Attrs: noinline nounwind uwtable
define i8* @t_str(i8* %s, i8* %y, i8* %_r) #0 {
entry:
  %_r.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  %buf__ = alloca i8*, align 8
  %i = alloca i32, align 4
  %r_ = alloca i8**, align 8
  store i8* %_r, i8** %_r.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %s, i8** %s.addr, align 8
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* %i, align 4
  %conv = sext i32 %0 to i64
  %call = call noalias i8* @malloc(i64 %conv)
  %1 = bitcast i8* %call to i8**
  store i8** %1, i8*** %r_, align 8
  %2 = load i8*, i8** %y.addr, align 8
  %3 = load i8*, i8** %s.addr, align 8
  %call1 = call i8* @strtok(i8* %3, i8* %2)
  store i8* %call1, i8** %buf__, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i8*, i8** %buf__, align 8
  %cmp = icmp ne i8* %4, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4
  %conv3 = sext i32 %5 to i64
  %mul = mul i64 8, %conv3
  %6 = load i8**, i8*** %r_, align 8
  %7 = bitcast i8** %6 to i8*
  %call4 = call noalias i8* @realloc(i8* %7, i64 %mul)
  %8 = bitcast i8* %call4 to i8**
  store i8** %8, i8*** %r_, align 8
  %9 = load i8*, i8** %buf__, align 8
  %call5 = call i64 @strlen(i8* %9)
  %sub = sub i64 %call5, 1
  %call6 = call noalias i8* @malloc(i64 %sub)
  %10 = load i8**, i8*** %r_, align 8
  %11 = load i32, i32* %i, align 4
  %sub7 = sub nsw i32 %11, 1
  %idxprom = sext i32 %sub7 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %10, i64 %idxprom
  store i8* %call6, i8** %arrayidx, align 8
  %12 = load i8*, i8** %buf__, align 8
  %call8 = call i64 @strlen(i8* %12)
  %add = add i64 %call8, 1
  %13 = load i8*, i8** %buf__, align 8
  %14 = load i8**, i8*** %r_, align 8
  %15 = load i32, i32* %i, align 4
  %sub9 = sub nsw i32 %15, 1
  %idxprom10 = sext i32 %sub9 to i64
  %arrayidx11 = getelementptr inbounds i8*, i8** %14, i64 %idxprom10
  %16 = load i8*, i8** %arrayidx11, align 8
  %call12 = call i8* @strncpy(i8* %16, i8* %13, i64 %add)
  %17 = load i8*, i8** %y.addr, align 8
  %call13 = call i8* @strtok(i8* null, i8* %17)
  store i8* %call13, i8** %buf__, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %19 = load i32, i32* %i, align 4
  %sub14 = sub nsw i32 %19, 1
  %20 = load i8*, i8** %_r.addr, align 8
  %21 = bitcast i8* %20 to i32*
  store i32 %sub14, i32* %21, align 4
  %22 = load i8**, i8*** %r_, align 8
  %23 = bitcast i8** %22 to i8*
  ret i8* %23
}

declare i8* @strtok(i8*, i8*) #1

declare i8* @strncpy(i8*, i8*, i64) #1

; Function Attrs: noinline nounwind uwtable
define i8* @c_str(i8* %y, i8* %t, i8* %a) #0 {
entry:
  %a.addr = alloca i8*, align 8
  %t.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %str = alloca i8*, align 8
  %s = alloca i32, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %t, i8** %t.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 0, i32* %i, align 4
  %0 = load i8*, i8** %a.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 1, %conv
  %add = add i64 %mul, 1
  %call = call noalias i8* @malloc(i64 %add)
  store i8* %call, i8** %str, align 8
  %3 = load i8*, i8** %t.addr, align 8
  %4 = bitcast i8* %3 to i32*
  %5 = load i32, i32* %4, align 4
  store i32 %5, i32* %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %s, align 4
  %7 = load i8*, i8** %t.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 4
  %10 = load i8*, i8** %a.addr, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32, i32* %11, align 4
  %add1 = add nsw i32 %9, %12
  %sub = sub nsw i32 %add1, 1
  %cmp = icmp sle i32 %6, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** %y.addr, align 8
  %14 = load i32, i32* %s, align 4
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds i8, i8* %13, i64 %idxprom
  %15 = load i8, i8* %arrayidx, align 1
  %16 = load i8*, i8** %str, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %17 to i64
  %arrayidx4 = getelementptr inbounds i8, i8* %16, i64 %idxprom3
  store i8 %15, i8* %arrayidx4, align 1
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %s, align 4
  %inc5 = add nsw i32 %19, 1
  store i32 %inc5, i32* %s, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load i8*, i8** %str, align 8
  %21 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %21 to i64
  %arrayidx7 = getelementptr inbounds i8, i8* %20, i64 %idxprom6
  store i8 0, i8* %arrayidx7, align 1
  %22 = load i8*, i8** %str, align 8
  ret i8* %22
}

; Function Attrs: noinline nounwind uwtable
define i8* @ch_str(i8* %s, i8* %i) #0 {
entry:
  %i.addr = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  %s_ = alloca i8*, align 8
  store i8* %i, i8** %i.addr, align 8
  store i8* %s, i8** %s.addr, align 8
  %call = call noalias i8* @malloc(i64 2)
  store i8* %call, i8** %s_, align 8
  %0 = load i8*, i8** %i.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %conv = trunc i32 %2 to i8
  %3 = load i8*, i8** %s_, align 8
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0
  store i8 %conv, i8* %arrayidx, align 1
  %4 = load i8*, i8** %s_, align 8
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i64 1
  store i8 0, i8* %arrayidx1, align 1
  %5 = load i8*, i8** %s.addr, align 8
  %call2 = call i64 @strlen(i8* %5)
  %add = add i64 %call2, 2
  %6 = load i8*, i8** %s_, align 8
  %7 = load i8*, i8** %s.addr, align 8
  %call3 = call i8* @strncat(i8* %7, i8* %6, i64 %add)
  %8 = load i8*, i8** %s_, align 8
  call void @free(i8* %8)
  %9 = load i8*, i8** %s.addr, align 8
  ret i8* %9
}

declare i8* @strncat(i8*, i8*, i64) #1

; Function Attrs: noinline nounwind uwtable
define i8* @n_str(i8* %t, i8* %b_) #0 {
entry:
  %b_.addr = alloca i8*, align 8
  %t.addr = alloca i8*, align 8
  %s = alloca i8*, align 8
  store i8* %b_, i8** %b_.addr, align 8
  store i8* %t, i8** %t.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  store i8* %call, i8** %s, align 8
  %0 = load i8*, i8** %b_.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %3 = load i8*, i8** %t.addr, align 8
  %call1 = call i32 @strtol(i8* %3, i8** null, i32 %2)
  %4 = load i8*, i8** %s, align 8
  %5 = bitcast i8* %4 to i32*
  store i32 %call1, i32* %5, align 4
  %6 = load i8*, i8** %s, align 8
  %cmp = icmp eq i8* %6, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %s, align 8
  %8 = bitcast i8* %7 to i32*
  store i32 0, i32* %8, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %9 = load i8*, i8** %s, align 8
  ret i8* %9
}

declare i32 @strtol(i8*, i8**, i32) #1

; Function Attrs: noinline nounwind uwtable
define i8* @pause() #0 {
entry:
  %r = alloca i32*, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r, align 8
  %1 = load i32*, i32** %r, align 8
  store i32 0, i32* %1, align 4
  %call1 = call i32 @system(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @"\01??_C@_05PDJBBECF@pause?$AA@", i32 0, i32 0))
  %2 = load i32*, i32** %r, align 8
  %3 = bitcast i32* %2 to i8*
  ret i8* %3
}

declare i32 @system(i8*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @exit_() #0 {
entry:
  %retval = alloca i8*, align 8
  %r = alloca i32*, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %r, align 8
  %1 = load i32*, i32** %r, align 8
  store i32 0, i32* %1, align 4
  call void @exit(i32 1) #8
  unreachable

return:                                           ; No predecessors!
  %2 = load i8*, i8** %retval, align 8
  ret i8* %2
}

; Function Attrs: noreturn
declare void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define i8* @read(i8* %name) #0 {
entry:
  %retval = alloca i8*, align 8
  %name.addr = alloca i8*, align 8
  %f_ = alloca %struct._iobuf*, align 8
  %r = alloca i8*, align 8
  %s = alloca i32, align 4
  %str = alloca i8*, align 8
  store i8* %name, i8** %name.addr, align 8
  %0 = load i8*, i8** %name.addr, align 8
  %call = call %struct._iobuf* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @"\01??_C@_02JDPG@rb?$AA@", i32 0, i32 0))
  store %struct._iobuf* %call, %struct._iobuf** %f_, align 8
  %1 = load %struct._iobuf*, %struct._iobuf** %f_, align 8
  %cmp = icmp eq %struct._iobuf* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 4)
  store i8* %call1, i8** %r, align 8
  %2 = load i8*, i8** %r, align 8
  %3 = bitcast i8* %2 to i32*
  store i32 0, i32* %3, align 4
  %4 = load i8*, i8** %r, align 8
  store i8* %4, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load %struct._iobuf*, %struct._iobuf** %f_, align 8
  %call2 = call i32 @fseek(%struct._iobuf* %5, i32 0, i32 2)
  %6 = load %struct._iobuf*, %struct._iobuf** %f_, align 8
  %call3 = call i32 @ftell(%struct._iobuf* %6)
  store i32 %call3, i32* %s, align 4
  %7 = load %struct._iobuf*, %struct._iobuf** %f_, align 8
  %call4 = call i32 @fseek(%struct._iobuf* %7, i32 0, i32 0)
  %8 = load i32, i32* %s, align 4
  %add = add nsw i32 %8, 1
  %conv = sext i32 %add to i64
  %call5 = call noalias i8* @malloc(i64 %conv)
  store i8* %call5, i8** %str, align 8
  %9 = load %struct._iobuf*, %struct._iobuf** %f_, align 8
  %10 = load i32, i32* %s, align 4
  %conv6 = sext i32 %10 to i64
  %11 = load i8*, i8** %str, align 8
  %call7 = call i64 @fread(i8* %11, i64 %conv6, i64 1, %struct._iobuf* %9)
  %12 = load %struct._iobuf*, %struct._iobuf** %f_, align 8
  %call8 = call i32 @fclose(%struct._iobuf* %12)
  %13 = load i8*, i8** %str, align 8
  %14 = load i32, i32* %s, align 4
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds i8, i8* %13, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  %15 = load i8*, i8** %str, align 8
  store i8* %15, i8** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %16 = load i8*, i8** %retval, align 8
  ret i8* %16
}

declare %struct._iobuf* @fopen(i8*, i8*) #1

declare i32 @fseek(%struct._iobuf*, i32, i32) #1

declare i32 @ftell(%struct._iobuf*) #1

declare i64 @fread(i8*, i64, i64, %struct._iobuf*) #1

declare i32 @fclose(%struct._iobuf*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @write(i8* %file, i8* %c__) #0 {
entry:
  %retval = alloca i8*, align 8
  %c__.addr = alloca i8*, align 8
  %file.addr = alloca i8*, align 8
  %f_ = alloca %struct._iobuf*, align 8
  %r = alloca i8*, align 8
  %r2 = alloca i8*, align 8
  store i8* %c__, i8** %c__.addr, align 8
  store i8* %file, i8** %file.addr, align 8
  %0 = load i8*, i8** %file.addr, align 8
  %call = call %struct._iobuf* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @"\01??_C@_01NOFIACDB@w?$AA@", i32 0, i32 0))
  store %struct._iobuf* %call, %struct._iobuf** %f_, align 8
  %call1 = call noalias i8* @malloc(i64 4)
  store i8* %call1, i8** %r, align 8
  %1 = load i8*, i8** %r, align 8
  %2 = bitcast i8* %1 to i32*
  store i32 1, i32* %2, align 4
  %3 = load %struct._iobuf*, %struct._iobuf** %f_, align 8
  %cmp = icmp eq %struct._iobuf* %3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call3 = call noalias i8* @malloc(i64 4)
  store i8* %call3, i8** %r2, align 8
  %4 = load i8*, i8** %r2, align 8
  %5 = bitcast i8* %4 to i32*
  store i32 0, i32* %5, align 4
  %6 = load i8*, i8** %r2, align 8
  store i8* %6, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %7 = load %struct._iobuf*, %struct._iobuf** %f_, align 8
  %8 = load i8*, i8** %c__.addr, align 8
  %call4 = call i32 @fputs(i8* %8, %struct._iobuf* %7)
  %9 = load %struct._iobuf*, %struct._iobuf** %f_, align 8
  %call5 = call i32 @fclose(%struct._iobuf* %9)
  %10 = load i8*, i8** %r, align 8
  store i8* %10, i8** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = load i8*, i8** %retval, align 8
  ret i8* %11
}

declare i32 @fputs(i8*, %struct._iobuf*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @sys_dr__alloca(i8* %len) #0 {
entry:
  %len.addr = alloca i8*, align 8
  %b_ = alloca i8*, align 8
  store i8* %len, i8** %len.addr, align 8
  %0 = load i8*, i8** %len.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %conv = sext i32 %2 to i64
  %call = call i8* @VirtualAlloc(i8* null, i64 %conv, i32 12288, i32 4)
  store i8* %call, i8** %b_, align 8
  %3 = load i8*, i8** %b_, align 8
  ret i8* %3
}

declare dllimport i8* @VirtualAlloc(i8*, i64, i32, i32) #1

; Function Attrs: noinline nounwind uwtable
define i8* @sys_dr__free(i8* %i, i8* %len) #0 {
entry:
  %len.addr = alloca i8*, align 8
  %i.addr = alloca i8*, align 8
  store i8* %len, i8** %len.addr, align 8
  store i8* %i, i8** %i.addr, align 8
  %0 = load i8*, i8** %i.addr, align 8
  %call = call i32 @VirtualFree(i8* %0, i64 0, i32 32768)
  %1 = load i8*, i8** %i.addr, align 8
  ret i8* %1
}

declare dllimport i32 @VirtualFree(i8*, i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define i8* @sys_p(i8* %c, i8* %t, i8* %len) #0 {
entry:
  %len.addr = alloca i8*, align 8
  %t.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %len, i8** %len.addr, align 8
  store i8* %t, i8** %t.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %0 = load i8*, i8** %c.addr, align 8
  %1 = load i8*, i8** %t.addr, align 8
  %2 = load i8*, i8** %len.addr, align 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32, i32* %3, align 4
  %div = sdiv i32 %4, 1024
  %conv = sext i32 %div to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 %conv, i32 1, i1 false)
  %5 = load i8*, i8** %c.addr, align 8
  ret i8* %5
}

; Function Attrs: noinline nounwind uwtable
define i8* @sys_acess(i8* %t) #0 {
entry:
  %t.addr = alloca i8*, align 8
  %t_ = alloca i8*, align 8
  store i8* %t, i8** %t.addr, align 8
  %0 = load i8*, i8** %t.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  %conv = sext i32 %2 to i64
  %3 = inttoptr i64 %conv to i8*
  store i8* %3, i8** %t_, align 8
  %4 = load i8*, i8** %t_, align 8
  ret i8* %4
}

; Function Attrs: noinline nounwind uwtable
define i8* @sys_t(i8* %_) #0 {
entry:
  %_.addr = alloca i8*, align 8
  %a = alloca i32*, align 8
  store i8* %_, i8** %_.addr, align 8
  %call = call noalias i8* @malloc(i64 4)
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %a, align 8
  %1 = load i8*, i8** %_.addr, align 8
  %2 = ptrtoint i8* %1 to i64
  %conv = trunc i64 %2 to i32
  %3 = load i32*, i32** %a, align 8
  store i32 %conv, i32* %3, align 4
  %4 = load i32*, i32** %a, align 8
  %5 = bitcast i32* %4 to i8*
  ret i8* %5
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #6

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
declare void @llvm.va_end(i8*) #6

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