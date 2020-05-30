def average(num_list)
	num_list.reduce(:+) / num_list.length
end


# input: array of integers
# no empty array -- at least 1 value
# only positive integer values -- 1 or greater

# output: average of all numbers
# add to a total and divide by length
# turn many integers into one number (integer)

# is integer addition (rounded down) okay or should it have
# typical math rounding (higher/lower of .5)?
# assume we want integer addition

puts average([1, 2]) == 1
puts average([4, 4]) == 4
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Array of Ints -> Integer

# reduce array to one integer by adding the elements together
# divide that total by length of the array



def faverage(num_list)
	num_list.reduce(:+).to_f / num_list.length
end

puts faverage([1, 2])
puts faverage([4, 4])
puts faverage([1, 5, 87, 45, 8, 8])
puts faverage([9, 47, 23, 95, 16, 52])