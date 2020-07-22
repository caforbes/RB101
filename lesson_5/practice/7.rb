a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p arr
# => [4, [1, 8]]

# actually, it's [4, [3, 8]]
# because arr[0] now points to 4 but a still points to 2, it has not mutated
