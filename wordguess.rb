require 'terminal-table'
require 'colorize'

class User
  attr_accessor :difficulty, :letter_guessed, :word_to_guess

  def initialize
    @difficulty
    @letter_guessed
    @word_to_guess
    puts "Welcome to Word Guess!".blink
    prompt
  end

  def prompt
    rows = []
    rows << ["Easy".colorize(:green), 10]
    rows << ["Medium".colorize(:yellow), 7]
    rows << ["Hard".colorize(:red), 5]
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
  attr_accessor :user, :counter

  def initialize(user)
    @user = user
    @counter = user.difficulty
    game_play
  end

  def graphic
    puzzle_array = []
    flower = []
    @counter.times do
      flower << "(@)"
    end

    puzzle_length = user.word_to_guess.split('').length
    puzzle_length.times do
      puzzle_array << "_  "
    end
    puts "#{flower.join}"
    puts
    puts "#{puzzle_array.join}"
  end

  def game_play
    until game_over
      graphic
      guess
    end
  end

  def guess
    puts "Enter a letter"
    letter = gets.chomp
    word = user.word_to_guess.split('')
    if word.include?(letter)
      puts "Yes"
    else
      puts "no"
    end
    @counter -= 1
    puts @counter

  end


  def game_over
    if counter == 0
      true
    else
      false
    end
  end

end

user = User.new
game = GamePlay.new(user)
