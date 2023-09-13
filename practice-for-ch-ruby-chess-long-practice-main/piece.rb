class Piece
    attr_reader :color, :board, :pos

    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos
    end

    def moves

    end

    def empty?

    end

    def valid_moves

    end

    def pos=(value)

    end

    private

    def move_into_check?(end_pos)

    end



    def inspect 
        print "#{color} at  #{pos} position" 
        puts
    end
end