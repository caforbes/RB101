def prompt(msg)
  puts ">> #{msg}"
end

def word_from_user(category)
  prompt("Please enter a(n) #{category}:")
  gets.chomp
end

madlib_list = {
  verb: '',
  noun: '',
  adverb: '',
  adjective: '',
}

madlib_list.each_key do |category|
  madlib_list[category] = word_from_user(category.to_s)
end

puts "I'm a #{madlib_list[:adjective]} #{madlib_list[:noun]} and I wanna #{madlib_list[:adverb]} #{madlib_list[:verb]}."
prompt("LOL, what are you talking about?")


=begin
PROBLEM:
  create a madlibs program that prompts user for:
  verb
  noun
  adverb
  adjective
  and inserts them into a sentence/story, which it prints

  INPUT: get strings from user
  OUTPUT: (print) string
  RULES? (explicit/implicit)
    get strings from user
  QUESTIONS: (input types? new/old object? empty input?)
    do we need valid input? or anything is fine?

EXAMPLES (manually check them):
  (provided test cases
  (any additional examples?)

DATA STRUCTURES:
  Strings
  Hash of words
  String -> print

ALGORITHM (review the hardest example out loud):
  hash of needed word categories and blank strings
  method for getting a word from user, prompted by word category
  for each element in hash, get word of that category from user
  replace empty value with user-provided value



CODE!
=end
