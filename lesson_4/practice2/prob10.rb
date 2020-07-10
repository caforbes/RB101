munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def age_group(age)
  return nil if age.negative?

  case age
  when 0..17
    "kid"
  when 18..64
    "adult"
  else
    "senior"
  end
end

munsters.each do |person, info|
  info["age_group"] = age_group(info["age"])
end

puts munsters
