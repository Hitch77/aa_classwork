require_relative "Tile.rb"
class Board
        #create grid
        #read line by line txt file
        #from every line, sort through integer
        #from integer, make corresponding tile
        #if num != 0, make given
        #if num = 0, reg tile
    def initialize
        #@grid = Array.new(9){Array.new(9)}
        @grid = []
    end

    def populate
        File.open('puzzles/sudoku1_almost.txt').each do |line|
            new_array = []
            line = line.chomp
            line.each_char do |num|
                if num == 0
                    b = Tile.new(num)
                    new_array << b
                else
                    b = Tile.make(num)
                    new_array << b
                end
            end
            @grid << new_array
        end
        p @grid
    end

    def update_tile(pos)
    end

end

b = Board.new
b.populate