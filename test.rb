def solution(str)
  #-- get the length of the strin
  stringLength = str.length
  #-- if not even legth string then pad end with an underscore "_"
  if stringLength % 2 != 0 then
    str << "_"
  end
  #Create Array and split string into pairs of two characters
  arr = []
  arr = str.chars.each_slice(2).map(&:join)
  puts arr[0]
  return arr
end

me = solution("AABBCC")
puts me
