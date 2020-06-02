def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_integer?(input)
  # original
  # input == input.to_i().to_s()

  # new version
  /^\d+/.match(input)
end

def valid_float?(input)
  /\d/.match(input) && /\d*\.?\d*/.match(input)
end

def number?(input)
  # original version (it works!!!)
  # if /^-?[\d\.]+$/.match(input)  # only digits and .
  #   print period_units = input.split(".",3)
  #   if period_units.size == 1
  #     true # integer
  #   elsif period_units.size == 2
  #     true # float
  #   else
  #     false
  #   end
  # else
  #   false
  # end

  # new version
  valid_integer?(input) || valid_float?(input)
end
# still needs to be able to add/sub/mult with floats

def operator_gerund(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to the Calculator!")
prompt("Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to enter your name.")
  else
    break
  end
end

loop do # main loop
  num1 = ''
  loop do
    prompt("What is your first number?")
    num1 = Kernel.gets().chomp()

    if number?(num1)
      break
    else
      prompt("That doesn't look like a valid number.")
      prompt("Only integers are allowed.")
    end
  end

  num2 = ''
  loop do
    prompt("What is your second number?")
    num2 = Kernel.gets().chomp()

    if number?(num2)
      break
    else
      prompt("That doesn't look like a valid number.")
      prompt("Only integers are allowed.")
    end
  end

  prompt("I see, you chose #{num1} and #{num2}!")

  op_prompt = <<-MSG
    What operation would you like to perform on these numbers?
        1) add
        2) subtract
        3) multiply
        4) divide
  MSG
  prompt(op_prompt)
  
  operation = ""
  loop do
    operation = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(operation)
    prompt("You must choose 1, 2, 3, or 4.")
  end

  result =  case operation
            when '1'
              num1.to_i() + num2.to_i()
            when '2'
              num1.to_i() - num2.to_i()
            when '3'
              num1.to_i() * num2.to_i()
            when '4'
              num1.to_f() / num2.to_f()
            end

  prompt("#{operator_gerund(operation)} your numbers...")
  prompt("Your result is #{result}!")

  prompt("Do you want to perform another operation? (Y to calculate again)")
  again = Kernel.gets().chomp()
  break unless again.downcase().start_with?('y')
end

prompt("Thanks for calculating, #{name}!")