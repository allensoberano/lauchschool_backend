def joinor(arr, sep = ', ', word = 'or')

puts arr[0..(arr.size-2)].join(sep) +
     "#{sep}#{word} #{arr.last}"

end

joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"