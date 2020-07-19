def swapcase(string)
  characters = string.chars.map do |char|
    case char
    when 'a'..'z'
      char.upcase
    when 'A'..'Z'
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
p swapcase('') == ''

=begin
PROBLEM:
  write new method
  input a string, return a new string
  swap the case of every character: lower -> up and up -> lower
  don't just use swapcase lol

  INPUT: string
  OUTPUT: New String
  RULES? (explicit/implicit)
    uppercase char -> lowercase char
    lowercase char -> uppercase char
    all other chars the same
  QUESTIONS: (input types? new/old object? empty input?)
    empty string should be the same?

EXAMPLES (manually check them):

DATA STRUCTURES:
  String -> Array -> String

ALGORITHM (review the hardest example out loud):
  split input string into array of characters
  transform/map character array to swapped cases
    evaluate if char is uppercase, lowercase or other
    if uppercase, return lower case
    if lowercase, return upper case
    if neither, return same
  join transformed character array into string
  return joined string

CODE!
=end
