require 'byebug'
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min(list)
  list.each_index do |i|
    smallest = true
    list.each_index do |j|
      next if i == j
      smallest = false if list[j] < list[i]
    end
    return list[i] if smallest
  end
end

def my_min2(list)
  min = nil
  list.each do |x|
    min = x if min.nil? || x < min
  end

  min
end

def largest_subsum(list)
  sub_arr = []
  list.each_index do |i|
    ((i)...list.size).each do |j|
      sub_arr << list[i..j]
    end
  end

  sums = sub_arr.map {|arr| arr.inject(:+)}
  sums.max
end

# def largest_subsum2(list)
#   largest_sum = list[0]
#   j = 0
#   list.each_index do |i|
#     if list[i] < 0
#       sub_sum = list[j...i].inject(:+)
#       largest_sum = sub_sum if sub_sum > largest_sum
#       j = i + 1
#     elsif i == (list.size - 1)
#       sub_sum = list[j..i].inject(:+)
#       largest_sum = sub_sum if sub_sum > largest_sum
#       j = i + 1
#     else
#       next
#     end
#   end
#   largest_sum
# end

def largest_subsum2(list)
  largest_sum = 0
  current_sum = 0
  list.each do |num|
    current_sum += num
    largest_sum = current_sum if current_sum > largest_sum
    current_sum = 0 if current_sum < 0
  end
  largest_sum
end





list = [5, 3, -7, 4, 5, 6]

p largest_subsum2(list)
