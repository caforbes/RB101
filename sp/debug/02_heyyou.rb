def shout_out_to(name)
  name.upcase!
  puts 'HEY ' + name

  # puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'
