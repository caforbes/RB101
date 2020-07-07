[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]

# The block contains a conditional statement. If the element of the original
# array is greater than one, the value is printed. The return value of the
# puts statement is nil, so in the returned array of map that element is
# converted to nil. Otherwise, that is for the initial element which is not
# greater than one, the element itself is returned in the new array (1).
# In order, the first element is not greater than one and is itself returned
# in the mapped array, while the next two are each printed and nil returned
# to the mapped array.
