class Game
attr_accessor :counter #:letter_positions, :blanks,

  def initialize(library)
    @library = library
    @letter_positions = []
    @counter = 0
    @win = false
    select_word
    @board = Board.new(@word_array)

  end

  def select_word #secret word
    #select word from library
    limit = @library.length
    chosen_word = @library[rand(limit)] #havent seen rand used this way, inside of array instead of "on array"

    #treat word as array of characters
    @word_array = chosen_word.chars

    # puts statements for testing
    # puts @word_array
  end


  def turn #loop turn with conditionals
    puts "What's your letter guess?"
    @guess = gets.chomp.upcase
    if check_guess == true
      right_guess
    else
      wrong_guess
    end
  end


  def right_guess
    @board.draw_blanks(@letter_positions)
    # check_win
    # def check_win
    # end
  end


  def wrong_guess
    @counter += 1
    @board.draw_art(@counter)
    if @counter > 5 # or.length(-however many)
      puts "You lost."
      exit
    end
  end


  def check_guess

    @word_array.each_with_index do |letter, index|
      if letter == @guess
        @letter_positions << index
        return true
      else
        return false
      end
    end
  end

end

class Board

  def initialize(word_array)
    @blanks = []
    @word_array = word_array

    @word_array.length.times do # game.word_array.length #draws matching number of blanks
      @blanks << "_"
    end
  end

  def draw_art(counter)
    @current_counter = counter
    #rerenders upon wrong guess
    #max guesses is 5
    #5 changes
  end

  def draw_blanks (letter_positions)
    @current_positions = letter_positions
    #checking by position instead of contents
    @blanks.each_with_index do |blank, index|
      if @current_positions.include?(index)
        print @word_array[index]
      else
        print blank + " "
      end

    end
    print "\n"
  end
end

#provide library
library = ["HAI", "HAIRCUT", "POTATO", "PLUM", "SHIRK", "VITRIOL"]


game = Game.new(library)

# until game.counter > 5
#   game.turn
# end

game.turn
game.turn
