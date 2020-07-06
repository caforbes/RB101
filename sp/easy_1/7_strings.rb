def stringy(int)
  str = ""
  int.times do |n|
    n.even? ? str.concat('1') : str.concat('0')
  end
  str
end


# one arg: pos integer
# returns string of alternating 1/0 starting with 1, = length of integer
# smallest input = 1, infinite possible length
# int = desired return string length

puts stringy(1) == '1'
puts stringy(4) == '1010'
puts stringy(6) == '101010'
puts stringy(7) == '1010101'
puts stringy(9) == '101010101'

# Integer -> String

# could be achieved with loops until length of counter,
# or by leveraging times enumerator...
# enumerator block plugs in index starting with 0

# create a string
# the number of times given by the positive input number,
# add either a 1 or 0 onto that string, alternating
  # given a counter starting with 0, print 1 if even and 0 if odd
# return that string


def stringy_2(len,start=1)
  str = ""
  len.times do |n|
    if start == 1
      n.even? ? str.concat('1') : str.concat('0')
    else
      n.odd? ? str.concat('1') : str.concat('0')
    end
  end
  str
end

puts stringy_2(1) == '1'
puts stringy_2(6) == '101010'
puts stringy_2(9) == '101010101'
puts stringy_2(1,0) == '0'
puts stringy_2(4,0) == '0101'
puts stringy_2(7,0) == '0101010'