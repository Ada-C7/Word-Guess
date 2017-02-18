# Word guess game created by Alena Messmer and Theresa Manney
# Started on 2.16.17

require 'faker'
require 'colorize'

# Create game class
class WordGame
  attr_reader :word
  attr_writer :letters
  attr_accessor :progress, :wrong_guesses, :max_guesses


  # Method initialize
  def initialize
    #gsub is a string method that can take regex as an argument, in this case it will strip all spaces
    @word = Faker::Color.unique.color_name.upcase.gsub(/\s+/,"").chars
    @max_guesses = 15
    @wrong_guesses = []
    @progress = Array.new(@word.length, "_")
  end
end

# starts the individual game called at the bottom of the program
# modelled after the main method we learned about as a debugging technique
def run_game

  word_game = WordGame.new


  welcome
  # loops through the steps of the game until user runs out of guesses
  # or they win
  until word_game.max_guesses == 0
    puts "Wrong guesses: #{word_game.wrong_guesses.join(" ")}\n\n"
    puts "Word: #{word_game.progress.join(" ")}\n\n"
    roses = pruning_roses(word_game.max_guesses)
    puts print_ascii_art(roses)
    winning?(word_game)
    guess = prompt_user(word_game)
    input_evaluation(guess, word_game)
    # clears the terminal screen so that it feels more like a game play
    # to the user (fun fact: doesn't work on Windows computer)
    system("clear")

    # conditional statement that prints the empty pot
    # if the user loses
    if word_game.max_guesses == 0
      system("clear")
      roses = pruning_roses(word_game.max_guesses)
      puts print_ascii_art(roses)
    end
  end

  puts "Sorry you lost :("
  puts "The word you were looking for was #{word_game.word.join}"
end

# printing the pot with buds
def print_ascii_art(roses)
  stems = "\n,\\,\\,|,/,/,
   _\\|/_".colorize(:green)
  pot = "
  |_____|
   |   |
   |___|
  ".colorize(:yellow)
  roses + stems + pot
end

# updating the number of rose buds according to failed attempts
def pruning_roses(max)
  roses = "(@)(@)(@)(@)(@)"
  roses[0...max].colorize(:red)
end

# Sorting between wrong and correct guesses
def input_evaluation(guess, correct_word)
  if correct_word.word.include?(guess)
    # We learned that .each_with_index can be used to locate each letter corresponding with each spacific index
    # Then if the letter matches it will subsitue the "_", at the correct index, with the corresponding letter
    correct_word.word.each_with_index do |letter, index|
      if letter == guess
        correct_word.progress[index] = guess
      end
    end
  else
    # Storing wrong letters into an array and updating max_guesses
    correct_word.wrong_guesses << guess
    correct_word.max_guesses -= 3
  end
end

# Method to check if the user won + happen message if won
def winning?(game)
  if game.word == game.progress
    puts "You won! Yaaaaay!!"
    exit
  end
end

# Welcome message to the user
def welcome
  puts "\nWelcome user! We have created a guessing game for you."
  puts "Try your best to guess the word or else the bouquet of "
  puts "roses will die."
  puts "Hint: colors make things happy\n\n"
end

# Method to create initial prompt to the user
def prompt_user(word_game)

  input = nil
  while input == nil
    puts "\nPlease guess a letter > "
    input = gets.chomp.upcase
    begin
      input = Integer(input)
    rescue ArgumentError
    end
    if input.is_a? Integer
      puts "That's not a letter. Try again."
      input = nil
    end
    if input != nil && input.length > 1
      puts "Please try just one letter at a time."
      input = nil
    end
    if word_game.wrong_guesses.include?(input)
      print "\nThat letter was already guessed: "
      input = nil
    end
  end
  return input
end

run_game
