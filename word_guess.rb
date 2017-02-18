# pair_programming https://github.com/Ada-C7/Word-Guess
# Elizabeth and Tamiko

require 'colorize'

# new class for word game
class WordGame

  def initialize
    @win = false
    @word = ["PIZZA", "JUMPY", "HELLO", "WORLD", "QUACK", "TAXES"].sample
    @all_guesses = []
    @duck_count = 5
    @open_game = open_game

    # first turn
    @guess = guess #for test
    @word_with_blanks = word_with_blanks #for test
    @score = score
    @print_ducks = print_ducks

    # game play
    until (@win || lose?)
        guess
        word_with_blanks
        score #after_turn
        print_ducks
    end
  end

  def open_game
    puts "\nWelcome to the DUCKS IN A ROW!"
    puts "\nYou have 5 guesses to guess the word or the ducklings will swim away."
    print_ducks
  end

  def guess
    print "\nWhich letter would you like to guess? > "
    @guess = gets.chomp.upcase
    # validate guess
    until ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
    "S", "T", "U", "V", "W", "X", "Y", "Z"].include?(@guess)
      print "\n  Quack! Give me a letter! > "
      @guess = gets.chomp.upcase
    end

    @all_guesses << @guess
    return @guess
  end

  def word_with_blanks
    @word_with_blanks = ""
    @word.each_char do |letter|
      if @all_guesses.include?(letter) # account for multiple guesses
        @word_with_blanks << " #{letter} "
      else
        @word_with_blanks << " _ "
      end
    end

    if @word_with_blanks.include?("_") == false
      @win = true
    end

    puts @word_with_blanks
    puts "\n"
    print "Used letters: #{@all_guesses}"
    puts "\n\n"

  end

  def correct_guess?
    @word.include?(@guess)
  end

  def lose?
    @duck_count == 0
  end

  private

def print_ducks
    case @duck_count
    when 5
      puts "
        _          _          _          _          _
      >(')____,  >(')____,  >(')____,  >(')____,  >(') ___,
       (` =~~/    (` =~~/    (` =~~/    (` =~~/    (` =~~/
    ~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~".colorize(:yellow)
    when 4
      puts "
        _          _          _          _
      >(')____,  >(')____,  >(')____,  >(')____,
       (` =~~/    (` =~~/    (` =~~/    (` =~~/
    ~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~^`---'~^~".colorize(:yellow)

    when 3
      puts "
        _          _          _
      >(')____,  >(')____,  >(')____,
       (` =~~/    (` =~~/    (` =~~/
    ~^~^`---'~^~^~^`---'~^~^~^`---'~^~".colorize(:yellow)

    when 2
      puts "
        _          _
      >(')____,  >(')____,
       (` =~~/    (` =~~/
    ~^~^`---'~^~^~^`---'~^~".colorize(:yellow)

    when 1
      puts "
        _
      >(')____,
       (` =~~/
    ~^~^`---'~^".colorize(:yellow)

    when 0
      puts "


  ~^~^`---'~^

    .-""""""-.
  .'          '.
 /   O      O   \
:           `    :
|                |
:    .------.    :
 ( '        '   )
  '.          .'
    '-......-'".colorize(:yellow)
    else
      puts @duck_count
    end
  end

  def score

    if @win
      puts "YOU WIN! All your ducks swim back."
      @duck_count = 5
    elsif correct_guess? == false
      puts "Oh, sad. One of the ducks swam away."
      @duck_count -= 1
    else
      puts "GOOD GUESS! You're one step closer to winning."
    end

    if lose?
      puts "All the ducks swam away. YOU LOST! "
    end

  end
end

game = WordGame.new
