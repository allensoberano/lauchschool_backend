#1. 
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_age = 0
munsters.each do |name, details|
  if details['gender'] == 'male'
    total_age += details['age']
  end
end

puts total_age


#2.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts name + " is a " + details["age"].to_s + " year old " + details["gender"]
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end

#3. 
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#4. 
sentence = "Humpty Dumpty sat on a wall."
words = sentence.split(/\W/).reverse!
reversed_sentence = words.join(' ') + "."

#solution:
words = sentence.split(/\W/)
words.reverse!
backwards_sentence = words.join(' ') + '.'

#5. WHAT IS THE OUTPUT OF THE FOLLOWING CODE:
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 #=> 34







  