class WordGuess

attr_reader :letter_guess

  def initialize (words_array = [ "hello", "elephant", "gum"], lines = [])
    @words = words_array[rand(0..2)]
    puts "#{@words}"
    @flower = []
    @words.length.times do
      @flower << "@"
    end
    print "#{ @flower }"
    @correct_word = []
    @incorrect_letters = []
    @words.length.times do
      @correct_word << "_"
    end
    puts "#{@lines}"
    @user_guess = "e"

  end

  def checking_letters
    chosen_word_array = @words.chars.to_a
    #counter = 0
    if @words.include?(@user_guess)
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

wordgame = WordGuess.new
wordgame.checking_letters
