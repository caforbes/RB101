def century(year)
  century = ((year - 1) / 100) + 1
  century.to_s + ordinal_suff(century)
end

def ordinal_suff(num)
  digits = num.digits.reverse

  if digits[-2] == 1 then 'th' # 10-19th
  elsif digits.last == 1 then 'st'
  elsif digits.last == 2 then 'nd'
  elsif digits.last == 3 then 'rd'
  else 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'


# input: integer
# output: string
# convert year int to century int
  # ((year-1)/100)+1
  # subtract 1 so 1900-1901 in diff centuries (18-19)
  # divide by 100 to get ... centurylike number
  # but it's actually the one more than that

# add proper ordinal suffix
  # ordered rules
    # 2nd-to-last digit == 1  --> th
    # last digit == 1  --> st
    # last digit == 2  --> nd
    # last digit == 3  --> rd
    # else  --> th
  # 1st
  # 2nd
  # 3rd
  # 4th...20th
