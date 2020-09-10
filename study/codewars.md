# RGB To Hex Conversion (5kyu) - 2020-09-08

The rgb function is incomplete. Complete it so that passing in RGB decimal values will result in a hexadecimal representation being returned. Valid decimal values for RGB are 0 - 255. Any values that fall out of that range must be rounded to the closest valid value.

Note: Your answer should always be 6 characters long, the shorthand with 3 will not work here.

The following are examples of expected output values:

```ruby
rgb(255, 255, 255) # returns FFFFFF
rgb(255, 255, 300) # returns FFFFFF
rgb(0,0,0) # returns 000000
rgb(148, 0, 211) # returns 9400D3
```

## PEDAC

Problem
- input: 3 integer values
	- valid values are 0-255
	- need to validate those outside this range
- output: hex value as string
- rules:
	- round all input values to 0-255
	- output has six string chars, no #

Data structure
- Integers -> Array -> String

Algorithm
- put all input values in a 3-element array
- transform all values to nearest integer in 0-255 range
	- is it an integer? if not, make it so
	- is it outside 0-255? if not, round it to nearest edge
		- if less than 0, use 0
		- if greater than 255, use 255
- reformat 0-255 value as a 2-char hex value
	- convert to string (base 16)
	- if length is not 2, prepend a 0
- join all 3 string values
- return joined string


# First non-repeating character (5kyu) - 2020-09-10

Write a function named `first_non_repeating_letter` that takes a string input, and returns the first character that is not repeated anywhere in the string.

For example, if given the input `'stress'`, the function should return `'t'`, since the letter t only occurs once in the string, and occurs first in the string.

As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input `'sTreSS'` should return `'T'`.

If a string contains all repeating characters, it should return an empty string (`""`) or `None` -- see sample tests.

```ruby
first_non_repeating_letter('a') == 'a'
first_non_repeating_letter('stress') == 't'
first_non_repeating_letter('moonmen') == 'e'
first_non_repeating_letter('') == ''
first_non_repeating_letter('aa') == '' # ?
```

## PEDAC

Problem 
- Input: string (may be empty, any case)
- Output: 1-char letter
- Rules:
	- return the first letter that does not appear elsewhere in the word, regardless of case
	- return the letter in its original case
	- empty input string gives empty result
	- what happens if there are no unique letters? -- return empty?

Data structure
- Strings, case manipulation

Algo
- create an array of all lowercase characters of the input string
- iterate through the array with reference to the index
- for each lowercase character, count how many times it appears in the array
- if it appears only one time total, return the original character from the string with that index (retrieves original case)
- if no candidate characters are found, return an empty string


# Mexican Wave (6kyu) - 2020-09-10

In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up. 

1.  The input string will always be lower case but maybe empty.
2.  If the character in the string is whitespace then pass over it as if it was an empty seat

```ruby
wave("hello") # => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
wave("") # => []
wave("   gap   ") # => ["   Gap   ", "   gAp   ", "   gaP   "]
```

## PEDAC

Problem
	- Input: String (all lowercase, maybe empty)
	- Output: Array of Strings (or empty)
	- Rules:
		- output strings will be the same as input except for case
		- number of elements in the array equals length of the array sans space characters
		- each string has 1 capital letter
		- capital letter is at index 0, then 1, 2, 3 etc
		- empty string returns empty array
		- space char can't be uppercased, doesn't count

Data structure
	- String -> Array
	- play with array of chars, transform 1 char to uppercase?

Algo
	- create empty results array
	- perform the following operation a number of times equal to input string length
		- create an array of characters in the input string
		- take the number of the current iteration, starting from 0
		- make the character at that position uppercase, unless it's a space, in which case skip to next iteration
		- join the array of characters into a string
		- add the string to the results array
	- return the results array

## 17:52