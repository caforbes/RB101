['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }

# The return value of #each_with_object is the original object it was passed,
# in this case an empty hash to which an element has been added for each
# iteration. The block adds a new element to that hash where the key
# equates to the first letter sliced from the array element, and the
# value is the array element. In short, the elements in the calling
# array are now values in the returned object hash, with their first letters
# as the keys.
