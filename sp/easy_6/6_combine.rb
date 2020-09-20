=begin
PROBLEM:
  INPUT: Array 1 + 2
  OUTPUT: new Array
  RULES? (explicit/implicit)
    - Output arr should contain all elements contained by originals
    - output arr should have no duplicates even if originals did

  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  input, output, rules, constants?

ALGORITHM (review the hardest example out loud):
  add the two arrays together to a new array
  filter to only unique values

  initialize results array
  add unique elements of array 1
  iterate through elements of 2
  add the current element to results if not already in results
  return the result array

CODE!
=end

def merge(arr1, arr2)
  # (arr1 + arr2).uniq
  # arr2.each_with_object(arr1.uniq) do |elem, results|
  #   results << elem unless results.include?(elem)
  # end
  arr1 | arr2
end

p merge([1], [3]) == [1, 3]
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
p merge([1, 3, 3, 5], [3, 6, 9, 9]) == [1, 3, 5, 6, 9]
