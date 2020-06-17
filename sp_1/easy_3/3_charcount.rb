def count_chars(string)
  string.delete(" ").length
end

puts "Please enter at least one word:"
input = gets.chomp

puts "There are #{count_chars(input)} characters in '#{input}'."

# PROBLEM:
  # prompt user for: word / multiple words
  # return the number of characters -- no spaces
  # INPUTS --> String
  # OUTPUTS --> Integer, PRINTED
    # "There are ..res.. characters in ..input..."
  # QUESTIONS?
    # should work on null and space-only string
  # RULES?
    # EXPLICIT:
      # delete all spaces in the string
      # count remaining characters in the string
    # IMPLICIT:
  # IDEAS?
    # would like it better if we could strip punctuation overall but okay
    # it's counting non-space characters, not letters

# EXAMPLES / TEST CASES:
  # p count_chars("") == 0
  # p count_chars(" ") == 0
  # p count_chars("walk") == 4
  # p count_chars("walk, don't run") == 13

# DATA STRUCTURES:
  # INPUT --> String
  # OUTPUT --> Integer --> printed string

# ALGORITHM / INSTRUCTIONS:
  # prompt the user for words/multiple words
  # save it = input
  # count the characters
    # delete all spaces
    # length of the remainder string
  # display count and input to the user

# CODE!
