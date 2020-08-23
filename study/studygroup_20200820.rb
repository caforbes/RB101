# You have to create a function that takes a positive integer number
# and returns the next bigger number formed by the same digits:
#
# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
#
# If no bigger number can be composed using those digits, return -1:
#
# 9 ==> -1
# 111 ==> -1
# 531 ==> -1


  # return -1 if number is already max number
    # find the max number:
    # get all digits
    # sort in ascending order, join and turn into integer
    # same as input number?
  # **get permutations of the digits starting with the same or greater digit than input number
    # get first element of array
    # - 1 el array is same as self
    # - 2 el array is self + reversed self
    # - 3 starts to get tricky
      # get all two-element combinations
  # join each permutation into a number
  # sort the list of UNIQUE options in ascending order
  # find the input number in the list (its index)
  # get the element at the next highest index
  # if no element at the next highest index (past end of list) return -1

def next_bigger(num)
  digits = num.digits.reverse
  return -1 if num == max_permutation(num)

  possible_next_nums = permutations(digits).map { |order| order.join.to_i }
  possible_next_nums = possible_next_nums.uniq.sort

  current_num = possible_next_nums.index(num)
  possible_next_nums[current_num + 1]
end

def next_bigger_ta(num)
  digits = num.digits.reverse
  return -1 if num == max_permutation(num)

  current_num = num
  loop do
    current_num += 1
    return current_num if max_permutation(current_num) == max_permutation(num)
  end
end

def max_permutation(num)
  num.digits.sort.reverse.join.to_i
end

def permutations(array)
  results = []

  if array.length == 1
    results << array.dup
  else
    previous_perms = permutations(array[0...-1])
    last_element = array[-1]

    previous_perms.each do |current_perm|
      results += insert_at_each_space(current_perm, last_element)
    end
  end

  results.sort
end

def insert_at_each_space(array, new_element)
  results = []

  (array.length + 1).times do |index|
    new_arr = array.dup
    new_arr.insert(index, new_element)
    results << new_arr
  end

  results.sort
end

  # initialize *results* array of permutations (nested array)
  # perms of 1-el array
    # copy of array
    # add copy to result array
  # perms of 2-el array
    # if array has size > 1
    # get permutations of array sans last element (recurse)
    # then iterate over the permutations
    # for each permutation
      # loop: insert last element in first position of (copy of) the array (ind 0)
      # add that array to results array
      # repeat for every position in the array
  # return SORTED array of arrays (permutations)

# p insert_at_each_space([1], 2) == [[1,2], [2,1]]
# p insert_at_each_space([1,2], 3) == [[1,2,3], [1,3,2], [3,1,2]]

# p permutations([1]) == [[1]].sort
# p permutations([1,2]) == [[1,2], [2,1]].sort
# p permutations([1,2,3]) == [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]].sort

p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(414) == 441
p next_bigger(144) == 414
p next_bigger(9) == -1
p next_bigger(111) == -1
p next_bigger(531) == -1

p next_bigger_ta(12) == 21
p next_bigger_ta(513) == 531
p next_bigger_ta(2017) == 2071
p next_bigger_ta(414) == 441
p next_bigger_ta(144) == 414
p next_bigger_ta(9) == -1
p next_bigger_ta(111) == -1
p next_bigger_ta(531) == -1
