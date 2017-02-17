#https://github.com/Ada-C7/Word-Guess
require 'faker'

class WordGame

  def initialize
    @lives = 9
    @word = Faker::Cat.unique.name
    @underscore_array = Array.new( @word.length, "_" )
    @word_array = @word.split("")
    @user_input = gets.chomp
  end

  def convert_string_to_array
    @word_array = @word.split("")
    puts "#{@underscore_array}"
    puts "#{@underscore_array.join(" ")}"
    @underscore_string = @underscore_array.join(" ")
    puts "#{@word_array}"
    puts "#{@word_array.join("")}"
    @word_string = @word_array.join("")
  end

def big_loop
  if @word_array.include? @user_input then
    puts "Working1"
    # this is where the correct index is collected
    # the underscore_array and underscore_string
    # are updated to show correct guess
    # unless loop to handle when last letter guessed
  elsif @user_input == @word_string then
    puts "Working2"
  #elsif @word_array.length == @underscore_array.length
    #compare complete arrays and give
    #you win prompt
  else
    puts "You're SO wrong. You killed a cat."
    @lives =- 1
  end
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
worddammit.big_loop
