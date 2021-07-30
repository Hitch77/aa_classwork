# def my_min(list)
#     quick_sort(list).first
# end

# def quick_sort(list)
#     return list if list.length <= 1
#     pivot = list.shift
#     left = []
#     right = []
#     list.each do |ele|
#         if ele < pivot
#             left << ele
#         else right << ele
#         end
#     end
#     quick_sort(left) + [pivot] + quick_sort(right)
# end

def my_min_slow(list) # n = input
    list.each do |ele1| # loops n times
        list.all? do |ele2| # loops n times
            if ele1 < ele2
                return ele1
            end
        end
    end
end

def my_min_fast(list)
    min = list.first
    list.each do |ele|
        if ele < min
            min = ele
        end
    end
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_slow(list) # O(n^2)
# p my_min_fast(list) # 0(n)

def largest_contiguous_subsum_slow(list)
    subarrays = []
    (list.length-1).times do |i1| # n
        (i1..list.length-1).each do |i2| # n^2
            subarrays << list[(i1..i2)] # n^3
        end
    end

    largest_sum = subarrays.first.sum # but could have been size n
    subarrays.each do |ele| # n locally n^2 in scope
        if ele.sum > largest_sum # n^2 locally but n^3 in scope
            largest_sum = ele.sum # n^2 locally but n^3 in scope
        end
    end
    largest_sum
end

def largest_contiguous_subsum_fast(list)
    largest_sum = list.first # 1
    current_sum = list.min # n
    list.each do |ele| # n
        if ele + current_sum < 0 # this is checking if current sum plus element will hit zero, if not then we add contiguous elements # 1
            current_sum = ele    # resets contiguous sum # 1
        else
            current_sum += ele   # continues sum # 1
        end
        if ele > current_sum     # if current sum is negative and ele is larger/resets counter if new non-contiguous num is larger # 1
            current_sum = ele    # reset current sum to element # 1
        end
        if current_sum > largest_sum # 1
            largest_sum = current_sum # 1
        end
    end
      return largest_sum
end




list1 = [5, 3, -7]
p largest_contiguous_subsum_fast(list1) # => 8

# possible sub-sums
[5]           # => 5
[5, 3]        # => 8 --> we want this one
[5, 3, -7]    # => 1
[3]           # => 3
[3, -7]       # => -4
[-7]          # => -7

list2 = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_fast(list2) # => 8 (from [7, -6, 7])

list3 = [-5, -1, -3]
p largest_contiguous_subsum_fast(list3) # => -1 (from [-1])
