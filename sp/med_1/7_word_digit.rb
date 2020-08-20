DIGIT_WORDS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9',
}

def word_to_digit(string)
  new_string = string.dup
  DIGIT_WORDS.each do |word, digit|
    new_string.gsub!(/\b#{word}\b/i, digit)
  end
  new_string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p DIGIT_WORDS
=begin
PROBLEM:
  INPUT: string
  OUTPUT: new string
  RULES? (explicit/implicit)
    - words for 0-9 converted to digit character
    - words maybe separated with punctuation, not just spaces
  QUESTIONS: (input types? new/old object? empty input?)
    - convert words containing a number word ("shone") or avoid?
    - same string = new or same object?

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  String
  digits - Hash

ALGORITHM (review the hardest example out loud):
  simple:
    initialize hash of words and their digit char correspondent
    for each key in the hash, operate on copy of the string
      substitute instance of key for value
    return modified copy

  complex:
    make word/digit hash
    for each key in the hash
      create a case-insensitive regex pattern of ([^\W]) + key + ([$\W])
        Regexp.new([^\W]) + key + ([$\W]), 'i')
        "\1#{digit}\2"
      substitute for \1 + val + \2
    return modified copy

CODE!
=end
