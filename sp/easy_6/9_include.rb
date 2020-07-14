def include?(array, search_val)
  array.each { |element| return true if element == search_val }
  false
end

# PROBLEM:
  # return true if search value in the array, false otherwise
  # no using Array#include? lol

  # INPUT: Array, any value
  # OUTPUT: Boolean

# EXAMPLES (manually check them):
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# DATA STRUCTURES:
  # Input: Array, AnyValue
  # Output: true/false

# ALGORITHM (review the hardest example out loud):
  # get the first element of the array
  # if it == search value, return true and exit method
  # otherwise look at the next element in the array
  # repeat for all elements in the array until/unless return true
  # after all elements of the array have been evaluated, return false

# CODE!
