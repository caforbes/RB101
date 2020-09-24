=begin
PROBLEM:
  INPUT: String
  OUTPUT: Hash
  RULES? (explicit/implicit)
    - hash has three entries, lower upper neither
    - values are the percentage value (Int/Float) of chars of that case in input
    - percentage = count/total (float) * 100
    - return the hash w percentages
    - input is not empty
  QUESTIONS: (input types? new/old object? empty input?)
    - round percentage to max 2 decimals

EXAMPLES (manually check them):

DATA STRUCTURES:
  Hash, String, Integers, Floats
  String/Array -> Hash -> Integers -> Num (I/F) -> Hash

ALGORITHM (review the hardest example out loud):
  create a hash with the 3 keys, values of 0
  iterate through the string characters
    for each character, identify its case
    increment that hash value
  count the total characters in the string / values sum in the hash
  transform the hash of counts to a hash of percentages
    divide the count value by the total characters (float division)
    multiply by 100
    if float/int are the same, return float
    else return float rounded to 2 decimals
  return transformed hash

CODE!
=end

def letter_percentages(string)
  percentages = letter_counts(string).map do |(case_type, count)|
    [case_type, (count / string.length.to_f) * 100]
  end
  percentages.to_h
end

def letter_counts(string)
  counts = {
    lowercase: string.count('a-z'),
    uppercase: string.count('A-Z'),
  }
  counts[:neither] = string.length - counts.values.sum
  counts
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
