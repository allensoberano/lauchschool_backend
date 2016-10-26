# 1. [1, 2, 3] - wrong: because uniq did not mutate the array.
# You would need to use uniq!

# 2. ! usually mutates the object it is used on.
# ? asks a question (true or false, yes or no)
  # 1. != means does not equal. You would use it when you want to check
  # if your object is not equal to another value.

  # 2. !user_id
  # 3. [1, 2, 2, 3, 4].uniq! => [1, 2, 3, 4,]
  # 4. ?choose (I believe that would cause a syntax error)
  # 5. def is_valid?
  # 6. name = "allen",  !!name => true

# 3. Replace the word "important" with "urgent" in the string:
advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')
puts advice

# 4. number = [1, 2, 3, 4, 5]
# numbers.delete_at(1) => [2] (number => [1, 3, 4, 5,])
# numbers.delete(1) => [1] (number = [2, 3, 4, 5])
#note: delete method will mutate

#5. Programmatically determine if 42 lies between 10 and 100.
(10..1000).cover?(42)

#6 Show two ways to add "Four score and " in front of the string
famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words

famous_words.prepend('Four score and ')
"Four score and " << famous_words

# 7. 42

# 8. 
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten
#or
flinstones.flatten

#9. 
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.assoc('Barney')
# ["Barney", 2]

#10. 
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
new_hash = {}
flintstones.each_with_index do |name, index|
  new_hash[name] = index
end

