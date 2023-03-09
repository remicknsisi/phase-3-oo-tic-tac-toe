class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8], #bottom row
        [0,4,8],
        [6,4,2],
        [0,3,6],
        [1,4,7],
        [2,5,8]
      ]

    def initialize
        @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    end

    def display_board 
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index input
        int = input.to_i - 1
        int
    end

    def move i, token = "X"
        @board[i] = token
    end

    def position_taken? i
        if @board[i] == ' '
            false
        else
            true
        end
    end

    def valid_move? i
        if i > 8
            false
        elsif @board[i] == ' '
            true
        else
            false
        end
    end

    def turn_count
        @board.select{|space| " " != space}.count
    end

    def current_player
        if self.turn_count.odd?
            "O"
        else
            "X"
        end
    end

    def turn 
        puts "Please enter a position (1-9):"
        user_input = gets.strip
        index = input_to_index(user_input)
       if valid_move?(index)
          token = current_player
          move(index, token)
          display_board
       else
         self.turn
       end
    end
end