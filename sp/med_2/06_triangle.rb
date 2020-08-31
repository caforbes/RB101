def triangle(angle_a, angle_b, angle_c)
  angles = [angle_a, angle_b, angle_c].sort
  largest = angles[-1]

  return :invalid unless angles.sum == 180 && angles.all? { |angle| angle > 0 }

  if largest == 90 then :right
  elsif largest > 90 then :obtuse
  else :acute
  end
end

=begin
PROBLEM:
  INPUT: 3 Integers (angle values)
  OUTPUT: Symbol (:right, :acute, :obtuse, :invalid)
  RULES? (explicit/implicit)
    - triangle angles must = 180
    - all angles must be > 0
    - obtuse: one angle > 90
    - right: one angle is 90
    - acute: all angles < 90
  QUESTIONS: (input types? new/old object? empty input?)
    - assume angles always integers (no floats) representing degrees

EXAMPLES (manually check them):
  (provided test cases)
  (any additional examples?)

DATA STRUCTURES:
  input, output, rules, constants?

ALGORITHM (review the hardest example out loud):
- collect all the angles into an array
- sort the array by smallest to largest angles
- validate the set of angles as a proper triangle
  - if sum of angles is not 180, return :invalid
  - or if any angle is 0 or less, return :invalid
- get the largest angle (last in array)
- return based on its value
  - greater than 90: obtuse
  - 90: right
  - otherwise acute

CODE!
=end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
