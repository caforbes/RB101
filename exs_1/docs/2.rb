require 'date'

# default date: 1582-10-15, 2299161
# puts will print the date object in tihs format #<Date: 2001-02-03 ((2451944j,0s,0n),+0s,2299161j)>

puts Date.new
#  #<Date: 1582-10-15 ((2299161j,0s,0n),+0s,2299161j)>  ??
puts Date.new(2016)
#  #<Date: 2016-01-01 ... >
puts Date.new(2016, 5)
#  #<Date: 2016-05-01 ... >
puts Date.new(2016, 5, 13)
#  #<Date: 2016-05-13 ... >


# Well, first, Date objects print human-readably I guess
# -- puts uses .to_s, not .inspect
# -- this print differently for Date objects
