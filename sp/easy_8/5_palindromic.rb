def palindromes(string)
  substrings(string).select do |substr|
    substr.length > 1 && substr == substr.reverse
  end
end
def palindromes_fe(string)
  # returns original substring, not normalized version
  substrings(string).select do |substr|
    normalized_str = substr.downcase.gsub(/[^a-z]/, '')
    normalized_str.length > 1 && normalized_str == normalized_str.reverse
  end
end

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

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
p palindromes('') == []

=begin
PROBLEM:
  return array of all substrings of an input string that are palindromes
  use previous substrings method

  INPUT: String
  OUTPUT: Array of Strings
  RULES? (explicit/implicit)
    palindrome:
      string which reads exactly the same forward and reversed
      case-sensitive, includes all characters
      a palindrome is at least two characters long
    if there are no palindromic substrings, return an empty array
  QUESTIONS: (input types? new/old object? empty input?)
    what happens if the input is an empty string? --> return empty array

EXAMPLES (manually check them):

DATA STRUCTURES:
  input, output, rules, constants?

ALGORITHM (review the hardest example out loud):
  get an array of all substrings of the input string (done)
  check every item to see whether it is a palindrome
    is the substring more than 1 character long?
    is it the same backwards and forwards?
  return a new array containing only palindromes


CODE!
=end
