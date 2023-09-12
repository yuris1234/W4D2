class Bishop < Piece
    def move_dirs
        moves(diagonal_dirs)
    end
end