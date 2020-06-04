# ask user for
  # the amount of the loan
  # duration in years (confirm w months too)
    # calculate months
    # years * 12 = months
  # APR of their loan (confirm percentage + decimal)
    # percentage to decimal: p * 0.01
    # calculate monthly interest
    # APR / 12 = monthly interest
  # these amounts must all be positive integers/floats
# for each, validate with user, and as numbers
# calculate monthly payment with fm given
  # m = p * (j / (1 - (1 + j)**(-n)))
# output the calculated amt for monthly payment to user.
  # round to nearest 2 decimals

p monthly_payment(1200,10,6) == 22.23
p monthly_payment(1200,1,6) == 17.18
p monthly_payment(500000,3.5,30) == 2245.22
p monthly_payment(200000,3.5,30) == 898.09

# Strings -> Int or Float
# convert these back to strings

# welcome user
# ask for amount of loan in currency
  # save to a variable "amount_str"
  # check whether it's a valid nonzero int or float
    # substitute non-digits/point chars for ""
    # int: regex: /^\d+$/
    # float: regex: /\d/ && /^\d*\.\d*$/
    # and greater than zero
    # if not, ask user to try again
  # save as int or float as applicable
  # display loan amt to user to confirm
  # if start with 'y', proceed, else try again
# ask user for years of the loan
  # check whether it's a valid nonzero int or float
    # as above
  # save as int or float
  # convert to months: years * 12, save as integer
  # display year and month amounts to user to confirm
  # if 'Y' proceed, else try again
# ask user for APR percentage
  # save string
  # confirm this is a nonzero int/float
    # as above
    # save as float
    # if not, ask to try again
  # print to user as percentage and decimal
  # wait for 'y' confirmation, else try again
# print "calculating your monthly payment..."
# calculate the monthly payment
  # convert APR to monthly interest: decimal APR / 12
  # convert years to months: years * 12
  # m = p * (j / (1 - (1 + j)**(-n)))
  # round to two decimals
# display result to user
# say goodbye thanks for calculating
