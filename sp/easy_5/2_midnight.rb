MINS_PER_HR = 60
HRS_PER_DAY = 24

def time_of_day(minutes)
  hrs, mins = minutes.divmod(MINS_PER_HR)
  days, hrs = hrs.divmod(HRS_PER_DAY)

  "#{format("%02d", hrs)}:#{format("%02d", mins)}"
end

# PROBLEM:
  # <= Integer
  # => String, corresponding to 24h clock
  # from a positive or negative integer, add or subtract minutes from midnight
  # and return a string with the 24h time
  # RULES? (explicit or implicit)
    # calculate time
      # 60 min -> 1 hr
      # 24hr -> 1 day, 0 hr
      # if positive, add to the time, if negative, subtract
    # format the time
      # 00-23 hours : 00-59 minutes
  # IDEAS?

# EXAMPLES (manually test them! include provided examples):
p time_of_day(0) == "00:00"
p time_of_day(3) == "00:03"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# DATA STRUCTURES:
  # INPUT TYPE --> Integer
  # OUTPUT TYPE --> String
  # RULE ENCODING --> rules

# ALGORITHM (step through the hardest example out loud):
  # calculate the time from the minutes number
    # divide mins by 60 to factor out hours
    # divide hrs by 24 to factor out days (not used again)
  # if negative, subtract from midnight (24, 60)
    # get -hr value from 0...24 range array
    # get -min value from 0...60 range array
    # -- this whole part unneccesary bc of negative divmod
  # format the hours/minutes
    # 2-character string with leading 0s, sep by :
    # format("%02d", ...)
  # return the string

# CODE!
