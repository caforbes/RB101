def is_odd?(int)
  int % 2 != 0
  # int.remainder(2) != 0
end

# input: integer (pos,neg,0)
# no integer validation required
# output: boolean
# true if absolute val of integer is odd, otherwise false

# odd iff remainder of divideby 2 is not 0
# x % 2 != 0
# no need to find absolute value, pos and neg function the same

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Integer > Boolean

# take a number and return boolean of whether remainder 2 is non-zero




# discussion: my solution works regardless of whether % is 
# a modulo or remainder operator. Structure is identical if I use
# int.remainder(2)