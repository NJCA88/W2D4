def two_sum?(array, target)
  array.each_with_index do |el1, idx1|
    array.each_with_index do |el2, idx2|
      next if idx1 == idx2
      return true if el1 + el2  == target
    end
  end
  false
end

puts "two sum test that should be true is #{two_sum?([0,1,5,7], 6)}"
puts "two sum test that should be false is #{two_sum?([0,1,3,8], 6)}"

def two_sorted_sum?(array, target)
  array.sort!
  array.each_with_index do |el, idx1|
    # puts "array is #{array}, target is #{target}, el is #{el}"
    idx2 = bsearch(array, target - el)
    return true if idx2 unless idx1 == idx2
  end
  false  
end

def bsearch(array, target)
  return nil if array.length == 0
  mid = array.length / 2
  
  if array[mid] == target
    return mid
  elsif array[mid] < target
    sub_array = array.select { |el| el > array[mid]}
    search_result = bsearch(sub_array,target)
    return nil if search_result.nil?
    return search_result + mid + 1
  else
    sub_array = array.select { |el| el < array[mid]}
    bsearch(sub_array, target)
  end
end
puts "two sorted sum test that should be true is #{two_sorted_sum?([0,1,5,7], 6)}"
puts "two sorted  sum test that should be false is #{two_sorted_sum?([0,1,3,8], 6)}"


