def bad_two_sum?(array,target) #n**2
  (0...(array.length-1)).each do |i|
    ((i+1)...array.length).each do |j|
      return true if array[i]+array[j] == target
    end
  end
  false
end

def okay_two_sum?(array,target) #n log n
  array.sort!
  array.each.with_index do |el,i|
    temp_target = target - el
    temp_array = array.delete_at(i)
    result = bsearch(temp_array,temp_target)
    return true if result
  end
  false
end

def bsearch(array,target)
  return false if array.empty?
  mid = array.length/2
  if array[mid] > target
    bsearch(array.take(mid),target)
  elsif array[mid] == target
    return true
  else
    subresult = bsearch(array.drop(mid+1),target)
    # subresult.nil? ? nil : subresult + mid + 1
    return true if subresult
  end
end

# O(n)
def two_sum?(array, target)
  hash = Hash.new(0)
  array.each { |el| hash[el] += 1 }
  array.each { |el| hash[target-el] -= 1 }
  hash.any? { |k, v| v == 0 }
end













# place holder