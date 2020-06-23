def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)
# we reassign my_str within the method to a new object, "pumpkinsrutabaga"
# we append an object "rutabaga" mutatively to my_array so it now contains 2

puts "My string looks like this now: #{my_string}"
# "pumpkinsrutabaga"
# oops, like an idiot i forgot that this was inside the method and we're out now
puts "My array looks like this now: #{my_array}"
# pumpkins
# rutabaga
