class Rook < Piece
    include Slideable

    def move_dirs
        moves(horizontal_dirs)
    end
end