numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # => 2
p numbers
# returns [1, 3, 4, 5] = deletes index 1 value

numbers = [1, 2, 3, 4, 5]
numbers.delete(1) # => 1
p numbers
# returns [2, 3, 4, 5] = deletes element with value 1
