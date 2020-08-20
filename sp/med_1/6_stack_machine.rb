def minilang(program)
  stack = []
  register = 0

  commands = program.upcase.split
  commands.map! { |item| item.to_i.to_s == item ? item.to_i : item }

  commands.each do |command|
    if command.class == Integer then register = command
    elsif stack.size > 0
      case command
      when 'PUSH' then stack.push(register)
      when 'POP' then register = stack.pop
      when 'ADD' then register += stack.pop
      when 'SUB' then register -= stack.pop
      when 'MULT' then register *= stack.pop
      when 'DIV' then register /= stack.pop
      when 'MOD' then register %= stack.pop
      when 'PRINT' then puts register
      else return p "Error: The command #{command} cannot be performed."
      end
    else
      case command
      when 'PUSH' then stack.push(register)
      when 'PRINT' then puts register
      else return p "Error: The command #{command} cannot be performed."
      end
    end
  end
  nil
end

=begin
PROBLEM:
  INPUT: string
  OUTPUT: nil, but prints strings/ints
  RULES? (explicit/implicit)
    - lg internal operations are on strings or integers
    - stack + register system, stack is array with pop/push
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):

DATA STRUCTURES:
  input, output, rules, constants?

ALGORITHM (review the hardest example out loud):
  initialize empty stack
  initialize register to 0
  split/parse list of commands to array
    upcase and split by spaces
    convert valid integers from string to integer
  iterate over commands
    look up each command
    perform stack modification or integer operation
    store result of command in register

CODE!
=end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

minilang('MULT PRINT')
# error: no item in stack
