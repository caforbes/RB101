def count_occurrences(arr)
  counts = Hash.new(0)
  arr.each { |item| counts[item] += 1 }
  # arr.each { |item| counts[item.lowercase] += 1 }  # for case-insensitive
  counts.each { |key,count| puts "#{key} => #{count}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2



# count number of times an element appears in an array (case-sensitive)
# input: array (of strings)
# output: hash of integers/counts
# after counting, print each element and number of times it appeared

# if something appears, => 1 in hash
# if it appears again, its hash value increments to 2, etc
# zero appearances in hash = 0 value


# what are the keys for the hash? leave as Strings...


# perform counts
  # create hash with default value 0
  # for each in array, convert to symbol and look up in hash
  # increment its value by one
# print hash neatly
  # for each in hash, print key and value
# end method