[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]

# Reject returns a new array containing only elements for which the block
# does not evaluate to true/a truthy value. That is, elements will be
# included in the array only if the block returns false or nil.
# In this case, the return value of the puts statement in the block is
# nil in each case, so each element of the array IS included in reject's
# returned array.
