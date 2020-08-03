def sequence(count, multiplier)
  # (1..count).to_a.map { |num| num * multiplier }
  (1..count).map { |num| num * multiplier }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

=begin
PROBLEM:
  INPUT: 2 Integers: Count, starting int + multiple num
  OUTPUT: Array of Integers
  RULES? (explicit/implicit)
    - output array contains the number of elements given by count
    - first element of array is the starting number given
    - each subsequent num adds the start number to itself (is multiplied by +1)
    - 0 count creates empty list
    - 0 multiplier creates list of 0s (because 0 multiplier = 0)
  QUESTIONS: (input types? new/old object? empty input?)

EXAMPLES (manually check them):

DATA STRUCTURES:
  Integers, Array

ALGORITHM (review the hardest example out loud):
  create an array of integers from 1 to count number
  if count number is 0 then make empty array
  multiply every value in the array by multiplier
  return the transformed array

CODE!
=end
