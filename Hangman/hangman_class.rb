class Hangman
    def initialize(player_name)
        @player_name = player_name
        @secret_word = nil
        @guess_count = 0
        @guess_word = nil
        @wrong_guess = []
    end

    def new_game
        puts "Hello #{@player_name}. To play Hangman just put your letter guess! You have 10 tries (Put 'save' to save your game)"
        puts "The secret word - #{@guess_word} - it has #{@guess_word.size} Letters."
        while @guess_count != 10
            puts "Please put your guess   -   Number of tries #{@guess_count}  - Wrong letters tried [#{@wrong_guess.join('-')}] "
            player_guess = gets.chomp.downcase
            if player_guess == 'save'
                save_game
                puts 'Game saved!'
                redo
            elsif player_guess.size > 1
                puts 'Only one letter at once please!'
                redo
            end
            replace_word(player_guess)
            puts "\t #{@guess_word}"
            break if @guess_word == @secret_word
        end
        puts "You lose! The secret word was #{@secret_word}" if @guess_count == 10
    end

    def create_secret_word
        wordlist = File.read('Lista-de-Palavras.txt')
        wordlist = wordlist.split
        wordlist.select! { |w| w.size >= 5 && w.size <= 12 }
        wordlist.map!(&:downcase)
        @secret_word = wordlist.sample
        @guess_word = '_' * @secret_word.chars.size
    end

    def find_word(user_guess)
        word_chars = @secret_word.chars
        if word_chars.include?(user_guess)
            return word_chars.each_with_index.select { |w, _idx| w == user_guess }.map { |w| w[1] }
        else
            return nil
        end
    end

    def replace_word(user_guess)
        @guess_count += 1
        character_index = find_word(user_guess)
        if character_index.class == Array
            character_index.each { |w| @guess_word[w] = user_guess }
        else
            @wrong_guess << user_guess
        end
    end

    def save_game
        File.open('game_save', 'w') { |f| f.write(Marshal.dump(self)) }
    end
end
