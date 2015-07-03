def isValidWalk(walk)
  isValid = true
  isValid = false if walk.count != 10


##
#  walk.each_with_index { |x, i|
#     isValid = false if next_x == x
#     next_x = walk[i+1]
#    }


  return isValid
end

puts isValidWalk(["n","s","n","s","n","s","n","s","n"]) #=> false
puts isValidWalk(["n","s","n","s","n","s","n","s","n","s"]) #=> true
puts isValidWalk(["n","s","n","s","n","s","n","s","n","s,","n"]) #=> false
puts isValidWalk(["n","n","n","s","n","s","n","s","n","s"]) #=> false
