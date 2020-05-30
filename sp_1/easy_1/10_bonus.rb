def calculate_bonus(salary,bonus)
	bonus ? salary / 2 : 0
end


# input: pos integer salary, and boolean give-a-bonus?
# output: integer of bonus to be added
# no zero or negatives, no validation

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

# Integer -> Integer

# if bonus is set to true, divide salary / 2
# if bonus is set to false, 0

