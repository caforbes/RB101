arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hash|
  new_hash = {}
  hash.each_pair { |key, val| new_hash[key] = val + 1 }
  new_hash
end

p arr
p new_arr
