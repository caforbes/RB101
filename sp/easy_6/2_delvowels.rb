VOWELS = 'aeiouAEIOU'

def remove_vowels(string_array)
  string_array.map do |string|
    string.chars.reject { |char| VOWELS.include?(char) }.join
  end
end

# PROBLEM:
  # array of strings --> array, but with all vowels removed from substrings
  # return empty string where it was all vowels

  # INPUT: Array (of strings)
  # OUTPUT: Array (of strings) -- new array
  # RULES? (explicit/implicit)
    # strip aeiou AEIOU
  # QUESTIONS: (input types? new/old object? empty input?)
    # should the strings inside the input array get modified?
    # probably not. --> output copies of substrings, not mutated

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
p remove_vowels([]) == []

# DATA STRUCTURES:
  # Arrays, and substrings inside
  # constant: set of vowels, both cases

# ALGORITHM (review the hardest example out loud):
  # map elements of the input array to new strings
  # remove the vowels from the element strings
    # for each character in the string
    # add character to new string unless in set of vowels (skip vowels)
  # output the new/mapped array

# CODE!
