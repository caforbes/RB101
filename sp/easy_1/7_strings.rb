def stringy_1(num)
  new_string = ''
  currently_one = true

  while num > 0
    char = currently_one ? '1' : '0'
    new_string << char

    num -= 1
    currently_one = !currently_one
  end

  new_string
end
# modify this one to have extra argument of starting value 1/0
# remove currently_one boolean
# concat starting char instead of using ternary
# instead of bang toggle, use ternary to reset 1 -> 0 and vvsa

def stringy(input)
  (1..input).to_a.map { |num| num.odd? ? '1' : '0' }.join
end
# add extra starting argument with 1 or 0 starting char
# default char set as a 2-element array
# if starting char doesn't match first element, reverse array
# ternary should reference first/second elements of array

=begin
PROBLEM:
  INPUT: Integer
  OUTPUT: String (1, 0s)
  RULES? (explicit/implicit)
    - output string starts with 1
    - output string length == input number
    - input is always positive
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):

DATA STRUCTURES:

ALGORITHM (review the hardest example out loud):
  initialize new empty string
  create toggle to add 1 or 0: start with 1
    add char to new string (1 or 0 based on switch)
    toggle 1/0 switch
    decrement counter
    repeat until counter reaches 0
  return new string

  create a range from 1 to num, inclusive
  turn to an array
  transform the array: odd nums -> 1, evens -> 0 (strings)
  join the array of strings and return it

CODE!
=end

puts stringy(1) == '1'
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
