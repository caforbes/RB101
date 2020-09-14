=begin
PROBLEM:
  INPUT: User Input (strings -> integers)
  OUTPUT: Output message
  RULES? (explicit/implicit)
    - get 5 numbers from user, store in a list
    - get another number from user
    - check if last number is in the list
    - return a message for yes vs no
  QUESTIONS: (input types? new/old object? empty input?)
    - need to validate that user inputs a number??

EXAMPLES (manually check them):
  25, 15, 20, 17, 23 + 17 = yes
  25, 15, 20, 17, 23 + 18 = no

DATA STRUCTURES:
  Input: String -> convert to Integer
  store in Array
  Output: String w interpolation

ALGORITHM (review the hardest example out loud):
  store ordinal numbers to retrieve (1st, 2nd ... 5th)
  for each element in the list, get a number from the user
    interpolate the ordinal into the user prompt
    for each user input, validate that it's an integer
      if str/integer are the same, save integer
      else print an error
      loop and get a new number
    once it's a valid number, save it into an array of user_numbers
  get another number from the user
    again, validate it
  save the last_number
  evaluate whether last_number is in the list of user_numbers
  print a message that it is or isn't there

CODE!
=end

def prompt(msg)
  puts ">> #{msg}"
end

def get_user_number
  loop do
    input = gets.chomp

    return input.to_i if input == input.to_i.to_s
    prompt "That's not a valid integer. Try again!"
  end
end

numbers_to_get = %w(1st 2nd 3rd 4th 5th)
user_numbers = []

numbers_to_get.each do |nth|
  prompt "Enter the #{nth} number:"
  user_numbers << get_user_number

end

prompt "Enter the last number:"
last_number = get_user_number

if user_numbers.include?(last_number)
  puts "The number #{last_number} appears in #{user_numbers}!"
else
  puts "The number #{last_number} does not appear in #{user_numbers}."
end
