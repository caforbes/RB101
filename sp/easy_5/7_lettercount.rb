def word_sizes(string)
  sizes = Hash.new(0)

  string.split.each { |word| sizes[word.size] += 1 }
  sizes
end

def word_sizes_2(string)
  sizes = Hash.new(0)

  string.split.each { |word| sizes[letter_count(word)] += 1 }
  sizes
end

def letter_count(word)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a

  word.chars.reduce(0) do |counter, char|
    letters.include?(char) ? counter + 1 : counter
  end
end

=begin
PROBLEM:
  INPUT: String
  OUTPUT: Hash (Int => Int)
  RULES? (explicit/implicit)
    - input is of space separated words
    - words are all characters between spaces including punct
    - return a hash
    - keys: integers representing word sizes
    - vals: integers for number of words with that size
  QUESTIONS: (input types? new/old object? empty input?)
    ??

ALGORITHM (review the hardest example out loud):
  - create empty results hash of sizes, default value 0
  - split string based on spaces (each element = word)
  - iterate over the array of words
    - get the length of the word
    - increment the value of the hash key corresponding to the length
  - return the hash

  * get the length of the word
    * create an array of valid letters from ranges
    * create a count variable
    * iterate over word/string characters
    * if character is a letter, increment counter
    * return counter value


CODE!
=end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

p word_sizes_2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes_2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes_2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes_2('') == {}
