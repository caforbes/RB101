hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
VOWELS = 'aeoiu'

hsh.each_value do |word_array|
  word_array.each do |word|
    vowels = ''
    word.chars.each { |char| vowels.concat(char) if VOWELS.include?(char) }
    puts vowels unless vowels.empty?
  end
end

puts "====="

vowels = ''
hsh.each_value do |word_array|
  word_array.each do |word|
    word.chars.each { |char| vowels.concat(char) if VOWELS.include?(char) }
  end
end
puts vowels

puts "====="

hsh.each_value do |word_array|
  word_array.each do |word|
    word.chars.each { |char| puts char if VOWELS.include?(char) }
  end
end
