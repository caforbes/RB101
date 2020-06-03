require 'yaml'
MESSAGES = YAML.safe_load(File.read("calculator.yml"))

def prompt(message, *variables)
  if variables
    variables = variables.to_a
    message_list = MESSAGES[message].split("*")
    message = message_list.zip(variables).flatten.join
  end

  Kernel.puts("=> #{message}")
end

def valid_integer?(input)
  /^-?\d+$/.match(input)
end

def valid_float?(input)
  /\d/.match(input) && /^-?\d*\.\d*$/.match(input)
end

def number?(input)
  valid_integer?(input) || valid_float?(input)
end

def operator_word(op)
  word = case op
         when '1'
           MESSAGES[:add]
         when '2'
           MESSAGES[:sub]
         when '3'
           MESSAGES[:mul]
         when '4'
           MESSAGES[:div]
         end
  word
end

prompt(:hello)
prompt(:"name-get")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(:"name-error")
  else
    break
  end
end

loop do # main loop
  num1 = ''
  loop do
    prompt(:num1)
    num1 = Kernel.gets().chomp()

    if number?(num1)
      break num1 = valid_integer?(num1) ? Integer(num1) : Float(num1)
    else
      prompt(:"num-error")
    end
  end

  num2 = ''
  loop do
    prompt(:num2)
    num2 = Kernel.gets().chomp()

    if number?(num2)
      break num2 = valid_integer?(num2) ? Integer(num2) : Float(num2)
    else
      prompt(:"num-error")
    end
  end

  prompt(:"num-confirm", num1, num2)

  prompt(:"choose-op")

  operation = ""
  loop do
    operation = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(operation)
    prompt(:"choose-error")
  end

  result = case operation
           when '1'
             num1 + num2
           when '2'
             num1 - num2
           when '3'
             num1 * num2
           when '4'
             num1.to_f() / num2.to_f()
           end

  prompt(:calculate, operator_word(operation))
  prompt(:result, result)

  prompt(:"try-again?")
  again = Kernel.gets().chomp()
  break unless again.downcase().start_with?('y')
end

prompt(:goodbye, name)
