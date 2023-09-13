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
            return Rook.new(color, self, [row,col])
        when 1 || 6
            return Knight.new(color, self, [row,col])
        when 2 || 5
            return Bishop.new(color, self, [row,col])
        when 3 
            return Queen.new(color, self, [row,col])
        when 4 
            return King.new(color, self, [row,col])
        end
    end

    def add_pawns(grid)
        grid[1].each_index do |col|
            grid[1][col] = Pawn.new(:black, self, [1, col])
        end
        grid[6].each_index do |col|
            grid[6][col] = Pawn.new(:white, self, [6, col])
        end
    end

    def populate_board
        grid = Array.new(8) { Array.new(8, null_piece) }

        grid[7].each_index do |col|
            grid[7][col] = add_piece([7, col], :white)
        end

        grid[0].each_index do |row|
            grid[0][col] = add_piece([0, col], :black)
        end

        add_pawns(grid)
    
        grid 
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

# b = Board.new 
# p b 
# pos = [0, 0]
# p b.[]([0,0])
# p b[[3,3]]
# p b[[7,7]]