def rotate_array(array)
  if array.empty?
    []
  else
    array[1..-1] + [array[0]]
  end
end

def rotate_rightmost_digits(number, n)
  digits = number.digits.reverse

  return number if n <= 0
  n = digits.length if n > digits.length

  rotaters = []
  n.times { rotaters.unshift(digits.pop) }

  (digits + rotate_array(rotaters)).join.to_i
end

# PROBLEM:
  # <= number (positive integer)
  # => number (pos integer)
  # do we allow 0 for the n? do we allow a higher n than there are digits?
  # I will assume yes, and handle these as 0 == 1 or too many == all
  # RULES? (explicit or implicit)
    # rules
  # IDEAS?
    # turn integer into an array, operate on array and concat etc
    # how to identify right portion of digit array from n?
      # slice: array[-n..-1]
      # ensure n is a proper number: 0 --> 1, >length --> length

# EXAMPLES (manually test them! include provided examples):
p rotate_rightmost_digits(735291, 0) == 735291
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 10) == 352917

# DATA STRUCTURES:
  # INPUT TYPE --> I
  # OUTPUT TYPE --> O
  # RULE ENCODING --> rules

# ALGORITHM (step through the hardest example out loud):
  # get array of digits in reverse order to number
  # determine size of rotating chunk
    # if length >= n > 0, use n
    # if n > length, use length
    # if 0 >= n, return number without modification
  # get two chunks: rotating chunk and remainder
    # shift n elements from list
    # remainder is remaining elements, maybe empty
  # rotate the ones that will rotate
  # concatenate rotated list + remainder, reverse, join/.to_i

# CODE!
