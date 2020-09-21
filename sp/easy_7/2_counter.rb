=begin
PROBLEM:
  INPUT: String
  OUTPUT: Hash = uppercase/lowercase/neither counts
  RULES? (explicit/implicit)
    - output hash has three keys: lowercase, uppercase, neither
    - provide counts based on case of characters in input string
    - return the hash
    - digits/etc must be counted in neither
  QUESTIONS: (input types? new/old object? empty input?)

EXAMPLES (manually check them):

DATA STRUCTURES:
  String
  Hash

ALGORITHM (review the hardest example out loud):
  initialize a hash with the three keys
  for lowercase/uppercase key, set value to count of a-z vs A-Z characters
  for neither key, set value to string length - upper/lower counts
  return hash

CODE!
=end

def letter_case_count(string)
  counts = {
    lowercase: string.count('a-z'),
    uppercase: string.count('A-Z'),
  }
  counts[:neither] = string.length - counts[:lowercase] - counts[:uppercase]
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
