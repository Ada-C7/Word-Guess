require 'faker'
# Word guess game created by Alena Messmer and Theresa Manney
# Started on 2.16.17

# Create game class
class WordGame
  attr_reader :word
  attr_writer :letters
  attr_accessor :progress, :wrong_guesses, :max_guesses


  # Method initialize
  def initialize(unique_word)

    @word = unique_word
    @max_guesses = 15
    @wrong_guesses = []
    @progress = Array.new(unique_word.length, "_")
  end
end
def run_game
  # word_game = start(words)
  # word_game = start(words)
  words = create_word_bank
  word_game = start(words)
  #prompt_user(word_game.progress)


  until word_game.max_guesses == 0
    roses = pruning_roses(word_game.max_guesses)
    puts print_ascii_art(roses)
    guess = prompt_user(word_game.progress)
    input_evaluation(guess, word_game)
    print word_game.wrong_guesses
    puts
  end
  print word_game.progress
  print word_game.word
end


def print_ascii_art(roses)
  #roses = "(@)(@)(@)(@)(@)\n"
  pot = "\n,\\,\\,|,/,/,
  _\\|/_
  |_____|
  |   |
  |___|
  "
  full_pot = roses + pot
end

def pruning_roses(max)
  roses = "(@)(@)(@)(@)(@)"
  roses[0...max]

end

# Input evaluation
def input_evaluation(guess, correct_word)
  if correct_word.word.include?(guess)
    correct_word.word.each_with_index do |letter, index|
      if letter == guess
        correct_word.progress[index] = guess

      end
    end
  else
    correct_word.wrong_guesses << guess
    correct_word.max_guesses -= 3
  end
end

# BUGZ: color might be greater than one work, how to handle spaces?
def create_word_bank
  words = []
  10.times do
    words << Faker::Color.unique.color_name
  end
  return words
end

def start(array)
  #gsub is a string method that can take regex as an argument, in this case it will strip all spaces
  #print array
  word = array[0].gsub(/\s+/,"").chars
  WordGame.new(word)
end

# puts game_word.word
# # puts words
# print game_word.word_work

# Create user prompt
def prompt_user(game_board)
  print game_board

  puts "\nHello user, please guess a letter > "
  gets.chomp


end
run_game
