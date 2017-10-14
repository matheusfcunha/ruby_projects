require_relative 'hangman_class.rb'

def start
    puts "                             HANGMAN \n\n\n    [1] New game\n    [2] Load game  \n  "
    player_input = gets.chomp.to_i
    player_input
    case player_input
    when 1
        puts 'Please insert your nickname'
        player_name = gets.chomp
        hangman = Hangman.new(player_name)
        hangman.create_secret_word
        hangman.new_game
    when 2
        load_game
    else
        puts 'Please, choose between 1 or 2'
    end
end

def load_game
    hangman = Marshal.load(File.read('game_save'))
    hangman.new_game
end

start
