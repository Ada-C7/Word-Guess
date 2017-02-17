class Board

  def initialize

  end

  def create_board
  end

  def display_board
  end

  def update_board
  end

end
# TO DO:

# attr_accessors etc

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
    puts "word is #{@word}."
    create_pond
    create_spaces
    run_turn
  end

  #TO DO
  # all the restart stuff


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

  puts "displaying pond"
end


def update_pond

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
end


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

  def update_spaces
    puts "updating spaces"
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
      puts "word is #{@word}."
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
      puts "correct letter guess"
      puts "counter is #{@counter}"
      update_spaces
      # update_spaces #update spaces with the letter
    else #wrong letter guess
      puts "wrong letter guess"
      @counter += 1
      update_pond
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
      display_spaces
      continue_or_quit
    end
    puts "checked game over status and no result"
  end


end

new_game = Game.new
