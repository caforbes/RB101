def move(n, from_array, to_array)
  n.times{ to_array << from_array.shift unless from_array.empty? }
  # return if n < 1 || from_array.empty?
  # to_array << from_array.shift
  # move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']


=begin
  to_array << from_array.shift
  move(n - 1, from_array, to_array)

The problem with this code is that there is no condition under which to stop
recursively calling move. The coder assumes that Ruby will stop moving array
elements when the array runs out of elements, by n reaching zero, but this is
not the case. Ruby can infinitely pull nil out of an empty array and append it
to the receiving array.

The SystemStackError is a consequence of this unbounded recursion. The system
simply does not have enough memory to continue calling the function internally
and saving the result. Nothing is ever returned.
=end
