def oddities(list)
  # each
  odd_list = []
  list.each_with_index { |val,ind| odd_list.push(val) if ind.even? }
  odd_list

  ## while loop
  # odd_list = []
  # counter = 0
  # while counter < list.length do
  #   odd_list.push(list[counter])
  #   counter += 2
  # end
  # odd_list

  ## select ???
end

# def oddities(arr, odd=true )
#   # based on the odd flag, return the even or odd elements in the array
#   odd ? arr.select { |item| arr.index(item).even? } : arr.select { |item| arr.index(item).odd? }
# end

# examples/tests
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 1, 1]) == [1, 1]
