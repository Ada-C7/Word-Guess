# pair_programming https://github.com/Ada-C7/Word-Guess
# Elizabeth and Tamiko
#
# *private section that contains the visual element
# ~ like passage_of_time ~
# - validation for non letters
#
# Initialize section

#
# ~Array of unique letters from random word
#
# .each with string
#

# (class) is the game WordGame
class WordGame

  def initialize
    @word = ["pizza", "jumpy", "hello", "world", "quack", "taxes"].sample
    puts @word
  end

  def open_game
    puts "Welcome to WORD GAME!"
  # rules/instruction
  # first artwork
  end

  def word_with_blanks
  # "hello".each_char {|c| print c, " " }
  end

  def guess
  # -prompt and get one letter from user
  end

  def correct?
  # 	include?
  end

  def validate
  # 	-include? [all_letters]
  end

  def wrong_guesses
  # 	*don't count correct ones
  # Note: keep track of guessed letters
  end

private

  def after_turn

  end

end

game = WordGame.new
