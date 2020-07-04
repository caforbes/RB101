# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []


# INPUT: string
# OUTPUT: array
# RULES:
  # produce substrings of the original string which are palindromes
    # substring: any adjacent set of characters in the word at any position
    # palindromes:
      # same backwards as forwards
      # must be 2+ characters long
      # sensitive to case
  # produce a new array containing the proper substrings of the input string

# basic question: will input always be strings?
