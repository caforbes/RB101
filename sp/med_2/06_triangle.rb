=begin
PROBLEM:
  INPUT: 3 Integers (angles)
  OUTPUT: Symbol
  RULES? (explicit/implicit)
    - invalid triangle: sum is not 180, any angle is 0 or less
    - acute: all angles less than 90
    - right: one angle == 90
    - obtuse: one angle > 90
    - calculate type of triangle from angles
    - return symbol of type
  QUESTIONS: (input types? new/old object? empty input?)
    - input angles only integers? or floats?

EXAMPLES (manually check them):

DATA STRUCTURES:
  Integers -> Array -> Symbol

ALGORITHM (review the hardest example out loud):
  collect all angles into an array and sort them
  if smallest angle is 0 or less, or sum is not 180, return invalid
  return other symbol based on value of largest angle
    - 90 :right
    - (0..90) :acute
    - (90...) :obtuse

CODE!
=end

def triangle(a, b, c)
  angles = [a, b, c].sort

  return :invalid unless angles.sum == 180 && angles.first > 0

  case angles.last
  when 90 then :right
  when (0...90) then :acute
  when (90...) then :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
