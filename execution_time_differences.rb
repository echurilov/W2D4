def lcs(list)
  max_value = 0
  (0...list.length).each do |start_pos|
    (0...list.length-start_pos).each do |end_pos|
      value = list[start_pos..end_pos].reduce(:+)
      max_value = value if value > max_value
    end 
  end 
  max_value
end

def lcs2(list)
  current_sum = list.shift
  largest_sum = current_sum
  
  list.each do |el|
    if current_sum + el > largest_sum
      largest_sum = current_sum + el 
    end 
    if el < 0
      current_sum = el if el > current_sum
    elsif current_sum >= 0 && el >=0
      current_sum = current_sum + el
    else
      current_sum = el
    end
    p "current_sum #{current_sum}"
    p "largest_sum #{largest_sum}"
  end
  
  largest_sum
end

  # if current_sum < 0 && current_sum > el
  #   largest_sum = current_sum
  # elsif current_sum + el >= 0
  #   largest_sum = (current_sum + el)
  # end
  # if current_sum + el < 0
  #   current_sum
  # else
  #   current_sum = current_sum + el
  # end
  # largest_sum = current_sum if current_sum > largest_sum