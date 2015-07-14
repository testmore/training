def iq_test (numbers)
  numArray = numbers.split(" ").map(&:to_i)
  
  odds = numArray.count { |x| x%2!=0}
  evens = numArray.count { |x| x%2==0}
  
  puts  "evens = #{evens} & odds = #{odds}"
  if odds < evens
    puts numArray.find_index {|x| x%2>0} +1
  else
    puts numArray.find_index {|x| x%2==0}
  end
end
    
iq_test("2 4 7 8 10")
