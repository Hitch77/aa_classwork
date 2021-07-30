def naive_solution(arr, window)
  current_max_range = 0
  (arr.length - window+1).times do |i| # n > m ? n : m
    range = arr[i..i+window-1] # m * (n > m ? n : m)
    range = (range.min - range.max).abs # n^2 * 2
    if range > current_max_range
      current_max_range = range
    end
  end
  current_max_range
end # n^2

p naive_solution([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p naive_solution([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p naive_solution([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p naive_solution([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
  def initialize
    @q = []
  end

  def enqueue(el)
    @q << el
    el
  end

  def dequeue
    @q.shift
  end

  def peek
    @q.first
  end

  def empty?
    @q.empty?
  end

  def size
    @q.size
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store << el
    el
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end
