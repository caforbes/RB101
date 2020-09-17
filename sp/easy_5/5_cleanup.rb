def cleanup(string)
  string.chars.each_with_index do |char, index|
    string[index] = ' ' unless ('a'..'z').include?(char)
  end
  # string.gsub(/ +/, " ")
  string.squeeze(" ")
end

=begin
PROBLEM:
  INPUT: String
  OUTPUT: same String
  RULES? (explicit/implicit)
    - input will be lowercase alph or nonalph characters
    - mutate the string in place
    - replace non-alph characters with a space
    - includes all punctuation, even apostrophes
    - result should have no consecutive repeating spaces
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):

DATA STRUCTURES:
  Alph: ranges / array
  I/O: string -- use array of chars

ALGORITHM (review the hardest example out loud):
  - iterate through array of chars in the string with indexes
  - for each character:
    - if it's alphabetic, move to next character
    - if it's not, replace char at that index in the string with a space
  - take the mutated input, and replace all consecutive spaces with single space
  - return the mutated input string

CODE!
=end

p cleanup("abc") == 'abc'
p cleanup("!!!!") == ' '
p cleanup("---what's my +*& line?") == ' what s my line '
