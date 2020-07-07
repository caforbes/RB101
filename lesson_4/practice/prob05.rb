hash = { a: 'ant', b: 'bear' }
hash.shift

# => [:a, 'ant']
# hash is now { b: 'bear' }

# We need to look at the documentation for Hash#shift.
# It removes the "first" element of the hash (evaluated as the first
# element inserted) from the hash, and returns it as a two-element array
# of the key and value.
