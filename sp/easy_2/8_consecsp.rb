puts("Please enter an integer greater than zero.")

user_num = ''
loop do
  user_num = gets.chomp.to_i

  break if user_num > 0
  puts("Your integer must be greater than zero. Try again.")
end

puts("Enter 's' to compute the sum, and 'p' to compute the product.")

choice = ''
loop do
  choice = gets.chomp

  break if %w(s p).include?(choice)
  puts("That isn't a valid choice. Try again.")
end

case choice
when 's'
  operation = :+
  noun = 'sum'
when 'p'
  operation = :*
  noun = 'product'
end

result = (1..user_num).reduce(&operation)

puts("The #{noun} of the integers between 1 and #{user_num} is #{result}.")

# PROBLEM:
  # get an integer > 0 from user
    # validation required: greater than zero
  # ask if user wants sum or product
    # validation required: ['s','p'].include?
  # compute sum or product of all integers between 1 and user number
  # display result to user
  # INPUTS -->
    # string -> integer > 0
    # string -> 's' or 'p'
  # OUTPUTS -->
    # integer (print as string)

# EXAMPLES / TEST CASES:
  # 5,s --> 15
  # 6,p --> 720
  # 1,s --> 1
  # 1,p --> 1

# DATA STRUCTURES:
  # INPUT -->
    # String -> Integer
    # String: 's' or 'p'
  # OUTPUT -->
    # Integer (print)

# ALGORITHM / INSTRUCTIONS:
  # prompt user for an integer
  # save integer to a value
    # check that integer is > 0
    # else, loop + prompt user for new value
  # prompt user for an operation, sum or product
  # save choice to value
    # if choice is s, convert choice to :+ operation
    # if choice is p, convert choice to :* operation
    # else, loop + prompt user for new value
  # create range from 1 to user integer
    # Range.new(1,...)
  # reduce range to a result using chosen operation
  # display result to user

# CODE!
