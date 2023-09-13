require_relative "slideable"
require_relative "piece"

class Rook < Piece
    include Slideable

    def symbol
        
    end

    private
    def move_dirs
        # return applicable module consatnts
        horizontal_dirs
    end
end