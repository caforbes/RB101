# Variables as pointers


Variables are not values, stored in memory. Instead they point to various values in memory. Furthermore, they point only to values -- they do not point to other variables.


## Assignment


Variable assignment is the initialization of a new name to reference a certain object. The contexts where that name can be used are dependent on the scoping rules of the variable being initialized (a local variable, CONSTANT, @@class variable).


An expression like `a = b` might be thought to say that `a` will refer to whatever `b` refers to, even if `b` is then subsequently changed to refer to something else. In fact, it means that `a` will refer to whatever `b` refers to _currently_, and that if `b`'s reference is changed, `a` will continue to refer to what `b` originally did.


## Reassignment


Reassignment changes the reference of a variable from its currently referenced object to a new object. It does not change the value of the original object. When a variable is reassigned to a new object, the old object remains in memory as it was. It simply cannot be referenced with that alias anymore.


[What is the difference between variable reassignment and mutation?](@card/nhvkupS5hvkp97f)


## Parameters


Parameters are special variables whose reference is initially defined upon method invocation. The arguments that a method is passed receive special variable names with which they can be referenced for the duration of the method.


```
def method(param)
  param = 'new value'
end
```
When an argument is passed to a method by means of a variable name, the parameter is not assigned to the variable name (reassignment of the parameter doesn't affect the reference of the external variable). The parameter is directed to the object itself, and has no way of modifying the reference of the variable name in the external context.
