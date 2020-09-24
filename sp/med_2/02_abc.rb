=begin
PROBLEM:
  INPUT: String
  OUTPUT: Bool
  RULES? (explicit/implicit)
    - provided a list of spelling blocks each containing 2 letters
    - input word may use only one letter per block
    - if so, success
    - if input word requires two letters from a block, fails
    - block letters are uppercase, input letters may be any case
    - evaluation is case-insensitive
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  Constant: Array of Strings for spelling block
      Could also have done hash with whatever keys, array of block chars
  String -> Array -> Boolean

ALGORITHM (review the hardest example out loud):
  store spelling block letters as 2-char strings in an array
  iterate through the input characters
  iterate through the set of spelling blocks
    iff the block contains the uppercased word character, save it
  if you found a block, delete it from the array
  otherwise return false
  return true if all iterations go forward successfully

  map an array of the word characters to their associated spelling blocks
    iterate through the spelling block array
    if it contains the uppercased character, transform to this value
  return true if mapped spelling block array is same as array with only uniq blocks


CODE!
=end

def block_word?(word)
  blocks = %w(BO, XK, DQ, CP, NA, GT, RE, FS, JW, HU, VI, LY, ZM)

  # blocks_used = word.chars.map do |char|
  #   the_block = nil
  #   blocks.each { |block| the_block = block if block.include?(char.upcase) }
  #   the_block
  # end

  # blocks_used == blocks_used.uniq

  word.chars.each do |char|
    the_block = blocks.reduce(nil) do |selected, block|
      block.include?(char.upcase) ? block : selected
    end

    if the_block
      blocks.delete(the_block)
    else
      return false
    end
  end
  true
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
