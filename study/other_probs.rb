=begin
create an array of the factors of the length of the input string
reduce to those half or less of input length
for each factor, do the following
  get a slice of the input string of that length, starting from the beginning
  multiply the substring slice until it is the length of the input string
    multiply by input length divided by substring length
  return true if the multiplied substring equals the input
if no true value has been returned after that, return false
=end

def repeated_substring(string)
  length = string.length
  factors = (1..length / 2).to_a.select { |num| length % num == 0 }

  factors.each do |factor|
    substring = string[0, factor]
    multiplied_substring = substring * (length / factor)
    return true if multiplied_substring == string
  end
  false
end

repeated_substring("aa") == true
repeated_substring("abab") == true
repeated_substring("aba") == false
repeated_substring("aabaaba") == false
repeated_substring("abaababaab") == true
repeated_substring("abcabcabc") == true
repeated_substring("abcabcabcabc") == true


=begin
PROBLEM
- input: array of strings (all lowercase)
- output: array of chars
- chars in result array are all chars that appear in all input strings
- chars should appear the minimum number of times they occur in all words

DATA
- arrays, string
- hash to keep track of counts in each word?

ALGO
- get all unique characters appearing in any input word
- create a hash of character counts, starting with empty array
- for each input word, iterate through the hash
  - update the character count array, adding the count of that character in the word
- create overlapping chars result array
  - for each char in the hash, add to result array the smallest number of counts

- create result array
- iterate through unique chars in the first word
  - count the number of times that char appears in each input word
  - add that char to result array the min number of counts
- return result char array
=end

def common_chars(words_array)
  overlapping = []

  words_array[0].chars.uniq.each do |char|
    counts = words_array.map { |word| word.count(char) }
    counts.min.times { overlapping.push(char) }
  end

  overlapping
end

p common_chars(%w(bella label roller)) == %w(e l l)
p common_chars(%w(cool lock cook)) == %w(c o)
p common_chars(%w(hello goodbye booya)) == %w(o)
p common_chars(%w(aabbaaaa ccdddddd eeddee ggrrrrr)) == []
