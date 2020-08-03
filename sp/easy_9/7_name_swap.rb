def swap_name(name)
  given, family = name.split
  "#{family}, #{given}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
