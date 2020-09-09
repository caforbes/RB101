SQ_FEET_PER_SQ_METER = 10.7639

def user_number(prompt)
  puts prompt
  gets.chomp.to_f
end

def sq_meters_to_feet(sq_meters)
  (sq_meters * SQ_FEET_PER_SQ_METER).round(2)
end

=begin
PROBLEM:
  INPUT: User Strings -> Int
  OUTPUT: printed output -> Floats
  RULES? (explicit/implicit)
    - ask for length/width of room in meters
    - display area
    - convert to sq meters and sq feet
    - 1 meter^2 = 10.7639 feet^2
    - round output calculation to 2 decimals
  QUESTIONS: (input types? new/old object? empty input?)
    - don't worry about user input/integer validation

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  Input = String
  Convert to Floats
  Output as String + Floats (interpolate!)

ALGORITHM (review the hardest example out loud):
  prompt user with request for length + meters
  save these to variables
  convert each to a float
  calculate area: L * W
  save as area_meters
  convert to area in feet (constant)
  save as area_feet
  output area calculations in a string

CODE!
=end

length = user_number("Enter the length of the room in meters:")
width = user_number("Enter the width of the room in meters:")

area_meters = length * width
area_feet = sq_meters_to_feet(area_meters)

puts "The area of the room is #{area_meters} square meters " +
     "(#{area_feet} square feet)"

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).
