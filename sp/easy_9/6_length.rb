def word_lengths(sentence)
  words = sentence.split
  words.map { |word| "#{word} #{word.length}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

=begin
PROBLEM:
  INPUT: string (containing words)
  OUTPUT: Array of strings
  RULES? (explicit/implicit)
    - returned array contains words with space and length appended
    - word is anything sectioned by a space
    - empty string returns empty array
    - count all punctuation in word length
  QUESTIONS: (input types? new/old object? empty input?)

EXAMPLES (manually check them):

DATA STRUCTURES:
  Strings -> Array of strings

ALGORITHM (review the hardest example out loud):
  split string into array of words by virtue of finding spaces
  for each word in the array,
    transform it to itself + space + its length
    as a string
  return the transformed array

CODE!
=end
