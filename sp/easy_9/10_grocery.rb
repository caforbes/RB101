def buy_fruit(grocery_array)
  unless grocery_array == grocery_array.to_h.to_a
    return puts("Sorry, I can't read your list.")
  end

  result_list = []

  grocery_array.each do |fruit, quantity|
    quantity.times { result_list << String.new(fruit) }
  end

  result_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

=begin
PROBLEM:
  INPUT: Array of Arrays (String/Integer pairs)
  OUTPUT: New Array (flat)
  RULES? (explicit/implicit)
    - input contains paired arrays of fruit + quantity
    - output array contains number of fruit entries given by quantity
    - nested integers in the pairs sum to the final length of the list
  QUESTIONS: (input types? new/old object? empty input?)
    - do we need to validate the input array?
    - should the multiple occurrences of the fruit be the same or diff objects?

EXAMPLES (manually check them):

DATA STRUCTURES:
  Nested Array -> Array (new)

ALGORITHM (review the hardest example out loud):
  create result grocery list
  iterate through grocery list pairs
  for each item on the list
    add the grocery item to the list
    repeat the number of times given by the quantity figure
  return result list

CODE!
=end
