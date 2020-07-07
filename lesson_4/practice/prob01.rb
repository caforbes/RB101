[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]
# Returns the same array because for each value in the original array,
# the implicit return value of the block is the truthy value 'hi'.
# When the block returns a truthy value, then the current element of the
# array is included in the new array to be returned.
# Because the block always returns a truthy value all elements of the
# original array are included in the new returned array.
