def user_name
  loop do
    name = gets.chomp

    break name if name =~ /[a-zA-Z]/
    puts("Your name has to contain a letter. Try again!")
  end
end

def greeting(name)
  if name =~ /!$/ # or string.end_with?('!')
    greet = "Hello, #{name[0..-2]}. Why are we screaming?".upcase # or name.chop
  else
    greet = "Hello, #{name}."
  end
end

print("What is your name? ")
name = user_name()

puts greeting(name)

# PROBLEM:
  # get the user's name
    # cannot be blank string or !
    # must have an a-zA-Z character: name =~ /[a-zA-Z]/
  # check if name ends in an exclamation mark
    # Y: output greeting in uppercase + scream message
    # N: output greeting in normal case
  # INPUTS -->
    # string from user
  # OUTPUTS -->
    # string greeting, name interpolated
  # QUESTIONS?
  # RULES?
    # EXPLICIT:
    # IMPLICIT:
      # user name cannot be '' or '!'
      # find scream: regex -> name =~ /!$/
  # IDEAS?

# EXAMPLES / TEST CASES:
  # p greeting('Bob') == 'Hello, Bob.'
  # p greeting('Bob!') == 'HELLO, BOB. WHY ARE WE SCREAMING?'

# DATA STRUCTURES:
  # INPUT --> String
  # OUTPUT --> String (print)
  # RULES?
    # name must have a letter: Regex
    # does name end in !: regex

# ALGORITHM / INSTRUCTIONS:
  # get user's name
    # initialize variable
    # begin loop
    # get name from user
    # check if name contains a letter
      # name =~ /[a-zA-Z]/
    # if it does, break, if it doesn't, print error
    # loop through this process until name contains a letter
  # construct greeting to user
    # check if name ends in !
      # match =~ /!$/
    # unless screaming, interpolate name in normalcase greeting
    # if screaming
      # strip exclamation point from name
      # interpolate name in greeting
      # concatenate why are we screaming?
      # convert to uppercase
  # print greeting to user
  # ...
  # GO THROUGH THE HARDEST EXAMPLE OUT LOUD

# CODE!
