# define class
class  WordGame
  attr_accessor :answer, :answer_array, :empty_array, :wrong_guesses

  def initialize
    @answer = "cat"
    @guess
    @answer_array = @answer.split("")
    @empty_array = Array.new(@answer_array.length, " _ ")
    @wrong_guesses = []
  end

  # gets guess from user
  def guess
    while @wrong_guesses.length < 5 && @answer_array != @empty_array
      puts "Enter guess: "
      @guess = gets.chomp
      evaluate
      guess
    end
  end

  # compares the user's letter to answer array
  def evaluate
    if @answer_array.include?(@guess)
      correct
      puts "correct!"
      puts @empty_array
    else
      incorrect
      puts "incorrect"
    end
  end

  # method if answer is correct
  def correct
    @answer_array.each do |letter|
      #find index of answer_array
      if letter == @guess
        index = @answer_array.index(@guess)
        @empty_array[index] = @guess
        # puts @empty_array
      end
    end
  end
  #
  # method if answer is wrong
  # penalize if wrong
  # take away a petal
  # display wrong guesses

  def incorrect
    @wrong_guesses << @guess
  end

end

word = WordGame.new
# puts word.answer
puts word.guess
print word.answer_array
print word.empty_array
# puts word.correct
# puts word.empty_array
#puts word.wrong_guesses
