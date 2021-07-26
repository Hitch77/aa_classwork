require_relative "00_tree_node.rb"
require 'byebug'
class KnightPathFinder
    attr_reader :root_node
    
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
        #debugger
        return added_positions
    end

    def self.valid_moves(pos)
        new_array = []
        i, j = pos

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

    def build_move_tree
        queue = [@root_node]

        while queue.length > 0
            first_node = queue.shift
            new_move_positions(first_node.value).each do |i| 
                new_node = PolyTreeNode.new(i)
                new_node.parent = first_node
                first_node.add_child(new_node)
                queue << new_node
            end
        end
    end

    def find_path(end_pos)
        end_node = self.root_node.dfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        new_arr = []
        ptr_node = end_node
        while ptr_node.parent != nil
            new_arr.unshift(ptr_node.value)
            ptr_node = ptr_node.parent
        end
        new_arr.unshift(@root_node.value)
        new_arr
    end

    
    # def dfs(value)
    #     return self if self.children.empty? && self.value == value
    #     return self if self.value == value
    #     # return nil if self.children.empty? && self.value != value
    #     self.children.each do |child_node|
    #         child = child_node.dfs(value)
    #         # return child_node if child_node.value == value
    #         return child if !child.nil?
    #     end
    #     nil
    # end
end





# deltas = [(-2, -1), (-2, +1), (+2, -1), (+2, +1), (-1, -2), (-1, +2), (+1, -2), (+1, +2)]
# def knight_moves(position):
#     valid_position = lambda (x, y): x >= 0 and y >= 0 and ???
#     return filter(valid_position, map(lambda (x, y): (position[0] + x, position[1] + y), deltas))
