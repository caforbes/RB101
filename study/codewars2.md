=begin
38. String transformer
(https://www.codewars.com/kata/5878520d52628a092f0002d0/train/ruby)
6 kyu

problem:
  - i: string
  - o: new string
  - reverse the order of words in the input
  - swap the case of all words in the input
  - input contains only alphabetical and spaces
  
data struc:
  - string > array > string

algo:
  - split input string into array of words, using spaces
  - reverse the array
  - transform the reversed array to one with cases swapped
    - swapcase method?
    - iterate over the characters of the word
    - if char is uppercase, lowercase it
    - if char is lowercase, uppercase it
  - join the array with spaces, return it
=end

def transform(string)
  string.split.reverse.map(&:swapcase).join(' ')
end

p transform("Example Input") == "iNPUT eXAMPLE"


=begin
60. Format a string of names like 'Bart, Lisa & Maggie'.
(https://www.codewars.com/kata/53368a47e38700bd8300030d2) 
6 kyu

prob:
  - i: array of hashes
  - o: string of names
  - input hashes in array contain key :name and string values
  - string values contain only letters, period, hyphen
  - output string should join all names with ', ' except last two with ' & '
  - don't mutate any objects
  
data struc:
  - array -> hash -> array -> string

alg:
  - iterate over the input array
  - get the string value from each hash 'name' key and append to an array
  - if array has 2+ elements, reassign the last two to themselves joined with ampersand
  - if new array still has 2+ elements, join all with comma
  - return the joined array

=end

def list(names)
  names = names.map { |name_hash| name_hash[:name] }
  names[-2,2] = names[-2,2].join(' & ') if names.size > 1
  names.join(', ')
end

p list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ]) == 'Bart, Lisa & Maggie'

p list([ {name: 'Bart'}, {name: 'Lisa'} ]) == 'Bart & Lisa'

p list([ {name: 'Bart'} ]) == 'Bart'

p list([]) == ''

# ~ 9:47
