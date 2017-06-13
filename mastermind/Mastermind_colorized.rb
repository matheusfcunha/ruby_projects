require 'colorize'

class Mastermind

  attr_accessor :turn, :user_code

 Red     =   "♥".colorize(:color => :red, :background => :black)
 Blue    =   "♥".colorize(:color => :blue, :background => :black)
 Yellow  =   "♥".colorize(:color => :light_yellow, :background => :black)
 Green   =   "♥".colorize(:color => :light_green, :background => :black)
 Pink    =   "♥".colorize(:color => :light_magenta, :background => :black)
 Cyan    =   "♥".colorize(:color => :light_cyan, :background => :black)

 Black =     "♥".colorize(:color => :black, :background => :light_black)
 White =     "♥".colorize(:color => :default, :background => :light_black)

  Numbers = [Red,Blue,Yellow,Green,Pink,Cyan ] #colors

  def initialize
    @secret_number = Ai.secret_number
    @turn = 0
    @user_code = []
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
   user_input.gsub!(" ","")
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
       color = Pink
     when 'cyan'
       color = Cyan
     end

   end
   user_input
  end

  def game_over?

    if self.turn >= 10
      puts "Game over, code was: "
      puts "\t#{@secret_number.join(' ')}"
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

  def new_game_code_guesser
  puts "Choose between this colors > (red,blue,yellow,green,pink,cyan) - 10 Turns to guess"
  puts "Hints: White hearts > the code has the color but in wrong position; Black hearts > the code has the color and it's in right position "
  puts "Please put your guess separeted by commas, 4 Colors!  Ex: red,blue,yellow,green"
  puts [Red,Blue,Yellow,Green,Pink,Cyan].join(' - ')
    while !game_over?
      check_win = guess_feedback
      break if check_win == [Black,Black,Black,Black]
    end
  end

  def new_game_code_creator
  puts "Make your code with 4 Colors!"
  user_code = gets.chomp.downcase
  user_code.gsub!(" ","")
  user_code = user_code.split(',')
  user_code.map! { |e| e.capitalize }
  user_code.map! { |e| eval(e) }
  @user_code = user_code
  end

end


class Ai < Mastermind

    attr_accessor :turn, :feedback, :ai_guess

    def initialize
      @feedback = []
      @turn = 0
      @ai_guess = []
      @user_code = []
    end

    def self.secret_number
      numbers_constant = Mastermind::Numbers
      secret_number = numbers_constant.sample (4)
      secret_number
    end

    def game_over?

      if self.turn >= 10
        puts "Game Over, AI Didn't break your code!"
        return true
      else
        false
      end

    end

    def take_turn
      @turn += 1
      if @feedback.include? (Black)
        for i in 0..@user_code.size - 1
          if @user_code[i] != @ai_guess[i]
            @ai_guess[i] = Numbers.sample
            return @ai_guess
          end
        end
      else
        ai_guess = Ai.secret_number
        @ai_guess = ai_guess
        return ai_guess
      end
    end

    def guess_feedback
      secret_array = @user_code
      guess_array = take_turn
      puts "\t#{guess_array.join(' ')}"
      feedback = []
      for i in 0..secret_array.size - 1
      feedback << Black if secret_array[i] == guess_array[i]
      end
      whites = secret_array.size - (secret_array - guess_array).size
      whites -= feedback.size
      whites.times { feedback << White }
      @feedback = feedback
      puts "\t#{feedback.join(' ')}"
      return feedback
    end
end
