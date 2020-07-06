def crunch(string)
  # crunched_str = ''
  # string.each_char do |char|
  #   crunched_str.concat(char) unless crunched_str[-1] == char
  # end
  # crunched_str

  string.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
