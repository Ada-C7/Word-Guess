require "colorize"
require 'random_word_generator'

class Word
 attr_reader :current_status, :complete_word

 def initialize (word)
  @complete_word = word
   @current_status = generate_dashes
 end

 def generate_dashes
   number_of_dashes = ""
   @complete_word.length.times do
     number_of_dashes += "_"
   end
   return number_of_dashes
 end

 def letter_sentinel(guess)
   # check to see if letter matches (.chars would be like .to_a for a string.)
   @complete_word.chars.each_with_index do |letter, index|
     if guess == letter
       @current_status[index] = letter
     end
   end
   # check to see if whole word matches
   if @complete_word == guess
     @current_status = @complete_word
   end
   @current_status
 end

 def correct_guess?(guess)
   @complete_word.include?(guess) || @complete_word == guess
 end

end

class Game
 def initialize (difficulty)

   if difficulty == "low"
     @word = Word.new(RandomWordGenerator.of_length(rand (10..14)))
   elsif difficulty == "medium"
     @word = Word.new(RandomWordGenerator.of_length(rand (6..9)))
   elsif difficulty == "high"
     @word = Word.new(RandomWordGenerator.of_length(rand (3..5)))
   else
     puts "Hmm I don't recognize #{difficulty}. I'll just generate a random word" +
          " for you."
     @word = Word.new(RandomWordGenerator.word)
   end

   @number_of_guesses = 6
   @guesses = []
 end

 def play
   until @number_of_guesses == 0 || @word.current_status == @word.complete_word
     puts @word.complete_word
     puts "\nGuesses so far: #{@guesses.join(", ")}"
     draw_top(@number_of_guesses -1)
     draw_stem
     puts @word.current_status
     print "Guess a letter: "

     guess = gets.chomp.downcase
     if !@guesses.include?(guess) && (guess.length == 1 || guess.length == @word.complete_word.length)
       @guesses << guess
       make_a_guess
     elsif @guesses.include?(guess)
       puts "\nYou have already guessed #{guess}."
     else
       puts "\nPlease guess a letter or the entire word."
     end
   end
   end_game
 end

   def make_a_guess
     @word.letter_sentinel(@guesses.last)
     if !@word.correct_guess?(@guesses.last)
       @number_of_guesses -= 1
     end
  end

   def draw_stem
     x = ["./stem.txt"]
   File.open(x[0]) do |f|
     f.each_line do |line|
       print line.colorize(:green)
     end
   end
 end

 def draw_top(index)
   tops = ["./dandelions6.txt", "./dandelions5.txt", "./dandelions4.txt", "./dandelions3.txt", "./dandelions2.txt", "./dandelions1.txt"]
   File.open(tops[index]) do |f|
     f.each_line do |line|
      print line.colorize(:magenta)
      end
    end
  end

# finish
  def end_game
    if @number_of_guesses == 0
      puts
      draw_stem
      puts "Ou! You lost :(\n"
           "The word was '#{@word.complete_word}'"
    else
      puts "\nYOU WON!"
    end
    puts "The word was '#{@word.complete_word}'"
  end
end

# Play the game until the user wants to quit
while true
  puts "Chose your difficulty level. Low, medium or high: "
  game = Game.new(gets.chomp.downcase)
  game.play

  print "\nWould you like to play again? Enter 'Yes' or 'No': "
  anwser = gets.chomp.downcase
  if anwser == "no"
    break
  end
end
