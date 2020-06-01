def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_lg(op)
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

    if valid_number?(num1)
      break
    else
      prompt("That doesn't look like a valid number.")
    end
  end

  num2 = ''
  loop do
    prompt("What is your second number?")
    num2 = Kernel.gets().chomp()

    if valid_number?(num2)
      break
    else
      prompt("That doesn't look like a valid number.")
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

  prompt("#{operation_to_lg(operation)} your numbers...")
  prompt("Your result is #{result}!")

  prompt("Do you want to perform another operation? (Y to calculate again)")
  again = Kernel.gets().chomp()
  break unless again.downcase().start_with?('y')
end

prompt("Thanks for calculating, #{name}!")
