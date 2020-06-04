def prompt(message)
  puts(">> #{message}")
end

def valid_int?(str)
  str.match(/^-?[\d]+$/)
end

def valid_float?(str)
  str.match(/-?\d/) && str.match(/^-?\d*\.\d*$/)
end

def get_number(input)
  result = nil
  if valid_int?(input)
    result = Integer(input)
  elsif valid_float?(input)
    result = Float(input)
  end
  result
end

def y_to_m(years)
  (years * 12).to_i
end

def perc_to_dec(perc)
  perc * 0.01
end

def monthly_payment(loan, apr_pct, years)
  interest = (perc_to_dec(apr_pct)) / 12
  months = y_to_m(years)

  res = loan * (interest / (1 - (1 + interest)**(-months)))
  res.round(2)
end

prompt("Welcome to the Monthly Payment Calculator!")

amount_str = ""
amount = nil
loop do
  prompt("Please enter the amount of your loan.")
  amount_str = gets.chomp

  amount = amount_str.chars.select { |c| c.match(/[\d\.-]/) }.join

  if get_number(amount).nil?
    prompt("That doesn't look like a number! Try again.")
    next
  elsif get_number(amount) <= 0
    prompt("You must enter a positive amount! Try again.")
    next
  else
    amount = get_number(amount)
  end

  prompt("You entered a loan amount of #{amount}.")

  prompt("Does that look right? (Y to confirm)")
  confirm = gets.chomp.downcase
  break if confirm.start_with?('y')
  prompt("Okay then, let's try again.")
end

years = 0
months = 0
loop do
  prompt("Please enter the duration of your loan in years.")
  years = gets.chomp

  if get_number(years).nil?
    prompt("That doesn't look like a number! Try again.")
    next
  elsif get_number(years) <= 0
    prompt("You must enter a positive number of years! Try again.")
    next
  else
    years = get_number(years)
  end

  months = y_to_m(years)

  prompt("You entered #{years} years (#{months} months).")

  prompt("Does that look right? (Y to confirm)")
  confirm = gets.chomp.downcase
  break if confirm.start_with?('y')
  prompt("Okay then, let's try again.")
end

apr = 0
apr_dec = 0
loop do
  prompt("Please enter the APR of your loan as a percentage.")
  apr_str = gets.chomp

  apr = apr_str.chars.select { |c| c.match(/[\d\.-]/) }.join

  if get_number(apr).nil?
    prompt("That doesn't look like a number! Try again.")
    next
  elsif get_number(apr) <= 0
    prompt("You must enter a positive number for your APR! Try again.")
    next
  else
    apr = get_number(apr)
  end

  apr_dec = perc_to_dec(apr)

  prompt("You entered an APR of #{apr}% (or #{apr_dec}).")

  prompt("Does that look right? (Y to confirm)")
  confirm = gets.chomp.downcase
  break if confirm.start_with?('y')
  prompt("Okay then, let's try again.")
end

prompt("Calculating your monthly payment...")

result = monthly_payment(amount, apr, years)
prompt("Your monthly payment is #{result}/month.")

prompt("Thanks for calculating. Good luck!")
