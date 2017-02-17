require "faker"

class GuessWordGame
  attr_reader :word, :length, :word_array, :right_array, :wrong_array
  attr_accessor :letter_guess
  # if random word is longer than 10, regenerates word
  def initialize
    word = Faker::Cat.name
    if word.length > 15
      word = Faker:: Cat.name
    else
      @word = word.upcase
      @length = word.length
      @word_array = @word.scan /\w/
      @right_array = Array.new(@length, "_")
      @wrong_array = []
    end
  end

  def guess_right
      # checks guessed letter for frequency in word
      #below only adds the first index the letter appears in the word
      @word_array.each_with_index do |character, index|
        if character == @letter_guess
          @right_array[index] = @letter_guess
        end
      end
      return @right_array

  end

  def guess_wrong
    @wrong_array << @letter_guess
    case wrong_array.length
    when 1
      puts "one wrong guess!"

    when 2
      puts "two wrong guesses!"
    when 3
      puts "three wrong guess!"
    when 4
      puts "four wrong guess!"
    when 5
      puts "five wrong guess!"
    when 6
      puts "You lose! It was #{ @word }."
      puts "
       _..._
     .:::::::.
    :::::::::::   NEW  MOON
    :::::::::::
    `:::::::::'
      `':::''"
      ""
      exit
    end
    return @wrong_array
  end

end



puts "Welcome to our word guess game"
game1 = GuessWordGame.new
puts game1.word # TAKE THIS OUT AT END



while game1.right_array.include?("_")
  puts "Enter a letter: "
  game1.letter_guess = gets.chomp.upcase
  # tried to get input verification working
  # until (game1.letter_guess == /^[a-z]{1}$/) || (game1.wrong_array.include?(game1.letter_guess) == true)
  #   puts "Try again and enter one letter: "
  #   game1.letter_guess = gets.chomp.upcase
  # end

    if game1.word_array.include?(game1.letter_guess)
      game1.guess_right
      puts game1.right_array
      puts game1.wrong_array
    else
      game1.guess_wrong
      puts game1.right_array
      puts game1.wrong_array
    end

end

puts "Cool! You won! :)"
