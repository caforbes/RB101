def multiply_list(first_arr, second_arr)
  # first_arr.map.with_index { |num, index| num * second_arr[index] }

  pairs = first_arr.zip(second_arr)
  pairs.map { |subarr| subarr.reduce(&:*) }

  # first_arr.zip(second_arr).map { |subarr| subarr[0] * subarr[1] }
end

p multiply_list([], []) == []
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

=begin
PROBLEM:
  take two arrays of the same length
  produce a new array of the same length consisting of the values
  of each list at each index position multiplied together (zipwise fashion)

  INPUT: Array + Array
  OUTPUT: New Array
  RULES? (explicit/implicit)
    multiply together the elements at the same index position in each list
    input and output lists all have the same length
  QUESTIONS: (input types? new/old object? empty input?)
    empty array possible, should produce new empty array

EXAMPLES (manually check them):

DATA STRUCTURES:
  I/O both arrays
  could choose to use nested array as intermediate step

ALGORITHM (review the hardest example out loud):
  METHOD 1
    reference to index/counter of array elements
    iterate through the first array
    produce a new array consisting of new values
      values: multiply first list element by second list element from index
    return that array

    iteratively map the first array onto a new array
      reference the index of each array element
      multiply element in arr1 by element in arr2, referenced from index
    return new array

  METHOD 2
    make a new nested array of the pairs of integers at each index of input arrays
    reduce each sub-array to the product of its elements
    return the final array


CODE!
=end
