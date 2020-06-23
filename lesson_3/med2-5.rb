def add_rutabagas(a_string_param, an_array_param)
  a_string_param.concat("rutabagas")
  an_array_param.push("rutabagas")
end

my_string = "pumpkins"
my_array = ["pumpkins"]
add_rutabagas(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
