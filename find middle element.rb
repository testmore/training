#def gimme(input_array)
#  sorted_array = input_array.sort
#  return input_array.rindex(sorted_array[1])
#end

def gimme(input_array)
  
  return input_array.index(input_array.sort[1])
end

puts gimme([3,2,6])
puts gimme([2,3,1])
puts gimme([3,14,10])
puts gimme([5,9,20])