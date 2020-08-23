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
    use a recursive method structure
  QUESTIONS: (input types? new/old object? empty input?)
    assume only valid integers input?

DATA STRUCTURES:

ALGORITHM (review the hardest example out loud):
  input of 1 or 2 outputs 1
  input of a greater number is:
    sum of fib n-1 and fib n-2

CODE!
=end

def fibonacci(n)
  if n > 2 then
    fibonacci(n-1) + fibonacci(n-2)
  else
    1
  end
  # n > 2 ? fibonacci(n-1) + fibonacci(n-2) : 1
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
