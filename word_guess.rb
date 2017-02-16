require "faker"

class Game
  attr_accessor :word, :user_guess, :image

  def initialize
    @word = word
    @user_guess = user_guess
    @image = image
  end

  def generate_word
    @word = Faker::HarryPotter.unique.character
    puts @word
  end

  def display_dashes
  end

  def image
  end

  def guess
  end

  def verify
  end

end

hangman = Game.new
hangman.generate_word
