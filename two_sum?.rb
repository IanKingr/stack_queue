def bad_two_sum?(arr, target)
  arr.each_index do |i|
    arr.each_index do |j|
      if j > i
        return true if arr[i] + arr[j] == target
      end
    end
  end
  false
end

def okay_two_sum?(arr, target)
  sorted = arr.sort
  arr.each do |x|
    addend = target - x
    return true if bsearch(arr, addend)
  end
  false
end

def bsearch(arr, target)
  half = arr.size / 2
  return false if arr.empty?
  return true if arr[half] == target

  if arr[half] > target
    bsearch(arr[0...half], target)
  else
    bsearch(arr[(half+1)..-1], target)
  end
end

def pair_sum(arr, target)
  nums = Hash.new(0)
  arr.each do |x|
    nums[x] += 1
  end
  arr.each do |x|
    if x == target - x
      return true if nums[x] > 1
    else
      return true if nums[target - x] > 0
    end
  end
  false
end

arr = [0, 1, 5, 7, 5]
p pair_sum(arr, 6) # => should be true
p pair_sum(arr, 10) # => should be false
