['ant', 'bear', 'caterpillar'].pop.size

# => 11

# It's important to know exactly what a method returns when creating a
# method chain. Here, the return value of #pop is not the mutated array,
# but the final element of the array which has been removed from it, a string.
# #size will then be called on the string 'caterpillar', which has a total
# of 11 characters.
