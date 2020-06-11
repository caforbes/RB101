puts("What is your age?")

age = gets.chomp.to_i

puts("At what age would you like to retire?")

retire_at = ''
loop do
  retire_at = gets.chomp.to_i

  break unless age > retire_at
  puts("You can't retire in the past! Try again.")
end

this_year = Time.now.year
years_left = retire_at - age
retire_year = this_year + years_left

puts("It's #{this_year}. You will retire in #{retire_year}.")
puts("You have #{years_left} years of work to go!")

puts("I guess you can retire now!") if years_left == 0

# PROBLEM:
  # get two numbers from user: current age + retirement age
  # print current year, year of retirement, and years delta
  # INPUTS -->
    # strings from user: assume these will be simple numbers, no validation
    # whole nonzero positive integers
  # OUTPUTS -->
    # years until retire: retirement age - current age
    # retirement year: current year + years til retire
    # print
      # one string with current year + retirement year
      # one string with years until retirement
  # QUESTIONS?
    # worry about birthday/time in the year?
    # worry about user input validation?
  # RULES?
  #   EXPLICIT:
      # need to include the current year: 2020
  #   IMPLICIT:
      # retirement age must be greater than current age
  # IDEAS?
    # check whether retirement age < current age --> invalid
    # check whether retirement age == current age --> special message

# EXAMPLES / TEST CASES:
  # 30, 70 --> 2020-2060 --> 40 years
  # 60, 60 --> 2020-2020 --> 0 years
  # 29, 65 --> 2020-2056 --> 36 years

# DATA STRUCTURES:
  # INPUT -->
    # string -> integer
  # OUTPUT -->
    # integer -> string

# ALGORITHM / INSTRUCTIONS:
  # get user's current age
    # save as variable
    # convert to integer
  # get user's retirement age
    # initialize variable
    # start a validation loop
      # save as variable
      # convert to integer
      # escape loop if retirement age greater than or equal to current age
      # otherwise print error message and loop
  # calculate years remaining until retirement
    # retirement age - current age
  # save current year
  # calculate retirement year
    # years left + current year = retirement year
  # print statements to user
    # interpolate current year and retirement year
    # interpolate years to retirement
    # if years left == 0
      # congrats! i guess you can retire now!

  # GO THROUGH THE HARDEST EXAMPLE OUT LOUD

# CODE!
