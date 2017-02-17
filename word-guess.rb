require 'Faker'
require 'colorize'

class WordGuess
  attr_reader :num_allowed_guesses
  attr_accessor :word_array, :word_lines, :flower_array, :letter_guesses, :word_guess, :flower_array

  def initialize (game_level)
    hardness_level ={ easy: 10, hard: 5 }
    @num_allowed_guesses = hardness_level[game_level.to_sym]
    @word_array = Faker::Food.ingredient.downcase.chars.to_a
    while @word_array.include?(' ')
      @word_array = Faker::Food.ingredient.downcase.chars.to_a
    end
    @flower_array = Array.new(@num_allowed_guesses, "(@)")
    @word_lines = Array.new(@word_array.length, '_')
    @letter_guesses = []
    @word_guess = false
  end
end

#outside of class begins here:
puts "Welcome to our Word Guess Game!"
while true
  print "Please select a diffilculty level (easy/hard): \n"
  difficulty_input = gets.chomp.downcase
  if ["easy", "hard"].include?(difficulty_input)
    break
  else
    puts "Try again! only enter 'easy', or 'hard'"
  end
end


game = WordGuess.new(difficulty_input)
# print game.word_array
# puts
# print game.word_lines

puts "You will begin with #{game.num_allowed_guesses} rose buds!."
puts "Each wrong letter guess will wilt one rose bud."
puts "Once the last rose bud is wilted the game is over."
puts "You will be able to guess the entire word, only once!"
puts "So guess wisely!\n"

#DISPLAY
puts game.word_array

game.flower_array.each { |flower| print "#{flower}   ".colorize(:light_red) }
puts
print "Your word: "
game.word_lines.each { |dash| print "#{dash} " }
puts
print "Wrong letter guesses: "
game.letter_guesses.each  {|dash| print " #{dash} " }
puts
#checks against erroneous guess_input
while true
  print "Enter a letter guess, or a word guess: "
  guess_input = gets.chomp.downcase
  if guess_input =~ /^[a-zA-Z]+$/
    break
  else
    puts "Try again! only enter a single letter, or a word."
  end
end
#see if it a letter guess or a word guess
if guess_input.length > 1
  #word case
  if guess_input.chars.to_a == game.word_array
    game.word_guess = true
    puts "Yay! You guessed the word!!"
    game.word_lines = game.word_array
  else
    puts "You lose!"
  end


else
  #letter case
  if game.word_array.include?(guess_input)

    game.word_array.each_with_index do |letter, index|
      if letter == guess_input
        game.word_lines[index] = guess_input
      end
    end
  else
    game.letter_guesses << guess_input
    game.flower_array.pop
  end
end

#DISPLAY
game.flower_array.each { |flower| print "#{flower}   ".colorize(:light_red) }
puts
print "Your word: "
game.word_lines.each { |dash| print "#{dash} " }
puts
print "Wrong letter guesses: "
game.letter_guesses.each  {|dash| print " #{dash} " }
puts
