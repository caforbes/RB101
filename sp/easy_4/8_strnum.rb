NUM_STRINGS = %w(0 1 2 3 4 5 6 7 8 9)

def string_to_integer(string)
  str_digits = string.chars
  str_digits.map! { |str| NUM_STRINGS.index(str) }
  str_digits.reduce { |sum, digit| (sum * 10) + digit }
end

=begin
  PROBLEM:
    INPUT: string of digits
    OUTPUT: Integer
    RULES? (explicit/implicit)
      - input includes only digits, no points or plus/minus
      - need to convert digit strings to digit integers
    QUESTIONS: (input types? new/old object? empty input?)
      - leading zeroes? assume yes

  EXAMPLES (manually check them):
    (provided test cases)
    (any additional examples?)

  DATA STRUCTURES:
    - String
    - Integer
    - Array mapping integer to digit
    - Array of characters/digits

  ALGORITHM (review the hardest example out loud):
    - create an array of digit characters from the string
    - transform those string digits to the index of those elements in NUMSTRINGS constant array
    - add the digits together, multiplying each intermediate total by 10
    - return the sum

  CODE!
=end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('005700') == 5700

def string_to_signed_integer(string)
  case string[0]
  when '+' then string_to_integer(string[1..])
  when '-' then -string_to_integer(string[1..])
  else string_to_integer(string)
  end
end

def string_to_signed_integer_2(string)
  if '+-'.include?(string[0])
    sign = string[0]
    string = string[1..]
  end

  result = string_to_integer(string)
  sign == '-' ? -result : result
end

=begin
PROBLEM:
  INPUT: String with digits and possible leading sign
  OUTPUT: Integer
  RULES? (explicit/implicit)
    - convert string to a number with appropriate sign
    - no .to_i or Integer() -- only previous method
    - strings with leading + or no sign = positive
    - strings with leading - = negative
    - assume always a valid number -- no validation
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):

DATA STRUCTURES:
  Strings / Integers

ALGORITHM (review the hardest example out loud):
  - identify the leading character in the input string
  - if leading +, call strtoi on all but first char and return result
  - if leading -, call strtoi on all but first char and return negated result
  - otherwise, call strtoi method on whole input string, return result

  - identify if first char is a leading sign
  - if so, save the sign, and reassign string to itself minus the first char
  - call strtoi method on the saved/reassigned input string
  - return that, unless the sign is negative, return the negated result

CODE!
=end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
