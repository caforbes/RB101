name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

puts '='*10

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# This should print out:
  # BOB
  # BOB
# In both cases, name is assigned to a string value,
# and then save_name is assigned to the same value.
# Then some expression affects the variable name.
# In the first case, name is reassigned to the value 'Alice'.
# This has no effect on the value of save_namewhich points to
# the original object. The two variables now point to distinct objects.
# In the second case, a mutative method is called on the object
# referenced by both name and save_name.
# Because at this point both variables point to the same object,
# mutation of that object by the method String#upcase! causes
# both variables to return the same mutated object when printed.
