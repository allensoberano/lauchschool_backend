# Write a method that takes an Array of numbers, and returns an Array
# with the same number of elements, and each element has the running
# total from the original Array.

# Test Cases

def running_total(arr)
  new_arr = []
  arr.each_with_index do |num, index|
    new_arr << num + arr[index - 1]
  end
end




p running_total([2, 5, 13]) #== [2, 7, 20] # => true
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67] # => true