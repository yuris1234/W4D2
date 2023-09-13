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

    def moves
        # return all possible moves as an array
        possible_moves = []
        self.move_dirs.each do |dir|
            possible_moves += grow_unblocked_moves_in_dir(dir)
        end

        possible_moves
    end

    def grow_unblocked_moves_in_dir(dir)
        # get rid of parameter, use self.move_dirs in this method
        # should check for color of piece and invalid move
        dir_row, dir_col = dir
        current_row, current_col = self.pos
        current_row += dir_row
        current_row += dir_col
        unoccupied = []
        until !(0..7).include?(current_col) || !(0..7).include?(current_row)
            possible_piece = self.board[current_row, current_col]
            if possible_piece != nil
                if possible_piece.color == self.color
                    break
                elsif possible_piece.color != self.color 
                    occupied << [current_row, current_col] 
                    break
                end
            end
            occupied << [current_row, current_col]
            current_col += dir_col
            current_row += dir_row
        end

        unoccupied
    end

    def move_dirs 
        raise NoImplementError
    end
end