def prompt(message)
  puts(">> #{message}")
end

def user_continue?
  prompt("Does that look right? (Y to confirm)")
  confirm = gets.chomp.downcase

  confirm = confirm.start_with?('y') ? true : false
  prompt("Okay then, let's try again.") unless confirm
  confirm
end

def user_loan_amt
  get_user_value("amount")
end

def user_loan_duration
  get_user_value("duration")
end

def user_apr
  get_user_value("APR")
end

def get_user_value(value_type) # testing
  loop do
    prompt(prompt_user_msg(value_type))
    value = gets.chomp

    if get_number(value).nil?
      prompt("That doesn't look like a number! Try again.")
      next
    elsif get_number(value) <= 0
      prompt("You must enter a positive #{value_type}! Try again.")
      next
    else
      value = get_number(value)
    end

    prompt(confirmation_msg(value, value_type))
    break value if user_continue?
  end
end

def prompt_user_msg(value_type)
  case value_type
  when "amount"
    "Please enter the amount of your loan."
  when "duration"
    "Please enter the duration of your loan in years."
  when "APR"
    "Please enter the APR of your loan as a percentage (e.g. 5%)."
  end
end

def confirmation_msg(input, value_type)
  case value_type
  when "amount"
    "You entered a loan amount of #{input}."
  when "duration"
    "You entered #{input} years (#{y_to_m(input)} months)."
  when "APR"
    "You entered an APR of #{input}% (or #{perc_to_dec(input)})."
  end
end

def get_number(input)
  input = input.chars.select { |c| c.match(/[\d\.-]/) }.join

  if valid_int?(input)
    Integer(input)
  elsif valid_float?(input)
    Float(input + "0")
  end
end

def valid_int?(str)
  str.match(/^-?[\d]+$/)
end

def valid_float?(str)
  str.match(/-?\d/) && str.match(/^-?\d*\.\d*$/)
end

def calculate_m_payment(loan, apr_pct, years)
  interest = (perc_to_dec(apr_pct)) / 12
  months = y_to_m(years)

  res = loan * (interest / (1 - (1 + interest)**(-months)))
  res.round(2)
end

def y_to_m(years)
  (years * 12).to_i
end

def perc_to_dec(percentage)
  percentage * 0.01
end

system("clear") || system("cls")
prompt("Welcome to the Monthly Payment Calculator!")

amount = user_loan_amt
years = user_loan_duration
apr = user_apr

prompt("Calculating your result...")

monthly_payment = calculate_m_payment(amount, apr, years)

prompt("Your payment is #{monthly_payment}/month.")
prompt("Thanks for calculating. Good luck!")
