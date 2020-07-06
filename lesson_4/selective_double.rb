def double_odd_positions(numbers)
  new_list = []
  counter = 0

  while counter < numbers.length do
    current_num = numbers[counter]

    current_num *= 2 if counter.odd?
    new_list << current_num

    counter += 1
  end

  new_list
end

p my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_positions(my_numbers)
# not mutated
p my_numbers
