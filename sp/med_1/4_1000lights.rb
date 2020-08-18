def toggling_lights_on(num_of_lights)
  lights = {}
  1.upto(num_of_lights) { |num| lights[num] = false }

  1.upto(num_of_lights) do |iteration|
    multiples = lights.keys.select { |position| position % iteration == 0 }
    multiples.each { |key| lights[key] = !lights[key] }
  end

  lights.select { |light_key, light_val| light_val }.keys
end

# def toggling_lights_on(num_of_lights)
#   lights = bank_of_lights(num_of_lights)

#   1.upto(num_of_lights) { |iteration| toggle_nth_light(iteration) }

#   lights.select { |position, is_on| is_on }.keys
# end

# def bank_of_lights(num_of_lights)
#   lights = {}
#   1.upto(num_of_lights) { |num| lights[num] = false }
#   lights
# end

# def toggle_nth_light(lights, n)
#   nth_positions = lights.keys.select { |position| position % n == 0 }
#   nth_positions.each { |switch| lights[switch] = !lights[switch] }
# end

p toggling_lights_on(1) == [1]
p toggling_lights_on(5) == [1, 4]
p toggling_lights_on(10) == [1, 4, 9]
p toggling_lights_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

=begin
PROBLEM:
  INPUT: Integer, num of lights
  OUTPUT: Array, numbered val of lights that are on
  RULES? (explicit/implicit)
    lights start off
    first round all multiples of 1 are toggled (on)
    2nd round all multiples of 2 are toggled
    nth round all multiples of n are toggled
    return array of numberedname of on lights
  QUESTIONS: (input types? new/old object? empty input?)
    assume no negative input integer

EXAMPLES (manually check them):

DATA STRUCTURES:
  Input: integer
  Lights: Hash (key = Int, val = Bool)
  Output: Array of keys for which light is true/on

ALGORITHM (review the hardest example out loud):
  initialize hash with keys from 1..n, values false
  loop from 1 to n
    for each loop iteration, consider the current number
    all lights with a key that is a multiple of that number, toggle on/off
  select only lights which are on
  return the keys/number name of the lights as an array

CODE!
=end
