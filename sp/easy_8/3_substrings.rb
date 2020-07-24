def leading_substrings(string)
  substring = ''
  string.chars.each_with_object([]) do |char, substr_array|
    substring += char
    substr_array << substring
  end
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
p leading_substrings('') == []

=begin
PROBLEM:
  INPUT: String
  OUTPUT: Array of Strings
  RULES? (explicit/implicit)
    leading substring:
      start from first letter
      for each element in the array, add another letter
      until you get to the whole string
    last element in the array is the same as the input string
    let's assume that all the strings are new objects, not the input string
  QUESTIONS: (input types? new/old object? empty input?)
    what should be returned from empty string?
    empty array or array with empty string? (let's do empty array)

DATA STRUCTURES:
  I - String
  O - Array of Strings

ALGORITHM (review the hardest example out loud):
  initialize new empty array
  initialize carrier string
  iterate through the characters of the string
    each time, reassign carrier string to include that character at end
    add the current carrier string to the array
  return the array

  other options: get increasingly large slices of the string

CODE!
=end
