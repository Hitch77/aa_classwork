require_relative "00_tree_node.rb"

class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def new_move_positions(pos)
        added_positions = []
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_moves.each do |pos|
            if !@considered_positions.include?(pos)
                @considered_positions << pos
                added_positions << pos
            end
        end
        return added_positions
    end

    def self.valid_moves(pos)
        new_array = []
        i, j = pos
        # new_array << [i+2, j+1]
        # new_array << [i-2, j-1]
        # new_array << [i+2, j-1]
        # new_array << [i-2, j+1]
        # new_array << [i+1, j+2]
        # new_array << [i-1, j-2]
        # new_array << [i+1, j-2]
        # new_array << [i-1, j+2]

        deltas = [[-2, -1], [-2, +1], [+2, -1], [+2, +1], [-1, -2], [-1, +2], [+1, -2], [+1, +2]]
        deltas.each do |subArray|
            new_i = i + subArray[0]
            new_j = j + subArray[1]
            if new_i >= 0 && new_i <= 7 && new_j >= 0 && new_j <= 7
                new_array << [new_i, new_j]
            end
        end
        return new_array
    end

        
end


p kpf = KnightPathFinder.new([4, 4])
p kpf.new_move_positions([4,4])






# deltas = [(-2, -1), (-2, +1), (+2, -1), (+2, +1), (-1, -2), (-1, +2), (+1, -2), (+1, +2)]
# def knight_moves(position):
#     valid_position = lambda (x, y): x >= 0 and y >= 0 and ???
#     return filter(valid_position, map(lambda (x, y): (position[0] + x, position[1] + y), deltas))
