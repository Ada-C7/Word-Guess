require 'terminal-table'

class User
  attr_accessor :difficulty, :letter_guessed, :word_to_guess

  def initialize
    @difficulty
    @letter_guessed
    @word_to_guess
    puts "Welcome to Word Guess!"
    prompt
  end

  def prompt
    rows = []
    rows << ["Easy", 10]
    rows << ["Medium", 7]
    rows << ["Hard", 5]
    table = Terminal::Table.new :title => "Pick your Difficulty",
    :headings => ["Difficulty", "Num of Guesses"], :rows => rows
    puts table
    input = gets.chomp.downcase
    case input
    when "easy"
      @difficulty = 10
    when "medium"
      @diffculty = 7
    when "hard"
      @difficulty = 5
    else
      puts "That's not a valid input"
      prompt
    end
    word
  end

  def word
    options = ["cast", "puppy", "pineapple", "bananas"]
    @word_to_guess = options.sample
  end


end

class GamePlay
  attr_accessor :user

  def initialize(user)
    @user = user
    graphic
  end

  def graphic
    puzzle_array = []
    flower = ["(@)","(@)", "(@)"]

    puzzle_length = user.word_to_guess.split('').length
    puzzle_length.times do
      puzzle_array << "_  "
    end
    puts "#{flower.join}"
    puts
    puts "#{puzzle_array.join}"
  end

  def game_play

  end

  def game_over

  end

end

user = User.new
game = GamePlay.new(user)
