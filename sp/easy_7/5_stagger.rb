=begin
PROBLEM:
  INPUT: String
  OUTPUT: new String
  RULES? (explicit/implicit)
    - output string should change case of input, ignores input case
    - start with uppercase, then stagger between lower/upper cases
    - non-letters can't be changed, but stagger should respect them (AaA1A)
  QUESTIONS: (input types? new/old object? empty input?)

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:

ALGORITHM (review the hardest example out loud):
  create flag to use a capital letter, initial value to true
  create empty result string
  iterate through characters of the string
  for each character, to result add capital if flag is true, lowercase if flag is false
  toggle the flag
  return the result string

CODE!
=end

def staggered_case(string, capital_at_start = true)
  capitalize = capital_at_start
  string.chars.each_with_object('') do |char, result|
    result.concat(capitalize ? char.upcase : char.downcase)
    capitalize = !capitalize
  end
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
