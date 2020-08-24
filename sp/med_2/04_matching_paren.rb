def balanced?(string)
  reduced_str = string.dup
  licit_paren = /\((.*?)\)/

  while reduced_str =~ licit_paren
    reduced_str.gsub!(licit_paren, '\1')
  end
  reduced_str.count("()") == 0
end

def balanced_fe?(string)
  reduced_str = string.dup
  licit_parens = [/\((.*?)\)/, /\{(.*?)\}/, /\[(.*?)\]/]

  licit_parens.each do |bracket_pair|
    while reduced_str =~ bracket_pair
      reduced_str.gsub!(bracket_pair, '\1')
    end
  end
  reduced_str.count("(){}[]") == 0
end

=begin
PROB
- check if all open parens have a closing pair and vvsa
- lone paren results in false
- opposite facing parens result in false
- any failure = overall false
- empty strings? ==> true
EXAMPLES
DATA
- String
- check patterns with regex
- return Boolean
ALGOR
- copy string to variable (reduced_str)
- operate on reduced_str copy
- if the string has any () pairs, enter a loop
  - check with /\((.*)\)/ -- greedy or lazy? not sure
  - substitute licit (...) pairs with only the ... content (mutate string)
  - halt when no more licit () pairs
- check if there are any ( or ) in the reduced string
- return true/false
=end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('') == true

p balanced_fe?('What (is) this?') == true
p balanced_fe?('What is) this?') == false
p balanced_fe?('What {is this?') == false
p balanced_fe?('{{What} {is this}}?') == true
p balanced_fe?('{{What}) {is this)}?') == false
p balanced_fe?('Hey!') == true
p balanced_fe?('[Hey!]') == true
p balanced_fe?(']Hey![') == false
p balanced_fe?('What [[is]]] up]') == false
p balanced_fe?('') == true
