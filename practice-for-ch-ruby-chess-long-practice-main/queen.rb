class Queen < Piece
    def move_dirs
        # return applicable module constants
        moves(horizontal_dirs + diagonal_dirs)
    end
end