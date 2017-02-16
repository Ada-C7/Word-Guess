class Game

  def initialize
    @player_guess
    @words = [] #[some list of words]
    @counter
    @word = @words.sample
    @letters_guessed = []
    get_player_input
  end

  def display_frog
    # called when the counter changes
    # and at the start
    # array with 5 elements
    # frog is at index that matches counter
    # everything else equals a lilypad
    # frog variable
    # lilypad variable
    # used to populate array
    # iterate through
  end


  def run_game
    # check for done
      # if done
        # win
      # if not
        # track counter possibly with while loop
        # display_frog
        # show_blanks
        # get_player_input
        # verify_guess_is_new
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
      update_spaces #update spaces with the letter
    else #wrong letter guess
      @counter += 1
      update_pond # frog position moves
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
