screen_width = 40
title = "Flintstone Family Members"

# 40 characters screen
# string is 25 chars long
# prepend some number of spaces before string
# (optional, append some (other) number after it)
# total number of characters incl new spaces = 40
# front and back spaces plus string length = 40

# num_spaces = (screen_width - title.length) / 2
# spacing = ' ' * num_spaces
# spaced_title = spacing + title + spacing

# puts spaced_title

puts title.center(screen_width)
