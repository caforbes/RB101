def staggered_case(string)
  next_is_uppercase = true
  string.chars.each_with_object('') do |char, result_str|
    if /[a-z]/i =~ char
      add_char = next_is_uppercase ? char.upcase : char.downcase
      next_is_uppercase = !next_is_uppercase
    else
      add_char = char
    end
    result_str.concat(add_char)
  end
end

def staggered_case_fe(string, alph_only=true)
  next_is_uppercase = true

  string.chars.each_with_object('') do |char, result_str|
    if /[a-z]/i =~ char || !alph_only
      add_char = next_is_uppercase ? char.upcase : char.downcase
      next_is_uppercase = !next_is_uppercase
    else
      add_char = char
    end
    result_str.concat(add_char)
  end
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case_fe('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case_fe('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'
