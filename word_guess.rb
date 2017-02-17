#https://github.com/Ada-C7/Word-Guess
require 'faker'

class WordGame

  def initialize
    @lives = 9
    @word = Faker::Cat.unique.name
    @underscore_array = Array.new( @word.length, "_" )
    @word_array = @word.split("")
  end

  def convert_string_to_array
    @word_array = @word.split("")
    puts "#{@underscore_array}"
    puts "#{@word_array}"
  end

  # def compare_arrays
  #   @word_array = @word.split("")
  #   # @user_input == @word_array.include
  # end

  def ascii_art
    @lives.times do
      print " ^⨀ ᴥ⨀ ^ "
    end
  end

  # def game_prompt
  #   puts "Hi! Let's play guess that word!"
  #   puts "Here's the board"
  #   # first full ascii art appears
  #   # empty array with _ _ _ _
  #   puts "What's your guess?"
  #   user_input = gets.chomp
  # end

end

worddammit = WordGame.new
worddammit.ascii_art
worddammit.convert_string_to_array
