# Object passing and mutation


## Mutable vs immutable object types


Immutable object types like `Integer`, `Symbol`, `nil` , contain fixed, unique instances of certain values. They cannot be changed by methods; instead, when changing the reference of something from one value to another, you are actually changing what object is referenced.
```
a = 6
b = 6
c = 6
```
All of these variables, though initialized separately, point to the same object `6`, which if probed with `object_id` will make clear that each instance is actually the same object.


Mutable object types like `String`, `Array`, `Hash` behave quite differently. These  objects are neither fixed nor unique. Whenever a new object is created through use of a literal or constructor, it refers to a new object that can be modified independently of any other apparently-identical instances that just happen to have the same value.
```
a = 'string'
b = 'string'
c = 'string'
```
All of these variables, although they refer to objects of the same class and value, actually reference distinct objects, which can be identified by calling `object_id`.


Furthermore, mutable objects can actually be changed over the course of a program, with the changes applying to the same object in memory, not shifting to a new object.


## Destructive vs non-destructive methods


When methods are called on mutable objects, they have the possibility of mutating/changing the value of that object. When this happens, the method is called 'destructive', and the process 'mutating the caller'.
```
str = 'hi'
puts str    # => 'hi'
str.upcase!
puts str    # => 'HI'
```
In Ruby, destructive methods are often distinguished from non-destructive counterparts with use of the `!` character: `upcase` vs `upcase!`. However, there are also destructive methods with no non-destructive counterpart, which are not labeled with `!`.


[What are two ways to perform string concatenation: non-destructive, and destructive?](@card/eHRF1Jk7VPcstfd)
[What are the values of a and b after the following commands:](@card/yAE289qbe6h1kvS)


Reassignment of an variable to a new object is not the same as mutating the object. Reassignment (typically) points the variable to a new object in memory; the old object can still be referenced by any other existing means available. Mutation of the object changes the object, and those changes will be reflected no matter the context and no matter what variable is used to reference the object. For example, these changes persist outside of methods.


[What is the difference between variable reassignment and mutation?](@card/nhvkupS5hvkp97f)


## Pass by reference vs pass by value


In some languages, it is not possible for methods to mutate the objects that are passed to them as arguments. These languages are **pass-by-value** languages, where copies are always made of objects that are passed as arguments. When a method only receives a copy of an object, not the original object itself, it has no way of directly mutating the object.


Ruby is not this kind of language: methods are able to mutate their arguments. Instead of passing copies of objects as arguments, ruby passes references to objects, allowing a method to locate the object directly. It is a **pass-by-reference** language.*


One thing is a little tricky: true PBR languages can mutate _any_ object type; that is, there is no distinction between mutable and immutable object types. Also, true PBR languages are actually capable of changing the reference of pointers to the object; inside a method, reassignment of a variable to a new object persists on that variable outside a method. Ruby has a mutable/immutable object type distinction, and it also does not allow the mutation of object variables/pointers. This is referred to as **pass-by-reference-value**, in that a variable passed to a method is copied, and points directly to that object; no changes can be made to the variable itself.


[What does it mean to say Ruby is a pass-by-reference-value language?](@card/i8m9RyYBxTmuKq1)
