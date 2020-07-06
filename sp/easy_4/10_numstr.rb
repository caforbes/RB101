DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  str_num = ''
  val = num

  loop do
    digit = val % 10
    val /= 10
    str_num.prepend(DIGITS[digit])
    break if val.zero?
  end

  str_num
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

def signed_integer_to_string(num)
  base = integer_to_string(num.abs)

  if num.positive?
    base.prepend('+')
  elsif num.negative?
    base.prepend('-')
  else
    base
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
