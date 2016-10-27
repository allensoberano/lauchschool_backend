# #1. When reassigning a variable in the same scope
# it changes the value not the objectID it points to.

# When reassigning the variable in a different scope it changes value and objectID


#2. 

#3. my_array will be mutated but my_string will not unless you return both.

#4. So because we used "=" (assignment operator) it assigns a new objectID
#When we are adding an element "<<" it's adding it to the same objectID


#5. 
def color_valid(color)
  color == "blue" || color == "green" 
end