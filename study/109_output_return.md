# Output vs Return


Methods can do three things: return a value, output a value, and mutate an object. All methods return a value; if this value is useful and meaningful, it's best if they not do one of the other two, and if they do one of the other two they should only do one. But this is a matter of design.


## Return values


All methods have a return value, either implicitly or explicitly. If all else, the last line of the method will determine the return value. This value is handled within the program: it may be saved to a variable or input to another method call, and otherwise it is thrown away.


The return value of a line of code is not output with `ruby` in the terminal, but is shown when using `irb`.


## Output


If a method outputs something, it prints it to the terminal when the line of code is run, no matter whether `ruby` or `irb` is used.


The methods that produce this behavior are `print`, `puts`, and `p`. Each of these, being a method, also has a return value: the first two return `nil` while `p` returns its argument.


[What is the difference between the printing commands print, puts, and p?](@card/CAaF5WRmcD2S39H)
