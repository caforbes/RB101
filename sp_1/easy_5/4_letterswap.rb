def swap(string)
  words = string.split

  words.each do |word|
    temp = word[0]
    word[0] = word[-1]
    word[-1] = temp
  end
  # words.each { |wd| wd[0], wd[-1] = wd[-1], wd[0] }

  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# PROBLEM:
  # <= string: words/spaces, each word has 1+ letter, string has 1+ word
  # => string where first/last letters of each word are swapped
  # any sensitivity to letters vs numbers? I'll assume only a-Z
  # RULES? (explicit or implicit)
    # words = letters only

# DATA STRUCTURES:
  # INPUT TYPE --> I
  # OUTPUT TYPE --> O

# ALGORITHM (step through the hardest example out loud):
  # split string into words by spaces
  # for each word swap first/last letters
    # save first to temp
    # save last to first
    # save temp to last
  # join modified words with spaces
  # return the joined string

# CODE!

# Further Exploration:
  # passing only the characters to be swapped to a separate method
  # instead of the whole word would not work, because swapping their
  # values in the separate domain of a method would not result in their
  # values being reassigned in the word outside of the method.
  # essentially, swapping the substrings inside a method would not have
  # the effect of mutating an external string that happens to contain that
  # substring. reassignment must occur in the context of the entire string.
