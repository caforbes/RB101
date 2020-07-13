def merge(one, two)
  merged_array = one + two
  merged_array.uniq
  # one | two         # => set union!
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
