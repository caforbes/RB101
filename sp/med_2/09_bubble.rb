def bubble_sort_1!(array)
  loop do
    copy = array.dup

    (array.length - 1).times do |index|
      if (array[index] <=> array[index+1]) == 1
        array[index], array[index+1] = array[index+1], array[index]
      end
    end

    break if array == copy
  end
end

def bubble_sort!(array)
  loop do
    unsorted = array.length
    swapped = false

    (unsorted - 1).times do |index|
      next unless (array[index] <=> array[index+1]) == 1
      array[index], array[index+1] = array[index+1], array[index]
      swapped = true
    end

    unsorted -= 1
    break unless swapped
  end
end

=begin
PROBLEM:
  INPUT: Array
  OUTPUT: ARRAY-mutated
  RULES? (explicit/implicit)
    - array must get sorted ascending
    - compare neighboring elements and swap if in wrong order
    - repeat until all elements in array have been subject of comparison
    - repeat over entire array until no swaps have taken place on that iteration
    - technically no needed return value
    - but common for mutated array to be output?
  QUESTIONS: (input types? new/old object? empty input?)
    - should there be a return value, or nil?

EXAMPLES (manually check them):

DATA STRUCTURES:
  input, output, rules, constants?

ALGORITHM (review the hardest example out loud):
  - begin looping
  - copy array
  - conduct first pass through array
    - number of comparisons will be array size - 1
    - evaluate item 0 and next
    - if next item is larger than first in comparison, swap the two items
    - move to item 1 and next
    - repeat until item end-1 and next
  - compare array after swaps to original copy of array
  - stop looping if original and copy are the same
  - return array/nil?

CODE!
=end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

