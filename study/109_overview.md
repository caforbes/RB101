# RB109 study guide


## Written assessment


Be able to explain clearly the following topics:

- local variable scope, especially how local variables interact with method invocations with blocks and method definitions
- how passing an object into a method definition can or cannot permanently change the object
- working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc)
- variables as pointers
- puts vs return
- false vs nil and the idea of "truthiness"
- method definition and method invocation
- implicit return value of method invocations and blocks


### Answer guidelines


When answering the questions, you should:

- Explain your reasoning with reference to specific lines in the program. You can use line numbers to refer to specific lines of code where necessary.
- Answer with extreme precision. For example, say "method definition" or "method invocation" as opposed to just "method" (see the section on 'Precision of Language' below for more on this).
- Highlight any specific syntactical conventions or technical observations where relevant.
- Identify the key fundamental concept or concepts being demonstrated in the question.

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

The local variable `greeting` is assigned to the String `'Hello'` on line 1. The `do..end` alongside the `loop` method invocation on lines 3 to 6 defines a block, within which `greeting` is reassigned to the String `'Hi'` on line 4. The `puts` method is called on line 8 with the variable `greeting` passed to it as an argument; since `greeting` is now assigned to `'Hi'`, this is what is output. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block.


### Timing


Anticipate having 20-25 questions to answer in the allotted span of 3 hours (180 minutes). Assuming 23 questions, you have a maximum of __7.5 minutes__ to spend on each question.

- Read the question
- Answer the question with great precision, using markdown
- Test any code examples provided with your answer
- Proofread your answer

There is no timer; you are responsible for managing your own time and turning in the assessment before 180 minutes have passed.


## Interview assessment


...
