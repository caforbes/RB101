def interleave_1(one, two)
  combined = []
  counter = 0
  while counter < one.size
    combined.push(one[counter], two[counter])
    counter += 1
  end
  combined
end

def interleave(one, two)
  one.zip(two).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
