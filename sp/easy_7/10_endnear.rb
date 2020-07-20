def penultimate(string)
  words = string.split
  words[-2].to_s
end

def middle(string)
  words = string.split
  length = words.length

  if length.even?
    ''
  else
    words[length / 2]
  end

end

p penultimate('word') == ''
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

p middle('one') == 'one'
p middle('one two') == ''
p middle('one two three') == 'two'
p middle('one two three four') == ''
