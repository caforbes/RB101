require 'date'

puts Date.new  # default start date: -4712-01-01
puts Date.new(2016) #defaults for unspecified: 2016-01-01 etc
puts Date.new(2016, 5)
puts Date.new(2016, 5, 13)

p Date.new  # these appear as ugly object types, unlike the cleaned-up puts
p Date.new(2016)
p Date.new(2016, 5)
p Date.new(2016, 5, 13)
