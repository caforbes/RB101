# Truthiness


In Ruby, any expression can be evaluated to a boolean-like value in the context of a conditional. This is because all objects and expressions have return values, and all values being able to be evaluated as true or false in a boolean context. This property of being _evaluated to_ a boolean value while simultaneously not being a boolean, having another value entirely, is the property of **truthiness**.


* The booleans `true` and `false` evaluate as expected, and are of the object class Boolean.
* The object `nil` evaluates to `false` in a boolean context (but is not a boolean).
* All other objects evaluate to `true` in a boolean context (but are not booleans). Yes, everything--including `0`--evaluates to `true` ("is truthy").


[What does it mean for a value to be truthy?](@card/MethRz0LCARMNrm)
[What kind of expressions can conditional operators (e.g. if) evaluate?](@card/KtWGw037ysPcfNF)
[What is the difference between what these if statements will evaluate?](@card/uBlJm0UAYrNUZS1)
