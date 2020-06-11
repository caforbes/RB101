 odd_nums = (1..99).select { |n| n.odd? }

puts odd_nums

# PROBLEM:
  # print odd numbers between 1-99 inclusive
  # print on separate lines
  # INPUTS --> n/a
  # OUTPUTS --> integers, printed as strings on \n
  # RULES?
    # EXPLICIT:
      # odd?

# EXAMPLES / TEST CASES:
  # 1..5

# DATA STRUCTURES:
  # INPUT -->
    # Range 1..99 --> Array
  # OUTPUT -->
    # putsed Array

# ALGORITHM / INSTRUCTIONS:
  # create an array from the 1..99 range (apparently not needed for enumerable)
  # filter this array for only odd numbers
  # puts the filtered array: will print on newlines

# CODE!
