def cleanup_regex(string)
  string.gsub(/[^a-z]+/, ' ')
end

def cleanup(string)
  arr = string.chars.map do |char|
    if ('a'..'z').include?(char) then char
    else ' ' end
  end
  cleaned = arr.join

  while cleaned.include?('  ') do
    cleaned = cleaned.gsub('  ', ' ')
  end
  cleaned
end

# PROBLEM:
  # write a method replacing non-alph characters in a string with spaces
  # reduce multiple occurrences of non-alph with 1 space
  # no consecutive spaces
  # <= string with lowercase letters, spaces, and non-alphabetic characters
  # => string with lowercase letters and spaces
  # QUESTIONS?
  # RULES? (explicit or implicit)
    # multiple non-alph --> space
    # a-z - OK, non a-z = SPACE
  # IDEAS?
  # try a regex version first, then a non-regex version (gsub for +?)

# EXAMPLES (manually test them! include provided examples):
p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("---") == ' '
p cleanup("") == ''
p cleanup("a") == 'a'
p cleanup("a  ") == 'a '

# DATA STRUCTURES:
  # <= String
  # => String
  # Replacement: /[^a-z]+/ -> ' '

# ALGORITHM (step through the hardest example out loud):
  # steps

# CODE!

# given solution is much nicer.
  # add chars to new array/string
  # if not in alphabet, add space unless last-added char is also space
# my solution more sucky
  # convert all characters in str to either alpha or space
  # iteratively delete multi space instances until reduced to 1 space
