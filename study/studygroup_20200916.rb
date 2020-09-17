# Have the method letter_changes(str) take the str parameter being passed and
# modify it using the following algorithm. Replace every letter in the string
# with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
# Then return this modified string.

=begin
I: String
  - may be alphabetic or numeric or whatever, all chars ok
O: String
  - mutate in place
Rules
  - all letter chars should be replaced with 3rd next letter
  - ignore/don't change digits/punct
  - Z cycles back to A
  - letters keep their case

Algorithm
  - save upper and lower alphabets as constant arrays [a, b, c...] / [A, B, C...]
  - iterate through array of characters of the string, with index
  - for each character, find the 3rd letter following in the alphabet array
    - if char is non-alphabetic, it's the same character
    - if the letter is in the lowercase alph array:
      - get the index of it in the alph array
      - add 3
      - if the new index you get is equal/greater to the array length, subtract array length
      - return the character at this index
    - same process if the letter is in the uppercase array
  - replace the char at that index in the original string with the new letter
  - after iterating through all characters, return original (mutated) string
=end

UPPER_LETTERS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
LOWER_LETTERS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def letter_changes(str)
  str.chars.each_with_index do |char, index|
    str[index] = third_next_letter(char)
  end
  str
end

def third_next_letter(char)
  return char unless UPPER_LETTERS.include?(char) || LOWER_LETTERS.include?(char)

  alphabet = UPPER_LETTERS.include?(char) ? UPPER_LETTERS : LOWER_LETTERS

  new_position = alphabet.index(char) + 3
  new_position -= alphabet.size if new_position >= alphabet.size

  alphabet[new_position]
end

# p third_next_letter('c') == 'f'
# p third_next_letter('Z') == 'C'

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')


# MINH

# def letter_changes(string)
#   alphabet = ("A".."Z").to_a + ("a".."z").to_a
#   codes = ("D".."Z").to_a + ("A".."C").to_a + ("d".."z").to_a + ("a".."c").to_a
#   hsh = alphabet.zip(codes).to_h # hash to translate letters

#   # string.each_char
#   string.each_char.with_index do |_, index|
#     if alphabet.include?(string[index])
#       string[index] = hsh[string[index]]
#     end
#   end

#   string
# end
