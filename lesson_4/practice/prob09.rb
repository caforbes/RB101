{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# not sure how map works on a hash but we'll assume it's as nested [key, val]
# => [nil, 'bear']

# For each paired element in the hash, the block of the map statement
# evaluates whether the length of the value is over three. If so, the
# value is included in the new array; otherwise the value is mapped to
# nil in the new array because the if statement has no return value.
