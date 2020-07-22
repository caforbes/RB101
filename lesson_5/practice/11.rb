arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map { |subarr| subarr.select { |n| n % 3 == 0 } }

p arr
p new_arr
