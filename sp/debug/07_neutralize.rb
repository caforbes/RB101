def neutralize(sentence)
  words = sentence.split(' ')
  words.clone.each do |word|
    words.delete(word) if negative?(word)
  end
  # words.reject! { |word| negative?(word) }

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

=begin
The issue is: we are iterating over an array while simultaneously mutating it.
When we delete one word from the array, and then move to the element with the
next highest index, we skip over a word that takes the index of the one that
has been deleted.

Instead of iterating over the object we mutate, we should iterate over a copy
that will remain unchanged, and mutate the original. Or, we can delete all the
negative words in one fell swoop, rather than by iterating.
=end
