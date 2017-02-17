#correct boolean

#provide library
library = ["HAI", "HAIRCUT", "POTATO"]

# define class Turn and begin to elaborate methods
class Game
  attr_accessor :blanks, :letter_positions

  def initialize(library)
    @library = library
    # @word_array
    @blanks = []
    @letter_positions = []
    @counter = 0
    @win = false

    # self.select_word
    # self.draw_blanks
    # self.draw_art
  end

  def select_word
    #select word from library
    limit = @library.length
    chosen_word = @library[rand(limit)] #havent seen rand used this way, inside of array instead of "on array"

    #treat word as array of characters
    @word_array = chosen_word.chars

    # puts statements for testing
    puts @word_array
  end

  def turn #loop turn with conditionals
    puts "What's your letter guess?"
    @guess = gets.chomp.upcase
    puts check_guess
    puts @letter_positions
    #what happens if correct or not
    #if correct .push array

    draw_blanks


    check_game_state



    draw_art

  end

  def check_guess

    @word_array.each_with_index do |letter, index|
      if letter == @guess
        @letter_positions << index
      end
    end


    if @letter_positions.length > 0
        return true
    else
      @counter += 1
      return false
    end
    # return correct
  end
  #could/should update_guess_counter  be called in this method instead?

  def draw_blanks
    @word_array.length
    @word_array.length.times do
      @blanks << "_"
    end
    #checking by position instead of contents
    @blanks.each_with_index do |blank, index|
      if @letter_positions.include?(index)
        print @word_array[index]
      else
        print blank + " "
      end
  
    end
    print "\n"
  end


  #draw unerscores
  #replace underscores with letters


  def check_game_state
    # if all letters have been guessed
    #@win? is true; game over

    # if counter reaches maximum
    #game is over
    if @counter > 5 # or.length(-however many)
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
game.turn
