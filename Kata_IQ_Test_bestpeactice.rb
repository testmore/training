def iq_test (numbers)
  nums = numbers.split.map(&:to_i).map(&:even?)
  nums.count(true) > 1 ? nums.index(false) + 1 : nums.index(true) + 1
end
    
puts iq_test("2 4 7 8 10")
