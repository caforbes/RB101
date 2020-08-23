=begin
PROBLEM:
  INPUT: integer (n of fibonacci sequence)
  OUTPUT: integer (last digit of that fib number)
  RULES? (explicit/implicit)
    - fibonacci sequence
      1, 2 = 1
      3+ = sum of last two fib numbers (1+1, 1+2, 2+3...)
    - get final digit of the found fib number
  QUESTIONS: (input types? new/old object? empty input?)
    assume valid positive input number

EXAMPLES (manually check them):

DATA STRUCTURES:
  Input Integer, output Integer
  DS: array for computing last two fib numbers in sequence
  DS: string for digits

ALGORITHM (review the hardest example out loud):
  find the (input-n)th number in the fib sequence
    initialize (components) array, start with [1, 0]
    for input num 3+, modify the components
      compute sum
      replace components with sum + first in existing components
    return sum
  convert to string
  return last character (string) as digit (integer)

CODE!
=end

def fibonacci_last(nth)
  last_two = [1, 0]
  3.upto(nth) { last_two = [last_two.sum % 10, last_two.first] }

  last_two.sum % 10
end

def fibonacci_last_1(nth)
  fibonacci(nth).to_s[-1].to_i
end

def fibonacci(nth)
  last_two = [1, 0]
  3.upto(nth) { last_two = [last_two.sum, last_two.first] }
  last_two.sum
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075

p fibonacci_last(15)        == 0 #(the 15th Fibonacci number is 610)
p fibonacci_last(20)        == 5 #(the 20th Fibonacci number is 6765)
p fibonacci_last(100)       == 5 #(the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   == 1 #(this is a 20899 digit number)
p fibonacci_last(1_000_007) == 3 #(this is a 208989 digit number)
# p fibonacci_last(123456789) == 4
