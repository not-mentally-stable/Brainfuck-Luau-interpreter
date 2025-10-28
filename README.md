executes Brainfuck..
i don't know what you were expecting..

made fully with LuaU that creates a realistic Brainfuck interpreter
with a pointer and cells

# whats brainfuck?
you can learn brainfuck here:
(i ofc didn't make these. credits to the owners that made these info & vid show some love)

video: [Brainfuck explained in 100s by @Fireship](https://youtu.be/hdHjjBS4cs8?si=-nGJwx1L0rHYwUYe)
Wiki: https://en.wikipedia.org/wiki/Brainfuck
other info:
https://esolangs.org/wiki/Brainfuck

# how to use?
example Brainfuck
```brainfuck
++++++++++[>+>+++>+++++++>++++++++++<<<<-]>>>>+++++++++.++++++++++++.<<++.>>---------------------.---.++++++++++++++++++++++.----------------.<<.>>++++++++++++++++.------------------.+++++++++.++++++.<<.>>---------.----------.+.+++++++++++++..--.
```
how to execute is simple
```Luau
local BrainfuckInterpreter = require(path.to.BrainfuckInterpreter)

local code = [[
++++++++++[>+>+++>+++++++>++++++++++<<<<-]>>>>+++++++++.++++++++++++.<<++.>>---------------------.---.++++++++++++++++++++++.----------------.<<.>>++++++++++++++++.------------------.+++++++++.++++++.<<.>>---------.----------.+.+++++++++++++..--.
]]

local interpreter = BrainfuckInterpreter.new(code)
local output = interpreter:run()

print("Output:", output)
```
output: ``my dawg went kaboom``
