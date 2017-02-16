# define class
class  WordGame
attr_accessor :answer, :answer_array, :empty_array

  def initialize
    @answer = "cat"
    @guess
    @answer_array = @answer.split("")
    @empty_array = Array.new(@answer_array.length, " _ ")
  end

  # gets guess from user
  def guess
    puts "Enter guess: "
    @guess = gets.chomp
  end

  # compares the user's letter to answer array
  def evaluate
    @answer_array.each do |letter|
      if @answer_array.include?(@guess)
        return "correct!"
      else
        return "wrong"
      end
    end
  end
#
#   # method if answer is wrong
#   def incorrect
#
#   end
#
#   # method if answer is correct
#   def correct
#
#   end
#
end

word = WordGame.new
puts word.answer
print word.answer_array
print word.empty_array

puts word.guess
puts word.evaluate
