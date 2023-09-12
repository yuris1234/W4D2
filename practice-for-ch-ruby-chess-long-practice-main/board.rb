class Board
    def initialize
        @grid = Array.new(8) { Array.new(8) }
        @grid.each_with_index do |row, i|
            @grid.each_with_index do |col, j|
                if (0..1).include?(row) || (6..7).include?(row)
                    @grid[i][j] << Piece.new
                else
                    @grid[i][j] << nil
                end
            end
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @grid[row][col] = piece
    end

    def valid_pos?(pos)
        row, col = pos
        return false if !(0..7).include?(row) || !(0..7).include?(col)
        true
    end

    def move_piece(start_pos, end_pos)
        raise if @grid[start_pos] == nil || !valid_pos?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end
end