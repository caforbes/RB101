def short_long_short(one, two)
  if one.length > two.length
    long, short = one, two
  else
    short, long = one, two
  end
  
  short + long + short
end

# PROBLEM:
  # method takes two strings, finds longest, 
  # returns concatenation of short + long + short
  # assume the strings are of different lengths (not same)
    # how should it handle same?? doesn't matter
  # INPUTS -->
    # str1, str2
  # OUTPUTS -->
    # new str
  # QUESTIONS?
  # RULES?
    # EXPLICIT:
    # IMPLICIT:
  # IDEAS?

# EXAMPLES / TEST CASES:
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# DATA STRUCTURES:
  # INPUT -->
  # OUTPUT -->
  # RULES?

# ALGORITHM / INSTRUCTIONS:
  # find the longer of two strings

# CODE!

# documentation digs at me: "too clever for its own good" rofl