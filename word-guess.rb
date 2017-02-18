require 'Faker'
require 'colorize'

class WordGuess
  attr_reader :num_allowed_guesses, :game_over, :word
  attr_accessor :word_array, :word_lines, :flower_array, :letter_guesses, :word_guess, :flower_array, :stem_array

  #constructor method, initializes WordGuess object
  def initialize(game_level)
    #diffilculty setting option implemented
    hardness_level ={ easy: 10, hard: 5 }
    @num_allowed_guesses = hardness_level[game_level.to_sym]

    #ensures single random word is chosen
    @word = Faker::Food.ingredient.downcase
    @word_array = @word.chars.to_a
    while @word_array.include?(' ')
      @word = Faker::Food.ingredient.downcase
      @word_array = @word.chars.to_a
    end

    #creates rose buds and stem array according to allowed guess number
    @flower_array = Array.new(@num_allowed_guesses, "(@)")
    @stem_array = Array.new(@num_allowed_guesses, "~|~")

    #creates the word_lines array for display
    @word_lines = Array.new(@word_array.length, '_')

    #stores wrong letter guesses
    @letter_guesses = []

    #indicates if the user guesses the word correctly
    @word_guess = false
  end

  #display starts here - displays flowers and words before each guess
  def display
    @flower_array.each { |flower| print "#{flower}   ".colorize(:light_red) }
    puts
    @stem_array.each { |flower| print "#{flower}   ".colorize(:light_green) }
    puts
    print "Word: "
    @word_lines.each { |dash| print "#{dash} " }
    puts
    print "Wrong letter guesses: "
    @letter_guesses.each  {|dash| print " #{dash} " }
    puts
  end

  def guess
    #checks against erroneous guess_input
    while true
      print "Enter a letter guess, or a word guess: "
      guess_input = gets.chomp.downcase
      if guess_input =~ /^[a-z]+$/
        break
      else
        puts "Try again! only enter a single letter, or a word."
      end
    end

    #see if it a letter guess or a word guess
    if guess_input.length > 1 #checks if guess is word or letter
      #word case
      if guess_input.chars.to_a == @word_array # if word checking is correct word
        @word_guess = true # SHOULD indicate that game is over
        @word_lines = @word_array #converts lines to the correct word

      else
        puts "You lose! You can only guess the word once."
      end
      @game_over = true #game ends after first word guess
    else
      #letter case
      if @word_array.include?(guess_input) #checking good guess
        if @word_lines.include? guess_input #check reapeat on good guesses
          puts "We'll this one fly, but you already guessed this letter =]".colorize(:light_yellow).blink
        else
          @word_array.each_with_index do |letter, index| # update word_array
            if letter == guess_input
              @word_lines[index] = guess_input
            end
            if @word_array == @word_lines
              @game_over = true
            end # end of game over indication
          end #end of repeat word check
        end #end of good guess
      else #checking bad guess
        if @letter_guesses.include? guess_input
          puts "We'll this one fly, but you already guessed this letter =]".colorize(:light_yellow).blink
        else
          @letter_guesses << guess_input #add wrong letters to letter_guesses array
          @flower_array.pop # removes last index value - flower bud
          @stem_array.pop # removes last index value - stem
          @num_allowed_guesses -= 1 # updates allowed guess counter
        end
      end  # end of wrong letter guess
      if num_allowed_guesses == 0
        @game_over = true
      end
    end # end of letter case conditional
    puts
  end
end

#outside of class begins here
#title ascii art
def intro

  title_border = "
  ╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝"
  title_word = "
            ██╗    ██╗ ██████╗ ██████╗ ██████╗
            ██║    ██║██╔═══██╗██╔══██╗██╔══██╗
            ██║ █╗ ██║██║   ██║██████╔╝██║  ██║
            ██║███╗██║██║   ██║██╔══██╗██║  ██║
            ╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝
            ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝
  "
  title_guess = "
          ██████╗ ██╗   ██╗███████╗███████╗███████╗
          ██╔════╝ ██║   ██║██╔════╝██╔════╝██╔════╝
          ██║  ███╗██║   ██║█████╗  ███████╗███████╗
          ██║   ██║██║   ██║██╔══╝  ╚════██║╚════██║
          ╚██████╔╝╚██████╔╝███████╗███████║███████║
          ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚══════╝
  "
  puts "\n#{title_border}"
  puts "#{title_word}"
  puts title_guess
  puts "#{title_border}"

  puts "\n          Welcome to our Word Guess Game!"

  #checks against erroneous diffilculty setting input
  while true
    print "Please select a diffilculty level (easy/hard): "
    difficulty_input = gets.chomp.downcase
    if ["easy", "hard"].include?(difficulty_input)
      break
    else
      puts "Try again! only enter 'easy', or 'hard'"
    end
  end

  return difficulty_input
end

def instruct(game)
  puts
  puts "You will begin with #{game.num_allowed_guesses} rose buds!."
  puts "Each wrong letter guess will wilt one rose bud."
  puts "Once the last rose bud is wilted the game is over."
  puts "You will be able to guess the entire word, only once!"
  puts "So guess wisely!\n"
end

#method that performs one full game loop
def single_play
  difficulty_input = intro
  game = WordGuess.new(difficulty_input)
  instruct(game)


  while !game.game_over
    game.display
    game.guess
  end

  puts "                  End of the game summary"
  puts "  ========================================================  "
  if game.word_array == game.word_lines
    puts "   Yay you guessed the word #{game.word} with #{game.num_allowed_guesses} guess(es) left.".colorize(:light_magenta)
  else
    puts "           The mystery word was #{game.word}."
    puts "           You have #{game.num_allowed_guesses} guess(es) left."
  end
  title_border = "
  ╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝"
  end_banner = "
            ██████╗  █████╗ ███╗   ███╗███████╗
            ██╔════╝ ██╔══██╗████╗ ████║██╔════╝
            ██║  ███╗███████║██╔████╔██║█████╗
            ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝
            ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗
            ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝

            ██████╗ ██╗   ██╗███████╗██████╗
            ██╔═══██╗██║   ██║██╔════╝██╔══██╗
            ██║   ██║██║   ██║█████╗  ██████╔╝
            ██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗
            ╚██████╔╝ ╚████╔╝ ███████╗██║  ██║
            ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝"
  puts "\n#{title_border}"
  puts "#{end_banner}"
  puts "#{title_border}"
end

def play_again
  while true
    print "Would you like to play another round? (y/n): "
    user_input = gets.chomp.downcase
    if ['y','n', 'yes', 'no'].include?(user_input)
      break
    else
      puts "Try again! Only enter 'y' or 'n'!".colorize(:light_yellow)
    end
  end
  if ['n', 'no'].include?(user_input)
    exit
  end
end

while true
  single_play
  play_again
end
