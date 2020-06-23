def color_valid(color)
  color == "blue" || color == "green"
end

p color_valid("blue") == true
p color_valid("green") == true
p color_valid("red") == false
p color_valid("") == false
