# Local variable scope


Method definitions and blocks create new __scope domains__ for local variables. Variables initialized within these domains (in the inner scope) cannot be accessed outside of the domain (in the outer scope).


Other expressions like loops and conditionals do not create new scope domains in this way. Variables initialized inside the loop or conditional can be accessed outside of it. (Be cautious however; unlike the proper loop keywords `for` and `while`, `loop` is a _method_ which takes a block.)


[At what level can a local_variable be declared, accessed, and/or changed?](@card/beQLbdVkrpBSBJv)
[How do method definitions, blocks, and loops differ with respect to scope?](@card/XuCxJXcGpKrYsbt)
[What are the rules of local variable scope with respect to loops?](@card/MwSzZGtjrMVvOgn)


## Local variables in method definitions


Method definitions constitute scope islands for local variables. Variables initialized inside the method scope cannot be accessed outside of the method. Vice versa, variables initialized outside the method scope cannot be accessed inside the method.
[What are the rules of local variable scope with respect to method definitions?](@card/ggNvbMfiwGPZl1W)


## Local variables in method invocations with blocks


Blocks constitute penetrable new scope domains. Variables initialized internal to the block in the inner scope cannot be accessed outside the block scope. However, variables initialized outside the scope of the block can be accessed and changed in the inner block scope.
[What are the rules of local variable scope with respect to blocks and procs?](@card/hm641AL41MNknL1)


Blocks allow the initialization of parameters, which may have the same name as externally-initialized local variables. When this occurs, the new argument passed to the block temporarily overwrites ('shadows') the value to which that variable has been assigned in the outer scope. When the program returns to the outer scope, the value of that variable is returned to what it originally was in the outer scope.
[What is 'shadowing' in variable assignment?](@card/TbnWogxVbYHpCVF)
