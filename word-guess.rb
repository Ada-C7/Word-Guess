# define class
class  WordGame
 attr_accessor :answer, :answer_array, :empty_array, :wrong_guesses

def initialize
   @answer = "hello"
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
   index = @answer_array.each_index.select {|index| @answer_array[index] == @guess}

  index.each do |index|
       @empty_array[index] = @guess
   end
   # puts @empty_array
 end
 #
 # method if answer is wrong
 def incorrect
   @wrong_guesses << @guess
 end

end

# take away a petal
# display wrong guesses
def display

end

word = WordGame.new
# puts word.answer
puts word.guess
print word.answer_array
print word.empty_array
# puts word.correct
# puts word.empty_array
#puts word.wrong_guesses
