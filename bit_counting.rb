def count_bits(n)
  (binary = n.to_s(2)).count("1")
end

puts count_bits(9)
puts count_bits(0)
puts count_bits(4)
puts count_bits(7)
puts count_bits(10)


