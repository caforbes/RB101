numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# I think it will print 1 and 3.
# It prints the first number with index 0, then the first item is deleted.
# each then moves to the item with the next index 1 (now 3).
# then the first item (2) is deleted.
# it attempts to move to the next index 2 but there are no items with
# index 2 anymore.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# I think it will print 1 and 2.
# After printing value 1, value 4 is removed from the array.
# After printing value 2, value 3 is removed from the array.
# Then there are no more values to move to.

# In each case, the array is being modified as we iterate through it.
# Iteration tracks the indexes at each iteration, not the objects
# being mutated and deleted or the original indexes from the original list.
