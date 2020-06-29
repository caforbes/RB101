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

def max_rotation_1(number)
  turns = number.digits.length

  turns.times { |n| number = rotate_rightmost_digits(number, turns-n)}

  number
end

def rotate_rightmost_elements(array, n) # if I did it from scratch, preserve 0s
  return array if n <= 0
  n = array.length if n > array.length

  new_array = array.clone
  new_array[-n..-1] = rotate_array(new_array[-n..-1])
  new_array
end

# p rotate_rightmost_elements(%w(7 3 5 2 9 1), 0) == %w(7 3 5 2 9 1)
# p rotate_rightmost_elements(%w(7 3 5 2 9 1), 1) == %w(7 3 5 2 9 1)
# p rotate_rightmost_elements(%w(7 3 5 2 9 1), 2) == %w(7 3 5 2 1 9)
# p rotate_rightmost_elements(%w(7 3 5 2 9 1), 3) == %w(7 3 5 9 1 2)
# p rotate_rightmost_elements(%w(7 3 5 2 9 1), 4) == %w(7 3 2 9 1 5)
# p rotate_rightmost_elements(%w(7 3 5 2 9 1), 5) == %w(7 5 2 9 1 3)
# p rotate_rightmost_elements(%w(7 3 5 2 9 1), 10) == %w(3 5 2 9 1 7)

def max_rotation(number)
  digits = number.digits.reverse
  turns = digits.length

  turns.times { |n| digits = rotate_rightmost_elements(digits, turns-n)}

  digits.join.to_i
end

# PROBLEM:
  # <= number
  # => number
  # use the rotate-rightmost method from before...
  # RULES? (explicit or implicit)
    # rotate first everything (n = # of digits)
    # then rotate rightmost n-1 digits
    # then rotate rightmost n-2 ...
  # IDEAS?
    # most complex part is zero handling if 0 makes it to the top
    # but, zero only makes it to the top if it's the 2nd number
    # if it's dropped, size of stuff to rotate remains the same
    # should it get smaller?
      # (7) 1023456
      # (6) 0234561 -> 234561
      # (5) 245613
      # (4) 246135
      # (3) 246351
      # (2) 246315
      # (1) 246315
    # I guess just leave it in place

# EXAMPLES (manually test them! include provided examples):
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(1000) == 1 # 0001 => 0010 => 0001
p max_rotation(1020) == 21 # 0201 => 0012 => 0021

# DATA STRUCTURES:
  # INPUT TYPE --> integer
  # OUTPUT TYPE --> integer

# ALGORITHM (step through the hardest example out loud):
  # get the length of the integer in terms of digits
  # for the length of digits, rotate the number
    # length of digits is both counter of # of rotations and # of rotater digits
    # rotate the rightmost length-1 digits
    # etc the number until the counter is down to 1
  # return the rotated number

# CODE!
