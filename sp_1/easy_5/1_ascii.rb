def ascii_value(string)
  # string.chars.map { |char| char.ord }.sum
  string.chars.map(&:ord).sum
end

# PROBLEM:
  # <= string
  # => integer: sum of ascii vals of each character
  # RULES? (explicit or implicit)
    # ascii values: String#ord

# EXAMPLES (manually test them! include provided examples):
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# DATA STRUCTURES:
  # INPUT TYPE --> String --> Array of chars --> array of Ints
  # OUTPUT TYPE --> Integer

# ALGORITHM (step through the hardest example out loud):
  # split the string into individual chars
  # get the ascii value of each char with .ord
  # sum the values, return the sum

# CODE!
