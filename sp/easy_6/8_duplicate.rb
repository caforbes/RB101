=begin
PROBLEM:
  INPUT: Array
  OUTPUT: duplicate element of the Array
  RULES? (explicit/implicit)
    - input array has all unique elements except one duplicate
    - return the duplicate value
  QUESTIONS: (input types? new/old object? empty input?)
    - assume no validation necessary

EXAMPLES (manually check them):

DATA STRUCTURES:

ALGORITHM (review the hardest example out loud):
  iterate through the elements of the array
  count the number of occurrences of the current element in the array
  if the count is greater than 1, return the current element

CODE!
=end

def find_dup(array)
  array.each { |elem| return elem if array.count(elem) > 1 }
end

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
