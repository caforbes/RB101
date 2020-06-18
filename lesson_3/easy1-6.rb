famous_words = "seven years ago..."
add_this = "Four score and "

# non-mutative
p add_this + famous_words

# mutative
p famous_words.prepend(add_this)
