require 'byebug'
def remove_dups(array)
    sorted = array.sort
    no_dups = []
    sorted.each do |ele|
        if !no_dups.include?(ele)
            no_dups << ele
        end
    end
    no_dups
end

class Array
    def two_sum
        pairs = []
        self.each_with_index do |ele1, idx1|
            self.each_with_index do |ele2, idx2|
                if idx2 > idx1 && ele1 + ele2 == 0
                    pairs << [idx1, idx2]
                end
            end
        end
        return pairs
    end
end

def my_transpose(arr)
  arr.each_with_index.map do |ele, index|
    arr.map { |row| row[index] }
  end
end

def stock_picker(array)
    # debugger
    pairs = []
    diff = 0
    array.each_with_index do |ele1, idx1|
        array.each_with_index do |ele2, idx2|
            if (idx2 > idx1) && (ele2 > ele1) && ((ele2 - ele1) > diff)
                diff = ele2 - ele1
                pairs = [idx1, idx2]
            end
        end
    end
    pairs
end

class Puzzle
    attr_accessor :towers, :disc
    def initialize
        @towers = [[3, 2, 1], [], []]
    end

    def [](pos)
        row, col = pos
        @towers[row][col]
    end

    def []=(pos, value)
        row, col = pos
        value = @towers[row][col]
    end

    def move(old_pos, new_pos)
        disc = @towers[old_pos].pop
        if @towers[new_pos].last == nil || @towers[new_pos].last > disc
            @towers[new_pos] << disc
        else @towers[old_pos] << disc
        end
        p @towers
    end

    def input
        until won?
            p "Which pile do you want to pick up the disc from?"
            old_pos = gets.chomp.to_i
            p "Which pile do you want to place your picked up disc?"
            new_pos = gets.chomp.to_i
            self.move(old_pos, new_pos)
        end
        p "you won!"
    end

    def won?
        if @towers[2] == [3, 2, 1]
            return true
        end
        false
    end

end

play = Puzzle.new
p play.towers
play.input
# p play.move

