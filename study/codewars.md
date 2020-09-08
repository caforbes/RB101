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