def word_to_digit(string)
  num_words = %w(zero one two three four five six seven eight nine)

  num_words.each_with_index do |word, digit|
    pattern = Regexp.new('\b'+word+'\b', 'i')
    string.gsub!(pattern, digit.to_s)
  end
  string
end

=begin
PROBLEM:
  INPUT: String
  OUTPUT: String (same string?)
  RULES? (explicit/implicit)
    - mutate the string in place
    - zero-nine words should be replaced with 0-9 digits
    - change the word even if it's adjacent to punctuation
    - don't change words containing the same string, like "phone"
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):

DATA STRUCTURES:
  Array of strings
  String
  integer?

ALGORITHM (review the hardest example out loud):
  create array of words, corresponding to index digit
  for each word:
    construct acase-insensitive regex of the word + boundaries on each side
    replace bounded word with index (destructively)
  return mutated string

CODE!
=end
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit('Please phone me at five five five one two three four. Thanks.') == 'Please phone me at 5 5 5 1 2 3 4. Thanks.'
