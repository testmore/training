def number lines
  # TODO
  lines.map.with_index{|x,i| (i+1).to_a + ": " + x}
end

puts number([])
puts number(["a", "b", "c"])
