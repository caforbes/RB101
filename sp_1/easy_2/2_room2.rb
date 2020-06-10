SQM_TO_SQFT = 10.7639
SQFT_TO_SQIN = 144
SQFT_TO_SQCM = 929.03

def user_value(prompt)
  puts prompt
  gets.chomp.to_f
end

length = user_value("Enter the length of the room in feet:")
width = user_value("Enter the width of the room in feet:")

area_feet = (length * width).round(2)
area_inch = (area_feet * SQFT_TO_SQIN).round(2)
area_cm = (area_feet * SQFT_TO_SQCM).round(2)

puts "The area of the room is #{area_feet} square feet."
puts "(That's #{area_inch} square inches, or #{area_cm} square cm.)"

# ask user for values in feet
# display in sqft, sqinch, sqcm

# input will be strings (assume just digits/.)
# use floats
# output as floats -> string

# request length from user
  # convert to float + save
# request width from user
  # convert to float and save
# calculate area of the room in sq meters
  # length * width
  # save this value
# convert sq meters area to sq feet
  # meters * 10.7639
  # round to 2 decimals
# print statement to the user, interpolating meter area + feet area
