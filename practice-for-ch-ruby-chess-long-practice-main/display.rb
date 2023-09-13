require_relative "board"
require "colorize"
require_relative "cursor"

class Display
    attr_reader :cursor, :board
    def initialize(board)
        @cursor = Cursor.new([0,0],board)
        @board = board
    end

    def render
        board.rows.each_with_index do |row,  row_i|
            row.each_with_index do |col, col_i|
                if row_i.even?
                    if col.color == :white 
                        puts board[[row_i,col_i]].colorize(:color => :white, :background => :white)
                    else
                        puts board[[row_i,col_i]].colorize(:color => :black, :background => :white)
                    end
                else
                    if col.color == :white 
                        puts board[[row_i,col_o]].colorize(:color => :white, :background => :black)
                    else
                        puts board[[row_i,col_o]].colorize(:color => :black, :background => :black)
                    end
                end
            end
        end
    end
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
d = Display.new(b)
d.render