module Slideable
    HORIZONTAL_DIRS = [[-1,0],[1,0],[0,1],[0,-1]]
    DIAGONAL_DIRS = [[-1,1],[1,1],[1,-1],[-1,-1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def grow_unblocked_moves_in_dir(dir)
        dir_row, dir_col = dir
        current_row, current_col = self.pos
        current_row += dir_row
        current_row += dir_col
        unoccupied = []
        until self.board[[current_row, current_col]] != nil
            occupied << [current_row, current_col]
            current_col += dir_col
            current_row += dir_row
            if !(0..7).include?(current_col) || !(0..7).include?(current_row)
                next
            end
        end

        unoccupied
    end

    def move_dirs 

    end
end