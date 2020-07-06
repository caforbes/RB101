a = %w(a b c d e)

# Array#fetch

puts a.fetch(7)
# IndexError
# because index is out of bounds
puts a.fetch(7, 'beats me')
# 'beats me'
# uses supplied default value because out of bounds
puts a.fetch(7) { |index| index**2 }
# '49'
# evaluates block on 7 because out of bounds