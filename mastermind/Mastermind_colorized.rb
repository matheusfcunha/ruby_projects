require 'colorize'

class Mastermind

  attr_accessor :turn

 Red     =   "♥".colorize(:color => :red, :background => :black)
 Blue    =   "♥".colorize(:color => :blue, :background => :black)
 Yellow  =   "♥".colorize(:color => :light_yellow, :background => :black)
 Green   =   "♥".colorize(:color => :light_green, :background => :black)
 Magenta =   "♥".colorize(:color => :light_magenta, :background => :black)
 Cyan    =   "♥".colorize(:color => :light_cyan, :background => :black)

 Black =     "♥".colorize(:color => :black, :background => :light_black)
 White =     "♥".colorize(:color => :default, :background => :light_black)

  Numbers = [Red,Blue,Yellow,Green,Magenta,Cyan ] #colors

  def initialize
    @secret_number = Ai.secret_number
    @turn = 0
  end

  def guess_feedback
    secret_array = @secret_number
    guess_array = take_turn
    puts "\t#{guess_array.join(' ')}"
    feedback = []
    for i in 0..secret_array.size - 1
    feedback << Black if secret_array[i] == guess_array[i]
    end
    whites = secret_array.size - (secret_array - guess_array).size
    whites -= feedback.size
    whites.times { feedback << White }

    puts "\t#{feedback.join(' ')}"
    return feedback
  end

  def take_turn
   @turn += 1
   puts "Turn: #{self.turn}"
   print "> "
   user_input = gets.chomp.downcase
   user_input = user_input.split(',')
   user_input.map! do |color|
     case color
     when 'red'
       color = Red
     when 'blue'
       color = Blue
     when 'yellow'
       color = Yellow
     when 'green'
       color = Green
     when 'pink'
       color = Magenta
     when 'cyan'
       color = Cyan
     end

   end
   user_input
  end

  def game_over?

    if self.turn >= 10
      return true
    else
      false
    end

  end

  def player_win?
    if guess_feedback == [Black,Black,Black,Black]
      return true
    else
      return false
    end
  end

  def new_game
  puts "Choose between this colors > (red,blue,yellow,green,pink,cyan) - 10 Turns to guess"
  puts "Hints: White hearts > the code has the color but in wrong position; Black hearts > the code has the color and it's in right position "
  puts "Please put your guess separeted by commas, 4 Colors!  Ex: red,blue,yellow,green"
  puts [Red,Blue,Yellow,Green,Magenta,Cyan].join(' - ')
    while !game_over?
      check_win = guess_feedback
      break if check_win == [Black,Black,Black,Black]
    end
  end

end


class Player

end

class Ai

  def self.secret_number
    numbers_constant = Mastermind::Numbers
    secret_number = numbers_constant.sample (4)
    secret_number
  end
end
