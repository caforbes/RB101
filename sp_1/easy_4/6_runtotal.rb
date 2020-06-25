# def running_total(num_array)
#   sum = 0
#   totals = []
#   num_array.each do |n|
#     sum += n
#     totals.push(sum)
#   end
#   totals
# end

def running_total(num_array)
  sum = 0
  totals = num_array.map { |n| sum += n }
end

# def running_total(num_array)
#   sum = 0
#   num_array.each_with_object([]) do |n, list|
#     sum += n
#     list.push(sum)
#   end
# end

# input: array of numbers (integers???)
# output: array with same n, but n is running total of sums

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
