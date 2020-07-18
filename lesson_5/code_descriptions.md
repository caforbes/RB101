# Lesson 5: blocks

## EXAMPLE 3

- call the method `map` on the nested array
- `map` initializes a block
- sub-arrays of nested array passed to the block and assigned the local variable `arr`
- for each iteration of the block:
	- call `first` method on the sub array, returns element at index 0 (for each)
	- call `puts` method, uses the return value of `first` method (element at index 0)
	- `puts` has the side effect of outputting the string value of the 0-element (1, 3) 
	- `puts` each time returns `nil`: this value is not used.
	- then call `first` method again on the sub-arrays, returning each element at index 0
	- this value is returned by each iteration of the block and used by `map`
- `map` constructs a new array out of the values returned by the block and returns the new array: [1, 3]

## EXAMPLE 4

- begins with variable assignment: new local variable `my_arr` is initialized and set to the value of the following expression
- `each` method is called on nested array. note that `each` always returns its caller so the value of `my_arr` will be this nested array object
- `each` initializes a block at lines 1-7
	-	return value of this block is ultimately ignored
	- in the block, local variable `arr` is initialized and assigned to each sub-array
	-	`each` method called on the sub-arrays
		-	invokes another block on lines 2-6
		-	in the second block, new local variable `num` is initialized and assigned to the elements in the sub array
		-	conditional statement on lines 3-5
			-	evaluates whether `num` (element in sub-array) is greater than 5
			- if so, line 4 is run
			-	here we invoke the method `puts` on `num`
			- side effect of this method is to output values (18, 7, 12)
			- each invocation of `puts` returns `nil`
			- consequently the conditional statements always return `nil`, whether evaluated as true or false
		- return value of inner block is always `nil`, but this is not used by #each
	- return value of outer block is [always `nil`] the sub-array returned by `each`, but again not used by outer invocation of `each`
- `my_arr` assigned to the value returned by `each`, which is its caller [[18, 7], [3, 12]]

1		variable assignment with `my_arr` (returns assigned array [[18, 7], [3, 12]])
1 	`each` method invocation (returns calling nested array, used in variable assignment)
1-7	block initialized by `each`, `arr` variable assignment (returns subarrays, ignored)
2		`each` method invocation (returns subarray, returned by block)
2-6	block initialized by `each`, `num` variable assignment (returns `nil`, ignored)
3-5 conditional statement (always returns `nil`)
3		comparison with `>`
4		`puts` method invocation (outputs 18, 7, 12 -- returns `nil`, used by conditional)

`=> [[18, 7], [3, 12]]`

## EXAMPLE 5

1 	invocation of inner `map` method
		- operates on nested array [[1, 2], [3, 4]]
		- returns new array containing new sub-arrays
		- final return value of program [[2, 4], [6, 8]]
1-5	block
		-	operates on sub-arrays assigned variable `arr`
		- returns new arrays with elements multiplied by 2 (from block)
		- return value passed to outer `map`
2 	invocation of inner `map` method
		- operates on sub-arrays `arr`
		- returns new arrays with elements multiplied by 2
		- return value passed to outer block
2-4	block
		- operates on elements of sub-arrays, assigned variable `num`
		- returns new sub-arrays, passed to inner `map`
3		method invocation with `*`
		- operates on element of sub-array (`num`) and `2`
		- returns integer values (passed to block)

=> [[2, 4], [6, 8]]

TIPS:
- first explain what the code returns
- then explain the overall goal of the code
- then explain the precise steps taken to achieve the result
	- line
	- action
	- object
	- side effect
	- return value
	- use of return value

## EXAMPLE 6

The goal of this code is to return a list of hashes where, for all pairs in the hash, the key matches the first letter of the hash. The return value is 

`=> [{ :c => "cat" }]`

1		We begin with an array of hashes and call the `select` method on it. This method invokes a block and returns a new array of all elements where the block evaluates to true. This is only the element hash `{ c: 'cat' }`

1-5	An outer block operating on the sub-hashes (via local variable `hash`). It returns the boolean return values of the `all?` method and passes it to `select`.

2		Invocation of the `all?` method. It operates on each of the sub-hashes. It invokes a block, and considers the truthiness of the return value of the block to return a boolean, which is passed to the outer block.

2-4 An inner block, operating on the key/value pairs contained in the sub-hashes (through initialized variables `key` and `value`). Its return value, a boolean, is passed to and used by the `any?` method.

3		Invocation of the `==` comparison method. It operates on the first character of each hash value, with the argument a string version of `key`. It returns a boolean (`true` if the first value character matches the key), which is passed to the block.

3		Invocation of `String#[]`. It operates on each hash value string and takes the integer `0` as its argument, and returns a single character string at that index for use by the `==` method.

3		Invocation of `to_s` method. It operates on the key symbol of each hash and returns a new string, passed to and used by the `==` method.

The important evaluation part of this code occurs on line 3, where for each key/value pair, it is determined whether the key (converted to a string with `to_s`) matches the first character of the value (retrieved with `String#[]`). This value is passed to the block initialized and evaluated by `all?`, which properly evaluates to true only when all elements in a hash return `true` for that operation. Finally, `select` returns only those hashes which `all?` evaluates to `true`.

>> If we used `any?` instead, we would change the behavior of `select` to return hashes where any key matched the first character of the value, rather than hashes where all pairs had that property. The first hash in the sub-array would evaluate to true under `any?`, but not `all?`.

...

## EXAMPLE 10

The goal of this code is to increment every number in a double/triple nested array. The code successfully returns:

`=> [[[2, 3], [4,5]], [6,7]]`

We begin with a call to an outer `map` method (line 1). This method operates on each of the two sub-arrays `[[2, 3], [4,5]]` and `[6,7]`. Based on the return value of the block it initializes, it returns a new transformed array returned at the end of the program.

The outer block (lines 1-11) operates on the sub-arrays and passes its return value (from an inner call to `map`) to the outer `map` for transformation.

The inner `map` invocation (line 2) operates on the elements of the sub-arrays, which are either themselves arrays (in the first sub-array) or integers (in the second sub-array). It performs transformation on the level 2 sub-arrays and returns new sub-arrays to the outer block.

The inner block (lines 2-10) operates on the array and integer elements of the sub-arrays. It passes its return value, retrieved from the conditional statement, to the inner `map`.

Inside the inner block is a conditional statement (lines 3-9). This statement returns the transformed value of the sub-arrays' elements, depending on the element type. The return value is passed to the inner block.

A crucial part of the conditional is evaluation of the type of the elements through a call to `==` (line 3). It operates on the size of the string value of the element (through a chained call to `to_s.size` on the element) and the argument `1`, returning a boolean value that identifies whether the element is an integer or string. This value is passed to the conditional statement for evaluation.

The iteration/transformation occurs in the conditional statement. On line 4, after the type-evaluating conditional evaluates to `true`, recognizing an integer, there is a call to `+`, which operates on the integer element and `1` to produce an incremented element.
Within the else clause, the elements under evaluation are arrays. Instead of directly calling `+`, there is a third invocation of `map` on line 6, which transforms the third-level sub-arrays. The return value of `map` is passed to the conditional and inner block.
The third inner `map` initializes a block from lines 6-8. Within the block we see a call to `+` on line 7 with the inner integer element and `1` as arguments; this is passed to the block, and returned to `map`, which returns a transformed third-layer sub-array `[6,7]`.

