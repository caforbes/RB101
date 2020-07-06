def sum(number)
  nums = number.to_s.chars.map { |s| s.to_i }
                          #map(&:to_i)
  nums.reduce(:+)
end

# input: positive integer
# output: integer -- sum of its digits
# no zero, negatives, or validation e.g. commas

puts sum(1) == 1
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# Integer -> String -> Array OF STRINGS
# -> Integer

# convert integer to a string
# split into individual digit characters array
# map back into integers
# reduce into one sum value