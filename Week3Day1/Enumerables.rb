class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_array = []
        self.my_each do |ele|
            new_array << ele if prc.call(ele)
        end
        return new_array
    end

end

a = [1, 2, 3]
puts a.my_select { |num| num > 1 } # => [2, 3]
puts a.my_select { |num| num == 4 } # => []

# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
#      1
#      2
#      3
#      1
#      2
#      3

# p return_value 

