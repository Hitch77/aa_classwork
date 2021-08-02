require_relative 'p02_hashing.rb'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def insert(key)
    return false if include?(key)
    i = key.hash % store.length
    store[i] << key
    @count += 1
    if count > num_buckets
        resize!
    end
    true
  end

  def include?(key)
    i = key.hash % store.length
    store[i].include?(key)
  end

  def remove(key)
    return false if !include?(key)
    i = key.hash % num_buckets
    store[i].delete(key)
    @count -= 1
    true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = HashSet.new(2 * num_buckets)
    @store.each do |bucket|
      bucket.each do |val|
        new_store.insert(val)
      end
    end
    @store = new_store.store
  end
end
