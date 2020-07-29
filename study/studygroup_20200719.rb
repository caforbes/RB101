=begin

# The objective is to return all pairs of integers from a given array of integers that have a difference of 2.
# The result array should be sorted in ascending order of values.
# Assume there are no duplicate integers in the array.
# The order of the integers in the input array should not matter.

# PROBLEM
- difference between the two integers in each sub array should be 2
- we need to return subarrays
- each sub array should have 2 integers
- should be ascending order: from lower to higher --> 1, 2, 3 (etc)
- order of integers in the array should not matter --> the input is not sorted
- there are no duplicates that we have to deal with

# EXAMPLES
p difference_of_two([1, 2, 3, 4]) ==  [[1, 3], [2, 4]]
p difference_of_two([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p difference_of_two([1, 23, 3, 4, 7]) == [[1, 3]]
p difference_of_two([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]
p difference_of_two([2, 4]) == [[2, 4]]
p difference_of_two([1, 4, 7, 10, 13]) == []

- numbers can be reused (as the lower and then the higher number)
- if there are no pairs with a difference of 2, then return an empty array
- the output is reordered from the input (ascending order we mentioned earlier)
- 2 options: empty array or a nested array * that includes even if there is only 1 nested array

# DATA STRUCTURES
- array
- nested array
- integer

# ALGORITHM




------------------------
Lee:

# #Algorithm

# - Iterate over the input
# - Check if there is any pair of number that has the difference of 2
# - If there is any pair that has the difference of 2, put it on a new container
# - Return the result

# Check if there is any pair of number that has the difference of 2
# - Compare the first number with the rest of the input
# - Go the second number, check the second number with the rest of the given pool of numbers
# - Repeat the last step until there are no number left to compare
# - Sort the result by ascending order

# Sort the result by ascending order
# - Sorted the number inside the pair by ascending order
# - If there is more than one pair of numbers, sort all the pairs by ascending order

----------------------
Andrew:

# Algorithm:
# - Given an aray of integers
# - Iterate over each integer in the array
#   - Iterate over each integer in the array again
#     - If the difference of integer at the current iteration of the inner loop and the current integer of the outer loop is 2
#       - Add the two integers to an array
#       - Push the resulting sub-array into a main array
# - Have the resulting array run in ascending order

----------------------
Clarissa:

get the original list of numbers
create a new empty list of pairs
sort the numbers in increasing order
look at the first number in the list
  compare the first number to the next number in the list
    is the difference two?
    if yes, remember both
  otherwise compare the first number to the second-next number in the list
    is the difference two?
    if yes, remember both
  if you saved a pair of numbers, add them as a paired set to the new list of pairs
  if you didn't save a pair of numbers, move to the next number in the list as the basis of comparison
repeat this comparison/save process for every number in the list
return the new list of pairs whether it has new pairs in it or is empty

Sort the input array
Initialize an empty array
Iterate over the sorted input array
  Get the index of the current number
  Iterate over a slice of the next two numbers in the array
    Subtract outer number (lower value) from inner number (higher value)
    If difference is two, then push an array of the paired numbers to the new array


----------------------
Juliana:

- sort the input array in ascending order
- iterate through the collection and calculate the difference between current element (integer) and next two ones
- if that difference is 2, save that pair for the output result

----------------------
with each number in the argument array determine if any other number in the array has a difference of two from that number, if so put those two numbers together in an object...each number is compared to all others in the array, then move to next number.

----------------------
- Sort the input (so they're in ascending order)
- Find all possible integer pairs. Save them.
- Look at each pair, and keep it if the difference between them is 2
- Return the kept pairs

----------------------



# CODE

# - Given an aray of integers
# - Iterate over each integer in the array
#   - Iterate over each integer in the array again
#     - If the difference of integer at the current iteration of the inner loop and the current integer of the outer loop is 2
#       - Add the two integers to an array
#       - Push the resulting sub-array into a main array
# - Have the resulting array run in ascending order

=end

def difference_of_two_orig(arr)
  arr = arr.sort
  arr.each_with_object([]) do |first_num, final_arr|
    arr.each do |second_num|
      if second_num - first_num == 2
        final_arr.push([first_num, second_num])
      end
    end
  end
end

def difference_of_two_ta(arr)
  arr.sort.combination(2).select { |sub_arr| sub_arr[1] - sub_arr[0] == 2 }
end

# Sort the input array
# Initialize an empty array
# Iterate over the sorted input array
#   Get the index of the current number
#   Iterate over a slice of the next two numbers in the array
#     Subtract outer number (lower value) from inner number (higher value)
#     If difference is two, then push an array of the paired numbers to the new array

def difference_of_two(arr)
  arr = arr.sort
  arr.each_with_object([]) do |first_num, pair_arr|
    next_two_nums = arr.slice(arr.index(first_num) + 1, 2)
    next_two_nums.each do |second_num|
      pair_arr.push [first_num, second_num] if second_num - first_num == 2
    end
  end
end

p difference_of_two([1, 2, 3, 4]) ==  [[1, 3], [2, 4]]
p difference_of_two([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p difference_of_two([1, 23, 3, 4, 7]) == [[1, 3]]
p difference_of_two([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]
p difference_of_two([2, 4]) == [[2, 4]]
p difference_of_two([1, 4, 7, 10, 13]) == []
