class Pawn < Piece
    def symbol
        "♙"
    end

    def moves
        forward_steps + side_attacks 
    end

    private

    def at_start_row?
        row, col = self.pos
        row == 1 || row == 6
    end

    def forward_dir
        # helper method
        # direction + 1
        # direction - 1
        row, col = self.pos
        return 1 if row == 1
        return -1 if row == 6
    end

    def forward_steps
        # actually using forward_dir to figure out forward steps
        holder = []
        row, col = self.pos
        if at_start_row?
            if self.board[[row+(forward_dir*2), col]].is_a?(NullPiece)
                holder << [row+(forward_dir*2), col]
            end
        end
        if self.board[[row+forward_dir, col]].is_a?(NullPiece)
            holder << [row+forward_dir, col]
        end

        holder
    end

    def side_attacks
        # actually using forward_dir to figure out diagonal steps
        row, col = self.pos

        holder = []
        right_diagonal = [row+forward_dir, col-1]
        right_piece = self.board[[row+forward_dir, col-1]]
        left_diagonal = [row+forward_dir, col+1]
        left_piece = self.board[[row+forward_dir, col+1]]

        if self.board.valid_pos?(right_diagonal) && right_piece.color == self.color
            holder << right_diagonal
        elsif self.board.valid_pos?(left_diagonal) && left_piece.color == self.color
            holder << left_diagonal
        end

        holder
    end
end