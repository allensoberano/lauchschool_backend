#1. What will the code Print and why?

a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a

	#7 because the assignment operator and created a new variable was used 
	#so it creates a new variable

#2. What will the code print and why?
a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a
	
	#7 as well because the assignment operator is used.

#3. What will the code print and why?
a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a

	#7 because of the same scope as above

#4. What will the code print and why?
a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a

	#"Xy-zy" because you are changing the string so it keeps the
	#same object-id

#5. 
a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a
	#a doesn't change 

#6
a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a

	#'a' doesn't change: WRONG
	#will raise an error because outer variable isn't visible
	#inside methods

#7
a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

	#a => 3 because the last iteration

#8
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

	#will raise an error because variable was initialized inside a block

#9
a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

	#print 7 because a was reassigned in the block it keeps in the lock
	#shadowing

#10
a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
puts a

	#raise an error because 'a' was never passed into the method

	




