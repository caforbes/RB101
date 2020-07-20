def multiply_all_pairs(arr1, arr2)
  pairs = arr1.product(arr2)
  pairs.map! { |pair| pair[0] * pair[1] }
  pairs.sort
end

def multiply_all_pairs_2(arr1, arr2)
  result = arr1.each_with_object([]) do |first_item, result_list|
    arr2.each do |second_item|
      result_list << (first_item * second_item)
    end
  end
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

=begin
PROBLEM:
  take two non-empty arrays
  produce a new array
  which contains result of all possible pairs in the array multiplied together
  array of products should be sorted in ascending order

  INPUT: Array, Array
  OUTPUT: New Array
  RULES? (explicit/implicit)
    pairs -> val * val
  QUESTIONS: (input types? new/old object? empty input?)
    no empty arrays in input

EXAMPLES (manually check them):

DATA STRUCTURES:
  Input: Array of Ints * 2
  -> Array of Arrays
  Output: Array of Ints

ALGORITHM (review the hardest example out loud):
  create an array of all pairs of values from input arrays
    ->  product method
    ->  create a new array
        iterate through first array
          iterate through second array
            create an array pair of current element from outer array and current element from inner array
            push that pair to the array of pairs
  map to a list of results: for each pair, get the product of the values
  sort the result array in increasing order
  return the result array

CODE!
=end
