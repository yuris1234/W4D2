require_relative "slideable"
require_relative "piece"

class Queen < Piece
    include Slideable

    def symbol

    end

    private
    def move_dirs
        # return applicable module constants
        horizontal_dirs + diagonal_dirs
    end
end