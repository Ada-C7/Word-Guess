class GameFrog
  attr_accessor :word, :counter, :player_guess, :player, :wheel

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
    @player_guess = gets.chomp.upcase
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
      puts "You were supposed to guess: #{@word.new_word}."
      continue_or_quit
    end
    if !@word.spaces.include?("_")
      puts "You win!"
      @pond.display_pond
      @word.display_spaces
      continue_or_quit
    end
    # puts "checked game over status and no result"
  end


end
