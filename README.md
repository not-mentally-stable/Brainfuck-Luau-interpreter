executes Brainfuck..
i don't know what you were expecting..

made fully with Luau that creates a realistic Brainfuck interpreter
with a pointer and cells

# whats brainfuck?
you can learn brainfuck here:
(i ofc didn't make these. credits to the owners that made these info & vid show some love)

video: [Brainfuck explained in 100s by @Fireship](https://youtu.be/hdHjjBS4cs8?si=-nGJwx1L0rHYwUYe)

Wiki: https://en.wikipedia.org/wiki/Brainfuck

other info: https://esolangs.org/wiki/Brainfuck

# Documentation:

## Functions

```Luau
BrainfuckInterpreter.new(code: string) -> BrainfuckInterpreter
```
Creates a new interpreter instance.

Parameters:
- `code`: Brainfuck source code. Only the characters `><+-.,[]` are used; all others are ignored.

Returns:
- A new `BrainfuckInterpreter` object.


```Luau
BrainfuckInterpreter:run(input: string?) -> string
```
Runs the loaded Brainfuck program.

Parameters:
- `input` (optional): A string used for the `,` command. Each `,` reads one character from this string.

Returns:
- A string produced by the program (from the `.` commands).


```Luau
BrainfuckInterpreter:buildBracketMap(code: string) -> table
```
Internal helper that creates a mapping between matching `[` and `]` 
positions.  
Usually called automatically by `new()`.

Parameters:
- `code`: Sanitized Brainfuck code.

Returns:
- A table mapping bracket indices.
---

the module automatically ignores all non brainfuck syntax characters 
```brainfuck
><+-.,[]
```
and treat them as comments like the real brainfuck so even like
```Luau
local BrainfuckInterpreter = require(path.to.BrainfuckInterpreter)

local code = [[
++++++dih++++[>+>erm+++>++++++AMONGUS+>++++++++++<<<<-]>>>>+++++++++.++++++++++++.<<++.>>----uwu-----------------.---.+++WOW+++++++++++++++++++.------bean----------.<<.>>+++++++++fuck+++++++.------------------.+++++++++.++++++.<<.>>---------.------RAWR----.+.+++++++++++++..--.
]]

local interpreter = BrainfuckInterpreter.new(code)
local output = interpreter:run()
print(output) -- Output: my dawg went kaboom
```
would still work
>[!WARNING]
> putting brainfuck syntax in comment will make the interpreter try to run like the normal bf compiler, so avoid brainfuck syntax in comments
> ``>+++ moves to cell[3]`` wont work and simply cause it to loop nothing because of the bracket so instead do ``>+++ moves to cell3``


# script example
math (so tuff)
```Luau
local BrainfuckInterpreter = require(path.to.BrainfuckInterpreter)

local code = [[
++                 set cell0 = 2
>+++               set cell1 = 3
[->+<]             move total to cell1
>++++++++++++++++++++++++++++++++++++++++++++++++ print as '5'
.
]]

local interpreter = BrainfuckInterpreter.new(code)
local output = interpreter:run()
print(output)
```
that's it you can figure out the rest 
happy Brainfuck coding

# Misc...
[![License: ](https://img.shields.io/badge/License%3A-MIT-green?style=plastic)](https://github.com/not-mentally-stable/xxpcall/blob/main/LICENSE)

[![Scripting Language: LUAU](https://img.shields.io/badge/Scripting%20Language%3A-LUAU-blue?style=plastic)](https://github.com/luau-lang/luau)
