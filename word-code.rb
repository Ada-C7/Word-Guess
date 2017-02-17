# Word-Guess game
class WordGuess

attr_accessor :word, :letter, :counter, :ascii

  def initialize
    @word = word
    @letter = letter
    @counter = 0
    @level = 1 # 1 is beginner level
    @words_list = ["beach", "wave", "sand", "umbrella", "vacation"]
    hidden_word
    
  end

  def print_original_shape

  end

  def print_word_to_guess

  end

  def include_letter?
    word_to_be_guessed.include? (user_input)
  end

  def guess
    print "Please guess a letter "
    user_input = gets.chomp.downcase
  end

  def display_letters
    if include_letter?

    end
  end

  def hidden_word
    word_to_be_guessed = @words_list[rand(@words_list.length)]
    puts  word_to_be_guessed
    word_to_be_guessed.split("")
  end

end

hey = WordGuess.new
puts hey.hidden_word
