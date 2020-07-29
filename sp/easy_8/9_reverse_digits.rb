def reversed_number(number)
  digits = number.to_s.chars.map(&:to_i)

  result = 0
  place_multiplier = 1

  digits.each do |digit|
    result += digit * place_multiplier
    place_multiplier *= 10
  end

  result

  # number.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
p reversed_number(0) == 0

=begin
PROBLEM:
  description

  INPUT: Integer
  OUTPUT: Integer
  RULES? (explicit/implicit)
    - returned integer has digits the reverse of the old one
    - trailing zeroes on input are not leading zeroes on output -- delete them
  QUESTIONS: (input types? new/old object? empty input?)
    - what about negative numbers? (assume: ignore them)

EXAMPLES (manually check them)

DATA STRUCTURES:
  Integer
  Array of Integers (digits)
  Integer

ALGORITHM (review the hardest example out loud):
  get array of digits from input integer
    (digits method -- reversed) OR
    convert to int to string
    get array of characters
    map/transform characters to numeric values: digits
  start with a result of 0 and a multiplier of 1
  iterate through the digits in forward order
    multiply the first digit by multiplier 1
    add this value to the result
    multiply the multiplier by 10 to increase the place value
  return the result

CODE!
=end
