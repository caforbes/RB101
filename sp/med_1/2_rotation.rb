def rotate_rightmost_digits(num, n_to_rotate)
  digits = num.to_s.chars
  digits[-n_to_rotate..-1] = rotate_array(digits[-n_to_rotate..-1])
  digits.join.to_i
end

=begin
PROBLEM:
  INPUT: Integer (to rotate), Integer (digits to move)
  OUTPUT: Integer
  RULES? (explicit/implicit)
    - specify the last n digits of the number
    - amongst only those digits, rotate the first digit to the last position
    - return a new integer with that order of digits
    - if 1 digit is specified, rotation has no effect
  QUESTIONS: (input types? new/old object? empty input?)
    - what happens if n is over the length of the integer?
      - ignore for now
      - consider limiting n to length of integer

EXAMPLES (manually check them):

DATA STRUCTURES:
  Integer -> String -> Array -> String -> Integer

ALGORITHM (review the hardest example out loud):
  - convert number to a string
  - get all chars of the string number
  - reassign final n characters to rotated n characters (slice reassignment)
  - join string characters
  - convert to integer and return

CODE!
=end

def rotate_array(arr)
  arr[1..-1] + arr[0,1]
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
