def word_sizes(string)
  # cleaned = strip_to_alph(string)
  # counts = Hash.new(0)
  # cleaned.split.each { |wd| counts[wd.length] += 1 }

  counts = Hash.new(0)
  string.split.each do |wd|
    clean_wd = wd.downcase.delete('^a-z')
    counts[clean_wd.length] += 1
  end

  counts
end

# def strip_to_alph(string)
#   stripped_string = ''

#   string.each_char do |char|
#     if char == ' ' || ('a'..'z').include?(char.downcase)
#       stripped_string.concat(char)
#     end
#   end

#   stripped_string
# end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
