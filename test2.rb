def solution(str)
  (str + "_").scan(/../)
end

me = solution("AABBCC")
puts me
