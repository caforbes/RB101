def find_fibonacci_index_by_length(length)
  fib_sequence = [1, 1]

  loop do
    new_fibonacci = fib_sequence[-2] + fib_sequence[-1]
    fib_sequence << new_fibonacci

    break if new_fibonacci.digits.length >= length
  end

  fib_sequence.length
end

# PROBLEM:
  # find the first fibonacci number with (input) number of digits
  # output the index of that number (first number index = 1)

  # INPUT: Integer
  # OUTPUT: Integer
  # RULES? (explicit/implicit)
    # fibonacci sequence: 1, 1, (sum of two preceding), ...
    # index of fibonacci numbers [1, 2, 3, ...]
    # number of digits
  # QUESTIONS: (input types? new/old object? empty input?)
    # assume input number > 1

# EXAMPLES (manually check them):
p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# DATA STRUCTURES:
  # Input (lengths) = Integer
  # Output (indexes) = Integer
  # Fib sequence = Array of Integers

# ALGORITHM (review the hardest example out loud):
  # generate an array of fibonacci numbers
    # [1, 1]
    # enter a loop
    # get the sum of last two numbers in the array
    # add this number to the array
    # check the number of digits of the newly added number
    # stop when num of digits = input number
  # output length of the generated fibonacci list

# CODE!
