def multiply(x, y)
  # x * y

  # many_y = []
  # x.times { many_y << y }
  # many_y.sum

  result = 0
  x.times { result += y }
  result
end

=begin
PROBLEM:
  INPUT: Numbers x2
  OUTPUT: Number
  RULES? (explicit/implicit)
    - multiply the two numbers
    - return the product
    - create 1 method with #*, another without
  QUESTIONS: (input types? new/old object? empty input?)
    - are both positive and negative numbers accepted?
    - are both floats and integers multiplied? other kinds of numbers?

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  input, output, rules, constants?

ALGORITHM (review the hardest example out loud):
  steps and subroutine steps

CODE!
=end

p multiply(5, 3) == 15
