

class WordGuess

attr_accessor :user_guess, :words, :flower

WORDS_ARRAY = [ "hello", "elephant", "gum"]

  def initialize

    @word = WORDS_ARRAY[rand(0..2)]
    @flower = ["@ ","@ ","@ ","@ ","@ "]


    @flower.each do |bud|
      print bud
    end

    @correct_word = []
    @incorrect_letters = []
    @word.length.times do
      @correct_word << "_ "
    end

    @correct_word.each do |letter|
      print letter
    end
    @user_guess

  end

  def checking_letters
    chosen_word_array = @word.chars.to_a
    #counter = 0
    if @word.include?(@user_guess)
      chosen_word_array.each_with_index do |letter, index|
        if letter == @user_guess
          @correct_word[index] = letter
          # puts @correct_word

          # else
          #   @incorrect_letters << @user_guess
          #
        end
        # counter += 1
      end
      print @correct_word
      puts
    else
      @incorrect_letters << @user_guess
      @flower.pop
      print @flower
    end
    puts "these are incorrect"
    puts @incorrect_letters
  end

  def remove_flower
  end

  def add_letter
  end

  def display_flowers

    # puts ",\\,\\,|,/,/,"
    # puts "  _\\|/_"
    # puts "  |_____|"
    # puts "   |   |"
    # puts "   |___| "
  end


end

puts "welcome to Word Guess!"
puts "Here is your secret word you have to guess!"
newgame = WordGuess.new

puts "Please enter a letter: "
newgame.user_guess = gets.chomp


newgame.checking_letters

# puts newgame.words


# newgame.flower.each do |bud|
#   print bud
# end
