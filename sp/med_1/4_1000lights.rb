def thousand_lights(n)
  light_bank = Array.new(n, true)

  (2..n).each do |round|
    light_bank.each_with_index do |light, index|
      light_bank[index] = !light if (index+1) % round == 0
    end
  end

  light_bank.map!.with_index { |light_on, index| index + 1 if light_on }
  light_bank.select { |light| light }
end

=begin
PROBLEM:
  INPUT: Integer
  OUTPUT: Array of Ints
  RULES? (explicit/implicit)
    - bank of lights with n lights
    - lights are numbered from 1 to n
    - conduct n rounds (same as number of lights)
    - on a round, toggle the light switches the same multiple as the round num
      - round 1 = all lights toggled (on)
      - round 2 = every other light
      - round 3 = every 3 lights ...
    - return array of light numbers that are on after all rounds
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  Integers
  Array of Booleans
  Array of Integers

ALGORITHM (review the hardest example out loud):
  - make an array of true values, of size n
  - from 2 to n (skip round 1):
    - iterate through the lights array with indices
    - if index+1 is a multiple of the current round number, reassign to toggled value
    - repeat for all rounds
  - transform all 'on'/true lights to their index + 1
  - select only integer/nonfalse values from the array
  - return the selected array

CODE!
=end

p thousand_lights(1) == [1]
p thousand_lights(2) == [1]
p thousand_lights(5) == [1, 4]
p thousand_lights(10) == [1, 4, 9]
p thousand_lights(1000)
