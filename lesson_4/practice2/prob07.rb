statement = "The Flintstones Rock"

char_counts = Hash.new(0)
statement.each_char { |char| char_counts[char] += 1 }

p char_counts
