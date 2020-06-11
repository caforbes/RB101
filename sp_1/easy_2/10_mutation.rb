array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Will print (on newlines)
  # %w(Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo)
# Array 1 and array 2 are different objects.
# however, array 2 is constructed with exactly the same
# objects that array 1 contains.
    # because what is pushed to array 2 are not copies of its elements,
    # but references (pointers) to the actual elements.
# When changes are made to the objects in array 1,
# array 2 will also reflect those changes, because it refers to
# precisely those objects.
# Thus, when String#upcase! is called on certain values in array 1,
# it mutates those objects in both array 1 and array 2.

# this can get you in trouble if you are copying an array so that
# you can safely mutate its contents without impacting the original array.
# in fact, if you copy the array too shallowly, your mutations will have
# consequences in the original array as well, contra your intentions.
