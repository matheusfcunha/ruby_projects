require 'colorize'

class Mastermind

  attr_accessor :turn

  Numbers = [1,2,3,4,5,6] #colors

  def initialize
    @secret_number = Ai.secret_number
    @turn = 0
  end

  def guess_feedback
    secret_array = @secret_number
    guess_array = take_turn
    feedback = []
    for i in 0..secret_array.size - 1
    feedback << "Black" if secret_array[i] == guess_array[i]
    end
    whites = secret_array.size - (secret_array - guess_array).size
    whites -= feedback.size
    whites.times { feedback << "White" }

    puts feedback
    return feedback
  end

  def take_turn
   @turn += 1
   puts "Please put your guess separeted by commas, 4 digits!"
   user_input = gets.chomp
   user_input = user_input.split(',')
   user_input.map! { |num| num.to_i }
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
    if guess_feedback == ["Black", "Black", "Black", "Black"]
      return true
    else
      return false
    end
  end

  def new_game
    while !game_over?
      check_win = guess_feedback
      break if check_win == ["Black", "Black", "Black", "Black"]
    end
  end

end


class Player

end

class Ai

  def self.secret_number
    secret_number = []
    numbers_constant = Mastermind::Numbers
    4.times { secret_number << numbers_constant[rand(numbers_constant.size)] }
    secret_number
  end
end
