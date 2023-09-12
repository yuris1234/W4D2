module Slideable
    HORIZONTAL_DIRS = [[-1,0],[1,0],[0,1],[0,-1]]
    DIAGONAL_DIRS = [[-1,1],[1,1],[1,-1],[-1,-1]]

    def horizontal_dirs
        # array of all horizontal directions
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves(array)
        # return all possible moves as an array
        possible_moves = []
        array.each do |dir|
            possible_moves += grow_unblocked_moves_in_dir(dir)
        end

        possible_moves
    end

    def grow_unblocked_moves_in_dir(dir)
        # return an array of all possible moves in one direction
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
                break
            end
        end

        unoccupied
    end

    def move_dirs 
       print "Remember to write move_dirs in your subclass!"
    end
end