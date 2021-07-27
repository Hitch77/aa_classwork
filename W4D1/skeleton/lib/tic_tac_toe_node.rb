require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board, :next_mover_mark
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
# debugger
    open_positions = []
    children = []
    @board.rows.each_index do |i|
      (0..2).each do |j|
        open_positions << [i, j] if @board.rows[i][j] == nil
      end
    end
    open_positions.each do |pos|
      new_board = @board.rows.dup
      child_board = Board.new(new_board)
      child_board[pos] = next_mover_mark
      new_mark = next_mover_mark
      new_mark == :x ? new_mark = :o : new_mark = :x
      children << TicTacToeNode.new(new_board, new_mark, prev_move_pos =)
    end
    return children    
  end
end


