def halvsies(array)
  first = []
  second = []

  counter = 0
  halfway = (array.length + 1) / 2

  while counter < array.length

    if counter < halfway
      first << array[counter]
    else
      second << array[counter]
    end

    counter += 1
  end

  [first, second]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
