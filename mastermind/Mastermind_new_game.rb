require_relative 'Mastermind_colorized'

def new_game
  game = Mastermind.new
  game_ai = Ai.new
  puts "Hello, how you want to play, you can be the 'guesser' or the 'creator' of the code!"
  user_input = gets.chomp.downcase
  case user_input
  when 'guesser'
    game.new_game_code_guesser
  when 'creator'
    game.new_game_code_creator
    game_ai.user_code = game.user_code
    game_ai.new_game_code_guesser
  else
    puts "Please, choose between 'guesser' mode, or 'creator' mode "
    new_game
  end
end



new_game
