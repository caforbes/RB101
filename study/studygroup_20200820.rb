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

  possible_next_nums = digits.permutation.to_a.map { |order| order.join.to_i }
  possible_next_nums = possible_next_nums.uniq.sort

  current_num = possible_next_nums.index(num)
  possible_next_nums[current_num + 1]
end

def max_permutation(num)
  num.digits.sort.reverse.join.to_i
end

p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(414) == 441
p next_bigger(144) == 414
p next_bigger(9) == -1
p next_bigger(111) == -1
p next_bigger(531) == -1
