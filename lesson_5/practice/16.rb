
def new_uuid
  sections = [8, 4, 4, 12]

  uuid = sections.map do |no_of_chars|
    hex_string = ''
    no_of_chars.times { hex_string.concat(random_hex_char) }
    hex_string
  end

  uuid.join('-')
end

def random_hex_char
  format('%x', rand(15))
end

p new_uuid

=begin
PROBLEM:
  create a string consisting of 32 hex characters (broken w hyphens)

  INPUT: n/a
  OUTPUT: String
  RULES? (explicit/implicit)
    8 hex - 4 hex - 4 hex - 12 hex
    hexadecimal char = '0123456789abcde'
  QUESTIONS: (input types? new/old object? empty input?)
    how to find a random hex character

EXAMPLES (manually check them):
"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

DATA STRUCTURES:
  Strings, Arrays

ALGORITHM (review the hardest example out loud):
  create empty uuid array
  create array of integers 8 4 4 12 for sections of uuid
  map integers to strings of that many hex characters
    create an empty string
    concatenate a new hex char that many times to the string
    return the string
  join array of strings with hyphens

  produce random hex character
    get random int from 0-15
    format as hexadecimal char

CODE!
=end
