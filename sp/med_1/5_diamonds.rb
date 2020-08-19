def diamond(grid)
  num_stars = grid
  num_spaces = 0

  diamond = [ make_line(num_spaces, num_stars) ]

  loop do
    num_stars -= 2
    num_spaces += 1
    break if num_stars < 1

    line = make_line(num_spaces, num_stars)

    diamond.unshift(line)
    diamond.push(line)
  end

  puts diamond
end

def make_line(spaces, stars)
  space_str = ' ' * spaces
  star_str = '*' * stars

  space_str + star_str
end

diamond(1)
diamond(3)
diamond(9)

=begin
PROBLEM:
  INPUT: Integer - width/height of diamond
  OUTPUT: NIL / prints a diamond (Strings?)
  RULES? (explicit/implicit)
    n = number of rows in diamond
    n = number of stars in diamond middle row
    1st row: y spaces, 1 star
      n/2 = y.5 (round down y, round up z)
      n = 9
        4 spaces, 1 star
        3 spaces, 3 stars
        2 spaces, 5 stars
        1 space,  7 stars
        0 spaces, 9 stars
        ...reverse
  QUESTIONS: (input types? new/old object? empty input?)
    assume input always odd, positive

EXAMPLES (manually check them):

DATA STRUCTURES:
  Input Number
  build Array of Strings
  Output: print Strings

ALGORITHM (review the hardest example out loud):
  initialize vars of stars (n) and spaces (0)
  create middle string of 0 spaces, n stars
  add to an array
  create a loop
    increment: +1 spaces, -2 stars
    add this string in first and last position of array
    repeat until number of stars is 0 (break when 0)
  print all the strings in the array on a new line


CODE!
=end
