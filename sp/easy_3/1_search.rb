def user_value(num_label)
  puts("==> Please enter the #{num_label} number")
  val = gets.chomp.to_i
end

numbers_to_get = %w(1st 2nd 3rd 4th 5th)

number_list = []
numbers_to_get.each { |label| number_list.push(user_value(label)) }

search_number = user_value('last')

if number_list.include?(search_number)
  puts "The number #{search_number} appears in #{number_list}!"
else
  puts "The number #{search_number} does not appear in #{number_list}."
end

# PROBLEM:
  # get 5 numbers from user
  # then get 6th number and check if it's among the first 5
  # INPUTS -->
    # user input: 6 numbers total
    # assume these will be integers, positive/negative/zero, no floats
    # UI : string x 6
  # OUTPUTS -->
    # string statement about inclusion of 6th number
  # QUESTIONS?
  # RULES?
    # EXPLICIT:
    # IMPLICIT:
  # IDEAS?
    # don't worry about number validation
      # but if you did: only digits, -, . ??
    # we don't need to perform any arithmetic -- numbers can stay strings
    # can we repeat a number? that seems fine

# EXAMPLES / TEST CASES:
  # [25, 15, 20, 17, 23] : 17 => true
  # [25, 15, 20, 17, 23] : 18 => false

# DATA STRUCTURES:
  # INPUT --> Strings > Array of Strings
  # OUTPUT --> boolean + print

# ALGORITHM / INSTRUCTIONS:
  # get a (number) value from user
    # prompt user for 1st-5th number
    # hypothetically: validate the number
  # push the string value to an array
  # repeat 4 more times
  # get and save another value from user
  # check whether saved array includes the new value
  # if so, print success statement
  # if not, print fail statement
  # GO THROUGH THE HARDEST EXAMPLE OUT LOUD

# CODE!


# reflection: was very sloppy with this one!!
# should turn into integers so that it prints properly anyway
