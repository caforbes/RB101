MIN_PER_HR = 60
HRS_PER_DAY = 24

def time_of_day(time_in_min)
  hrs, mins = time_in_min.divmod(MIN_PER_HR)
  hrs %= HRS_PER_DAY

  format("%02d:%02d", hrs, mins)
end

=begin
PROBLEM:
  INPUT: Integer (any)
  OUTPUT: String in HH:MM format, 24h time
  RULES? (explicit/implicit)
    - 60 minutes in an hour
    - 24 hours in a day
    - positive input goes forward in time, negative goes backward
    - start at 00:00/midnight
    - return string in HH:MM format
  QUESTIONS: (input types? new/old object? empty input?)
    ??

EXAMPLES (manually check them):

DATA STRUCTURES:
  divide val of minutes by 60: save hrs and remainder minutes
    - negative division will go backwards 1 hour as desired
  divide hrs by 24: save remainder hours
  format a string as HH:MM, two digits each
    format("%02d", 0)

ALGORITHM (review the hardest example out loud):
  steps and subroutine steps

CODE!
=end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
