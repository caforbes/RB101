MINS_PER_HR = 60
HRS_PER_DAY = 24
MINS_PER_DAY = MINS_PER_HR * HRS_PER_DAY

def after_midnight(time)
  hours, minutes = time.split(":").map(&:to_i)

  total_minutes = hours * MINS_PER_HR + minutes

  unless total_minutes < MINS_PER_DAY && hours < HRS_PER_DAY && minutes < MINS_PER_HR
    puts "That's not a valid 24 hour time, but let's try anyway."
  end

  total_minutes %= MINS_PER_DAY
end

def before_midnight(time)
  minutes = MINS_PER_DAY - after_midnight(time)
  minutes = 0 if minutes == MINS_PER_DAY
  minutes
end

# PROBLEM:
  # <= string in 24h format "XX:XX"
  # => integer in 0...1439, corresponding to minutes before/after midnight
  # after midnight counts up from 00:00
  # before midnight counts down from 24:00
  # but these two things are equivalent
  # RULES? (explicit or implicit)
    # hours * 60 + minutes = total minutes
    # total minutes % 1440 (1440m -> 0m, 1439 -> 1439)
    # before midnight = if aftermid 0, also 0
    #                 = else 1440 - aftermidnight
  # IDEAS:
    # validate 24h time?
      # split halves of the clock: max 23/59, else 24/00

# EXAMPLES (manually test them! include provided examples):
  p after_midnight('00:00') == 0
  p after_midnight('00:01') == 1
  p after_midnight('12:34') == 754
  p after_midnight('24:00') == 0
  p after_midnight('24:01') == 1
  puts ''
  p before_midnight('00:00') == 0
  p before_midnight('00:01') == 1439
  p before_midnight('12:34') == 686
  p before_midnight('24:00') == 0
  p before_midnight('24:01') == 1439

# DATA STRUCTURES:
  # INPUT TYPE --> String --> Array of 2 Str -> array of 2 ints
  # OUTPUT TYPE --> Integer

# ALGORITHM (step through the hardest example out loud):
  # split 24h input time into hours and minute sections
  # convert string number into integers
  # save as hours, minutes
  # calculate time in minutes:
    # hours*60 + minutes
    # divide by minutes per day: stay below 1440
  # after midnight:
    # return total minutes
  # before midnight:
    # if 0, return 0
    # else return minutes per day - total minutes

# CODE!
