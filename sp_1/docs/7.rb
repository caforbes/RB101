s = 'abc'
puts s.public_methods.inspect

# Object#public_methods and Object#methods
# accept an optional boolean parameter "regular"
# if true (default) will print all inherited methods, 
# if false will not print inherited methods.

# We want to print only the methods defined in the string
# class, not those inherited from other classes, so we
# should set that parameter to false.

puts s.public_methods(false).inspect