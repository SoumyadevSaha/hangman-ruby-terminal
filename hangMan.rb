class Hangman

    attr_accessor :word, :guess, :disp_word

    def initialize
      # Once we make an incorrect or correct guess, we will remove the letter from the array
      @word = words.sample # picking a random word from the array words.
      @guess = (word.first.length * 1.5).to_i # number of guesses based on the length of the word
      @disp_word = Array.new(word.first.length, '_') # creating an array of underscores based on the length of the word
    #   puts "The word is: #{@disp_word.join('')}\n"
    end

    def words
        [
            ["cricket", "A game fairly popular in India."], # word, clue pair.
            ["jogging", "Do this every morning to stay healthy."], # word, clue pair.
            ["python", "A programming language which is also associated with the name of an animal."], # word, clue pair.
            ["birthday", "This day comes only once a year for every person."], # word, clue pair.
            ["metaverse", "A VR technology associated with cryptocurrency."], # word, clue pair.
            ["ruby", "A programming language, also associated with the name of a gem."], # word, clue pair.
        ]
    end

    def begin
        # Ask the user to start the game
        puts "\nNew game started... Your word is #{@word.first.length} letters long.\nYour clue is -> #{@word.last}\n"
        while @guess > 0
            # Ask the user to guess a letter
            if @disp_word.join('') == @word.first
                break
            end
            puts "\nNumber of guesses remaining: #{@guess}\nGuess a letter: "
            @guess -= 1
            letter_guess = gets.chomp.downcase
            if @word.first.include?(letter_guess)
                # If the letter is in the word, replace the underscore with the letter
                @word.first.split('').map.with_index do |letter, index|
                    if letter == letter_guess
                        @disp_word[index] = letter_guess
                    end
                end
                puts "You guessed correctly !!!"
            else
                puts "Wrong guess !!!"
            end
            puts "\nThe word is: #{@disp_word.join(' ')}\n"
        end             
        if @disp_word.join('') == @word.first
            puts "\nYou won !!!"
        else
            puts "\nYou lost !!!\n"
            puts "The correct word was: #{@word.first}\n"
        end
    end

end

game = Hangman.new
game.begin

while true
    puts "\nDo you want to play again? press 'y' to play again or any other key to exit"
    play_again = gets.chomp.downcase
    if play_again == 'y'
        game = Hangman.new
        game.begin
    else
        puts "Thank you for playing !!!\n"
        break
    end
end