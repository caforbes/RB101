=begin
PROBLEM:
  INPUT: two Integers
  OUTPUT: print String
  RULES? (explicit/implicit)
    - print integers starting from and including the two input numbers
    - assume they'll be in the right order
    - if number divisible by 3 instead print Fizz
    - if number divisible by 5 instead print Buzz
    - if number divisible by both print FizzBuzz
    - print in a single string list separated by commas
  QUESTIONS: (input types? new/old object? empty input?)

EXAMPLES (manually check them):

DATA STRUCTURES:
  range -> Array
  Strings

ALGORITHM (review the hardest example out loud):
  create an array of numbers from start to end
  transform the array
    if number divisible by 3 and 5, use FizzBuzz
    if divisible by 3 use Fizz
    ... if by 5 use Buzz
  join the array with ", "
  print the string

CODE!
=end

def fizzbuzz(start_num, end_num)
  output =  (start_num..end_num).map do |num|
              if num % 3 == 0 && num % 5 == 0 then 'FizzBuzz'
              elsif num % 3 == 0 then 'Fizz'
              elsif num % 5 == 0 then 'Buzz'
              else num
              end
            end
  puts output.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
