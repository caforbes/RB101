def sum_square_difference(num)
  nums = (1..num).to_a

  sums_squared = nums.sum ** 2
  squares_summed = nums.map { |n| n**2 }.sum

  sums_squared - squares_summed
end

=begin
PROBLEM:
  INPUT: Integer (positive)
  OUTPUT: Integer
  RULES? (explicit/implicit)
    - set of nums is 1 through N
    - first number: sum of nums, squared
    - second number: square of each num, summed
    - first - second = result
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  I: Integer -> Range -> Array
  O: Array -> Integer

ALGORITHM (review the hardest example out loud):
  - get an array of all numbers from 1 to input
  - calculate square of sums
    - sum the array
    - square the array: n**2
    - save as (sums_squared)
  - calculate sum of squares
    - transform array to new array of squares: n**2
    - get sum of new array
    - save as (squares_summed)
  - subtract sumsqd by sqssum
  - return that difference


CODE!
=end

p sum_square_difference(3) == 22 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
