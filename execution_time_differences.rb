list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
test_list = [2, 3, -6, 7, -6, 7]

def my_terrible_min(arr)
  smallest = arr.first
  arr.each do |el1|
    arr.each do |el2|
      winner = [el1,el2].min
      smallest = winner if smallest > winner
       
    end
  end
  return smallest
end

puts my_terrible_min(list)

def phase_two(arr)
  smallest = arr.first
  arr.each do |el|
    smallest = el if el < smallest
  end
  smallest 
end 
puts "phase two answer is #{phase_two(list)}"

def sub_sum_bad(array)
  sub_list = []
  (0..array.length - 1).each do |idx1|
    (idx1.. array.length - 1).each do |idx2|
      sub_list << array[idx1..idx2]
    end
  end
  sum_subs = sub_list.map { |array| array.reduce(:+) }
  sum_subs.max
end

puts "sum sums bad answer is #{sub_sum_bad(list)}"
puts "test sum sums bad answer is #{sub_sum_bad(test_list)}"

def sub_sum_good(array)
  max = array.first
  running_tot = 0
  array.each_with_index do |el, idx|
    # p "running_tot=#{running_tot}, el=#{el}, max=#{max}"
    running_tot += el 
    max = running_tot if running_tot > max

    if running_tot < 0
      running_tot = 0 
    end 
  end 
  
  max
end 

puts "sum sums bad answer is #{sub_sum_good(list)}"
puts "test sum sums bad answer is #{sub_sum_good(test_list)}"











