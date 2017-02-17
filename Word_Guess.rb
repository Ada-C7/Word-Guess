#correct boolean

#provide library
library = ["HAI", "HAIRCUT", "POTATO"]

# define class Turn and begin to elaborate methods
class Game
  # attr_accessor :win

  def initialize(library)
    @library = library
    # @word_array

    @counter = 0
    @win = false

    # self.select_word
    # self.draw_board
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
    update_guess_counter
    check_game_state

    end

  end

  def check_guess
    if @word_array.include?(@guess)
      puts "Great job."
    else
      puts "false"
  end

  def draw_board
  end

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
