['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => 1

# The best way to check how a method treats the return value of a block
# is by checking the documentation. In this case, the return value of
# the #count method will increment for each element in the array for
# which the block returns --true-- (a truthy value).
