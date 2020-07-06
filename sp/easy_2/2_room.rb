def user_value(prompt)
  puts prompt
  gets.chomp.to_f
end

def calculate_area(length,width)
  length * width
end

def meters_to_feet_sq(meters)
  conversion = 10.7639
  (meters * conversion).round(2)
end

length = user_value("Enter the length of the room in meters:")

width = user_value("Enter the width of the room in meters:")

area_meters = calculate_area(length, width)
area_feet = meters_to_feet_sq(area_meters)

puts "The area of the room is #{area_meters} (#{area_feet} square feet)."

# get info from user
# input: room length + width (in meters)
  # don't worry about UI validation
  # positive number
# print room area in sq meters AND sq feet
  # calculate area: length * width
  # convert sq meters (1) to sq feet (10.7639)
  # round??

# examples
p meters_to_feet_sq(calculate_area(1,1)) == 10.76
p meters_to_feet_sq(calculate_area(5,10)) == 538.19
p meters_to_feet_sq(calculate_area(0.5,10.5)) == 56.51

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
