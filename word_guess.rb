# pair_programming https://github.com/Ada-C7/Word-Guess
# Elizabeth and Tamiko
#
# *private section that contains the visual element
# ~ like passage_of_time ~
# - validation for non letters
#
# Initialize section

#
# ~Array of unique letters from random word
#
# .each with stringl
#

# (class) is the game WordGame
class WordGame

  def initialize
    @word = ["pizza", "jumpy", "hello", "world", "quack", "taxes"].sample
    # test initialize (below)
    @duck_count = 5
    print @word #for test
    @open_game = open_game
    @all_guesses = []
    @guess = guess #for test
    @word_with_blanks = word_with_blanks #for test
    until win? || lose?
        guess
        word_with_blanks
        score #after_turn
    end
    #   @word_with_blanks = word_with_blanks
    #   @guess = guess
    #   @win_lose_continue
    # end
  end

  def open_game
    puts "\nWelcome to the DUCKLING WORD GAME!"
    puts "\nYou have 5 guesses to guess the word or the ducklings will swim away."
  end

  def guess
    print "Which letter would you like to guess? "
    @guess = gets.chomp.downcase
  # -prompt and get one letter from user
    @all_guesses << @guess
    return @guess
  end

  def word_with_blanks
    @word_with_blanks = ""
    @word.each_char do |letter|
      if @all_guesses.include?(letter) # account for multiple guesses
        @word_with_blanks << " #{letter} "
      else
        @word_with_blanks << " _ "
      end
      # if @word_with_blanks == @word
      #   win_announce
      # else
      #   word_with_blanks
    end
    print @word_with_blanks
    print @all_guesses
    # score
  end




  def correct_guess? # true if guess is in word
    @word.include?(@guess)
  end



  def lose?
    duck_count == 0
  end

  def win?
    @word_with_blanks == @word
      # win_announce
  end
  #
  #   if # win condition = guessed all the letters
  #     print "YOU WIN! All your ducks swim back."
  #   else
  #     # continue
  #   end
  # end

  def validate
  # 	-include? [all_letters]
  end

  def wrong_guesses
  # 	*don't count correct ones
  # Note: keep track of guessed letters
  end

  private

  def score
    if win?
      print "YOU WIN! All your ducks swim back."
      duck_count = 5
    elsif  correct_guess?

    else
      print "Oh, sad. One of the ducks swam away."
      duck_count -= 1
    end

    case @duck_count
    when 5
      puts "
        _          _          _          _          _
      >(')____,  >(')____,  >(')____,  >(')____,  >(') ___,
      (` =~~/    (` =~~/    (` =~~/    (` =~~/    (` =~~/
      ~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~"
    when 4
      puts "
        _          _          _          _
      >(')____,  >(')____,  >(')____,  >(')____,
      (` =~~/    (` =~~/    (` =~~/    (` =~~/
      ~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~^`---'~^~"

    when 3
      puts "
        _          _          _
      >(')____,  >(')____,  >(')____,
      (` =~~/    (` =~~/    (` =~~/
      ~^~^`---'~^~^~^`---'~^~^~^`---'~^~"

    when 2
      puts "
        _          _
      >(')____,  >(')____,
      (` =~~/    (` =~~/
      ~^~^`---'~^~^~^`---'~^~"

    when 1
      puts "
        _
      >(')____,
      (` =~~/
      ~^~^`---'~^"
    else
      puts @duck_count
    end
  end
end

game = WordGame.new
# until # win || lose
# # repeat turns
# end
