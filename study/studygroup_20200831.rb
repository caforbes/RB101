=begin
Given an array of integers arr, a lucky integer is an integer which has a frequency in the array equal to its value.

Return a lucky integer in the array. If there are multiple lucky integers return the largest of them. If there is no lucky integer return -1.

Example 1:

Input: arr = [2,2,3,4]
Output: 2
Explanation: The only lucky number in the array is 2 because frequency[2] == 2.

Example 2:

Input: arr = [1,2,2,3,3,3]
Output: 3
Explanation: 1, 2 and 3 are all lucky numbers, return the largest of them.

Example 3:

Input: arr = [2,2,2,3,3]
Output: -1
Explanation: There are no lucky numbers in the array.

Example 4:

Input: arr = [5]
Output: -1

Example 5:

Input: arr = [7,7,7,7,7,7,7]
Output: 7
=end

=begin
P;
- lucky = value equals the number of occurrences in array
- input: array of Integers
- output: an integer
    - highest "lucky" in the array
    - -1 if no "lucky" numbers
- probably always stuff in the array = no empty

ALGORITHM:
- make a hash of uniq values => # of appearances
  - iterate over unique values in input array
  - for each, add to a hash alongside its count from orig array
- filter to all the integers where the count == the value itself
  ...
- if there aren't any, return -1
- if there are some, return the one with the highest value
=end

def find_lucky(array)
  unique_vals = {}
  array.uniq.each { |val| unique_vals[val] = array.count(val) }

  lucky_nums = unique_vals.keys.select { |key_int| key_int == unique_vals[key_int] }

  lucky_nums.empty? ? -1 : lucky_nums.sort[-1]
end

p find_lucky([2, 2, 3, 4]) == 2
p find_lucky([1, 2, 2, 3, 3, 3]) == 3
p find_lucky([2, 2, 2, 3, 3]) == -1
p find_lucky([5]) == -1
p find_lucky([7, 7, 7, 7, 7, 7, 7]) == 7


puts "====="

=begin
You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

Example 1:

Input: coins = [1, 2, 5], amount = 11
Output: 3
Explanation: 11 = 5 + 5 + 1

Example 2:

Input: coins = [2], amount = 3
Output: -1

Note:
You may assume that you have an infinite number of each kind of coin.


PROB;
- input: a list of types of coins available, + integer of target amount
- output: Integer: number of coins used to reach target OR -1

ALGOR:
- initialize (result) as 0
- initialize (target) as input amount

- determine the biggest coin that can go into the target
  - get the set of coins smaller than or same as the target amount
  - get the largest coin in that set
  - if there's no option, return -1
- divide the target by the biggest coin
- save the remainder as next (target) value
- save the number of times we use the coin into (coins_used)
- add coins_used to result
- repeat...
  - until remainder = 0

- return result (num of coins)

ALGO 2:
  initialize list of results
  save input amount as (target)
  start value: (saved change)

  filter coins to those equal/smaller than target
  break if there are none
  split coins into those that divide evenly into target: is remainder 0?
  for evenly dividing coins
    get number of coins dividing (+ any previously saved coins)
    save in list of results
  for coins that don't divide evenly, find the best intermediate coin
    divide each coin into target
    pick the one with the smallest num of coins used
    save the coins used to a running tally (saved coins)
    save the remainder as next target
  repeat unless there was no intermediate coin
  return the smallest result in the list
  if there are no results, return -1
=end

def coin_change_1(amount, coins)
  result = 0
  target = amount

  loop do
    biggest_coin = coins.select{ |coin| coin <= target }.max
    return -1 unless biggest_coin

    coins_used, target = target.divmod(biggest_coin)
    result += coins_used
    break if target == 0
  end
  result
end

def coin_change(amount, coins)
  results = []

  temp_target = amount
  saved_coins = 0

  loop do
    possible_coins = coins.select{ |coin| coin <= temp_target }
    break if possible_coins.empty?

    exact_change, extra_coins = possible_coins.partition do |coin|
      temp_target % coin == 0
    end

    results += exact_change.map { |coin| saved_coins + (temp_target / coin) }

    next_best = extra_coins.map { |coin| temp_target.divmod(coin) }.sort[0]
    if next_best
      saved_coins += next_best[0]
      temp_target = next_best[1]
    else break
    end
  end

  results.empty? ? -1 : results.sort[0]
end

p coin_change(11, [1, 2, 5]) == 3
p coin_change(10, [2]) == 5
p coin_change(9, [5, 2, 1]) == 3
p coin_change(33, [10, 2, 1, 3]) == 4
p coin_change(32, [10, 2, 1, 3]) == 4
p coin_change(3, [2]) == -1
p coin_change(3, [5]) == -1
p coin_change(4, [2, 3]) == 2 # requires multiple options to be evaluated
