class Pawn < Piece
    def symbol

    end

    def moves
        
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
        return 1 if self.board[[row-1,col]].is_a?(NullPiece)
        return -1
    end

    def forward_steps
        # actually using forward_dir to figure out forward steps
    end

    def side_attacks
        # actually using forward_dir to figure out diagonal steps
    end
end