# Magenta-Languange

Magenta é uma linguagem fracamente e estaticamente tipada que compila para LLVM Assembly Language ela ultiliza CLANG C e tem suporte a funções de C.

Examples:
Hello World:
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

In magenta:
```
function main()
#x = (3)
#limit = (36)
if ((x) < (limit))
func print_n((x))
#x = ((x+3)*(x-2))
while
```
