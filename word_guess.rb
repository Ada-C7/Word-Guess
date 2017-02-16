class Game

  def initialize
    @player_guess
    @words = [] #[some list of words]
    @counter
    @word = @words.sample
    @letters_guessed = []
    get_player_input
  end


  def get_player_input
    print "What is your guess? "
    @player_guess = gets.chomp
    puts "You guessed: #{@player_guess}."
    # if letter
    # run check letter method
    # if > 1
    #   run check word method
  end

  def player_guess
    # takes player's guess
    # determines if it's valid
  end



end

new_game = Game.new
# new_game.get_player_input
