# setup the file
# setup the sample of word replacements as arrays in a hash constant
# initialize new_text
# initialize used madlibs
# split the text and replace each madlib category with new word
  # split at each %{
  # split that chunk at first }
  # the first piece should be a category
  # if it matches a category, replace with a random new word from that category
    # get difference of possible madlibs and used madlibs for that category
    # get a random word from the difference array
    # add that word to the used array
    # return the word
  # append new word to new_text
  # append to new_text
  # move to next chunk
# once replacement performed (or if there is none), append chunk to new_text
# output new_text

MADLIBS = {
  noun: %w(cat dog frog mountain pillow cloud fire lizard boyfriend water),
  verb_pres: %w(stands watches eats follows jumps chews bites hugs),
  adjective: %w(gold blue depressed exuberant cuddly soft short sleeping),
  adverb: %w(quickly noisily unexpectedly happily tenderly viciously),
}.freeze

def get_new_madlib(category, used_words)
  cat_key = category.to_sym
  if MADLIBS.keys.include?(cat_key)
    unused_words = MADLIBS[cat_key] - used_words[cat_key]
    new_word = unused_words.sample
    used_words[cat_key] << new_word
    new_word
  else category
  end
end

text = []
File.open("1_madlibs.txt").each { |line| text.push(line) }
text = text.join

madlibbed = ''
used_madlibs = MADLIBS.map { |(category, _)| [category, []] }.to_h

text.split("%{").each do |chunk|
  madlib_and_next = chunk.split("}", 2)

  if madlib_and_next.size > 1
    madlib_and_next[0] = get_new_madlib(madlib_and_next[0], used_madlibs)
  end

  madlib_and_next.each { |inner_chunk| madlibbed.concat(inner_chunk) }
end

puts madlibbed
