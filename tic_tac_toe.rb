class TicTacToe

  attr_accessor :grid
  attr_reader :positions

  WinPositions = [
    [:a1,:a2,:a3],
    [:b1,:b2,:b3],
    [:c1,:c2,:c3],
  #Vertical wins
    [:a1,:b1,:c1],
    [:a2,:b2,:c2],
    [:a3,:b3,:c3],
  #Diagonal wins
    [:a1,:b2,:c3],
    [:a3,:b2,:c1],
             ]

  def initialize
    @grid = {
      :a1 => nil,
      :a2 => nil,
      :a3 => nil,
      :b1 => nil,
      :b2 => nil,
      :b3 => nil,
      :c1 => nil,
      :c2 => nil,
      :c3 => nil
    }

  end

  def game_over?
    x_check = @grid.select { |k,v| v == "X" }
    o_check = @grid.select { |k,v| v == "O" }
    return true if @grid.has_value?(nil) == false
    for i in 0..WinPositions.size - 1
      win = WinPositions[i].all? {|v| x_check.key? v} || WinPositions[i].all? {|v| o_check.key? v}
      if win == true
        return true
        break
      end
    end
    return false
  end

  def self.new_game
    puts "How to play >  Player 1 is X, and player 2 is O, positions on board are following: A1,A2,A3 second line is B1,B2,B3 and the third C1,C2,C3"
    sleep 2
    a = TicTacToe.new
    a.print_board
    while a.game_over? != true
      puts "\nPlayer 1 put your X"
      position_1 = gets.chomp.downcase.to_sym
      a.grid[position_1] = "X"
      a.print_board
      break if a.game_over? == true
      puts "\nPlayer 2 put your O"
      position_2 = gets.chomp.downcase.to_sym
      a.grid[position_2] = "O"
      a.print_board
    end
  end

  def print_board
    print "\t #{self.grid[:a1]} | #{self.grid[:a2]} | #{self.grid[:a3]}\n\t ---------\n\t #{self.grid[:b1]} | #{self.grid[:b2]} | #{self.grid[:b3]}\n\t ---------\n\t #{self.grid[:c1]} | #{self.grid[:c2]} | #{self.grid[:c3]} "
  end


end
