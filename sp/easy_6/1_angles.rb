MIN_PER_DEG = 60
SEC_PER_MIN = 60
POSSIBLE_DEGREES = 360

DEGREE = "\xC2\xB0"

def dms(number)
  degree_range_number = number % POSSIBLE_DEGREES

  degree, remainder = degree_range_number.divmod(1)
  minute, remainder = (remainder.round(4) * MIN_PER_DEG).divmod(1)
  second = ((remainder.round(4) * SEC_PER_MIN) / 1).round

  format_dms(degree, minute, second)
end

def format_dms(deg, min, sec)
  min = format("%02d", min)
  sec = format("%02d", sec)

  "#{deg}#{DEGREE}#{min}'#{sec}\""
end

# PROBLEM:
  # take a floating num representing degrees and convert to a string
  # representing the degree, and converting decimal to min/sec (base 60)

  # INPUT: Float/Num between 0/360
  # OUTPUT: String in deg/min/sec
  # RULES? (explicit/implicit)
    # 1 deg = 60 min, 1 min = 60 sec
      # NUM / 1 = degrees
      # RMDR (round 4) * 60 / 1 = minutes
      # 2ndRMDR (round 4) * 60 = seconds (round to whole)
    # format = 0°00'00"
      # 1-3 digits + deg sign
      # 2 digits '
      # 2 digits "
  # QUESTIONS: (input types? new/old object? empty input?)
    # 0 = 0
    # 360 = 360 or 0
    # rounding issues: round to nearest 4 digits each time

# EXAMPLES (manually check them):
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")

# DATA STRUCTURES:
  # Input: Int/Float
  # Output: String
  # constants: Int

# ALGORITHM (review the hardest example out loud):
  # calculate degrees mins and secs
    # num / 1 = degrees
    # save remainder
    # remainder (rounded 4) * 60 = minutes
    # save remainder
    # remainder (rounded 4) * 60, rounded to nearest integer = seconds
  # format degs mins and secs
    # format("%02d",min/sec)
    # followed by representative sign
  # output formatted string

# CODE!
