def triangle(side_a, side_b, side_c)
  sides = [side_a, side_b, side_c].sort

  return :invalid unless triangle?(sides)

  if sides.count(sides[0]) == 3 then :equilateral
  elsif sides.count(sides[0]) == 2 then :isosceles
  elsif sides.count(sides[1]) == 2 then :isosceles
  else :scalene
  end
end

def triangle?(arr_of_sides)
  return false unless arr_of_sides.size == 3
  return false unless arr_of_sides.all? { |side| side > 0 }

  arr_of_sides = arr_of_sides.sort # optional here but otherwise important
  arr_of_sides[0..1].sum >= arr_of_sides[2]
end

=begin
PROBLEM:
  INPUT: 3 Numbers (triangle side lengths)
  OUTPUT: Symbol (:equilateral, :isosceles, :scalene, :invalid)
  RULES? (explicit/implicit)
    - invalid triangle if:
      - sum of 2 shortest is less than longest
      - any side is length 0
    - equilateral if all same length
    - isosceles if 2 are same length
    - otherwise scalene
  QUESTIONS: (input types? new/old object? empty input?)
    always 3 positive numbers input?

EXAMPLES (manually check them):

DATA STRUCTURES:
  Input: Int/Float -> Array
  Output: Symbol

ALGORITHM (review the hardest example out loud):
  sort the sides by length
  check that the nums given form a valid triangle
    all sides must be greater than 0
    two smallest must >= longest
  if fails, return false
  count the instances of the shortest value:
    3: equil
    2: iso
  count the instances of the next value
    2: iso
  else scalene
  return the symbol

  (later: convert to taking a splat arg, restrict to 3 sides)

CODE!
=end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(-3, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
