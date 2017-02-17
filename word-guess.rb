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
  attr_reader  :random_word
  def initialize
    @counter = 0 # counts wrong guesses, if 5 - user lose
  end

  def empty_array?(array)
    array.each do |value|
        return false if value != ""
    end
  end

  def display_underlines(array_of_underlines)
    print "Word: "
    array_of_underlines.each do |underline|
      print underline
    end
  end


  def find_place (random_word, user_guess, array_of_underlines)
    random_word.each_with_index do |char, index|
        if char == user_guess
          array_of_underlines[index] = user_guess # put guessed letter in array of underlines
          random_word[random_word.index(user_guess)] = ''
        end
      end
  end

  def play_game
    stop_game = false
    until stop_game
      puts "Welcome to word guess game! "
      random_word = "whiteblue".split''#Faker::Color.color_name.split''
      print random_word
      array_of_underlines = Array.new(random_word.length, "_ ")
      display_underlines(array_of_underlines)
      puts "\n Enter a letter or a full word:"
      flower = '
        (@)(@)(@)(@)(@)
          ,\,\,|,/,/,
            _\|/_
           |_____|
            |   |
            |___|'
      stop_round = false # stop round of a game
      until stop_round
        puts flower
        user_guess = gets.chomp
        if random_word.include? user_guess
          find_place(random_word, user_guess, array_of_underlines)

          display_underlines(array_of_underlines)
          # puts
          # print random_word
          # puts
        elsif !random_word.include? user_guess
          @counter += 1
          flower = flower.sub(/\(@\)/, '') # remove (@) from flower
        end
        if @counter == 5
          puts "You lost a game"
          stop_round = true
        end
        if empty_array?(random_word)|| (user_guess.split'') == random_word
          puts "You guessed a word!"
          stop_round = true
        end
      end # end until stop_round loop
      puts "Would you like to play one more time? (y/n)"
      answer = gets.chomp
      if answer == "n"
        stop_game = true
      end
  end # end of stop_game loop
  end # end of method
end # end of class
game = Game.new
puts game.play_game
