arr = [1, 2, 3, 4, 5]
arr.take(2)

# => [1, 2]
# it is not destructive.

# #take returns a new array containing the first number of elements of the
# array specified, and leaves the old one unmodified. To find this out,
# we check the documentation, which says nothing about the original array being
# modified. To confirm, we can check in irb.
