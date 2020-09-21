def staggered_case(string, capital_at_start = true)
  capitalize = capital_at_start
  string.chars.each_with_object('') do |char, result|
    result.concat(capitalize ? char.upcase : char.downcase)
    capitalize = !capitalize unless char.upcase == char.downcase
  end
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
