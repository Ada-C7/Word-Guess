require 'faker'

class WordGuess

  def initialize
    @secret_word = Faker::Pokemon.name.upcase
    @user_progress = Array.new(@secret_word.length,"_")
    @scenes = [1, 2, 3, 4, 5]
    @current_index = 0
    @bad_guesses = []
    @remaining_guesses = 5
  end

  def get_guess
    puts
    print "Make a guess: "
    guess = gets.chomp.upcase

    while @bad_guesses.include?(guess) || @user_progress.include?(guess)
      puts "You already guessed that!"
      print "Guess again: "
      guess = gets.chomp.upcase
    end
    return guess
  end

  def make_move
    correct_guess = false
    guess = get_guess
    if guess == @secret_word
      @user_progress = @secret_word.split("")
      correct_guess = true
    else
      @secret_word.each_char.with_index do |char, index|
        if char == guess
          @user_progress[index] = char
          correct_guess = true
        end
      end
    end
    guess_badly(guess) unless correct_guess
  end

  def guess_badly(guess)
    @remaining_guesses -= 1
    @current_index += 1
    @bad_guesses << guess
  end

  def display_board
    puts @scenes[@current_index]
    puts @user_progress.join(" ")
    puts "Guesses: #{@bad_guesses.join(", ")}" if @bad_guesses.length > 0 && !winner?
    puts "Remaining Guesses: #{@remaining_guesses}" unless winner?
  end

  def winner?
    !@user_progress.include? "_"
  end

  def loser?
    @remaining_guesses == 0
  end

  def play
    loop do
      display_board
      make_move

      if winner? || loser?
        display_board
        puts "YOU WIN" if winner?
        puts "YOU LOST IT WAS #{@secret_word} YOU FAILURE" if loser?
        break
      end

    end
  end

end

game = WordGuess.new
game.play
