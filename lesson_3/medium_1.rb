# Exercises Medium 1

#1. For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

string = "The Flinstones Rock!"

10.times do |i|
  puts (" " * i) + string
end

#refactored
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }


#2. Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
arr_index = []
new_hash = {}
arr_index = statement.split('').uniq.sort
arr_index.each do |letter|
  new_hash[letter] = statement.count(letter)
end

    #cleaner code from forum
    statement = 'The Flintstones Rock'

    result = Hash.new(0)
    statement.split('').each do |letter|
      next if letter == ' '
      result[letter] += 1 
    end

#3. Because you can't add strings and numbers
puts "the value of 40 + 2 is " + (40 + 2)
#should be
puts "the value of 40 + 2 is " + (40 + 2).to_s

#4. When we modify the array we are iterating the iteration will
#iterate through correctly

#5.
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

    #1 bonus: number % dividend == 0  to make sure it divides evenly
    #2 divisors is to return the final array

#6. The return of buffer1 will change the input when returned

#7. limit variable is in outerscope and not passed into method
limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

#8. 
def titleize(string)
  arr = []
  arr = string.split(' ')
  arr.map {|word| word.capitalize!}
end

titleize('hello world')

#refactored by solution
def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

titleize('hello world')

#9. 
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, value|
  case value["age"]
  when 0..18
    value["age_group"] = "kid"
  when 18..65
    value["age_group"] = "adult"
  else
    value["age_group"] = "senior"
  end
end

puts munsters


