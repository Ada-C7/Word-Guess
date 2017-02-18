
require 'colorize'
require 'Faker'
class Game
  attr_reader  :name
 def initialize (name)
   @name = name
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
    puts
  end

  def input_incorrect?(user_guess, random_word)
    special = "@#%!*1234567890-=+()"
    if special.include?(user_guess)
      return true
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
      puts "Welcome to #{@name}! "
      random_word = Faker::Color.color_name.split''
      array_of_underlines = Array.new(random_word.length, "_ ")
      display_underlines(array_of_underlines)
      counter = 0 # counts wrong guesses, if 5 - user lose
      puts "\n Enter a letter or a full word:"
      flower = '
    (@)(@)(@)(@)(@)
      ,\,\,|,/,/,
         _\|/_
        |_____|
         |   |
         |___|'.colorize(:red)
      stop_round = false # stop round of a game
      all_guesses = []
      until stop_round
        puts flower
        user_guess = gets.chomp
        if input_incorrect?(user_guess, random_word)
          puts "Letters only! Try Again!"
          next
        end

        if all_guesses.include?(user_guess)
          puts "Don't enter the same letter twice! Try again"
          next
        end
        all_guesses.push(user_guess)

        if random_word.include? user_guess
          find_place(random_word, user_guess, array_of_underlines)
          display_underlines(array_of_underlines)

        elsif !random_word.include? user_guess
          counter += 1
          flower = flower.sub(/\(@\)/, '') # remove (@) from flower
        end
        if counter == 5
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
game = Game.new("Word Guess Game")
puts game.play_game
