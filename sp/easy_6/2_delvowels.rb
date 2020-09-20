=begin
PROBLEM:
  INPUT: Arr of Strings
  OUTPUT: Arr of Strings -- new
  RULES? (explicit/implicit)
    - return same string values but without vowels
    - vowels are AEIOU upper and lower case
  QUESTIONS: (input types? new/old object? empty input?)
    - implies return new array/new strings, so don't mutate

EXAMPLES (manually check them):

DATA STRUCTURES:
  Array of vowels
  I: Array/Strings
  O: Array/Strings

ALGORITHM (review the hardest example out loud):
  - transform input array with map
  - for each string in the array, get an array of chars
  - delete/filter all upper/lowercase vowel characters from the chars array
  - join the array of chars
  - return the transformed array of no-vowel strings

  or: - delete all vowel chars from the string (nondestructive)

CODE!
=end

def remove_vowels(array)
  vowels = 'aeiou'
  array.map do |string|
    string.chars.reject { |char| vowels.include?(char.downcase) }.join
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
