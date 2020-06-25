def multisum(int)
  multiples_35 = multiples(3, int) + multiples(5, int)
  multiples_35.uniq.sum
end

def multiples(int, limit)
  multiples = []
  counter = 1
  while int * counter <= limit do
    multiples.push(int * counter)
    counter += 1
  end
  multiples
end

# # p multiples(3, 10) == [3, 6, 9]
# # p multiples(3, 3) == [3]
# # p multiples(3, 1) == []


# def multisum(int)
#   total = (1..int).select { |n| n % 3 == 0 || n % 5 == 0 }.reduce(&:+)
#   total.nil? ? 0 : total
# end


# find all multiples of 3 OR 5 between 1/other number
# compute sum of all multiples
# assume number passed is integer greater than 1

# how do you find multiples?
# loop
  # 3 * 1+ until >= NUM
  # 5 * 1+ until >= NUM
# 3.step(NUM, 3) {block add to array or w/e}

p multisum(2) == 0
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
