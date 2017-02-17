#correct boolean

#provide library
library = ["HAI", "HAIRCUT", "POTATO"]

# define class Turn and begin to elaborate methods
class Game
  attr_accessor :blanks

  def initialize(library)
    @library = library
    # @word_array
    @blanks = []
    @counter = 0
    @win = false

    # self.select_word
    # self.draw_blanks
    # self.draw_art
  end

  def select_word
    #select word from library
    limit = @library.length
    chosen_word = @library[rand(limit)]

    #treat word as array of characters
    @word_array = chosen_word.chars

    # puts statements for testing
    puts @word_array
  end

  def turn
    puts "What's your letter guess?"
    @guess = gets.chomp.upcase
    check_guess
    #what happens if correct or not
    #if correct .push array

    draw_blanks

    update_guess_counter
    check_game_state



    draw_art

  end

  def check_guess
    if @word_array.include?(@guess)
      correct = true
    else correct = false
    end
    return correct
  end

  def draw_blanks
    @word_array.length
    @word_array.length.times do
      @blanks << "_"
    end
    puts @blanks
  end


  #draw unerscores
  #replace underscores with letters
  def update_guess_counter
    @counter += 1
  end

  def check_game_state
    # if all letters have been guessed
    #@win? is true; game over

    # if counter reaches maximum
    #game is over
    if @counter > 5
      puts "You lost."
      exit
    end
  end
  def draw_art

  end
end
game = Game.new(library)
game.select_word
game.turn
