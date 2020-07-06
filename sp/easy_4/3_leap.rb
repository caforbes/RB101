def leap_year?(year)
  if year % 100 == 0
    year % 400 == 0
  else
    year % 4 == 0
  end
end

# assume input: a year greater than 0
# rules
  # if year divisible by 100:
    # if divisible by 400 = yes
    # else = no
  # else if year divisible by 4 = yes

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
