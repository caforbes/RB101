=begin
PROBLEM:
  INPUT: UserValues - Str -> Number
  OUTPUT: Output - Str with Float
  RULES? (explicit/implicit)
    - tip percentage / 100.0 * bill = tip
    - bill amount + tip amount = total
  QUESTIONS: (input types? new/old object? empty input?)
    - assume no input validation necessary

EXAMPLES (manually check them):
  200, 15 = 30, 230

DATA STRUCTURES:
  Input: Str -> Float
  Output: Float -> Str, puts

ALGORITHM (review the hardest example out loud):
  prompt user for bill
  save as float
  prompt user for tip percentage
  save percentage as float
  convert to decimal / 100
  calculate tip size (* bill)
  calculate total (+ bill)
  display results interpolated in message

CODE!
=end

puts "> What is the bill?"
bill = gets.chomp.to_f

puts "> What percent would you like to tip?"
tip_percent = gets.chomp.to_f

tip = (tip_percent / 100) * bill
total = bill + tip

puts "> The tip is $#{tip}"
puts "> The total bill is $#{total}"
