arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hashed_arr = {}
arr.each { |(key, val)| hashed_arr[key] = val }
# arr.each { |subarr| hashed_arr[subarr[0]] = subarr[1] }

p hashed_arr
