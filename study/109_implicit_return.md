# Implicit return


Every method in Ruby has a return value. That's because, regardless of whether an explicit `return` keyword is used, a method will return the value of the final statement or expression in the method.


These methods have identical return values:
```
def two
  return 2
end
```
```
def also_two
  2
end
```
```
def other_two
  1 + 1
end
```
The first uses an explicit return with the keyword `return`; the other two rely on implicit returns to return the value of the final expression or statement. The second method simply returns the value `2`; the third returns the return value of the `+` method called on its arguments, which evaluates to `2`.


[What is the difference between an implicit and explicit return in a method?](@card/E7fZSAwSw9Gir1U)
