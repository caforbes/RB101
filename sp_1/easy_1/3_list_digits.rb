def digit_list(int)
	digits = int.to_s.chars
	digits.map(&:to_i)
end


# input: positive integer
# output: array of digit characters in the integer
# no need to worry about negative sign haha!

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# Input: Integer > String
# Output: Array of Integers

# convert integer to a string
# split string into array of characters
# map all string digits in the array to integer counterpart
# return that