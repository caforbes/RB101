DIGITS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0,
}

HEX_DIGITS = {
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15,
}.merge!(DIGITS)

def string_to_integer(str)
  digits = str.chars.map { |char| DIGITS[char] }
  digits.reverse.map.with_index { |n, place| n * (10**place) }.sum
end

def hexadecimal_to_integer(str)
  digits = str.chars.map { |char| HEX_DIGITS[char.upcase] }
  digits.reverse.map.with_index { |n, place| n * (16**place) }.sum
end


# PROBLEM:
  # <= string of digits only
  # => integer
  # no regex, no String#to_i, no Integer
  # assume only digit characters, no +/- or points
  # RULES? (explicit or implicit)
    # digits: '1'->1 ...
    # place: dependent on the length of the str
    # last digit: '1' -> 1*1
    # 2ndlast digit: '1' -> 1*10
    # 3rdlast digit: '1' -> 1*100
  # IDEAS?
    # convert characters to digits
    # add the place value to the digits via multiplication by 10 etc
    # sum the digits/place value

# EXAMPLES (manually test them! include provided examples):
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('00') == 0
p string_to_integer('200') == 200
p string_to_integer('') == 0

p hexadecimal_to_integer('4D9f') == 19871

# DATA STRUCTURES:
  # INPUT TYPE --> String -> Array
  # OUTPUT TYPE --> Integer
  # RULE ENCODING --> place value = 10**index (reversed digits)

# ALGORITHM (step through the hardest example out loud):
  # split string into characters
  # turn numeric character string into number
    # make lookup hash or case statement?: digit_value
  # reverse the digit list
  # multiply the digit list by 10^its index (0 = 1, 1 = 10, 2 = 100)
  # sum the list

# CODE!
