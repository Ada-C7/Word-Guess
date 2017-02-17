require 'faker'

# define class
class  WordGame
  attr_accessor :answer, :answer_array, :empty_array, :wrong_guesses

  def initialize
    @answer = Faker::Cat.name.upcase
    @guess
    @answer_array = @answer.split("")
    @empty_array = Array.new(@answer_array.length, " _ ")
    @wrong_guesses = []
    @flower = ["(@)", "(@)", "(@)", "(@)", "(@)"]
  end

  # gets guess from user
  def guess
    while @wrong_guesses.length < 5 && @answer_array != @empty_array
      print "\nGuess: "
      @guess = gets.chomp.upcase
      evaluate
      display
      puts "\n"
      guess
    end
  end

  # *** evaluates whether the user's guess was a valid input
  # *** makes sure user hasn't already guessed that letter?
  # evaluates the user's guess as correct or incorrect
  def evaluate
    if @answer_array.include?(@guess)
      #puts "\ncorrect!"
      correct
    else
      #puts "\nincorrect"
      incorrect
    end
  end

  # displays correct letter
  def correct
    puts "CORRECT!"

    index_array = @answer_array.each_index.select {|index| @answer_array[index] == @guess}

    index_array.each do |index|
      @empty_array[index] = @guess
    end

  end

  # removes a flower if answer is incorrect
  def incorrect
    puts "\nINCORRECT!"
    @wrong_guesses << @guess
    @flower.pop
  end

end

# take away a petal
# display wrong guesses
def display
  print "\n    " + @flower.join("")
  puts "\n   \,\\,\\,|,/,/,"
  puts "      _\\|/_"
  puts "     |_____|"
  puts "      |   |"
  puts "      |___|\n\n"
  puts @empty_array.join(" ")
  puts "Wrong Guesses: #{@wrong_guesses.join(" ")}"
end

# *** tells user whether they won or lost
# *** if they lost displays word
# *** prompts user to play again
def end_of_game
  puts "Would you like to play again? (YES/NO): "

end

# puts word.answer
puts "WELCOME TO OUR WORD GAME"
word = WordGame.new
puts word.guess
# puts word.correct
# puts word.empty_array
#puts word.wrong_guesses
