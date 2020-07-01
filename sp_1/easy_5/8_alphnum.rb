NUM_NAMES = %w(zero one two three four five six seven eight nine ten
  eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(int_array)
  # int_array.sort { |a, b| NUM_NAMES[a] <=> NUM_NAMES[b] }
  int_array.sort_by { |int| NUM_NAMES[int] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
