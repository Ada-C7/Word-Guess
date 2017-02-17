require 'faker'

# define class
class  WordGame
  attr_accessor :answer_array, :empty_array, :wrong_guesses
  attr_reader :answer

 def initialize
    @answer = Faker::Cat.name.upcase
    @guess
    @answer_array = @answer.split("")
    @empty_array = Array.new(@answer_array.length, " _ ")
    @wrong_guesses = []
    @flower = ["(@)", "(@)", "(@)", "(@)", "(@)"]
  end

 # gets guess from user
  def run_game
    while @wrong_guesses.length < 5 && @answer_array != @empty_array
      print "Guess: "
      @guess = gets.chomp.upcase
      until /[A-Z]/.match(@guess) && @guess.length == 1
          puts "Please enter a single letter!"
          print "Guess: "
          @guess = gets.chomp.upcase
      end
      evaluate
      display
      puts "\n"
      run_game
    end
    end_game
  end


 # *** evaluates whether the user's guess was a valid input
  # *** makes sure user hasn't already guessed that letter?
  # evaluates the user's guess as correct or incorrect
  def evaluate
    if @answer_array.include?(@guess)
      correct
    else
      incorrect
    end
  end

 # displays correct letter
  def correct
    index_array = @answer_array.each_index.select {|index| @answer_array[index] == @guess}

   index_array.each do |index|
      @empty_array[index] = @guess
    end
  end

 # removes a flower if answer is incorrect
  def incorrect
    @wrong_guesses << @guess
    @flower.pop
  end

 # displays how many petals are left
  # displays blank spaces and correct letters
  # display wrong guesses
  def display
    print "\n    " + @flower.join("")
    puts "\n   \,\\,\\,|,/,/,"
    puts "      _\\|/_"
    puts "     |_____|"
    puts "      |   |"
    puts "      |___|\n\n"
    puts "Word: " + @empty_array.join(" ")
    puts "\nWrong Guesses: #{@wrong_guesses.join(" ")}"
  end

 # tells user whether they won or lost
  # if they lost displays word
  # prompts user to play again
  def end_game
    if @answer_array == @empty_array
      puts "CONGRATULATIONS! You guessed the correct word."
    else
      puts "YOU RAN OUT OF GUESSES. The correct word was #{@answer}."
    end

   print "\nWould you like to play again? (YES/NO): "
    response = gets.chomp.downcase

   if response == "yes"
        new_game = WordGame.new
        puts new_game.run_game
    else
      puts "GOODBYE!"
      exit
    end
  end
end

# displays title
# starts new game
puts "WELCOME TO OUR WORD GAME"
word = WordGame.new
puts word.run_game
