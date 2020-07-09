flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}

flintstones.each_with_index do |person, idx|
  flintstones_hash[person] = idx
end

p flintstones_hash
