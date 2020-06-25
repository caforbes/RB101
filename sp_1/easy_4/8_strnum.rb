DIGITS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0,
}

def string_to_integer(str)
  digits = str.chars.map { |char| DIGITS[char] }
  digits.reverse.map.with_index { |n, place| n * (10**place) }.sum
end

# def string_to_signed_integer(str)
#   if ['+','-'].include?(str[0])
#     sign = str[0]
#     str = str[1..-1]
#   else
#     sign = '+'
#   end

#   sign == '+' ? string_to_integer(str) : -string_to_integer(str)
# end

def string_to_signed_integer(str)
  if str[0] == '-' then positive = false
  else positive = true
  end

  result = string_to_integer(str.delete('+-'))
  positive ? result : -result
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
