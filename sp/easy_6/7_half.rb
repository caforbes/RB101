=begin
PROBLEM:
  INPUT: Array
  OUTPUT: Nested array
  RULES? (explicit/implicit)
    - output is a nested array containing first and second half of input array
    - assume that all the output arrays are new arrays
    - length of input and 2 output arrays are the same
    - if input arr has even number of elements, two output arrs have same length
    - if input arr has odd number, first output arr is longer (has the odd element)
  QUESTIONS: (input types? new/old object? empty input?)
    ??

ALGORITHM (review the hardest example out loud):
  - get the halfway mark to transition between first/second output array
    - input length / 2, rounded up
    - length + 1 / 2
  - get a slice of first half of array: index 0 to halfway mark
  - get a slice of second half of array: halfway mark to last elem
  - return an array containing first + second slice

CODE!
=end

def halvsies(array)
  halfway = (array.length+1) / 2

  [ array[0..halfway-1], array[halfway..-1] ]
end

p halvsies([]) == [[], []]
p halvsies([5]) == [[5], []]
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
