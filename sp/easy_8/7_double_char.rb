def repeater(string)
  # doubled_result = ''
  # string.each_char { |char| doubled_result << char << char }
  # doubled_result

  doubled_chars = string.chars.map { |char| char + char }
  doubled_chars.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

=begin
PROBLEM:
  INPUT: String
  OUTPUT: New String
  RULES? (explicit/implicit)
    every char in the input string is doubled in the output string
    return, don't print, the new string
    doubled chars in input --> quadrupled chars in the output
    empty string = also empty output
    not just alphabetic, but all characters!!

EXAMPLES (manually check them):

DATA STRUCTURES:
  Strings
  Strings --> Array of Strings --> Strings

ALGORITHM (review the hardest example out loud):
  strings only:
    create new empty string
    iterate through input string charactesr
    for each char, add that char twice to the new string
    return the new string
  arrays:
    convert input string to array of characters
    transform each element of the array to itself doubled
      i.e. array of 1 char ('a') --> array of 2 chars/doubled chars ('aa')
    join the array of doubled chars
    return the joined string

CODE!
=end
