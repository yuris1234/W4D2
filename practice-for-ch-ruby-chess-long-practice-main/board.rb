require_relative "./piece.rb"
require "byebug"

class Board
    def initialize
        @rows = populate_board
        @null_piece = NullPiece.instance
    end

    def add_piece(pos, color)
        row, col = pos
        case col
        when 0 || 7
            return Rook.new(color, board, [row,col])
        when 1 || 6
            return Knight.new(color, board, [row,col])
        when 2 || 5
            return Bishop.new(color, board, [row,col])
        when 3 
            return Queen.new(color, board, [row,col])
        when 4 
            return King.new(color, board, [row,col])
        end
    end

    def populate_board
        grid = Array.new(8) { Array.new(8, null_piece) }

        grid[7].each do |row|
            col = 0

            while col <= 7
                grid[row][col] = add_piece([row, col], :white)
                col += 1
            end
        end
        grid[0].each do |row|
            col = 0

            while col <= 7
                grid[row][col] = add_piece([row, col], :black)
                col += 1
            end
        end
        # @rows = Array.new(8) { Array.new(8, NullPiece.new) }
        # @rows.each_with_index do |row, i|
        #     @rows.each_with_index do |col, j|
        #         if (0..1).include?(i) || (6..7).include?(i)
        #             @rows[i][j] = Piece.new
        #         else
        #             @rows[i][j] = nil
        #         end
        #     end
        # end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @rows[row][col] = piece
    end

    def valid_pos?(pos)
        row, col = pos
        return false if !(0..7).include?(row) || !(0..7).include?(col)
        true
    end

    def move_piece(start_pos, end_pos)
        raise if @rows[start_pos] == nil || !valid_pos?(end_pos)
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
        @rows 
    end

    private
    attr_reader :null_piece
end

b = Board.new 
p b 
pos = [0, 0]
p b.[]([0,0])
p b[[3,3]]
p b[[7,7]]