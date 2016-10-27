# 1. will throw an error because variable was initialized inside the
# if block
require 'pry'

# #2. because the assignment operator '=' was used greetings and 
# informal_greeting both point to the same objectID.
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

#3.
#a: one two three because the assignment operator was used they
# aren't available at the outer scope
# #b: one two three, same as 'a'
# #c: two three one

#4.

def letter_v_number()
  array = []
  (0..9).each {|x| array << x.to_s }
  ('a'..'f').each { |letter| array << letter}
  array.sample
end

def uuid
  sections = [8,4,4,4,12]
  string = ''

  5.times do |index|
    sections[index].times do |i|
      string << letter_v_number
    end
    string += '-' unless index >= sections.size - 1
  end
  puts string
end

uuid()

#5. 
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
    
  end
  while dot_separated_words.size > 0 do
    binding.pry
    word = dot_separated_words.pop
    binding.pry
    return false unless is_an_ip_number?(word)
  end
  true
end
