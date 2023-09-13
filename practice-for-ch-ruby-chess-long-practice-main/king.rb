require_relative "stepable"
require_relative "piece"

class King < Piece 
    include Stepable
    def symbol

    end
    protected
    def move_dirs 
        return [[0,1],[-1,0],[0,-1],[1,0],[-1,-1],[1,1],[1,-1],[-1,1]]
    end
end