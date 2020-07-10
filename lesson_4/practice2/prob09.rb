def titleize(string)
  words = string.split

  words.map! do |wd|
    wd.downcase!
    wd[0] = wd[0].upcase
    wd
  end

  words.join(' ')
end

def titleize_2(string)
  words = string.split.map(&:capitalize)
  words.join(' ')
end

words = "the flintstones rock"
puts titleize(words)
puts titleize_2(words)
