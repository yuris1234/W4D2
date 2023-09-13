class King < Piece 
    def symbol

    end
    protected
    def move_dirs 
        return [[0,1],[-1,0],[0,-1],[1,0],[-1,-1],[1,1],[1,-1],[-1,1]]
    end
end