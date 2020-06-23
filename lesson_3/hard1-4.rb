def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  return false unless dot_separated_words.length == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    next if is_an_ip_number?(word)
    return false
  end

  true
end

# return a false condition
# what if there are <4 or >4 components to the address -- should be invalid
