def staggered_case(string)
  chars = string.chars.map.with_index do |char, index|
    index.even? ? char.upcase : char.downcase
  end
  chars.join
end

def staggered_case_fe(string, start_upper=true)
  chars = string.chars.map.with_index do |char, index|
    if index.even?
      start_upper ? char.upcase : char.downcase
    else
      start_upper ? char.downcase : char.upcase
    end
  end
  chars.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('') == ''
p staggered_case_fe('I LoVe lAuNcH ScHoOl!', false) == 'i lOvE LaUnCh sChOoL!'

=begin
PROBLEM:
  return a new string, where case of input string is modified.
  first char is upcase, then downcase, alternating throughout the string
  all even-index characters are upcase, all odd-index are downcase
  non-alph characters are counted but are not modified

  INPUT: String
  OUTPUT: New string

EXAMPLES (manually check them):

DATA STRUCTURES:
  input = string
  --> array of characters
  output = String

ALGORITHM (review the hardest example out loud):
  split the input into an array of characters (not words!!)
  transform/map the array of chars wrt character index
    if the index is odd, return lowercase version of char
    otherwise, return uppercase version of char (incl 0)
    (non-alph characters not affected by up/downcase methods)
  join the transformed character array
  return the joined string

CODE!
=end
