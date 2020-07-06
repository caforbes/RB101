CURRENCY = "$"

def format_currency(number)
  currency = CURRENCY + format("%.2f", number).to_s
end

puts "What is your bill?"
subtotal = gets.chomp.to_f

puts "What percent do you want to tip?"
tip_percent = gets.chomp.to_f * 0.01

tip = (subtotal * tip_percent).round(2)
total = (subtotal + tip).round(2)

puts "The tip is: #{format_currency(tip)}"
puts "The total bill is: #{format_currency(total)}"

# PROBLEM:
  # INPUTS -->
    # user string value of bill
      # expect positive numbers, integer or float
      # bill should be > 0
    # user string value of tip percentage
      # expect positive numbers, integer or float
      # tip can be 0
      # tip should be converted to a decimal
    # assume these will be typical numbers, no major validation
  # OUTPUTS -->
    # calculation of tip
      # bill * tip percentage
    # calculation of total bill
    # total = bill subtotal + calculated tip
    # display results in a string (print)
  # QUESTIONS?
      # should i worry about validating weird UI?
        # --> ignore (could handle with regex)
  # RULES?
    # IMPLICIT:
      # multiply bill by tip percentage = tip
      # add bill subtotal and tip = total bill
  # IDEAS?
      # should i worry about formatted currency numbers
        # --> challenge: format with two floating digits

# EXAMPLES / TEST CASES:
  # INCLUDE EXPLICIT EXAMPLE
  # "200" bill, "15" percentage == 30.0 tip, 230.0 total
  # "200" bill, "0" percentage == 0.0 tip, 200.0 total
  # "20.50" bill, "11.5" percentage == 2.36 tip, 22.86 total

# DATA STRUCTURES:
  # INPUT -->
    # strings from user
    # become floats
  # OUTPUT -->
    # display as string

# ALGORITHM / INSTRUCTIONS:
  # prompt user to enter the amount of the bill
    # save this to a variable
    # input validation? (skip)
      # use regex to lift digits and one point
        # /\d*\.\d*/ + /\d/
    # convert the string to a float
      # input validation? (skip)
  # prompt user to enter the tip percentage
    # save this as a variable
    # convert string to a float
    # multiply percentage value by 0.01 to get decimal value
  # calculate tip amount
    # multiply bill by tip decimal value
    # round to 2 decimals
    # save this to a variable
  # interpolate the tip amount in a statement printed to the user
    # format the amount as currency
      # round the float to 2 decimals
      # convert float to a string
      # prepend string with $ (or other currency)
      # if there is only one digit after the point, add a trailing zero
        # regex: /\.\d$/
  # calculate bill total
    # add tip amount to saved bill amount
    # round the float to 2 decimals
    # save to a variable
  # interpolate the bill total in a statement printed to the user
    # format the amount as currency

  # GO THROUGH THE HARDEST EXAMPLE OUT LOUD

# CODE!