def greetings(name_arr, job_hash)
  name = name_arr.join(' ')
  job_title = "#{job_hash[:title]} #{job_hash[:occupation]}"

  puts "Hello, #{name}! Nice to have a #{job_title} around these parts!"
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
greetings(['Jester', 'Lavore'], { title: 'Chief', occupation: 'Mischief-maker' })

# 2 args, array and hash
#   array: 2+ elements creating a name
#   hash: title + occupation plus values
# return a greeting with name, title, and occupation

=begin
PROBLEM:
  INPUT: Array (name components), Hash (job title/occupation)
  OUTPUT: String
  RULES? (explicit/implicit)
    contents of array with spaces make name
    hash has :title and :occupation
    :title + :occupation makes full job title
    output string should have greeting Hello! also some other words
    add the name and job stuff to the string (personalized!)
  QUESTIONS: (input types? new/old object? empty input?)
    return the greeting? or print to user? (I think output/print)

EXAMPLES (manually check them):

DATA STRUCTURES:
  Array of Strings --> String
  Hash w/ string values --> String
  --> String

ALGORITHM (review the hardest example out loud):
  initialize variable name
  join contents of name array and save as name
  initialize variable jobtitle
  concatenate title value, occupation, and space and save as jobtitle
  create greeting string
    "Hello ___! Nice to have a ____ around."
  interpolate name and job title in greeting string
  output the greeting

CODE!
=end
