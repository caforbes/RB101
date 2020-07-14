def find_dup_2(array)
  sorted = array.sort
  # sorted = array.sort_by(&:object_id)
  sorted.each_with_index do |elem, idx|
    return elem if elem == sorted[idx+1]
  end
end
# was trying to be cool here. works with provided test cases
# but doesn't expand to non-sortable arrays with different element types

def find_dup(array)
  new_array = []

  array.each do |element|
    return element if new_array.include?(element)
    new_array << element
  end
end

# PROBLEM:
  # unordered array, one value is duplicate all others unique
  # find the value which occurs more than once in the array

  # INPUT: unordered Array, assume one duplicate value
  # OUTPUT: duplicated value
  # RULES? (explicit/implicit)
    # find x2 value
  # QUESTIONS: (input types? new/old object? empty input?)
    # assume no empty object
    # maybe an array with only duplicated value?
    # return the actual object in the array, where relevant

# EXAMPLES (manually check them):
p find_dup([1, 1]) == 1
p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
p find_dup([1, "hello", 3, 1]) == 1
p find_dup([1, "hello", 3, "cool", "hello"]) == "hello"

# DATA STRUCTURES:
  # arrays - input
  # arbitrary type of value/object - output

# ALGORITHM (review the hardest example out loud):
  # sort the array
  # for each element, compare with next element
    # reference the element by its index
    # first element 0, compare 0+1
  # if they are the same, break and return that element
    # return from block returns from whole method

# CODE!
