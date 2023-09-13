require_relative "./piece.rb"
require "byebug"
require_relative "piece_classes"

class Board
    attr_accessor :rows
    def initialize
        @rows = populate_board
        @null_piece = NullPiece.instance 
    end

    def add_piece(pos, color)
        # debugger
        row, col = pos
        # debugger
        case col
        when 0 
            return Rook.new(color, self, [row,col])
        when 1 
            return Knight.new(color, self, [row,col])
        when 2 
            return Bishop.new(color, self, [row,col])
        when 3 
            return Queen.new(color, self, [row,col])
        when 4 
            return King.new(color, self, [row,col])
        when 5 
            return Bishop.new(color,self,[row,col])
        when 6
            return Knight.new(color, self, [row,col])
        when 7
            return Rook.new(color, self, [row,col])
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
        # debugger
        grid = Array.new(8) { Array.new(8, NullPiece.instance) }
        # debugger
        grid[7].each_index do |col|
            # debugger
            grid[7][col] = add_piece([7, col], :white)
            # grid[7][col] = add_piece([7, col], :white)
        end

        grid[0].each_index do |col|
            grid[0][col] = add_piece([0, col], :black)
        end

        add_pawns(grid)
    
        grid 
    end

    def [](pos)
        # debugger
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

    def has_piece?(pos)
        self[pos] != NullPiece.instance 
    end

    def move_piece(start_pos, end_pos)
        raise if !valid_pos?(end_pos) || !valid_pos?(start_pos)
        moving_piece = self[start_pos]
        # p moving_piece.moves
        raise if !moving_piece.moves.include?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
        self[end_pos].pos = end_pos
    end

    def checkmate?(color)
        #check if there's a checkmate on the board for a color
    end

    def in_check?(color)
        # check if there's a check for the color
    end

    def find_king(color)

    end

    def print_board
        @rows.each do |row|
            puts row.join(" ")
        end
    end

    private
    attr_reader :null_piece
end

b = Board.new 
# b.print_board
# b.print_board
b.move_piece([7,1],[5,2])
# b.print_board
b.move_piece([7,0],[7,1])
# b.print_board
b.move_piece([1,4],[3,4])
# b.print_board
b.move_piece([0,4],[1,4])
# b.print_board
b.move_piece([1,4],[2,4])
# b.print_board
b.move_piece([1,5],[3,5])
b.move_piece([0,3],[3,6])
b.move_piece([3,6],[6,6])
b.print_board
# pos = [0, 0]
# p b.[]([0,0])
# p b[[3,3]]
# p b[[7,7]]