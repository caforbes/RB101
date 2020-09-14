=begin
PROBLEM:
  INPUT: Integer
  OUTPUT: Integer
  RULES? (explicit/implicit)
    - find all multiples of 3 and 5 between 1 and input number
    - return the sum of those multiples
    - the input is a positive integer
  QUESTIONS: (input types? new/old object? empty input?)
    - are input num included? -- yes

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  Integers
  Range
  Array

ALGORITHM (review the hardest example out loud):
  initialize array of multiples
  create a range between 1 and input num
  check whether each num in the range is a multiple of 3 or 5
  when it is, add that number to the array of multiples
  return the sum of the multiples

CODE!
=end

def multisum(max)
  # multiples_35 = []

  # (1..max).each do |possible_num|
  #   if possible_num % 3 == 0 || possible_num % 5 == 0
  #     multiples_35 << possible_num
  #   end
  # end

  # multiples_35.sum

  # (1..max).reduce(0) do |result, num|
  #   num % 3 == 0 || num % 5 == 0 ? result + num : result
  # end

  multiples = (1..max).select { |num| num % 3 == 0 || num % 5 == 0 }
  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
