def multiply(numbers, multiplier)
  new_numbers = []
  # counter = 0

  # while counter < numbers.length
  #   new_numbers << numbers[counter] * multiplier
  #   counter += 1
  # end

  for num in numbers
    new_numbers << num * multiplier
  end

  new_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
