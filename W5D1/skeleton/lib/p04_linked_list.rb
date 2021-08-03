class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
  
  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    prev.next = self.next
    self.next.prev = prev
    self.next = nil
    self.prev = nil
  end
end

class LinkedList
include Enumerable
  
  attr_accessor :head, :tail
  
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end
  
  def first
    return head.next unless empty?
    nil
  end
  
  def last
    return tail.prev unless empty?
    nil
  end
  
  def empty?
    head.next == tail
  end

  def get(key)
  end
  
  def include?(key)
  end
  
  def append(key, val)
    
    cur_node = head 
    while cur_node.next != tail 
        cur_node = cur_node.next 
    end
    new_node = Node.new(key, val)
    new_node.next = cur_node.next 
    new_node.prev = cur_node 
    new_node.next.prev = new_node
    cur_node.next = new_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    nodes = []
    cur_node = head
    while cur_node.next != tail
      cur_node = cur_node.next
      nodes << cur_node
    end
    return nodes
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
