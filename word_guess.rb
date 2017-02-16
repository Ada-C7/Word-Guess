require 'faker'
# Word guess game created by Alena Messmer and Theresa Manney
# Started on 2.16.17

# Create game class
class WordGame
  attr_reader :word
  # Method initialize
  def initialize(unique_word)
    @letters = []
    @word = unique_word
    @max_guesses
  end
  puts @word
  # Method Ascii art
  def print_ascii_art

  end
  # Method word work... prints correct and incorect guesses along with underscores
  def word_work
    underscores = []
    underscores = @word.upcase.split(//)

  end

  #add letter method
  def add_letter(letter)
    @letters << letter

  end

  # Input evaluation
  def input_evaluation
    #while

    #end
  end

end

# Create an array that will contain words
words = []

# BUGZ: color might be greater than one work, how to handle spaces?
10.times do
  words << Faker::Color.unique.color_name
end

game_word = WordGame.new(words[0])

puts game_word.word
# puts words
print game_word.word_work

# Create user prompt
puts "Hello user, please guess a letter > "
letter_guess = gets.chomp.upcase
puts game_word.add_letter(letter_guess)

#letter_guess.input_evaluation
