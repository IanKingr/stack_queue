class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  attr_reader

  def initialize
    @store = []
    @max = []
    @min = []
  end

  def pop
    @max.pop
    @min.pop
    @store.pop
  end

  def push(el)
    @store << el
    if @max.empty?
      @max << el
    elsif el > @max.last
      @max << el
    else
      @max << @max.last
    end
    if @min.empty?
      @min << el
    elsif el < @min.last
      @min << el
    else
      @min << @min.last
    end
  end

  def max
    @max.last
  end

  def min
    @min.last
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end
end


class StackQueue
  def initialize
    @enqueue_stack = MyStack.new
    @dequeue_stack = MyStack.new
  end

  def enqueue(el)
    @enqueue_stack.push(el)
  end

  def dequeue
    if @dequeue_stack.empty?
      until @enqueue_stack.empty?
        @dequeue_stack.push(@enqueue_stack.pop)
      end
    end
    @dequeue_stack.pop
  end

  def max
    if not(@enqueue_stack.empty?) && not(@dequeue_stack.empty?)
      [@enqueue_stack.max, @dequeue_stack.max].max
    else
      @dequeue_stack.empty? ? @enqueue_stack.max : @dequeue_stack.max
    end
  end

  def min
    if not(@enqueue_stack.empty?) && not(@dequeue_stack.empty?)
      [@enqueue_stack.min, @dequeue_stack.min].min
    else
      @dequeue_stack.empty? ? @enqueue_stack.min : @dequeue_stack.min
    end
  end

  def size
    @enqueue_stack.size + @dequeue_stack.size
  end

  def empty?
    @enqueue_stack.empty? && @dequeue_stack.empty?
  end
end
