def print_in_box(text)
  text_width = text.length

  horizontal = "+-#{'-'*text_width}-+"
  padding = "| #{' '*text_width} |"
  text_line = "| #{text} |"

  boxed_text = [
    horizontal,
    padding,
    text_line,
    padding,
    horizontal,
  ]

  puts boxed_text
end

def print_in_box_chopped(text)
  max_width = 80
  max_text = max_width-4

  chopped_text = text[0..(max_text-1)]
  text_width = chopped_text.length

  horizontal = "+-#{'-'*text_width}-+"
  padding = "| #{' '*text_width} |"
  text_line = "| #{chopped_text} |"

  boxed_text = [
    horizontal,
    padding,
    text_line,
    padding,
    horizontal,
  ]

  puts boxed_text
end

def print_in_box_wrapped(text)
  max_width = 80
  max_text = max_width-4

  wrapped_text = split_to_width(text,max_text)

  text_width = wrapped_text[0].length

  horizontal = "+-#{'-'*text_width}-+"
  padding = "| #{' '*text_width} |"

  framed_text = wrapped_text.map do |line|
    "| #{line.ljust(text_width, ' ')} |"
  end

  boxed_text = [
    horizontal,
    padding,
    framed_text,
    padding,
    horizontal,
  ].flatten

  puts boxed_text
end

def split_to_width(string, width)
  split_text = []

  start = 0
  while start <= string.length
    split_text << string[start..(start + width - 1)]
    start += width
  end

  split_text
end


# PROBLEM:
  # return same text but with a box around it
  # <= string of X length
  # => nil, but print text in a box
  # QUESTIONS?
  # RULES? (explicit or implicit)
    # line 1,5: +,-*X + 2,+
    # line 2,4: |, *X + 2,|
    # line 3: |, ,text, ,|

# EXAMPLES (manually test them! include provided examples):
print_in_box('To boldly go where no one has gone before.')
print_in_box('')

print_in_box_chopped("Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.")
print_in_box_chopped('To boldly go where no one has gone before.')
print_in_box_chopped('')

print_in_box_wrapped("Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.")
print_in_box_wrapped('To boldly go where no one has gone before.')
print_in_box_wrapped('')

# DATA STRUCTURES:
  # <= String
  # => nil + printed String
  # CONSTANTS OR RULES


# ALGORITHM (step through the hardest example out loud):
  # save text width
  # construct top/bottom
    # corner + width+2 hyphens + corner
  # construct padding
    # edge + width+2 spaces + corner
  # construct text line
    # edge + space + text + space + edge
  # construct array of box components
    # top, padding, text, padding, top
  # join this array with newlines
  # print -- don't need to join if you puts it

# CODE!
