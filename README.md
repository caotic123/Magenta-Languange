# Magenta-Languange

Magenta é uma linguagem fracamente e estaticamente tipada que compila para LLVM Assembly Language ela ultiliza CLANG C e tem suporte a funções de C.

Hello World In Magenta Language:
```
function main() func print("Hello World")
```

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

# Magenta estrutura

O primeiro metodo a ser chamado em magenta é a função main onde o codigo principal será carregado primeiramente.
Logo...:
```
function main()
(...)code(...)
```
Todos os valores de magenta são referenciados e não existe valores constantes, por isso deve se tomar cuidado com possiveis redeclarações de variabeis fora do espoco de funções.
Exemplo:
```
function main()
if (...) 
print("crazy iteration")
while
```
Para corrigar o problema basta alocar a variavel antes:
```
function main()
#x = "ok it's right"
if (...) 
print((x))
while
```
Tipos:
```
#bool = (true) 
#integer = (123)
#str = "string"
```
Valores booleanos(true and false) e numeros devem ser colocados entre paretenses sempre.

Isto é:
```
Correct : #x = (12) print_n((x))
Wrong: #x = 12 print_n(x)
```
A condicional funciona como na maioria das linguagens:
```
if (...)
(...then...)
end
```
Ou no caso do loop:
```
if (...loop_condition...)
(...do..)
while
```

# Building 
You don't need any lib for compilation, but magenta requires CLANG for run.
Clang(uses Pre-Built Binaries) is available in:
(http://releases.llvm.org/download.html)
If the OS is windows add path variable environment in O.S.
