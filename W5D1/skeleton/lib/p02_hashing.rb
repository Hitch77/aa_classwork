class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0 if self.empty?
    result = length + self[0] - self[-1]
    self.each do |ele|
        result *= ele
    end
    result
  end
end

class String
  def hash
    result = 1
    self.each_char do |char|
        result *= char.ord
    end
    result + self[-1].ord
  end
end



class Hash

  def hash
    result = 1
    
    self.each do |k, v|
        result * (k.hash + v.hash)
    end
    result + self.length
  end
end