def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  string.each_char { |char| counts[which_case(char)] += 1 }

  percents = {}
  counts.each do |case_key, count|
    percents[case_key] = percentage(count, string.length)
  end
  percents
end

def which_case(char)
  # if char != char.upcase then :lowercase
  # elsif char != char.downcase then :uppercase
  # else :neither
  # end
  if char =~ /[a-z]/ then :lowercase
  elsif char =~ /[A-Z]/ then :uppercase
  else :neither
  end
end

def percentage(count, total)
  percent = count / total.to_f * 100
  percent == percent.to_i ? percent.to_i : percent.round(2)
end

# p which_case('a') == :lowercase
# p which_case('A') == :uppercase
# p which_case('!') == :neither

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI') == {:lowercase=>66.67, :uppercase=>33.33, :neither=>0}

=begin
Prob:
- input: String
- output: new Hash %lowercase, &uppercase, %neither
- string is not empty
- returned hash values are integers/floats where needed
  - round to 2 digits?
Examples: check
Data:
- string : iterate over chars (array?)
- integers
- hash : 3 entries, symbol + number
Alg:
- initialize hash lower/upper/neither, set each to 0
- iterate over chars in input string
- identify if lower/upper/neither
  - if lowercase =/= current -> uppercase
  - if upcase =/= current -> lowercase
  - else neither
  - return symbol :lowercase, :uppercase, :neither
- increment hash value for each character of that kind
- map hash to new hash (ratios)
  - get the ratio of counted val to totals
    - 25/100 = 25
    - 4/10 = 40
    - 3/8 = 37.5
  - use same case key names
  - divide token by total input string length (total converted to float)
  - re-convert mapped hash to a hash
- return the hash
=end
