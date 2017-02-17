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
    @open_game = open_game
    print @word
    @guess = guess
    @word_with_blanks = word_with_blanks
    # print @word

  end

  def open_game
    puts "\nWelcome to the DUCKLING WORD GAME!"
    puts "\nYou have 5 guesses to guess the word or the ducklings will swim away."
    after_turn
  #   puts "
  #      _          _          _          _          _
  #    >(')____,  >(')____,  >(')____,  >(')____,  >(') ___,
  #     (` =~~/    (` =~~/    (` =~~/    (` =~~/    (` =~~/
  #  ~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~"
  # rules/instruction
  # first artwork
  end

  def word_with_blanks
    @word.each_char do |letter|
      if letter == @guess # account for multiple guesses (?)
        print " #{letter} "
      else
        print " _ "
      end
    end
    after_turn
  end

  def guess
    print "Which letter would you like to guess? "
    @guess = gets.chomp.downcase
  # -prompt and get one letter from user
    return @guess
  end

  def correct? # true if guess is in word
    @word.include?(@guess)
  end

  def validate
  # 	-include? [all_letters]
  end

  def wrong_guesses
  # 	*don't count correct ones
  # Note: keep track of guessed letters
  end

  private

  def after_turn
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
