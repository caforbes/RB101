def reverse_words(str)
  arr = str.split.map do |word|
    word.length >= 5 ? word.reverse : word
  end
  arr.join(' ')
end


# input String with 1+ words, no punctuation
# output String with 5+ character words reversed
# 2+ words joined by space
# no need to convert case or work on empty string input

# examples
puts reverse_words('test') == "test"
puts reverse_words('test  ') == "test"
puts reverse_words('Professional') == "lanoisseforP"
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School') == "hcnuaL loohcS"

# String -> Array -> String

# split input string into array of words (substring sep by space)
# map each word to its reverse string if it is 5+ characters long
# else retain original word
# join the transformed array with spaces into a new string