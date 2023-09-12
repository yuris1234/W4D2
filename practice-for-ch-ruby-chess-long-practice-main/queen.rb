class Queen < Piece
    def move_dirs
        moves(horizontal_dirs + diagonal_dirs)
    end
end