counter = 1

loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts "Exiting... (loops = #{counter})"
    break
  end
  counter += 1
end
