def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

=begin
PROBLEM:
  INPUT: String
  OUTPUT: Boolean
  RULES? (explicit/implicit)
    - return true only if all chars are uppercase alphabetic or non-alphabetic
    - return true if input is empty
    - return false if contains a lowercase char
  QUESTIONS: (input types? new/old object? empty input?)
    n/a

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  String --> Boolean

ALGORITHM (review the hardest example out loud):
  compare input with force-uppercased input
  if the same, return true, else false

CODE!
=end
