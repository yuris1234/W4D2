class Rook < Piece
    include Slideable

    def move_dirs
        # return applicable module consatnts
        horizontal_dirs
    end
end