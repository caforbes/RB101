def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# this will print [4, 5, 3, 6]
# the first and last values are applied to the parameters
# with no supplied default. the remaining middle value, 5,
# is interpreted as the first of the middle paramaters with
# a default specified. the second uses its default value.

# found this on page "calling methods"

# PS, you can't add another default parameter e after d.