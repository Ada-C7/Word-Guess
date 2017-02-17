require 'faker'

# define class
class  WordGame
 attr_accessor :answer, :answer_array, :empty_array, :wrong_guesses

def initialize
   @answer = Faker::Cat.name
   @guess
   @answer_array = @answer.split("")
   @empty_array = Array.new(@answer_array.length, " _ ")
   @wrong_guesses = []
   @flower = ["(@)", "(@)", "(@)", "(@)", "(@)"]
 end

# gets guess from user
 def guess
   while @wrong_guesses.length < 5 && @answer_array != @empty_array
     print "\nEnter guess: "
     @guess = gets.chomp
     evaluate
     display
     puts "\n"
     guess
   end
 end

# compares the user's letter to answer array
 def evaluate
   if @answer_array.include?(@guess)
     puts "\ncorrect!"
     correct
   else
     puts "\nincorrect"
     incorrect
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
   @flower.pop
 end

end

# take away a petal
# display wrong guesses
def display
  print @flower.join("")
  puts "\n\,\\,\\,|,/,/,"
  puts " _\\|/_"
  puts "|_____|"
  puts " |   |"
  puts " |___|"
  puts @empty_array.join(" ")
  puts "Wrong Guesses: #{@wrong_guesses.join(" ")}"
end

# puts word.answer
puts "WELCOME TO OUR WORD GAME"
puts "Guess the cat's name!"
word = WordGame.new
puts word.guess
# puts word.correct
# puts word.empty_array
#puts word.wrong_guesses
