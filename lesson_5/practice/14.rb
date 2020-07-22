hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

color_size_array = []

hsh.each_value do |properties|
  addition =  case properties[:type]
              when 'fruit'
                properties[:colors].map(&:capitalize)
              when 'vegetable'
                properties[:size].upcase
              end
  color_size_array.push(addition)
end

p color_size_array

=begin
PROBLEM:
  retrive colors (from fruit items) and sizes (from veg items) and put in new array
  transform the case of those items when adding

  INPUT: Hash
  OUTPUT: Array
  RULES? (explicit/implicit)
    fruit colors = capitalize
    veg sizes = upcase

DATA STRUCTURES:
  Hash
  Hash value = Hash
  fruit colors = nested Array of strings
  veg sizes = Strings

ALGORITHM (review the hardest example out loud):
  create a new array
  retrieve the hashes in the value of each produce item
  check the type of the item
    if a fruit, retrieve the colors
      map the array to capitalized ver
    if a veg, retrieve the size
      get upcase string
    save either of these as a result
    push the result into the array

CODE!
=end
