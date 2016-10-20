#1. a method that returns the sum of two integers

Given 2 integers
Return integer1 + integer2

#2. a method that takes an array of strings, and returns a string that is all those strings concatenated together
Given an array of strings

Iterate through the collection one by one.
Save the first string into a variable
For each iteration add the string to the current string.
When at the end of the collection, return the string.

#---Formal
START

#Given an array of strings

SET iterator  = 0
SET final_string = ""

WHILE iterator < array size
  SET final_string to string in array at iterator location
  iterator += 1
end

return final_string


#3. a method that takes an array of integers, and returns a new array with every other element
Given an array of integers

Iterate through the collection of integers one by one.
Check if current index of integer is even
If even then save into a new array
Else go to next iteration
Iterator += 1
When at the end of collection, return the new array.

#---Formal
START

#Given array of integers

SET iterator = 0
SET new_array = []

WHILE iterator < array size
  IF iterator == even
    new_array << array[iterator]
  end
  iterator += 1
end

print new_array



