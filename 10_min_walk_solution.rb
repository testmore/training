def isValidWalk(walk)
  walk.count("e") == walk.count("w") and
  walk.count("n") == walk.count("s") and
  walk.count == 10
end

puts isValidWalk(["n","s","n","s","n","s","n","s","n"]) #=> false
puts isValidWalk(["n","s","n","s","n","s","n","s","n","s"]) #=> true
puts isValidWalk(["n","s","n","s","n","s","n","s","n","s,","n"]) #=> false
puts isValidWalk(["n","n","n","s","n","s","n","s","n","s"]) #=> false
