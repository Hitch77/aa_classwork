def bad_two_sum?(arr, target_sum)
    (arr.length-1).times do |idx1| #n
        (idx1+1..arr.length-1).each do |idx2| #n^2
            return true if arr[idx1] + arr[idx2] == target_sum 
        end
    end
    false
end #n^2

def okay_two_sum?(arr, target_sum)
    sorted = arr.sort #n^2
    max = 0
    sorted.each do |ele| #n
        if ele > max && ele < target_sum
            max = ele
        end
    end
    sorted.each do |ele| #n
        if max + ele == target_sum
            return true
        end
    end
    false
end #n^2

def two_sum?(arr, target_sum)
    hash = Hash.new(target_sum)
    arr.each do |ele| #n
        hash[ele] = target_sum - ele
    end
    hash.each_with_index do |(k, v), i| #n
        return true if hash.has_key?(v) && k != v #1
    end
    false
end #n

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false