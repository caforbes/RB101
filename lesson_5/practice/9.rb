arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map { |collection| collection.sort { |a,b| b <=> a } }

p arr
p new_arr
