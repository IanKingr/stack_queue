require_relative 'myqueue.rb'

def max_windowed_range(array, window_size)
  current_max_range = nil
  (0..(array.size - window_size)).each do |i|
    range = array[i...(i + window_size)]
    min = range.min
    max = range.max
    current_max_range = max - min if current_max_range.nil? || max - min > current_max_range
  end
  current_max_range
end


def max_windowed_stackqueue(array, window_size)
  stack_queue = StackQueue.new

  window_size.times do
    stack_queue.enqueue(array.pop)
  end

  max_range = stack_queue.max - stack_queue.min
  while array.size > 0
    stack_queue.enqueue(array.pop)
    stack_queue.dequeue
    current_max_range = stack_queue.max - stack_queue.min
    max_range = current_max_range if max_range < current_max_range
  end

  max_range
end



p max_windowed_stackqueue([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p max_windowed_stackqueue([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p max_windowed_stackqueue([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p max_windowed_stackqueue([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
