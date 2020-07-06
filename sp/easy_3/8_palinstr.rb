def palindrome?(sequence)
  sequence == sequence.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

p palindrome?(%w(m a d a m)) == true
p palindrome?([]) == true
