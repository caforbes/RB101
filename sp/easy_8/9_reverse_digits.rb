=begin
PROBLEM:
  INPUT: Integer
  OUTPUT: Integer
  RULES? (explicit/implicit)
    - reverse the digits in the number
    - if number has trailing zeros, simply chop these (don't worry about octal)
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  Integers, Strings, Array

ALGORITHM (review the hardest example out loud):
  get array of digits of the input integer
  reverse the digits from their original order
  convert the array of integers to strings
  join the strings
  convert joined string to integer, return it

  convert number to a string
  reverse the string
  convert reversed string to an integer

CODE!
=end

def reversed_number(num)
  # num.digits.map(&:to_s).join.to_i
  num.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
