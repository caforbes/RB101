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


=begin
PROBLEM:
  INPUT: 2 Strings
  OUTPUT: Boolean
  RULES? (explicit/implicit)
    - true if the first string has a substring that the second string also has
    - false if no substring occurs in both strings
    - substring must be at least two characters
    - input strings may be empty
    - if input string is empty, there are no possible 2+ char substrings -> false
    - case of the strings is irrelevant -- need not be the same case to return true
    - order of the strings is irrelevant
  QUESTIONS: (input types? new/old object? empty input?)
    ??

DATA STRUCTURES:
  Strings -> Arrays of substrings -> Boolean

ALGORITHM (review the hardest example out loud):
  *** substrings method
  create an empty array for results
  if either input string is less than two characters, return empty array
  iterate over range from 0 to 2 less than string length
    use this number as starting index of a slice
    iterate over range from 2 to length of string - index
      use this number as length of the slice
      get a slice with starting index and length from the input string
      add the slice to results array
  return unique values in the results array

  smallest = 0, 2, or length-2, 2
  largest = 0, length of string

  *** main method
  find all the substrings in the first input string, lowercased
  find all the substrings in the second input string, lowercased
  see if any substring from string1 is found in string2 substrings -> boolean

  alternate strategy from video
    - iterate through characters of string 1, lowercased
    - iterate through characters of string 2, lowercased
    - for each, reference the index
    - for each, break iteration if index reaches final index
    - if the current character from both strings matches, and neither is the last char:
    - compare the following char in each string using index + 1
    - return true if that also matches
    - else return false

CODE!
=end

def substring_test(string1, string2)
  # substrings1 = substrings(string1.downcase)
  # substrings2 = substrings(string2.downcase)

  # substrings1.any? { |substring| substrings2.include?(substring) }


  chars1 = string1.downcase.chars
  chars2 = string2.downcase.chars

  chars1.each_with_index do |char1, index1|
    break if index1 == chars1.length - 1

    chars2.each_with_index do |char2, index2|
      break if index2 == chars2.length - 1
      if char1 == char2
        return true if chars1[index1 + 1] == chars2[index2 + 1]
      end
    end
  end
  false
end

def substrings(string)
  results = []
  return results if string.length < 2

  (0...string.length-1).each do |start_ind|
    (2..string.length - start_ind).each do |length|
      results << string[start_ind, length]
    end
  end

  results.uniq
end

# p substrings('h') == []
# p substrings('hi') == ['hi']
# p substrings('aaaa') == ['aa', 'aaa', 'aaaa']
# p substrings('hello') == ['he', 'hel', 'hell', 'hello',
#                           'el', 'ell', 'ello',
#                           'll', 'llo',
#                           'lo'
#                           ]

substring_test('Something', 'Fun') == false
substring_test('Something', 'Home') == true
substring_test('Something', '') == false
substring_test('', 'Something') == false
substring_test('BANANA', 'banana') == true
substring_test('test', 'lllt') == false
substring_test('', '') == false
substring_test('1234567', '541265') == true
substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

# ~25m


=begin
PROBLEM:
  INPUT: Strings x2
  OUTPUT: Boolean
  RULES? (explicit/implicit)
    - return true iff str1 can be rearranged to form str2
    - extra characters are fine
    - str1 must contain same NUMBER of each char as str2 has to return true
    - str1 must be at least same length
    - only lowercase will be input, no need to consider case
    - only alphabetic characters will be used
    - asymmetrical: str2 doesn't have to contain str1
  QUESTIONS: (input types? new/old object? empty input?)
    - what happens if one string is empty? automatically true??

EXAMPLES (manually check them):

DATA STRUCTURES:
  Strings -> Array of chars -> Boolean

ALGORITHM (review the hardest example out loud):
  - create an array of all the unique characters in string 2
  - iterate through the unique characters
  - for each character, check that the count of that char in string 1
    is greater/equal to count in string 2
  - return true if all characters pass, else false

CODE!
=end

def scramble?(string, target)
  target_chars = target.chars.uniq
  target_chars.all? { |char| string.count(char) >= target.count(char) }
end

scramble?('javasss', 'jjss') == false
scramble?('worldxxx', 'world') == true
scramble?('cedewaraaossoqqyt', 'codewars') == true
scramble?('katas', 'steak') == false
scramble?('scriptjava', 'javascript') == true
scramble?('scriptingjava', 'javascript') == true

# ~10m



=begin
- if string is empty, return 0
- split input string into array of substrings (shortest = 1)
  - create range of 0 - length-1 (starting indices)
  - for each index, iterate over start - length-1 as ending index
  - get a slice of string from start to end index
  - store in results arraay
  - return unique elements of results array
- filter array to only palindromes (can be 1)
  - string == reversed string
- transform palindrome array to array of lengths
- return maximum value
=end

def longest_palindrome(string)
  return 0 if string.empty?
  palindromes = substrings(string).select { |substr| palindrome?(substr) }
  palindromes.map!(&:length)
  palindromes.max
end

def substrings(string)
  results = []
  (0...string.length).each do |start_ind|
    (start_ind...string.length).each do |end_ind|
      results << string[start_ind..end_ind]
    end
  end
  results.uniq
end

def palindrome?(string)
  string == string.reverse
end

# p palindrome?("a") == true
# p palindrome?("ababa") == true
# p palindrome?("abb") == false

# p substrings('hi') == ['h', 'hi', 'i']
# p substrings('aaaa') == ['a', 'aa', 'aaa', 'aaaa']
# p substrings('hello') == ['h', 'he', 'hel', 'hell', 'hello',
#                           'e', 'el', 'ell', 'ello',
#                           'l', 'll', 'llo',
#                           'lo', 'o'
#                           ]

p longest_palindrome("") == 0
p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9

# ~23m
