require 'date'

def friday_13th(year)
  count_fri_13ths = 0

  1.upto(12) do |month|
    count_fri_13ths += 1 if Date.new(year, month, 13).friday?
  end
  count_fri_13ths
end

=begin
PROBLEM:
  INPUT: Integer: year greater than 1752
  OUTPUT: integer: num of Fri 13ths in that year
  RULES? (explicit/implicit)
    - year has 12 months, output will be 0-12
    - of course there will be less than 12 because multiples of something
    - include num of days in each month
    - need to calculate starting day of the year, leap year
  QUESTIONS: (input types? new/old object? empty input?)
    - assume it's ok to use Date class instead of manually counting months?
    - do both ways!?

EXAMPLES (manually check them):

DATA STRUCTURES:
  Input: Integer
  Use: Date
  Output: Integer

ALGORITHM (review the hardest example out loud):
  initialize var: (count13ths)
  from 1-12, loop:
    initialize a date on 13th of that month on input year
    check whether it is a friday (datetime method friday?)
    if so, increment fri13 count
  return fri13th count


CODE!
=end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
