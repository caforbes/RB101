def twice(num)
  double_number?(num) ? num : num * 2
end

def double_number?(num)
  string_num = num.to_s
  return false if string_num.length.odd?

  half_length = string_num.length / 2

  first_half = string_num[0, half_length]
  last_half = string_num[-half_length, half_length]

  first_half == last_half
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

p double_number?(11) == true
p double_number?(14) == false
p double_number?(4) == false

=begin
PROBLEM:
  INPUT: Integer
  OUTPUT: Integer
  RULES? (explicit/implicit)
    double number: first half digits == second half digits (e.g. 1212)
    if double number, return number
    if not, then return number * 2
    input numbers can be even or odd
    double numbers only even
  QUESTIONS: (input types? new/old object? empty input?)
    negative number handling? (assume only positive)

EXAMPLES (manually check them):

DATA STRUCTURES:
  Integer -> string

ALGORITHM (review the hardest example out loud):
  determine if number is a double number
    * convert int to a string
      if length is odd, return false
      get first half of the string
        slice: start at 0, length / 2
      check if it is == second half of string
        slice: start at -halflength, length/2
  yes: return number
  no: return number * 2

CODE!
=end
