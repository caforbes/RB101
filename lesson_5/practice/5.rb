munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munster_males = munsters.select do |person, data|
  data["gender"] == "male"
  # oops first I reassigned instead of comparing :|
end
# not necessary to select separately. just conditionally sum!

total_male_age = 0
munster_males.each_value { |data| total_male_age += data["age"] }

p total_male_age
