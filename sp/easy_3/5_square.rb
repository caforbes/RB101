def multiply(x, y)
  x * y
end

def square(x)
  multiply(x, x)
end

def power(x)
  counter = 0
  res = 1
  until counter == x do
    res = multiply(res, x)
    counter += 1
  end
  res
end

p square(5) == 25
p square(-8) == 64

p power(5) == 5**5
