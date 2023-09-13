module Stepable
    def moves 
        row, col = self.pos
        holder = []
        self.move_diffs.each do |dir|
            dir_row, dir_col = dir 
            new_row = row + dir_row 
            new_col = col + dir_col 

            if !self.board.valid_pos?([new_row,new_col])
                next
            end

            possible_piece = self.board[[new_row,new_col]]
            if possible_piece != nil 
                if possible_piece.color != self.color 
                    holder << [new_row,new_col]
                end
            elsif self.board.valid_pos?([new_row,new_col])
                holder << [new_row,new_col]
            end
        end
        p holder
        holder 
    end

    private
    def move_diffs
        print "Remember to implement moves_diffs!"
    end
end