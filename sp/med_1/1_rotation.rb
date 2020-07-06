def rotate_array(arr)
  new_arr = []

  if arr.length > 1
    arr[1..-1].each { |elem| new_arr.push(elem) }
  end

  new_arr.push(arr.first) unless arr.empty?

  new_arr
end

# def rotate_array_2(array)
#   if array.empty?
#     []
#   else
#     array[1..-1] + [array[0]]
#   end
# end

def rotate_string(string)
  if string.empty?
    ''
  else
    string[1..-1] + string[0]
  end
end

# PROBLEM:
  # <= array
  # => new array
  # steps rotation of an array by making first element the last element
  # array must not be modified
  # no use of the Array#rotate method
  # empty array should return empty array
  # one member array should return single member
  # IDEAS?
    # add all elements from input to new array, starting from index 1
      # IF there are >1 elements in the array
    # then add first element
      # UNLESS array is empty

# EXAMPLES (manually test them! include provided examples):
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
p rotate_array([]) == []

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

p rotate_string('hello') == 'elloh'
p rotate_string('1234') == '2341'
p rotate_string('a') == 'a'
p rotate_string('') == ''

x = 'string'
p rotate_string(x) == 'trings'   # => true
p x == 'string'                 # => true

# DATA STRUCTURES:
  # INPUT TYPE --> Array
  # OUTPUT TYPE --> Array

# ALGORITHM (step through the hardest example out loud):
  # create an empty array
  # if there are 2+ elements in the array,
    # add elements from old array to end of new array, start with index 1
    # until end of elements
  # unless array is empty,
    # add first element in original array to end of new one
  # return the new array

# CODE!
