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
  attr_accessor :user, :counter, :puzzle_array, :word_array

  def initialize(user)
    @user = user
    @counter = user.difficulty
    @puzzle_array = []
    puzzle_length = user.word_to_guess.split('').length
    puzzle_length.times do
      @puzzle_array << "_  "
    end
    @word_array = user.word_to_guess.split('')
    game_play
  end

  def graphic
    flower = []
    @counter.times do
      flower << "(@)"
    end


    puts "#{flower.join}"
    puts
    puts "#{@puzzle_array.join}"
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
    if @word_array.include?(letter)
      @word_array.each_with_index do |char, index|
        if char == letter
          @puzzle_array[index] = letter
        end
      end
      puts "Correct!"
    else
      puts "Try again!"
    end
    @counter -= 1

  end


  def game_over
    if @counter == 0
      puts "You didn't get it! The word was #{user.word_to_guess}"
      return true
    elsif @puzzle_array.join == user.word_to_guess
      puts "Congrats! You won!"
      return true
    else
     return false
    end
  end

end

user = User.new
game = GamePlay.new(user)
