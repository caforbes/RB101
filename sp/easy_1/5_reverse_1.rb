def reverse_sentence(str)
  str.split.reverse.join(" ")
end



# input String
# output String with words in reverse order
# do not reverse the characters in the words, but the words in the string
# no change to case necessary
# should also work on an empty string

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# String -> Array
# Array -> String

# split the input string into words in an array by spaces
# reverse the order of the array
# join the array into a string with single space