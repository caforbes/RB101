def sum(num)
  # num.digits.sum

  # sum = 0
  # num.to_s.chars.each { |char| sum += char.to_i }
  # sum

  num.to_s.chars.reduce(0) { |sum, char| sum += char.to_i }
end

=begin
PROBLEM:
  INPUT: Integer (positive)
  OUTPUT: Integer
  RULES? (explicit/implicit)
    - get digits in the input number
    - sum the digits
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):

DATA STRUCTURES:
  v1: to get digits -> String or Array

ALGORITHM (review the hardest example out loud):
v1:
  convert num to array of its digits
  sum the array
  return the sum
v2:
  create total
  convert num to string
  for each character in string
    turn to an integer
    add to running total
  when run out of characters, return total
v3:
  convert num to string
  get array of characters
  reduce with starting value 0
  add value of each character converted to integer
  return sum

CODE!
=end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
