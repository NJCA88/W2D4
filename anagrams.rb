def phase_one(str1, str2)
  permutation(str1).include?(str2)
end


def permutation(string)
  return [string] if string.length <= 1
  
  first = string.chars.shift
  perms = permutation(string[1..-1])
  
  result = []
  perms.each do |perm|
    (0..perm.length).each do |i|
      result << perm[0...i] + first + perm[i..-1]
    end
  end
  result 

end

puts "phase one is #{phase_one('gizmo', 'sally')}"
puts "phase one is #{phase_one("elvis", "lives")}"

def second_anagrams?(str1, str2)
  str1.chars.each do |letter|
    if str2.include?(letter)
      idx = str2.chars.find_index(letter)
      str2.slice!(idx)
    else 
      return false
    end 
  end 
  
  return true if str2.length == 0 
end 

puts "phase_two is #{second_anagrams?('gizmo', 'sally')}"
puts "phase_two is #{second_anagrams?("elvis", "lives")}"

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end 

puts "phase_third is #{third_anagram?('gizmo', 'sally')}"
puts "phase_third is #{third_anagram?("elvis", "lives")}"

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char { |letter| hash1[letter] += 1 }
  str2.each_char { |letter| hash2[letter] += 1 }
  hash1 == hash2
end 

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  str1.each_char { |letter| hash1[letter] += 1 }
  str2.each_char { |letter| hash1[letter] -= 1 }
  hash1.values.all? { |el| el== 0 }
end 

puts "phase_fourth is #{fourth_anagram?('gizmo', 'sally')}"
puts "phase_fourth is #{fourth_anagram?("elvis", "lives")}"






