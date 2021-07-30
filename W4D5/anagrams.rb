def first_anagram?(anag1, anag2) # input is (n & m) not just n
  anag1.split("").sort == anag2.split("").sort # n + n^2 + m + m^2
end # n^2


def second_anagram?(anag1, anag2)
  anag1 = anag1.split("") # n
  anag2 = anag2.split("") # m
  anag1.each do |ele| # n
    return false if anag2.length == 0 # 1
    anag2.delete(ele) #n^2
  end
  anag2.length == 0 # 1
end # n^2 (n * m)



def third_anagram?(anag1, anag2)
  anag1 = anag1.split("") # n
  anag2 = anag2.split("") # m
  anag1.sort! # n^2
  anag2.sort! # m^2
  anag1 == anag2 # 1
end


def fourth_anagram?(anag1, anag2)
  h1 = Hash.new(0) # 1
  h2 = Hash.new(0) # 1
  anag1.each_char do |char| # n
    h1[char] += 1 # 1
  end
  anag2.each_char do |char| # m
    h2[char] += 1 # 1
  end
  h1 == h2 # 1
end

def fifth_anagram?(anag1, anag2)
  anag1 = anag1.split("") # n
  anag2 = anag2.split("") # n
  h1 = Hash.new(0)
  (anag1 + anag2).each do |ele| # n + m
    h1[ele] += 1
  end
  h1.all? {|k, v| v % 2 == 0} # n > m
end




p fifth_anagram?("elvis", "lives")    #=> true
p fifth_anagram?("gizmo", "sally")    #=> false
