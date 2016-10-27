#1.
loop do
  puts 'Just keep printing...'
  break
end


#2. 
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  break
end

puts 'This is outside all loops.'

#3.
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

#4.
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'Yes'

end

#5.
say_hello = true
count = 0

while say_hello
  puts 'Hello!'
  count += 1
  say_hello = false if count == 5
end

#6. Using a while loop, print 5 random numbers 
#between 0 and 99. The code below shows 
#an example of how to begin solving this exercise.

numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers

#7.
count = 1

until count > 10
  puts count
  count += 1
end

#8. print all numbers using 'until'
numbers = [7, 9, 13, 25, 18]

count = 0
until count > numbers.size
	puts numbers[count]
	count += 1
end

#9. output when odd number
for i in 1..100
  puts i if i.odd?
end

#10 Greet each friend
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
	puts "Hello #{friend}!"
end

