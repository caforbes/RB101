=begin
PROBLEM:
  INPUT: string
  OUTPUT: boolean
  RULES? (explicit/implicit)
    - spelling blocks: pairs of letters
    - if word contains both letters in a block => false
    - otherwise => true
    - should be case-insensitive
  QUESTIONS: (input types? new/old object? empty input?)
    empty string "" should return ...? -> true

EXAMPLES (manually check them):

DATA STRUCTURES:
  I: string -> stepwise compared as chars or array
  helper hash?
  O: boolean
  C: array

ALGORITHM (review the hardest example out loud):
  save letter blocks in an array constant (BLOCKS)
  initialize (blocks_used) array
  uppercase the string
  iterate over characters in the uppercased string
    check whether the character is in any element of the BLOCKS array
    if so:
      check if that block is already in the blocks-Used array
      -- and return false
      otherwise add the block to blocks_used array
  if successfully iterated through all w/o returning false, return true

  map array of upcased chars in word to array of blocks containing that char
  evaluate if any element of array is count > 1 in the array

CODE!
=end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word_1?(word)
  word.upcase.chars.each_with_object([]) do |char, blocks_used|
    this_block = BLOCKS.select { |block| block.include?(char) }[0]

    return false if blocks_used.include?(this_block)
    blocks_used.push(this_block) if this_block
  end
  true
end

def block_word?(word)
  blocks_used = word.upcase.chars.map do |char|
    BLOCKS.select { |block| block.include?(char) }.first
  end

  blocks_used.none? { |block| blocks_used.count(block) > 1 }
end

p block_word?('') == true
p block_word?('BATCH') == true
p block_word?('BATCH!') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
