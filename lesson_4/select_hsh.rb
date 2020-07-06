def select_fruit(grocery_list)
  fruits = {}
  items = grocery_list.keys

  for item in groceries
    if grocery_list[item] == 'Fruit'
      fruits[item] = grocery_list[item]
    end
  end

  fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
