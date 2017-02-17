# the word will be given by gem
# underlines for the random word will be poped up according to the random word
# array for a word
# the user will start entering his guesses one at a time
# the user can guess the whole word at once - game over
# case 1 when user guess is right:
# place the right letter at the position/positions
# case 2 when user guess is not right:
# remove 1 flower at a time
# when the game is over, give an user option to continue or quit


require 'Faker'

class Game
  attr_reader  :random_word, :random_word_letters,
  def initialize
    # @random_word = Faker::Color.color_name.split''
    @flower = '
    (@)(@)(@)(@)(@)
    ,\,\,|,/,/,
    _\|/_
    |_____|
    |   |
    |___|'  #when we create instance variable it will appear

  end

  def play_game
    continue = false
    until continue
      random_word = Faker::Color.color_name.split''
      puts @flower
      number  = random_word.length
      array_of_underlines = Array.new(number, "_ ")
      print random_word
      #puts "word:" + "_ " * number
      print array_of_underlines
      puts "Enter a letter or a word?"

      stop = false
      until stop
        user_guess = gets.chomp
        if random_word.include? user_guess
          puts "Next?"
          random_word.delete(user_guess)
          puts random_word

        end
        if random_word.empty? || (user_guess.split'') == random_word
          puts random_word
          puts "Congratulations!"
          stop = true

        end
      end
      puts "Would you like to continue the game?(y/n)"
      game_continue = gets.chomp
      if game_continue == "n"
        continue = true
      end
    end
  end
end
game = Game.new
puts game.play_game
