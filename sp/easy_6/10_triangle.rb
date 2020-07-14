def triangle(size)
  triangle_rows = (0..size).map do |n|
    row = "*" * n
    row.empty? ? row : row.rjust(size)
  end

  puts triangle_rows
end

def triangle_2(size, bottom=true, right=true)
  stars_per_row = bottom ? (0..size) : (0..size).to_a.reverse

  triangle_rows = stars_per_row.map do |n|
    row = "*" * n

    if row.empty? then row
    elsif right then row.rjust(size)
    else row.ljust(size)
    end
  end

  puts triangle_rows
end

# PROBLEM:
  # print a right triangle out of n rows and columns of stars

  # INPUT: positive Integer
  # OUTPUT: nil / set of printed strings
  # RULES? (explicit/implicit)
    # number of strings = n
    # width of strings = n
    # content:
      # n spaces
      # n - 1 spaces, 1 star
      # n - 2 spaces, 2 stars
      # ...
      # n - n spaces, n stars
    # or, 0-n stars, r justified to width n

# EXAMPLES (manually check them):
triangle(1)
triangle(5)
triangle(9)
triangle_2(9,bottom=false)
triangle_2(9,bottom=false,right=false)

# DATA STRUCTURES:
  # Input: Integer
  # Data: Array of Strings
  # Output (printed): Strings

# ALGORITHM (review the hardest example out loud):
  # create empty triangle array
  # generate 0-n strings of star * number in array
    # from range 0-n, for each value
    # create string with interpolated star * number
    # append to triangle array
  # rjustify each string in array to width n
  # puts each string in the array

# CODE!
