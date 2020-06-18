def factors(number)
  divisor = number#.abs # do you want me to get neg factors for neg numbers?
  factors = []
  while divisor > 0 do
    factors << (number / divisor) if number % divisor == 0
    divisor -= 1
  end
  factors
  # factors.empty? ? nil : factors
end

# loop: so long as divisor is greater than zero
  # see if number/divisor has a remainder of zero
  # if so add divisor to factors
  # iterate divisor -1
# if we started with a number/divisor below zero, nothing is added to factors
# then return nil, otherwise return list of factors

p factors(10)
p factors(0)
p factors(-10)
