class Board

  def initialize(word)
    @pond
    @frog
    @word = word
    @lilypad
    @spaces
    create_board
    # @word ????
  end

  def create_board

    # CREATE POND
    @pond = []
    @frog = "____🐸____"
    @lilypad = "_________"
    @pond = []

    @pond << @frog
    4.times do
      @pond << @lilypad
    end

    # CREATE SPACES
    @spaces = []
    word.length.times do
      @spaces << "__"
    end
    puts "created initial spaces"

  end

  def display_board

    # DISPLAY pond
    @pond.each do |space|
      print space + "  "
    end
    puts
    puts "displaying pond"

    # DISPLAY SPACES
    @spaces.each do |space|
      print space + "\t"
    end
    puts
    puts "displaying spaces"

  end

  def update_board

    # UPDATE POND
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
    puts "updating pond"

    # UPDATE SPACES
    puts "updating spaces"
    word_array = word.split("")
    word_array.each_with_index do |letter, index |
      if  letter == @player_guess
        @spaces[index] = letter
      end
    end

end
# TO DO:

# attr_accessors etc

class Game

  def initialize
    @player_guess
    @words = ["big", "small", "cat", "turtle"] #[some list of words]
    @counter = 0
    @word = @words.sample
    @letters_guessed = []
    @spaces = []
    @board = Board.new(@word)
    puts "word is #{@word}."
    run_turn
  end


  def display_guessed_letters
    if @letters_guessed.length >0
      print "You have guessed: "
      @letters_guessed[0..-2].each do |letter|
        print "#{letter}, "
      end
      print "#{@letters_guessed[-1]}.\n"
    end
  end

  def run_turn
    @board.display_board
    display_guessed_letters
    get_player_input
    check_if_game_over
    run_turn
  end

  def continue_or_quit
    print "Would you like to play again? (yes/no) "
    user_response = gets.chomp
    case user_response
    when "yes"
      @word = @words.sample
      @letters_guessed = []
      puts "word is #{@word}."
      @board = Board.new(@word)
      run_turn
    when "no"
      exit
    else
      continue_or_quit
    end
  end


  def get_player_input
    print "What is your guess? "
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
    if !@word.include? @player_guess
      @counter += 1
    end
    @board.update_board
  end

  def check_if_game_over
    if @counter == 5
      puts "you ran out of guesses"
      continue_or_quit
    end
    if @spaces.join == @word
      puts "you win!"
      display_spaces
      continue_or_quit
    end
    puts "checked game over status and no result"
  end


end

new_game = Game.new
