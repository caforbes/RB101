def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p spin_me("hello world") # "olleh dlrow"

testy = "hello world"
testy_pair = spin_me(testy)
p testy == testy_pair
p testy

# Given the method's implementation, will the returned string be the same
# object as the one passed in as an argument or a different object?

# It will be a different object.
# However, it will also mutate the input string.

# The final output string is the result of calling join, which
# returns a new string rather than reconstructing the original string
# from its subparts.

# However, the original string will also be modified in place, because
# the elements of the array formed by calling #split on the input are
# actual substrings/slices referring to the original object, and these
# are destructively modified with #reverse!.


# Nevermind! I guess even though the split array is formed of substrings,
# mutation of these does not affect the original object.
# Strings are not like arrays in this way I guess.

# Therefore, this function has the undesirable effect of both mutating
# the caller and returning a new object
