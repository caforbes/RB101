a = [1, 4, 8, 11, 15, 19]

# Array#bsearch: {|x| block} => item
# array must be sorted/monotone wrt the block

val = a.bsearch { |x| x > 8 }
puts val