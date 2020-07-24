def sum_of_sums(num_array)
  # arr_of_sums = []

  # current_sum = 0
  # num_array.each do |num|
  #   current_sum += num
  #   arr_of_sums.push(current_sum)
  # end

  # arr_of_sums.sum

  arr_of_sums = num_array.map.with_index do |num, index|
    num_array.slice(0..index).sum
  end
  arr_of_sums.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([0, 4]) == 4
p sum_of_sums([4, 0]) == 8
p sum_of_sums([1, 2, 3, 4, 5]) == 35

=begin
PROBLEM:
  get the sum of the sum of all "leading substrings" of nums in an array

  INPUT: Array of Integers -- min one number
  OUTPUT: Integer
  RULES? (explicit/implicit)
    input will always have 1+ num in the array
    leading substring
      linear sub-set of numbers, starting from first number
      e.g. 1 2 3 4 -> 1, 12, 123, 1234
    number of nums in the array = number of substrings to sum
    single element array returns value of element
    order of input array is crucial
  QUESTIONS: (input types? new/old object? empty input?)
    no empty arrays
    no messy numbers, only integers

EXAMPLES (manually check them):

DATA STRUCTURES:
  I:  Array of Integers
      Array of Integers (Sums)
  O:  Integer

ALGORITHM (review the hardest example out loud):
  create empty array of sums
  loop/iterate through input array of nums
    initialize a running total (0)
    add a number in the array to the total (through reassignment)
    push the total value to the array
    move to next number
  (there's also a way to do this with map for sure)
    map input array to new array of sums
    for each value AND INDEX, get slice of array from 0 to current number index
    return sum of values in the slice
  we now have array of sums, with each number added to it
  return the sum of all values in sum array

CODE!
=end
