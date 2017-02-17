require "faker"

class Game
  attr_accessor :word, :user_guess, :image

  def initialize
    @word = word
    @word_array = []
    @user_guess = user_guess
    @image = image
  end

  def generate_word
    @word = Faker::HarryPotter.unique.character.downcase
    puts "The word is #{@word}."

    @word_array = @word.chars.to_a

    print @word_array
  end

  def display_dashes

    @word_array.each do |i|
      print "_ "
    end
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
hangman.display_dashes
