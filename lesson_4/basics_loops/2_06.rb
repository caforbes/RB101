names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts "Hi #{names.shift}!"
  break if names.empty?
end
