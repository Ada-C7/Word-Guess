require "random_word_generator"

class Game
  attr_accessor :word, :user_guess, :image

  def initialize
    @word = word
    @word_array = []
    @user_guess = user_guess
    @guess_array = []
    @correct = []
    @total = 0
  end

  def generate_word
    @word = RandomWordGenerator.word.downcase
    puts "The word is #{@word}."
    @word_array = @word.chars.to_a
    # print "#{@word_array}\n"
  end

  def display_dashes
    @word_array.each do |i|
      print "_ "
    end
  end

  def image
    File.open('./candle_6.txt') do |f|
      f.each_line do |line|
        puts line
      end
    end
    puts
    puts
    puts
  end

  def guess
    print "\nPlease guess a letter: "
    @user_guess = gets.chomp.downcase
    if @guess_array.include?(@user_guess)
      puts "You already guessed that!"
    else
      @guess_array.push(@user_guess)
      @correct.push(@user_guess)
    end
  end

  def update_dashes
    # puts "inside update_dashes()"
      @word_array.each do |i|
        if i == @user_guess || @correct.include?(i)
          print i
        else
          print "_ "
        end
      end
  end

  def verify
    if @word_array.include?(@user_guess)
      puts  "\nYou guessed correctly!"
    else
      puts "\nPlease try again"

      # Tried to use this to end the game.
      # @total++
      #
      # if @total == 6
      #   puts "Sorry, you lost! :("
      #   break
      # end
    end
  end

end

puts "Hey user! Welcome to Allison and Sahana's Harry Potter name hangman game!"

hangman = Game.new
hangman.generate_word
hangman.display_dashes

6.times do
  hangman.guess
  hangman.update_dashes
  hangman.verify
end
