[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# block => true/false of each integer in the array
# this is determined by receiving each element of the array (assigned the
# parameter variable name num), printing it once, and then evaluating whether
# it is odd with #odd? which returns true or false.

# any? => true (because 1 is evaluated as odd, this is all that's necessary)
# --outputs each number element in the array--
# outputs the first number in the array, which evaluates as odd. At this
# point any? short-circuits, since any further evaluation would be superfluous,
# and no other elements of the array are evaluated or printed.
