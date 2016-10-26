#1. 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?("Spot")
ages.key?('Spot')
ages.member('Spot')

#2. 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.inject(:+)

#3. 
ages.keep_if { |_, age| age < 100}

#4. 
munsters_description = "The Munsters are creepy in a good way."
munsters_description.capitilize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!

#5. 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
additional_ages.merge!{additional_ages}

#6.
ages.values.min

#7.
advice = "Few things in life are as important as house training your pet dinosaur."
advice.match("dino")

#8. 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index {|name| name[0, 2] == "Be"}

#9. 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|name| name[0,3]}
#or
flintstones.map! do |name|
  name[0, 3]
end 

#10.
flintstones.map! {|name| name[0, 3]}
