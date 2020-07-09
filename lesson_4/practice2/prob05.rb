flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

be_index = 0
until flintstones[be_index].start_with?("Be")
  be_index += 1
end

puts "#{flintstones[be_index]} starts with B E at index #{be_index}."
