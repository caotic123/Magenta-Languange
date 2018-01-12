# Magenta-Languange

```
function main() func print("Hello World")
```
Magenta is a untyped compiled language that compiles for LLVM ASSEMBLY to JIT CLANG.
Magenta has a simple syntax and a basic imperative structures, however can supports redefition complex syntactics.

# SYNTAX

The syntax of magenta is very simple every values is defined through of "()" (except strings) and most of reserverd words are inspired in imperatives languages c-like and a bit of lisp family of functional languanges.

```
function do()
#x = (3)
#limit = (36)
if ((x) < (limit))
func print_n((x))
#x = ((x+3)*(x-2))
while
```

# TYPES

Magenta don't have complete system of types but the compiler doesn't check all possibilities of errors this means that you don't need declare types of variables.

Consider this code:

```
#int = (23)
#string = "ola"
```
Other detail is that all variable are references, so if you defines:

```
#var = (func())
```

The variable var recevied the value of andress of function returned of func this else means that the compiler don't know what type of this variable then Magenta consider this var as unknow type. Operations as unknow type are treated as number(double). To fix this just cast the variable.

# Pointers

if in Magenta everything is referenced then it is possible to allocate memory and do not give anything special treatment for this variable.

```
#string = (new_str(23))
//return char with 23 spaces of memory allocated
#string = "ola"
#x = (number())
#x = (232) #x = (0.2322)
```
```new_str()``` and ```number()``` ```mag_alloc()``` can be used to a space of memory that isn't temporary and local

# COMPILING

Just add the file .mag in folder mag_files with the code and run compiler.

# METAPROGRAMMING

Like C language Magenta supports textual macros, however magenta macros are hygienic and can descrive the new syntax.

```
#var = (func()+2)
//this is not possible
```
But with macro is possibilities magenta compiles run this expression.
First should defines a new macro syntax```#define macro-syntax (anything)``` and the syntax.
I will consider ```[(value)]``` to recevied function so... ```[(function())]```

```
#define macro-syntax [(var y)]

#end macro
```

This macro captures (var y) captures as function (but can be a variable or anything in "()")
Now, just add code generation.

```
#define macro-syntax [(var y)]
#vars {($x)}
#top {#($x) = ($y)}
#return {($x)}
#end macro
```
Variables defined in (vars {}) are hygienic and (top, down, return) generates codes in relative position of macro syntax found.
Magenta macros works like a grammatic free of context then we can translate this

```#define macro-syntax [(#var y)] 
where [([(x)])] in magenta is [([(#var y)])]
[ = [
([(x)]) = (var y)
] = ]
[ = [
(x) = (var y)
] = ]
```

```
A -> [BCD
B -> (free
C -> ) | A)
D -> ]
free -> anything
 
[BCD (<- A)
[(freeCD (<- B)
[(CD (<- free)
[(A)D (<- C)
[([BCD)D (<- B)
[([(xCD)D (<- C)
[([(x)D)D (<- D)
[([(x)])D (<- D)
[([(x)])]
```

Hello World In Magenta Language:

In lua:
```lua
x = 3
while(x <= 36) do
print(x)
x = (x+3)*(x-2)
end
```
Output:
```
3
6
36
```

The same code In Magenta:
```
function main()
#x = (3)
#limit = (36)
if ((x) < (limit))
func print_n((x))
#x = ((x+3)*(x-2))
while
```
Output:
```
3
6
36
```

Simple examples:
https://github.com/caotic123/Magenta-Languange/tree/master/mag_files

# Building 
You don't need any lib for compilation, but magenta requires CLANG for run.
Clang(uses Pre-Built Binaries) is available in:

In linux just extract magenta source and in terminal:
```
sudo apt install clang
g++ -o Magenta -std=c++11 compiler.cpp macro.cpp magenta_.cpp magenta_headers.cpp magenta_lex.cpp main.cpp module.cpp
```

In windows install binares in (http://releases.llvm.org/download.html) and add path variable environment in O.S and compile magenta in mingw or clang.
