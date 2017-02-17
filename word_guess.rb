require 'faker'
# Word guess game created by Alena Messmer and Theresa Manney
# Started on 2.16.17

# Create game class
class WordGame
  attr_reader :word
  attr_writer :letters
  attr_accessor :progress, :wrong_guesses, :max_guesses


  # Method initialize
  def initialize
    #gsub is a string method that can take regex as an argument, in this case it will strip all spaces
    @word = Faker::Color.unique.color_name.gsub(/\s+/,"").chars
    @max_guesses = 15
    @wrong_guesses = []
    @progress = Array.new(@word.length, "_")
  end
end
def run_game

  word_game = WordGame.new

  until word_game.max_guesses == 0
    system("clear")
    puts "Wrong letter guesses: #{word_game.wrong_guesses.join(" ")}"
    puts "#{word_game.progress.join(" ")}"
    roses = pruning_roses(word_game.max_guesses)
    puts print_ascii_art(roses)
    winning?(word_game)
    guess = prompt_user
    input_evaluation(guess, word_game)

    if word_game.max_guesses == 0
      system("clear")
      roses = pruning_roses(word_game.max_guesses)
      puts print_ascii_art(roses)
    end
  end

  puts "Sorry you lost :("
  puts "The word you were looking for was #{word_game.word.join}"
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

def winning?(game)
  if game.word == game.progress
    puts "You won! Yaaaaay!!"
    exit
  end
end

# Create user prompt
def prompt_user
  puts "\nHello user, please guess a letter > "
  gets.chomp


end
run_game
