DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  digits = digit_list(num)
  digits.map { |n| DIGITS[n] }.join
end

def digit_list(num)
  digits = []

  loop do
    digits.unshift(num % 10)
    num /= 10
    break digits if num.zero?
  end
end

# PROBLEM:
  # <= positive integer
  # => string
  # RULES? (explicit or implicit)
    # conversion of each digit through a hash constant
  # what are potential problems? no things like e.g. leading zeroes...
  # there aren't nil integers either

# EXAMPLES (manually test them! include provided examples):
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# DATA STRUCTURES:
  # INPUT TYPE --> integer
  # OUTPUT TYPE --> string
  # RULES --> hash

# ALGORITHM (step through the hardest example out loud):
  # save an empty array for the digits (could use Num#digits but we won't)
  # get the digits
    # extract the last digit
      # number % 10 gets last digit
      # add to front of list
    # repeat with remaining digits
      # divide the number by 10 to chop off last digit
      # is the number zero? if so halt, if not repeat
  # convert each digit in the list to string equivalent
  # join all strings in the string array to one string

# CODE!

# => no need to use array intermediary really
# => can directly prepend to str
