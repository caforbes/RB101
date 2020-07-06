def palindrome?(sequence)
  sequence == sequence.reverse
end

def real_palindrome?(input)
  sequence = input.downcase.gsub(/\W/, '')
  # sequence = input.downcase.delete('^a-z0-9')
  # sequence = input.downcase.chars.select do |char|
  #   ('a'..'z').include?(char) || (0..9).include?(char)
  # end
  palindrome?(sequence)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") #== true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
