class Knight < Piece 
    def symbol

    end
    protected
    def move_dirs 
        return [[2,-1],[-1,2],[-2,1],[2,-1],[1,-1],[1,2],[-1,-2],[-2,-1]]
    end
end