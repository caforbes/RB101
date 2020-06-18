advice = "Few things in life are as important as house training your pet dinosaur."

# I'm assuming you want me to mutate the string.
puts advice.sub!("important", "urgent")

# .gsub = global substitution, sub all occurrences (like python sub)
# .sub = first substitution, sub first occurrence only (works here)
