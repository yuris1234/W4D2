module Stepable
    def moves 
        # use self.move_dirs in this method
        # should check color of next pos or invalid pos
        row, col = self.pos
        holder = []
        moves_diffs.each do |dir|
            dir_row, dir_col = dir 
            new_row = row +dir_row 
            new_col = col + dir_col 
            holder << [new_row, new_col] if self.board[new_row, new_col] != nil && self.board.is_valid?([new_row,new_col])
        end
        holder 
    end

    def moves_diffs
        print "Remember to implement moves_diffs!"
    end
end