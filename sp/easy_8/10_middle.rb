def center_of(string)
  result = string.dup
  while result.length > 2
    result[0], result[-1] = '', ''
  end
  result

  # center = string.size / 2
  # case
  # when string.empty?
  #   ''
  # when string.size.odd?
  #   string[center]
  # when string.size.even?
  #   string[center-1, 2]
  # end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
p center_of('') == ''

str = "string"
p (center_of(str).object_id == str.object_id) == false


=begin
PROBLEM:
  INPUT: String
  OUTPUT: String (New - 1-2 chars only)
  RULES? (explicit/implicit)
    - for input string of odd # of chars, return middle char
    - for input string of even # of chars, return middle 2 chars
    - all characters count, incl punctuation/whitespace
  QUESTIONS: (input types? new/old object? empty input?)
    behavior with empty string? (return empty string)

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  Strings...

ALGORITHM (review the hardest example out loud):
  options; loop taking chars off the ends of a copy, or identify middle slice

  LOOP:
  create a copy of the string
  if the string is more than 2 characters, remove the first and last characters
    repeat
  return the final 0-2 character string

CODE!
=end
