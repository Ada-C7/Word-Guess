require "faker"
require "colorize"

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
      @right_array = Array.new(@length, "__")
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
      puts "\n
       _..._
     .'   `::.
    :       :::    WANING GIBBOUS
    :       :::
    `.     .::'
      `-..:'' \n"


    when 2
      puts " \n
     _..._
   .'     `.
  :         :    FULL MOON
  :         :
  `.       .'
    `-...-'  \n"
    when 3
      puts "\n
       _..._
     .::'   `.
    :::       :    WAXING GIBBOUS
    :::       :
    `::.     .'
      `':..-'    \n"
    when 4
      puts "\n
     _..._
   .::::  `.
  ::::::    :    FIRST QUARTER
  ::::::    :
  `:::::   .'
    `'::.-'
    \n"
    when 5
      puts "\n
       _..._
     .::::. `.
    :::::::.  :    WAXING CRESCENT
    ::::::::  :
    `::::::' .'
      `'::'-' \n"
    when 6
      puts "\n
       _..._
     .:::::::.
    :::::::::::   NEW  MOON
    :::::::::::
    `:::::::::'
      `':::''"
      puts "\n
██╗   ██╗ ██████╗ ██╗   ██╗    ██╗      ██████╗ ███████╗███████╗
╚██╗ ██╔╝██╔═══██╗██║   ██║    ██║     ██╔═══██╗██╔════╝██╔════╝
 ╚████╔╝ ██║   ██║██║   ██║    ██║     ██║   ██║███████╗█████╗
  ╚██╔╝  ██║   ██║██║   ██║    ██║     ██║   ██║╚════██║██╔══╝
   ██║   ╚██████╔╝╚██████╔╝    ███████╗╚██████╔╝███████║███████╗
   ╚═╝    ╚═════╝  ╚═════╝     ╚══════╝ ╚═════╝ ╚══════╝╚══════╝\n".colorize( :red )
   puts "It was #{ @word }."
      exit
    end
    return @wrong_array
  end

end



puts "Welcome to our word guess game. Guess each letter of the word before the
new moon!"
puts "\n
      _..._
    .::::  `.
   ::::::    :    FIRST QUARTER
   ::::::    :
   `:::::   .'
     `'::.-'
  "
game1 = GuessWordGame.new
# display secret word for testing
# puts game1.word

while game1.right_array.include?("__")
  print "\nEnter a letter: "
  game1.letter_guess = gets.chomp.upcase

  while ! ( game1.letter_guess  =~  /^[A-Z]{1}$/ ) ||
    game1.wrong_array.include?(game1.letter_guess) ||
    game1.letter_guess.length > 1
    print "Try again and enter one letter: "
    game1.letter_guess = gets.chomp.upcase
  end

    if game1.word_array.include?(game1.letter_guess)
      game1.guess_right
      puts "Your current board:"
      game1.right_array.each do |letter|
        print "#{ letter }  "
      end

      puts "\nWrong letters you've guessed:"
      game1.wrong_array.each do |letter|
        print "#{ letter }, "
      end

    else
      game1.guess_wrong
      puts "\nYour current board:"
      game1.right_array.each do |letter|
        print "#{ letter }  "
      end

      puts "\nWrong letters you've guessed:"
      game1.wrong_array.each do |letter|
        print "#{ letter }, "
      end
    end

end

puts "\nCool! You won! :)"
