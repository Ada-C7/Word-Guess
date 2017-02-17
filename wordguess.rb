# A program to play a game of wordguess with one User
# Try and guess the word before your guesses run out

require 'terminal-table'
require 'colorize'

#Class for the user information
class User
  attr_accessor :difficulty, :word_to_guess
  attr_reader :theme

# Initialize with difficulty level, the word to guess and theme
  def initialize
    @difficulty = 0
    @word_to_guess
    @theme = ""
    puts "Welcome to Word Guess!".blink
    prompt
  end

#Prompt for user information. Users pick both difficulty and a
#word theme
  def prompt
    options = ["Default", "Food", "Hacker", "Game of Thrones",
     "Lord of the Rings"]
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
      @difficulty = 7
    when "hard"
      @difficulty = 5
    else
      puts "That's not a valid input"
      prompt
    end
    rows_two = []
    rows_two << ["Default"]
    rows_two << ["Food".colorize(:light_red)]
    rows_two << ["Hacker".colorize(:green)]
    rows_two << ["Game of Thrones".colorize(:red)]
    rows_two << ["Lord of the Rings".colorize(:yellow)]
    table_two = Terminal::Table.new :title => "Pick your theme!", :rows => rows_two
    puts table_two
    @theme = gets.chomp.downcase
    word
  end

#Method to pick a word that will be used for the game
  def word
    options = []
    case @theme
    when "default"
      options = ["cast", "puppy", "pineapple", "bananas"]
      @word_to_guess = options.sample
    when "food"
      options = ["mango", "papaya", "guava", "apples", "lychee"]
      @word_to_guess = options.sample
    when "hacker"
      options = ["bandwidth", "synthesize", "bypass", "cyberpunk", "firewall"]
      @word_to_guess = options.sample
    when "game of thrones"
      options = ["stark", "lannister", "arya", "hodor", "meereen"]
      @word_to_guess = options.sample
    when "lord of the rings"
      options = ["lothorien", "galadriel", "frodo", "bombadil", "goldberry"]
      @word_to_guess = options.sample
    end
  end


end

#Class for actual gameplay
class GamePlay
  attr_accessor :user, :counter, :puzzle_array, :word_array

  #The user object is passed into the gameplay class
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

#Method that outputs the graphical part of the game
  def graphic
    flower = []
    @counter.times do
      flower << "(@) ".colorize(:red)
    end
    puts "#{flower.join}"
    puts
    puts "#{@puzzle_array.join}"
    puts
  end

# Method that plays game. It runs into the game is over
  def game_play
    until game_over
      graphic
      guess
    end
  end

#Method that interprets the user inputted guess
  def guess
    puts "Enter a letter"
    puts
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

#Method to determine whether or not the game is over, and
#whether or not the game has been won
  def game_over
    if @counter == 0 && !(@puzzle_array.join == user.word_to_guess)
      puts "You didn't get it! The word was #{user.word_to_guess}."
      return true
    elsif @counter == 0 && @puzzle_array.join == user.word_to_guess
      puts "Congrats! You won!"
      graphic
      return true
    elsif @puzzle_array.join == user.word_to_guess
      puts "Congrats! You won!"
      return true
    else
     return false
    end
  end

end

#Create user and gameplay objects
user = User.new
game = GamePlay.new(user)
