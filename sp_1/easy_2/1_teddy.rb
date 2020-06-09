puts "Please enter a person's name."

the_name = gets.chomp
the_name = 'Teddy' if the_name.empty?

age = rand(20..200)
puts "#{the_name.capitalize} is #{age} years old!"

# build a program
# generate age: random number 20-200 (inclusive?)
# print age within string "Teddy is .. years old!"
# input: none
# output: string

# age can generate 20 and 200, not 0, not 201
# p (20..200).member?(20) == true
# p (20..200).member?(200) == true
# p (20..200).member?(69) == true
# p (20..200).member?(19) == false
# p (20..200).member?(201) == false

# integers only: random integer

# save a random number between 20..200 inclusive
# interpolate the function calling the number, within a string.
