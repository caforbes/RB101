Kernel.puts("Welcome to the Calculator!")

Kernel.puts("What is your first number?")
num_1 = Kernel.gets().chomp()
Kernel.puts("What is your second number?")
num_2 = Kernel.gets().chomp()
# validation?
Kernel.puts("I see, you chose #{num_1} and #{num_2}!")

Kernel.puts("What operation would you like to perform on these numbers?
  1) add 2) subtract 3) multiply 4) divide")

operation = Kernel.gets().chomp()
# validation?

if operation == '1'
  result = num_1.to_i() + num_2.to_i()
elsif operation == '2'
  result = num_1.to_i() - num_2.to_i()
elsif operation == '3'
  result = num_1.to_i() * num_2.to_i()
else
  result = num_1.to_f() / num_2.to_f()
end

Kernel.puts("Your result is #{result}!")