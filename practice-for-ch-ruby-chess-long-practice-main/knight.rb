require_relative "stepable"
require_relative "piece"

class Knight < Piece 
    include Stepable
    def symbol
        "♘"
    end
    protected
    def move_diffs
        return [[2,-1],[-1,2],[-2,1],[2,-1],[1,-1],[1,2],[-1,-2],[-2,-1]]
    end
end