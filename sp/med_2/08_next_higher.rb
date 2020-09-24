=begin
PROBLEM:
  INPUT: Integer
  OUTPUT: Integer / Output error message
  RULES? (explicit/implicit)
    - featured number: odd, multiple of 7, unique digits
    - start from any input number
    - return next featured number greater than input
    - there is no featured number over 9876543210 (even a lower limit)
  QUESTIONS: (input types? new/old object? empty input?)
    - positive or negative input?

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  Integers

ALGORITHM (review the hardest example out loud):
  increment the input number:
      if the number is not a multiple of seven, increment by 1 until it is
      now if the number is even, add seven
  enter a loop
    check if the number has all unique digits
      array of digits == unique digits
    if so, return the number
    otherwise, increment the number by 14
    stop if the number goes over the limit
  if the current number is over the limit, output error message, return nil


CODE!
=end

def featured(number)
  number += 1
  number += 1 until number%7 == 0
  number += 7 if number.even?

  while number < 9876543210
    return number if number.to_s.chars == number.to_s.chars.uniq
    number += 14
  end

  puts "There is no possible number that fulfills those requirements."
end

p featured(-12) == -7
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
