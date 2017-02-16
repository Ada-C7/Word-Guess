class WordGuess
  attr_reader = :word

  def initialize
    @word = gen_word
    @word_as_dashes = nil
    @word_as_array = #word_dash_array   #not defined yet
    puts intro
  end

# show ascii, generate word, show dashes
  def intro
    puts "Welcome!"
    puts gen_word
  end

  def gen_word
   array_of_words = ["pug", "stumptown", "normcore", "pitchfork", "chillwave", "cardigan"]
    @word = array_of_words[rand(0..5)]
  end

  def word_dash
  end

  def match
  end

  def guess
  end

  # private

  def update_ascii
  end

  def update_dash
  end

  def update_guessed_letters
  end


end


new_game = WordGuess.new
