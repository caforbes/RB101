def featured(num)
  num += 1
  num += 1 until num % 7 == 0 && num.odd?

  while num < 9_876_543_210
    return num if num.digits == num.digits.uniq
    num += 14
  end

  puts "There is no possible number that fulfills those requirements."
end

def featured_1(num)
  num = next_multiple_of_7(num)

  while num < 9_999_999_999
    if featured_number?(num)
      return num
    else
      num = next_multiple_of_7(num)
    end
  end
  puts "There is no possible number that fulfills those requirements."
end

def featured_number?(num)
  num.odd? && num.digits == num.digits.uniq && num % 7 == 0
end

def next_multiple_of_7(num)
  num % 7 == 0 ? num + 7 : ((num / 7) + 1) * 7
end

=begin
PROBLEM:
  INPUT: Integer
  OUTPUT: Integer / nil + error msg
  RULES? (explicit/implicit)
    - odd multiple of 7, where digits are all unique
    - there is no possible featured number with 10+ digits (one will repeat)
    - return the next highest featured number
    - don't return the current number!!!
    - ouput error message if no possible next number
  QUESTIONS: (input types? new/old object? empty input?)
    - can the input integer be negative?

EXAMPLES (manually check them):

DATA STRUCTURES:
  input, output, rules, constants?

ALGORITHM (review the hardest example out loud):
- evaluate the provided number
  - if over featured limit, output error
  - if featured number, return the number
    - remainder of division by 7 is 0
    - number is odd
    - array of digits is equal to array of unique digits
  - if a multiple of seven, add 7 and repeat
  - if not a multiple of seven, get to next multiple and repeat
    - divide num by 7
    - that + 1 * 7 is next num
- repeat until one of the conditions is met

- increment input number once, and again until it is an odd multiple of 7
- evaluate number
  - if over the possible limit of featured nums, output error
  - return num if it has unique digits
  - otherwise add 14 and repeat

CODE!
=end

p featured(0) == 7
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
