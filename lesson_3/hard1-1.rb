if false
  greeting = “hello world”
  # doesn't get evaluated bc false
  # otherwise it should throw a nameerror because wrong apostrophes
end

greeting
# name error?

# tricky lesson => expressions in if statements read but not evaluated
# variables initialized there, even if not executed, don't raise exception
