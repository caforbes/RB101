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

common_chars(%w(bella label roller)) == %w(e l l)
common_chars(%w(cool lock cook)) == %w(c o)
common_chars(%w(hello goodbye booya)) == %w(o)
common_chars(%w(aabbaaaa ccdddddd eeddee ggrrrrr)) == []


=begin
Maximum sum sequence subarray problem: find the maximum sum in a contiguous
subsequence in an array of integers.

sequence: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
max subsequence: [4, -1, 2, 1]
sum: 6

If all integers are positive, return the sum of the whole because it's the max.
If all integers are negative, return 0 instead.

Empty array also has a greatest sum of 0. The empty array is a valid sub-array.

DATA STRUCTURES:
- arrays, integers
- probably a nested array for subsequences! or not, only for sums

ALGO:
- if there are no positive numbers in the array, return 0
- create an empty array for subsequences
- get all subsequences of this array
  - iterate through the indices of the array (0 - length-1)
  - at each index, iterate through the ending indices (i - length-1)
  - get a slice of the array using those indices
  - push it to the array of subsequences
- get the sum of each subsequence via transformation
- return the highest sum
=end

def max_sequence(num_array)
  return 0 if num_array.none?(&:positive?)

  possible_sums = subsequences(num_array).map(&:sum)
  possible_sums.max
end

def subsequences(array)
  results = []

  array.length.times do |first_idx| # refactor later to use EWO
    first_idx.upto(array.length - 1) do |last_idx|
      results << array[first_idx..last_idx]
    end
  end
  results
end

# subsequences([1, 2, 3])

max_sequence([]) == 0
max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
max_sequence([11]) == 11
max_sequence([-32]) == 0
max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12


=begin
PROB:
- find leading substring common to all strings in an array
- if no common starting char across all strings, return empty string
- I: Array of Strings (lowercase) / O: String

DATA:
- arrays, strings

ALGO:
- initialize an empty result string
- iterate over indexes of first word in array
- check the character at that index of all words
- if it's the same, add the char to a result string
- if it's not the same, break out of the iteration
- return the result string
=end

def common_prefix(strings_arr)
  result = ''
  first_word = strings_arr[0]

  first_word.length.times do |index|
    characters = strings_arr.map { |word| word[index] }
    if characters.uniq.size == 1
      result << characters[0]
    else
      break
    end
  end
  result
end

common_prefix(%w(flower flow flight)) == 'fl'
common_prefix(%w(dog racecar car)) == ''
common_prefix(%w(interspecies interstellar interstate)) == 'inters'
common_prefix(%w(throne dungeon)) == ''
common_prefix(%w(throne)) == 'throne'
