class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end
  
  def insert(num)
    raise 'Out of bounds' if !num.between?(0, store.length-1)
    store[num] = true
  end

  def remove(num)
    raise 'Out of bounds' if !num.between?(0, store.length-1)
    store[num] = false
  end

  def include?(num)
    raise 'Out of bounds' if !num.between?(0, store.length-1)
    store[num] == true
  end

end


class IntSet
  
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end
  
  def insert(num)
    return false if include?(num)
    i = num % store.length
    store[i] << num
    true
  end
  
  def remove(num)
    return false if !include?(num)
    i = num % store.length
    store[i].delete(num)
    true
  end
  
  def include?(num)
    i = num % store.length
    store[i].include?(num)
  end
  
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store
  attr_writer :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    i = num % num_buckets
    store[i] << num
    @count += 1
    if count > num_buckets
      resize!
    end
    true
  end

  def remove(num)
    return false if !include?(num)
    i = num % num_buckets
    store[i].delete(num)
    @count -= 1
    true
  end

  def include?(num)
    i = num % num_buckets
    store[i].include?(num)
  end

  private
  attr_writer :store

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = ResizingIntSet.new(2 * num_buckets)
    @store.each do |bucket|
      bucket.each do |val|
        new_store.insert(val)
      end
    end
    @store = new_store.store
  end
end