require_relative "./piece.rb"
require "byebug"

class Board
    def initialize
        @grid = Array.new(8) { Array.new(8) }
        @grid.each_with_index do |row, i|
            @grid.each_with_index do |col, j|
                if (0..1).include?(i) || (6..7).include?(i)
                    @grid[i][j] = Piece.new
                else
                    @grid[i][j] = nil
                end
            end
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @grid[row][col] = piece
    end

    def valid_pos?(pos)
        row, col = pos
        return false if !(0..7).include?(row) || !(0..7).include?(col)
        true
    end

    def move_piece(start_pos, end_pos)
        raise if @grid[start_pos] == nil || !valid_pos?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end

    def add_piece(piece, pos)
        self[pos] = piece 
    end

    def checkmate?(color)
        #check if there's a checkmate on the board for a color
    end

    def in_check?(color)
        # check if there's a check for the color
    end

    def find_king(color)

    def inspect 
        @grid 
    end
end

b = Board.new 
p b 
pos = [0, 0]
p b.[]([0,0])
p b[[3,3]]
p b[[7,7]]