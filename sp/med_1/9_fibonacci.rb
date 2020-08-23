=begin
PROBLEM:
  INPUT: Integer
  OUTPUT: Integer
  RULES? (explicit/implicit)
    fibonacci sequence
      1 = 1
      1 (+0)= 1
      1 + 1 = 2
      2 + 1 = 3
      3 + 2 = 5
      5 + 3 = 8
      8 + 5 = 13
    n times, sum together the two previous numbers
    don't use recursion
  QUESTIONS: (input types? new/old object? empty input?)
    assume only valid integers input?

DATA STRUCTURES:

ALGORITHM (review the hardest example out loud):
  for input of 1-2, output 1
  for 3 or greater:
    initialize (components), start with [1, 0]
    loop
      reassign components to [sum, first_num]
      perform n-2 times (3 = 1 time, 4 = 2 times)
  return sum of components

CODE!
=end

def fibonacci(num)
  last_two = [1, 0]
  3.upto(num) { last_two = [last_two.sum, last_two.first] }
  last_two.sum
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
