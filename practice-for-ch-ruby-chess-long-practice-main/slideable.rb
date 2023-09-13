module Slideable
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

    private 
    HORIZONTAL_DIRS = [[-1,0],[1,0],[0,1],[0,-1]]
    DIAGONAL_DIRS = [[-1,1],[1,1],[1,-1],[-1,-1]]
    def grow_unblocked_moves_in_dir(dir)
        dir_row, dir_col = dir
        current_row, current_col = self.pos
        current_row += dir_row
        current_col += dir_col
        unoccupied = []
        until !self.board.valid_pos?([current_row,current_col])
            possible_piece = self.board[[current_row, current_col]]
            if possible_piece == NullPiece.instance
                # p "hello"
                unoccupied << [current_row, current_col] 
            elsif possible_piece.color == self.color
                break
            elsif possible_piece.color != self.color 
                unoccupied << [current_row, current_col] 
                break
            end
            current_col += dir_col
            current_row += dir_row
        end

        unoccupied
    end

    def move_dirs 
        raise NoImplementError
    end
end