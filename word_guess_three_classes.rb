require 'faker'

class Word
  attr_reader :new_word, :spaces
  def initialize
    @spaces = []
    @new_word = Faker::Ancient.god.downcase
    create_spaces
  end

  def new_word
    @new_word
  end

  def spaces
    @spaces
  end

  def update_spaces(player_guess)
    # UPDATE SPACES
    # puts "before updating spaces, spaces is #{@spaces}"
    word_array = @new_word.split("")
    word_array.each_with_index do |letter, index |
      if letter == player_guess
        @spaces[index] = letter
      end
    end
  end

  def create_spaces
    # CREATE SPACES
    @new_word.length.times do
      @spaces << "__"
    end
    # puts "created initial spaces"
  end

  def display_spaces
    # DISPLAY SPACES
    puts
    @spaces.each do |space|
      print space + "  "
    end
    puts
    # puts "displaying spaces"

  end

end # end of Word class

class Pond

  attr_accessor :counter


  def initialize
    @counter = 0
    @pond = []
    @frog = "____🐸____"
    @lilypad = "_________"
    # @player_guess = player_guess
    create_pond
  end

  def create_pond

    # CREATE POND
    @pond << @frog
    4.times do
      @pond << @lilypad
    end


  end

  def display_pond

    # DISPLAY POND
    puts
    @pond.each do |space|
      print space + "  "
    end
    puts
    # puts "displaying pond"


  end

  def update_pond

    # UPDATE POND
    # puts "updating pond"

    @pond.length.times do |n|
      if n < @counter || n > @counter
        @pond[n] = @lilypad
      else
        @pond[n] = @frog
      end
    end

    # PLEASE TELL US WHY THIS LOOP DIDN'T WORK
    # @pond.each_with_index do |space, index|
    #   if @counter == index
    #     space = @frog
    #   else
    #     space = @lilypad
    #   end
    # end


    # puts "after updating, spaces is #{@spaces}"
  end

end


class Game
  attr_accessor :word, :counter, :player_guess

  def initialize
    @letters_guessed = []
    @word = Word.new
    @pond = Pond.new
    # @spaces =
  end

  def welcome_message
    puts "\nWelcome to Frog Hop!"
    puts "Guess the correct letters in the word before the frog hops off your screen.\n\n"
    run_turn
  end


  def display_guessed_letters
    if @letters_guessed.length > 0
      print "\nYou have guessed: "
      @letters_guessed[0..-2].each do |letter|
        print "#{letter}, "
      end
      print "#{@letters_guessed[-1]}.\n"
    end
  end

  def run_turn
    @pond.display_pond
    @word.display_spaces
    display_guessed_letters
    get_player_input
    check_if_game_over
    run_turn
  end

  def continue_or_quit
    print "\nWould you like to play again? (yes/no) "
    user_response = gets.chomp
    case user_response
    when "yes", "y"
      @counter = 0
      @word = Word.new
      @letters_guessed = []
      # puts "word is #{@word}."
      @pond = Pond.new
      run_turn
    when "no", "n"
      exit
    else
      continue_or_quit
    end
  end


  def get_player_input
    print "\nPlease guess a letter: "
    @player_guess = gets.chomp
    puts "You guessed: #{@player_guess}."
    verify_guess_is_new
  end

  def verify_guess_is_new
    if @player_guess.length == 1
      #has it been guessed
      if @letters_guessed.include?(@player_guess)
        get_player_input
      else
        @letters_guessed << @player_guess # push new guess into old guesses array
        check_if_guess_is_right
      end
    else  #string is not one letter; gets another chance
      get_player_input
    end
  end

  def check_if_guess_is_right
    # puts "counter is now #{@counter}"

    if !@word.new_word.include? @player_guess
      @pond.counter += 1
    end
    @pond.update_pond
    @word.update_spaces(@player_guess)

  end

  def check_if_game_over
    if @pond.counter == 5
      puts "The frog got away! You lose. Wah-wah."
      continue_or_quit
    end
    if @word.spaces.join == @word.new_word
      puts "You win!"
      @pond.display_pond
      @word.display_spaces
      continue_or_quit
    end
    # puts "checked game over status and no result"
  end


end

new_game = Game.new
new_game.welcome_message
