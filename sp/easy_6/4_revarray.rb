def my_reverse!(array)
  halfway_index = array.size / 2

  counter = 0
  while counter < halfway_index do
    opposite = -(counter + 1)

    # temp = array[counter]
    # array[counter] = array[opposite]
    # array[opposite] = temp
    array[counter], array[opposite] = array[opposite], array[counter]

    counter += 1
  end

  array
end

# PROBLEM:
  # mutate an array in place by reversing the order of its elements

  # INPUT: Array
  # OUTPUT: Same Array
  # RULES? (explicit/implicit)
    # first = last
    # second = second to last
    # etc
  # QUESTIONS: (input types? new/old object? empty input?)
    # empty array should remain the same
    # objects inside should probably remain the same
    # should work for any kind of object in the array

# EXAMPLES (manually check them):

# DATA STRUCTURES:
  # Input/Output = same Array

# ALGORITHM (review the hardest example out loud):
  # get the size of half the array, rounded down
  # conduct this many item swaps on the array
    # start with index 0
    # save item at index 0 to temp
    # save item at index -1 (- 0+1) to 0
    # save item at temp to index -1
  # stop swapping after going through half the list, rounded down

# CODE!

list = [1,2,3,4]
result = my_reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p my_reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p my_reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p my_reverse!(list) == []
p list == []
