NUM_STRINGS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(int)
  string_result = ''

  loop do
    int, digit = int.divmod(10)
    string_result.prepend(NUM_STRINGS[digit])
    break if int == 0
  end
  string_result
end

# Input: Integer -- positive or zero
# Output: String
# Rules:
  # no built in conversion methods
  # create string representing same value as number
  # typically has same digits as integer num has

# Algorithm
  # create an empty string for the result
  # peel off each digit
    # get the remainder of dividing the input by 10
    # save division as new target num, remainder as digit
    # convert the digit: use it as index to retrieve string in NUM_STRINGS constant
    # prepend the string character to result string
  # stop peeling digits if input num now == 0, else continue
  # return the result string

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'


def signed_integer_to_string(int)
  string_result = integer_to_string(int.abs)

  if int.zero? then         string_result
  elsif int.negative? then  string_result.prepend('-')
  else                      string_result.prepend('+')
  end
end

=begin
PROBLEM:
  INPUT: Integer, zero/pos/neg
  OUTPUT: String: digits with leading sign (unless zero)
  RULES? (explicit/implicit)
    output string should have + if positive, - if negative, else 0
    otherwise, digits from integer/string should be same
    accepts any valid integer as input
    don't use built in string conversion, only old method
    - old method won't divide properly if given negative input
  QUESTIONS: (input types? new/old object? empty input?)
    ??

ALGORITHM (review the hardest example out loud):
  - call strtoi on absolute value of input num
  - if original input is zero, return that result
  - if original input is negative, prepend - and return
  - if original input is positive, prepend + and return

  - if input is zero, call/return itos method
  - if input is positive, call itos method, and prepend +
  - if input is negative, call itos method on negated int, and prepend -

CODE!
=end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
