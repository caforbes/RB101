def substrings(string)
  substr_array = []
  0.upto(string.length) do |index|
    first_slice = string.slice(index..-1)
    substr_array += leading_substrings(first_slice)
  end
  substr_array
end

def leading_substrings(string)
  substring = ''
  string.chars.each_with_object([]) do |char, substr_array|
    substring += char
    substr_array << substring
  end
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

=begin
PROBLEM:
  get all substrings from an input string
  input into an array
  the substrings should be ordered: substr starting from char 0, 1, 2 etc

  INPUT: String
  OUTPUT: Array of Strings
  RULES? (explicit/implicit)
    create substrings on 0-4, then 1-4, then 2-4, then 3-4, then 4
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):

DATA STRUCTURES:
  input, output, rules, constants?

ALGORITHM (review the hardest example out loud):
  initialize result array
  get substrings of input: increase the starting position, go to end
    iterate through numbers from 0 to string final index char number (length-1)
    get a slice of the string from (index) to end of string
  for each of those, get substrings with same start, increasing to end
    (leading substrings method)
    returns array of substrings
  push substring arrays to result array
  flatten the array and return it


CODE!
=end
