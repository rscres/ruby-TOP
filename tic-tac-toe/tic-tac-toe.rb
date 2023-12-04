class Board
  def initialize
    @board = Array.new(9, ' ')
    9.times { |i| @board[i] = i + 1 }
  end

  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6]             # diagonals
  ]

  def win_check?
    WINNING_COMBINATIONS.any? do |combination|
      @board.values_at(*combination).uniq.length == 1
    end
  end
  
  def draw
    x = 0
    puts ' '
    while x < 9
      if x % 3 == 2
        puts " #{@board[x]} "
        puts '---+---+---' if x < 8
      else
        print " #{@board[x]} |"
      end
      x += 1
    end
    puts ' '
  end

  def update(position, symbol)
    return false if @board[position - 1] == ('X' or 'O')
    @board[position - 1] = symbol
    return true
  end
end

class Player
  attr_reader :number, :symbol
  @@player_count = 0

  def initialize
    @@player_count += 1
    @number = @@player_count.odd? ? 1 : 2
    @symbol = @@player_count.odd? ? 'X' : 'O'
  end

  def move(board)
    print "Player#{@number}, enter a number (1-9): "
    position = gets.chomp.to_i
    while position.between?(1, 9) == false || board.update(position, @symbol) == false
      print 'Invalid move. Try again: '
      position = gets.chomp.to_i
    end
  end
end

class Game
  attr_reader :board, :player1, :player2

  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
  end

  def restart?
    print 'Play again? (y/n): '
    answer = gets.chomp.downcase
    if answer == 'y'
      @board = Board.new
      @player1 = Player.new
      @player2 = Player.new
      self.round
    else
      puts 'Thanks for playing!'
      exit
    end
  end

  def check_winner(i)
    if @board.win_check? == true and i.even?
      puts "Player#{@player2.number} wins!"
    elsif @board.win_check? == true and i.odd?
      puts "Player#{@player1.number} wins!"
    else
      puts "That's a draw!"
    end
  end
  
  def round
    i = 0
    while @board.win_check? == false and i < 9
      system('clear')
      @board.draw
      if i.even?
        @player1.move(@board)
      else
        @player2.move(@board)
      end
      i += 1
    end
    system('clear')
    @board.draw
    self.check_winner(i)
    self.restart?
  end
end

game = Game.new
game.round