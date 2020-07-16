def word_cap(string)
  titlecased = string.split.map do |word|

    # word.capitalize

    # word[0].upcase + word[1..-1].downcase

    new_case_word = ''
    counter = 0
    while counter < word.size
      case counter
      when 0
        new_case_word << word[counter].upcase
      else
        new_case_word << word[counter].downcase
      end
      counter += 1
    end
    new_case_word

  end

  titlecased.join(' ')
end

# PROBLEM:
  # titlecase a string, return new string

  # INPUT: String containing words (split by spaces)
  # OUTPUT: New String with same value different case
  # RULES? (explicit/implicit)
    # word = split by space, include punctuation in word
    # titlecase = first character is upcase, rest are downcase
    # --> don't preserve original case at alllll
  # QUESTIONS: (input types? new/old object? empty input?)
    # should work on empty string also

# EXAMPLES (manually check them):
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
p word_cap('') == ''

# DATA STRUCTURES:
  # input -> string
  # --> array of strings (words)
  # output -> string

# ALGORITHM (review the hardest example out loud):
  # split the string into words by space character
  # map array of words to array of capitalized words
  # join titlecase array with spaces

# CODE!
