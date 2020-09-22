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


# Multiples of 3 or 5 (6kyu) - 2020-09-20

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once. Also, if a number is negative, return 0(for languages that do have them)

```
test(solution(10), 23)
test(solution(20), 78)
test(solution(200), 9168)
```

## PEDAC

Prob:
- count all numbers which are multiples of 3 or 5 below the input number
- does not count the current number (e.g. up to 10, not including)
- get the sum of all these multiples
- don't repeat multiples, e.g. don't count 15 twice
- return 0 if the input number is negative

Data Str
- range (0...input)
- Array

Algo
- create a range from 0 to the input number, convert this to an array
- filter to only multiples of 3 or 5
- sum these numbers and return the sum

## 8:30


# Break up Camel Case

Complete the solution so that the function will break up camel casing, using a space between words.

```
solution("camel")  ==  "camel"
solution("camelCasing")  ==  "camel Casing"
solution("camelCasingTest")  ==  "camel Casing Test"
```

## PEDAC

Prob:
- input will be a string in camel case
- first letter is lowercase, some subsequent chars are uppercase
- output should insert a space before the uppercase character
- return a new string

Data:
- range to get uppercase chars
- String -> Array of chars -> String

Algo:
- define an array/range containing all uppercase characters
- split string into array of characters
- transform the array of chars:
	- if a character is uppercase, prefix a space to it
- join the transformed characters and return it

## 8:55


# Who likes it? (6kyu)

You probably know the "like" system from Facebook and other pages. People can "like" blog posts, pictures or other items. We want to create the text that should be displayed next to such an item.

Implement a function likes :: [String] -> String, which must take in input array, containing the names of people who like an item. It must return the display text as shown in the examples:

```
likes [] -- must be "no one likes this"
likes ["Peter"] -- must be "Peter likes this"
likes ["Jacob", "Alex"] -- must be "Jacob and Alex like this"
likes ["Max", "John", "Mark"] -- must be "Max, John and Mark like this"
likes ["Alex", "Jacob", "Mark", "Max"] -- must be "Alex, Jacob and 2 others like this"
```

For 4 or more names, the number in and 2 others simply increases.

## PEDAC

Prob:
- input: list of names/strings
- output: string
- calculate how to display the list of names, displaying max 3 of them
- for 0-1 users, use singular "likes"
- for 2+ users, use plural "like"
- for 0 users, list name as "no one"
- for 1 user, list user
- for 2 users, list users split by "and"
- for 3 users, list users split by ", " and "and"
- for 4+ users, list two users split by ", " and number of others remaining

Algo:
- initialize case statement referencing size of users/names array
- 0: "no one likes this"
- 1: "[1] likes this"
- 2: "[1] and [2] like this"
- 3: "[1], [2], and [3] like this"
- 4+: "[1], [2], and [list size -2] like this"
- return the probably-interpolated string

## 9:00


# Sherlock pockets (6kyu) -- 2020-09-21

Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:

```
pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 
```

Write method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (`pockets == nil`), the method should return `nil`.

```
find_suspects(pockets, [1, 2]) # => [:tom, :jane]
find_suspects(pockets, [1, 7, 5, 2]) # => nil
find_suspects(pockets, []) # => [:bob, :tom, :jane]
find_suspects(pockets, [7]) # => [:bob, :tom]
```

## PEDAC

Prob:
- I: Hash, Array of integers
- O: Array of symbols (hash keys), else nil
- Rules
	- input hash contains name symbols as keys
	- input hash has values of array of integers (?)
	- return all names/keys for which the value array contains an element not in the input array
	- if all value arrays have only elements in the input array, or if the input hash is empty, return nil

Algo:
- if hash is empty, return nil
- create empty suspects array
- iterate through the pockets hash
	- if all elements in pocket array (value) are in input array, move to next
	- if not all elements are in input array, add key/name to suspects array
- if suspects array is empty, return nil, else return suspects array

## 18:10


# Write number in expanded form (6kyu)

You will be given a number and you will need to return it as a string in Expanded Form. For example:

```
expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
```

NOTE: All numbers will be whole numbers greater than 0.

## PEDAC

Prob:
- Input: positive integer
- Output: string
- return expanded form with all base ten elements in separate slot
- separated by plus
- if e.g. tens digit is 0, skip that one (no +0)

Data structures:
- Integer
- Array
- String

Algo:
- enter a loop
	- get number modulo placevalue 10
	- subtract remainder from num and save to an array (in first position)
	- multiply place value by 10
	- continue multiplying by 100, 1000, until number is 0
- join array with " + "

- get digits array of original number in reverse order
- multiply each digit by 10^index
- remove all 0 from the array
- reverse the array
- join it with ' + '

## 17:45


# Weight for weight (5kyu) - 2020-09-22

It was decided to attribute a "weight" to numbers. The weight of a number will be from now on the sum of its digits.

For example 99 will have "weight" 18, 100 will have "weight" 1 so in the list 100 will come before 99. Given a string with the weights of FFC members in normal order can you give this string ordered by "weights" of these numbers?

`"56 65 74 100 99 68 86 180 90"` ordered by numbers weights becomes: `"100 180 90 56 65 74 68 86 99"`

When two numbers have the same "weight", let us class them as if they were strings (alphabetical ordering) and not numbers: 100 is before 180 because its "weight" (1) is less than the one of 180 (9) and 180 is before 90 since, having the same "weight" (9), it comes before as a string.

All numbers in the list are positive numbers and the list can be empty.

- It may happen that the input string have leading, trailing whitespaces and more than a unique whitespace between two consecutive numbers
- Don't modify the input

## PEDAC

Prob:
- I: String
- O: new String
- Rules
	- string is of numbers and whitespace
	- original numbers are in value order
	- create a new string with numbers in digit sum order
	- if two numbers have same digit sum order, further sort by string order
	- list string can be empty

Data:
	- Strings
	- Array of strings
	- Array of integers/digits

Algo:
	- split input string by whitespace into string-numbers
	- sort the array by custom criteria
		- split string numbers into characters, convert to digits and sum
		- compare elements by this value
		- if uneven, sort based on this weight
		- if equivalent, then sort based on original string alphabetic order
	- join sorted array of strings with spaces
	- return string

## 15:07


# Simple pig latin (5kyu)

Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.

```ruby
pig_it('Pig latin is cool') # igPay atinlay siay oolcay
pig_it('Hello world !')     # elloHay orldway !
```

## PEDAC

Prob:
- Input: String
- Output: new String
- Rules
	- input words are separated from each other and punctuation by spaces
	- change all words (not punctuation) to pig latin variant
	- move first letter to end and add 'ay'
	- don't change the case of anything, retain it as original case even moved
	- only move first letter, not clusters etc
	- we don't even care about vowels/consonants!!

Data:
	Strings
	Array of Strings

Algo:
	- split string into words based on spacing
	- transform the array of words
	- if all characters are alphabetical, change to pig latin word
		- slice of all but first character + first char + 'ay'
	- else use original word
	- join the transformed array with spaces, and return

## ~11m