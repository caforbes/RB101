def double_consonants(string)
  chars = string.split('')
  doubled_cons = chars.map { |char| consonant?(char) ? char * 2 : char }
  doubled_cons.join
end

def consonant?(char)
  return false if char.length != 1
  /[a-z]/i.match?(char) && /[^aeiou]/i.match?(char)
end

p consonant?('a') == false
p consonant?('A') == false
p consonant?('!') == false
p consonant?('') == false
p consonant?('c') == true
p consonant?('C') == true
p consonant?('cc') == false

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

=begin
PROBLEM:
  double only the consonant characters in the string

  INPUT: String
  OUTPUT: New String
  RULES? (explicit/implicit)
    return a new string with some characters doubled
    double iff a consonant character (excl punctuation, whitespace, vowels, dig)
    vowels = aeiou
  QUESTIONS: (input types? new/old object? empty input?)

EXAMPLES (manually check them):

DATA STRUCTURES:
  String --> Array of Strings --> String

ALGORITHM (review the hardest example out loud):
  split the string into array of characters
  transform the array
    *identify if a character is a consonant
      matches [a-zA-Z]
      also matches [^aeiou]
    if so, convert it to a doubled character
  join the array of some-doubled consonants
  return the array

CODE!
=end
