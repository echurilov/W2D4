
# O(n^2)
def max_windowed_range(array, window_size)
  range = 0
  array.each_cons(window_size) do |sub_arr|
    sub_range = sub_arr.max - sub_arr.min
    range = sub_range if sub_range > range
  end
  range
end

class Queue
  def initialize
    @store = []
  end
  
  def enqueue(el)
    @store.push(el).dup
  end
  
  def dequeue
    @store.shift
  end
  
  def peek
    @store.first
  end
  
  def size
    @store.count
  end
  
  def empty?
    @store.empty?
  end
end

class Stack
  def initialize
    @store = []
  end
  
  def push(el)
    @store.push(el).dup
  end
  
  def pop
    @store.pop
  end
  
  def peek
    @store.last
  end
  
  def size
    @store.count
  end
  
  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @stack1 = Stack.new
    @stack2 = Stack.new
  end
  
  def enqueue(el)
    @stack1.push(el)
    @stack2 = @stack1.reverse
    @stack1.dup
  end
  
  def dequeue
    @stack2.pop
    @stack1 = @stack2.reverse
    @stack2.dup
  end
  
  def size
    @stack1.size == @stack2.size
    @stack1.size
  end
  
  def empty?
    @stack1.empty? && @stack2.empty?
  end
end