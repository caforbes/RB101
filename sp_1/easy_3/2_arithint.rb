OPERATIONS = %i(+ - * / % **)

def prompt(msg)
  puts "==> #{msg}"
end

def get_results(x, y)
  inputs = [x, y]
  OPERATIONS.map { |op| inputs.reduce(&op) }
end

prompt("Enter the first number (a positive integer).")
first = gets.chomp.to_i
prompt("Enter the second number (a positive integer).")
second = gets.chomp.to_i

results = get_results(first, second)

results.each_with_index do |res,ind|
  op = OPERATIONS[ind]
  prompt("#{first} #{op} #{second} = #{res}")
end

# PROBLEM:
  # get two positive integers from user
  # display result of:
    # addition +
    # subtraction -
    # product *
    # quotient /
    # remainder %
    # power **
  # no input validation concerns, just do the work
  # INPUTS --> two strings (positive integers), convert to integers
  # OUTPUTS --> six result numbers, printed to screen in strings?
    # "1stNum OPERATION 2ndNum = ResultNum"
  # QUESTIONS?
  # IDEAS?
    # store operations in a constant?

# EXAMPLES / TEST CASES:
  # p get_results(1,1) == [2,0,1,1,0,1]
  # p get_results(2,3) == [5,-1,6,0,2,8]
  # p get_results(23,17) == [40,6,391,1,6,141050039560662968926103]

# DATA STRUCTURES:
  # INPUT --> Strings -> Integers -> Array of Integers
  # OUTPUT --> Array of Integers -> Strings/Print statements
  # RULES?
    # List of available operations -> Array of symbols?

# ALGORITHM / INSTRUCTIONS:
  # Store operations to perform as array of symbols (constant)
  # Prompt user for a positive integer
  # Save it
  # Prompt user for another positive integer
  # Save that too
  # get results of operations
    # Add both values to an array (input_vals)
    # map the operations-to-perform to the results
    # reduce the input values by each operation
  # now we have an array of results
  # for each result, print it to the screen alongside the inputs and operation
    # "1st_val (operation) 2nd_val = (result)"

# CODE!
