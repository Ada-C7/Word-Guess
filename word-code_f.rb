# Word-Guess game
require "colorize"
class WordGuess

  def initialize(level = 1)
    if [1, 2, 3].include?(level)
      @level = level
    else
      @level = 1
    end

    @words_levels = []
    @words_levels << ["beach", "wave", "sand", "land", "road"]
    @words_levels << ["umbrella", "vacation", "peace", "travel", "camping"]
    @words_levels << ["mountain", "climbing", "kayaking", "canoeing",
                      "relaxing"]

    @words_list = @words_levels[@level-1]

    @hidden_word = @words_list[rand(@words_list.length)].split("")
    @user_guessed_word = ("-" * @hidden_word.length).split("")

    @tally_shape = ("@" * @hidden_word.length).split("")
    @ascii_shape = []
    @ascii_shape << ["(", "@", ")","-","-","(", "@", ")"]
    @ascii_shape << [" ", " ", "\\","|","|","/", " ", " "]
    @ascii_shape << [" ", " ", "-","-","-","-", " ", " "]
    @ascii_shape << [" ", "/", " "," "," "," ", "\\", " "]
    @ascii_shape << [" ", "\\", " "," "," "," ", "/", " "]
    @ascii_shape << ["|", " ", "-","-","-","-", " ", "|"]
    @ascii_shape << ["\\", "-", "-","-","-","-", "-", "/"]
    @ascii_shape << [" ", " ", "\\","-","-","/", " ", " "]
    @ascii_shape << []

    @wrong_letters = []
  end

  # Just checking the code
  # def variables_check
  #   puts @words_list
  #   puts @hidden_word
  #   puts @letters_to_be_filled
  #   puts @ascii_shape
  # end

  def add_wrong_letter(letter)
    if !@wrong_letters.include?(letter)
      @wrong_letters << letter
    end
    @wrong_letters = @wrong_letters.sort
  end

  def update_shape(letter)
    if !@wrong_letters.include?(letter)
      @tally_shape.pop
    end
  end

  def check_guess(letter)
    if @hidden_word.include?(letter)
      @hidden_word.length.times do |index|
        if @hidden_word[index] == letter
          @user_guessed_word[index] = letter
        end
      end
    else
      update_shape(letter)
      add_wrong_letter(letter)
    end
  end

  def game_on?
    if @user_guessed_word.include?("-") && @tally_shape.length > 0
      return true
    # else
    #   return false
    end
  end

  def print_info
    puts @tally_shape.join(" ").red
    @ascii_shape.each do |row|
      puts row.join(" ").colorize(:blue)
    end
    puts @user_guessed_word.join(" ").red.on_yellow
    if @wrong_letters.length > 0
      puts "Wrong guesses: #{ @wrong_letters.join(" ") }"
      #puts "One petal has been taken away"
    end
    puts @hidden_word.join(" ")
  end


  def is_letter?(input)
    if ("a".."z").to_a.include?(input)
      true
    end
  end

  def start_game
    while game_on?
      print_info
      print "Please guess a letter ('a'...'z') > "
      user_guess = gets.chomp.downcase
      if is_letter?(user_guess)
         check_guess(user_guess)
      else
      puts "That's not a letter"
        #check_guess(user_guess)
       end
    end

    print_info
    if @user_guessed_word == @hidden_word
      puts "Great!! You guessed the hidden word."
      puts "Hidden word is: #{ @hidden_word.join(" ") }"

    else
      puts "Sorry you didn't guess the hidden word."
      puts "Hidden word is: #{ @hidden_word.join(" ") }"
    end
    #print_info
  end
end


puts "Welcome to Word-Guess Game "
puts " 1- easy \n 2- medium \n 3- hard "

print "Enter the level of difficulties > "
game_level = gets.chomp.to_i

game = WordGuess.new(game_level)
game.start_game
