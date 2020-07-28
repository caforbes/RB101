def fizzbuzz(start_num, end_num)
  (start_num..end_num).each do |num|
    result = ''

    result.concat('Fizz') if num % 3 == 0
    result.concat('Buzz') if num % 5 == 0

    result = num.to_s if result.empty?

    puts result
  end
end

def fizzbuzz_better(start_num, end_num)
  nums = (start_num..end_num).to_a

  outputs = nums.map do |num|
    case # code structure follows logic of intent
    when num % 3 == 0 && num % 5 == 0
      'FizzBuzz'
    when num % 3 == 0
      'Fizz'
    when num % 5 == 0
      'Buzz'
    else
      num # .to_s unnecessary here -- type shift conducted by .join
    end
  end

  puts outputs.join(', ')
end

fizzbuzz(1, 15)
fizzbuzz_better(1, 15)

=begin
PROBLEM:
  INPUT: ?
  OUTPUT: ?
  RULES? (explicit/implicit)
    - print num if num not divisible by 3 or 5
    - print fizz if divisible by 3
    - print fizz if divisible by 5
    - print fizzbuzz if divisible by 3 and 5
  QUESTIONS: (input types? new/old object? empty input?)
    number validation that it makes a proper range?
    should the method return nil, or can it return a range?

EXAMPLES (manually check them):

DATA STRUCTURES:
  input, output, rules, constants?

ALGORITHM (review the hardest example out loud):
  steps and subroutine steps

CODE!
=end
