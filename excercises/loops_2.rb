# 1. Write a loop that prints numbers 1-5 and 
#whether the number is even or odd. Use the code 
#below to get started.
 
count = 1

loop do
	if count.even?
		puts "#{count} is even!"
	else
		puts "#{count} is odd!"
	end
	break if count == 5
  count += 1
end

# 2. stop if loop if between 0 and 10
loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end

# 3. 
process_the_loop = [true, false].sample

if process_the_loop
	loop do
		puts 'the loop was processed'
		break
	end
else
	puts "the loop wasn't proc"
end

#4. 
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
  	break
  else
  	puts "Wrong! Please try again"
  end
end