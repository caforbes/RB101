=begin
PROBLEM:
  INPUT: Integer
  OUTPUT: output - String?
  RULES? (explicit/implicit)
    - input integer is 7 or greater (assume always odd)
    - represents grid size to display 8-pointed star
    - there are INT rows in the star
    - middle row has INT stars and no spaces
    - upper and lower rows are mirrored, each have 3 stars
    - outer star padding: INT-3 spaces /2 ... -1 as it moves out
    - inner star padding: 0 ... +1 as it moves out
    - stops when stars are at corners (outer star padding = 0)
  QUESTIONS: (input types? new/old object? empty input?)
    - can there be even input?

EXAMPLES (manually check them):

DATA STRUCTURES:
  Integers
  Array of String

ALGORITHM (review the hardest example out loud):
  - create array with 1 element: string of n stars
  - outer padding = n -3 /2
  - inner padding = 0
  - construct next outer row from these numbers
    - outerpad + * + innerpad + * + innerpad + * + outerpad
    - add this row to both beginning and end of star array
    - stop now if outer padding is 0
    - decrement outer padding by 1, increment inner padding by 1
  - print all rows of the star array on a new line

CODE!
=end

def star(num)
  star = [ "*"*num ]
  outer_pad = (num - 3) / 2
  inner_pad = 0

  until outer_pad < 0
    next_row =  " "*outer_pad + "*" +
                " "*inner_pad + "*" +
                " "*inner_pad + "*" + " "*outer_pad

    star = [next_row] + star + [next_row]

    outer_pad -= 1
    inner_pad += 1
  end

  puts star
end

star(7)
puts ""
star(9)
