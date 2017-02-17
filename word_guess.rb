require 'random_word_generator'
require "colorize"


class Word
  # require 'random_word_generator'

  attr_reader :word, :word_in_progress, :guessed_letters

  def initialize(flower_pot)
    @word = RandomWordGenerator.of_length(5).upcase.split("")
    @word_in_progress = ["_", "_", "_", "_", "_"]
    @guessed_letters = []
    @flower_pot = flower_pot
    puts "TEST #{@word}"

  end


  def check_input(input)

    if input.length == 1
      update_guessed_letters(input)

      if @word.include? input
        update_word_in_progress(input)
        won?(@word_in_progress)
        # puts "TEST Not won yet "
      else
        # update_flower
        @flower_pot.update_ascii
        # puts "TEST Here we are going to update flowers"
      end

    elsif input.length > 1
      won?(input.split(""))
      @flower_pot.update_ascii
      # puts "TEST Here we are going to update flowers"
    end
    if @flower_pot.lost?
      puts "\n\n"
      @flower_pot.pot
      puts "\n YOU LOST!!! THE WORD WAS   " +    "#{@word.join(" ")}!!!".colorize(:cyan)
      exit
    end
    print_all
  end

def update_guessed_letters(input)
    if !@guessed_letters.include? input
      @guessed_letters << input
      # puts "TEST Uppdated list #{@guessed_letters.join(", ")}"
    end
  end


  def update_word_in_progress(letter)
    @word.length.times do |index|
      if @word[index] == letter
        @word_in_progress[index] = letter
      end
    end
    # puts "TEST Uppdated word in progress #{@word_in_progress.join(" ")}"
  end

  def won?(word_guess)
    if word_guess == @word
      puts "\n #{@word.join(" ")}"
      puts "YOU GUESSED CORRECTLY!!!!! YOU WIN!!!!".colorize(:magenta)
      exit
    else
      false
    end
  end


  # def lost?
  #   if @flowers[0] == 0
  #     return true
  #   else
  #     return false
  #   end
  # end


  def print_all
    @flower_pot.print_flower
    puts "\n"
    puts @word_in_progress.join(" ")
    puts "\n"
    puts "You have used the following letters: "
    puts @guessed_letters.join(", ")
  end

end

class Flower
  def initialize
    @flowers = [5,4,0]
  end

  def pot
    puts "  ,\\,\\,|,/,/,".colorize(:green)
    puts "     _\\|/_".colorize(:green)
    puts "    |_____|".colorize(:blue)
    puts "     |   |".colorize(:blue)
    puts "     |___|".colorize(:blue)
  end

  def print_flower
    puts "\n   #{"(@)" * @flowers[2]}".colorize(:red)
    puts " #{"(@)" * @flowers[1]}".colorize(:red)
    puts "#{"(@)" * @flowers[0]}".colorize(:red)
    pot
  end



  def lost?
    if @flowers[0] == 0
      return true
    else
      return false
    end
  end


  def setup_ascii
  end

  def update_ascii
    if @flowers[2] > 0
      @flowers[2] -= 1
    elsif @flowers[1] > 0
      @flowers[1] -= 1
    elsif @flowers[0] > 0
      @flowers[0] -= 1
    end
  end



end



# test = Word.new
#
# print "Enter letter "
# input = gets.chomp.upcase

# test.update_guessed_letters(input)
# test.update_word_in_progress(input)
# test.check_input(input)

test_flower = Flower.new
test_word = Word.new(test_flower)

while true
  print "Enter letter "
  input = gets.chomp.upcase
  test_word.check_input(input)
end




# test_flower.print_flower
# test_flower.update_ascii
# test_flower.print_flower

def main

end
