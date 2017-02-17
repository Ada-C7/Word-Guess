class Game

  def initialize
    @player_guess
    @words = ["big", "small", "cat", "turtle"] #[some list of words]
    @counter = 0
    @word = @words.sample
    @letters_guessed = []
    @spaces = []
    puts "word is #{@word}."
    create_spaces
    run_turn
  end

  #TO DO
  #handle multiple letters in the same word (e.g. t in turtle)
  #display pond and spaces and update pond and spaces

  def create_spaces
    @spaces = []
    @word.length.times do
      @spaces << "__"
    end
    puts "created initial spaces"
  end

  def display_spaces
    @spaces.each do |space|
      print space + "\t"

    end
    puts
    puts "displaying spaces"
  end


  def run_turn
    display_pond
    display_spaces
    puts "you have guessed: #{@letters_guessed}."
    get_player_input
    check_if_game_over
    run_turn
  end

  def display_pond

    # called when the counter changes
    # and at the start
    # array with 5 elements
    # frog is at index that matches counter
    # everything else equals a lilypad
    # frog variable
    # lilypad variable
    # used to populate array
    # iterate through
    puts "displaying pond"
  end




  def update_pond
    puts "updating pond"
  end

  def update_spaces
    puts "updating spaces"
  end

  def continue_or_quit
    print "Would you like to play again? (yes/no) "
    user_response = gets.chomp
    case user_response
    when "yes"
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
      puts "correct letter guess"
      puts "counter is #{@counter}"
      # update_spaces #update spaces with the letter
    else #wrong letter guess
      puts "wrong letter guess"
      @counter += 1
      puts "counter is #{@counter}"
      puts "update pond gets called"
      # update_pond # frog position moves
    end
  end

  def check_if_game_over
    if @counter == 5
      puts "you ran out of guesses"
      continue_or_quit
    end
    if @spaces.join == @word
      puts "you win!"
      continue_or_quit
    end
    puts "checked game over status and no result"
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
