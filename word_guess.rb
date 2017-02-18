require_relative 'word_guess_art_class'
require 'faker'

class Word_guess
  attr_accessor :word, :board, :letters_guessed, :max_guesses

  def initialize
    @word = Faker::Food.ingredient.upcase.split("")
    @board = Array.new(word.length) { |i| i = "_" }
    @art = WordGuessArt.new
    @letters_guessed = [ ]
    @max_wrong_guesses = 12
  end


  def main
    puts "Welcome to Cythina & Maria's Word Guessing Game"
    puts "-" * 60
    puts "Guess the word before the turtle disappears"

    until @max_wrong_guesses == 0 || @word == @board
      puts @art.print_art
      puts "Here are your previous guesses: #{@letters_guessed.join(", ") rescue ""}"
      puts "You only have #{@max_wrong_guesses} wrong guesses left"
      check_for_spaces
      puts print_board
      guess = get_guess
      check = check_guess?(guess)
      store_guess(guess)
      update_max_wrong_guesses(check)
      puts "-" * 60
    end

    if @word == @board
      puts "You got it! The word is #{@word.join}!"
    else
      puts "Sorry you lose - the word was #{@word.join}"
    end
  end
  #
  def check_for_spaces()
    @word.each_index do |i|
      if @word[i] == " "
        @board[i] = " "
      end
    end
  end

  def print_board
    return "Word: #{@board.join(" ")}"
  end

  def get_guess
    puts "What letter would you like to guess? "
    return gets.chomp.upcase
  end

  def store_guess(guess)
    @letters_guessed << guess
  end

#Check_guess? method will check the guess - if correct it updates the board and returns true - else it returns false and board stays the same
#PROBLEM: if you return true in the if statement then you stop the each-index iteriation and repeats wont show up
#SOLUTION: create local variable (define it before all iteriations and if/else statements so you can access it through the whole method - scope)
#that varable gets set to true if the guess is correct - last part of this method returns true or false based on results
  def check_guess?(guess)
    results = ""
    @word.each_index do |i|
      if @word[i] == guess
        @board[i] = guess
        results = true
      end
    end

    if results == true
      return true
    else
      return false
    end
  end

  def update_max_wrong_guesses(check)
    if check == false
      @max_wrong_guesses -= 1
      @art.update_art(@max_wrong_guesses)
    end
  end

end

new_game = Word_guess.new
print new_game.main
puts ""
