class Game

  def initialize
    @pond
    @player_guess
    @words = ["big", "small", "cat", "turtle"] #[some list of words]
    @counter = 0
    @word = @words.sample
    @letters_guessed = []
    @spaces = []
    @frog
    @lilypad
    create_pond
    create_spaces
    run_turn
  end


def create_pond
  @pond = []
  @frog = "____🐸____"
  @lilypad = "_________"
  @pond = []

  @pond << @frog
  4.times do
    @pond << @lilypad
  end
  # puts @pond
end

def display_pond
  @pond.each do |space|
    print space + "  "
  end
  puts
end


def update_pond

  @pond.length.times do |n|
    if n < @counter || n > @counter
      @pond[n] = @lilypad
    else
      @pond[n] = @frog
    end
  end
end


  def create_spaces
    @spaces = []
    @word.length.times do
      @spaces << "__"
    end
  end

  def display_spaces
    @spaces.each do |space|
      print space + "\t"
    end
    puts
  end

  def update_spaces
    word_array = @word.split("")
    word_array.each_with_index do |letter, index |
      if  letter == @player_guess
        @spaces[index] = letter
      end
    end
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
    display_pond
    display_spaces
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
      create_pond
      create_spaces
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
    if @word.include? @player_guess #correct letter guess!
      update_spaces
    else #wrong letter guess
      @counter += 1
      update_pond
    end
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
  end


end

new_game = Game.new
# new_game.get_player_input
# def player_guess
#   # takes player's guess
#   # determines if it's valid
# end


  #possible logic for checking word-length guesses
      # @player_guess.length == 0
      # get_player_input
    # elsif @player_guess.length >= 2
    #   if @player_guess == @word
    #     #wins
    #   else #OPTIONAL REQUIREMENT
    #     counter += 1
    #   end
