# Lesson 5: blocks

## EXERCISE 3

- call the method map on the nested array
- map initializes a block
- sub-arrays of nested array passed to the block and assigned the local variable arr
- for each iteration of the block:
	- call first method on the sub array, returns element at index 0 (for each)
	- call puts method, uses the return value of first method (element at index 0)
	- puts has the side effect of outputting the string value of the 0-element (1, 3) 
	- puts each time returns nil: this value is not used.
	- then call first method again on the sub-arrays, returning each element at index 0
	- this value is returned by each iteration of the block and used by map
- map constructs a new array out of the values returned by the block and returns the new array: [1, 3]
