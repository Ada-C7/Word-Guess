
class Word
  def initialize
    @word = ["C", "A", "T"]
    @word_in_progress = ["C", "_", "T"]
    @guessed_letters = ["D", "F", "C"]
  end


  def check_input(input)

    if input.length == 1
      update_guessed_letters(input)

      if @word.include? input
        update_word_in_progress(input)
        won?(@word_in_progress)
        puts "TEST Not won yet "
      else
        # update_flower
        puts "TEST Here we are going to update flowers"
      end

      if input.length > 1
        won?
        return true
      else
        return false
      end

    end
  end

  def update_guessed_letters(input)
    if !@guessed_letters.include? input
      @guessed_letters << input
      puts "TEST Uppdated list #{@guessed_letters.join(", ")}"
    end
  end


  def update_word_in_progress(letter)
    @word.length.times do |index|
      if @word[index] == letter
        @word_in_progress[index] = letter
      end
    end
    puts "TEST Uppdated word in progress #{@word_in_progress.join(", ")}"
  end

  def won?(word_guess)
    if word_guess == @word
      puts "#{@word.join} is correct. You win!!!"
      exit
    else
      return false
    end
  end

  def print_word
  end

end

class Flower
  def initialize
  end

  def lost?
  end

  def setup_ascii
  end

  def update_ascii
  end

  def print_ascii
  end
end


# test = Word.new
#
# print "Enter letter"
# input = gets.chomp.upcase

# test.update_guessed_letters(input)
# test.update_word_in_progress(input)
# test.check_input(input)

def main

end
