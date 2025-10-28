local BrainfuckInterpreter = {}
BrainfuckInterpreter.__index = BrainfuckInterpreter

local function sanitizeCode(code)
	local valid = {}
	for i = 1, #code do
		local c = code:sub(i, i)
		if string.find("><+-.,[]", c, 1, true) then
			table.insert(valid, c)
		end
	end
	return table.concat(valid)
end

function BrainfuckInterpreter.new(code)
	local cleanCode = sanitizeCode(code)
	local self = setmetatable({}, BrainfuckInterpreter)
	self.code = cleanCode
	self.tape = table.create(30000, 0)
	self.pointer = 1
	self.pc = 1
	self.brackets = self:buildBracketMap(cleanCode)
	return self
end

function BrainfuckInterpreter:buildBracketMap(code)
	local stack = {}
	local map = {}

	for i = 1, #code do
		local c = code:sub(i, i)
		if c == "[" then
			table.insert(stack, i)
		elseif c == "]" then
			local start = table.remove(stack)
			if not start then error("Unmatched ']' at position " .. i) end
			map[start] = i
			map[i] = start
		end
	end

	if #stack > 0 then
		error("Unmatched '[' at position " .. stack[#stack])
	end

	return map
end

function BrainfuckInterpreter:run(input)
	local inputIndex = 1
	local output = ""

	while self.pc <= #self.code do
		local cmd = self.code:sub(self.pc, self.pc)

		if cmd == ">" then
			self.pointer += 1
			if self.pointer > #self.tape then
				table.insert(self.tape, 0)
			end

		elseif cmd == "<" then
			self.pointer = math.max(1, self.pointer - 1)

		elseif cmd == "+" then
			self.tape[self.pointer] = (self.tape[self.pointer] + 1) % 256

		elseif cmd == "-" then
			self.tape[self.pointer] = (self.tape[self.pointer] - 1) % 256

		elseif cmd == "." then
			output ..= string.char(self.tape[self.pointer])

		elseif cmd == "," then
			if input and inputIndex <= #input then
				self.tape[self.pointer] = string.byte(input:sub(inputIndex, inputIndex))
				inputIndex += 1
			else
				self.tape[self.pointer] = 0
			end

		elseif cmd == "[" then
			if self.tape[self.pointer] == 0 then
				self.pc = self.brackets[self.pc]
			end

		elseif cmd == "]" then
			if self.tape[self.pointer] ~= 0 then
				self.pc = self.brackets[self.pc]
			end
		end

		self.pc += 1
	end

	return output
end

return BrainfuckInterpreter
