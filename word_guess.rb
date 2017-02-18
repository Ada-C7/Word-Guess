require 'faker'
require 'colorize'
require 'lolize'
colorizer = Lolize::Colorizer.new

class WordGuess

  def initialize(player)
    # access scene through @@scenes[type][level][scene]
    @@scenes = {
      grass: [
        File.read("ascii_art/bulbasaur.txt").split("next"),
        File.read("ascii_art/ivysaur.txt").split("next"),
        File.read("ascii_art/venusaur.txt").split("next")
      ],
      fire: [
        File.read("ascii_art/charmander.txt").split("next"),
        File.read("ascii_art/charmeleon.txt").split("next"),
        File.read("ascii_art/charizard.txt").split("next")
      ],
      water: [
        File.read("ascii_art/squirtle.txt").split("next"),
        File.read("ascii_art/wartortle.txt").split("next"),
        File.read("ascii_art/blastoise.txt").split("next")
      ]
    }

    # all possible characters
    @@characters = {
      grass: ["Bulbasaur", "Ivysaur", "Venusaur"],
      fire: ["Charmander", "Charmeleon", "Charizard"],
      water: ["Squirtle", "Wartortle", "Blastoise"]
    }
    # map of type to colors
    @@colors = { grass: :light_green, fire: :light_red, water: :cyan}

    #maps types to badge ascii art
    @@badges = {
      grass: File.read("ascii_art/badges.txt").split("next")[0],
      fire: File.read("ascii_art/badges.txt").split("next")[1],
      water: File.read("ascii_art/badges.txt").split("next")[2]
    }
    @level = 0
    @type = choose_type
    @player = player
  end

  #set variables for new game round
  def start_new_game

    if @level == 3 #if max level, choose new type
      @level = 0
      @type = choose_type
      puts "Great job, #{@player.name}! Now try to evolve a #{@type} type pokémon."
    end
    @secret_word = Faker::Pokemon.name.upcase
    @user_progress = Array.new(@secret_word.length,"_")
    @character = @@characters[@type][@level]
    @scenes = @@scenes[@type][@level]
    @color = @@colors[@type]
    @current_index = 0
    @bad_guesses = []
    @remaining_guesses = 5
    puts "You're at level #{@level+1}"
  end

  #ask user for pokemon type and validate
  def choose_type
    puts "Choose a pokémon type to start playin!"
    type = ""
    until type == :fire || type == :water || type == :grass
      print "\nFire, Water, or Grass? > "
      type = gets.chomp.downcase.to_sym
    end
    type
  end

  #get and validate guess of letter or word from user
  def get_guess
    print "\nMake a guess: "
    guess = gets.chomp.upcase

    #validate that guess has not already been guessed and is not blank
    while @bad_guesses.include?(guess) || @user_progress.include?(guess) || guess == ""
      puts "You already guessed that!" unless guess == ""
      print "Guess again: "
      guess = gets.chomp.upcase
    end
    return guess
  end

  def make_move
    correct_guess = false
    guess = get_guess
    if guess == @secret_word #if they guess the whole word
      @user_progress = @secret_word.split("")
      correct_guess = true
    else #check if guess matches any characters in secret word
      @secret_word.each_char.with_index do |char, index|
        if char == guess
          @user_progress[index] = char
          correct_guess = true
        end
      end
    end
    guess_badly(guess) unless correct_guess
  end

  #deal with incorrect guess
  def guess_badly(guess)
    @remaining_guesses -= 1
    @current_index += 1
    @bad_guesses << guess
  end

  def display_board
    puts @scenes[@current_index].colorize(@color)
    puts @user_progress.join(" ")

    #don't display bad guesses if there are none, or if user has won
    puts "Guesses: #{@bad_guesses.join(", ")}" if @bad_guesses.length > 0 && !winner?

    #don't display remaining guesses if user has won
    puts "\nRemaining Guesses: #{@remaining_guesses}" unless winner?
  end

  def winner? #defines winning game
    !@user_progress.include? "_"
  end

  def loser? #defines losing game
    @remaining_guesses == 0
  end

  def display_badges
    #print out all badges
    @player.badges.each do |type|
      print @@badges[type].colorize(@@colors[type]) + "\n"
    end
    puts
  end

  def win_game
    puts "YOU WIN"
    @level += 1
    if @level == 3
      puts "You fully evolved your #{@type} type pokémon!"

      # add badge if player has not earned before
      unless @player.badges.include? @type
        puts "You earn the #{@type} badge!"
        puts
        @player.badges << @type
        display_badges

        #if all badges have been won, display cool winning message
        if @player.badges.length == 3
          puts "\n\n"
          Lolize::Colorizer.new.write(File.read("ascii_art/win_banner.txt"))
          puts "\n\n"
          puts "You have now evolved all the starter pokémon. You are the very best!"
        end
      end

    end
  end

  def ask_play_again
    play_again = ""

    #ask if user wants to play again
    until play_again == "y" || play_again == "n"
      print "Do you want to play again? (y/n) > "
      play_again = gets.chomp.downcase
    end

    if play_again == "y"
      play
    else #if user says no, exit program
      exit
    end
  end

  def play
    start_new_game
    loop do
      display_board
      make_move

      if winner? || loser? #deal with game ending
        display_board
        win_game if winner?
        puts "YOU LOST IT WAS #{@secret_word} YOU FAILURE" if loser?

        ask_play_again
      end
    end
  end

end

class Player
  attr_accessor :badges
  attr_reader :name

  def initialize(name)
    @name = name
    @badges = []
  end
end

colorizer.write(File.read("ascii_art/banner.txt"))

puts "\n\n"
puts "Welcome to Pokémon Word Guess!".center(68)

#ask for and validate user name
puts
name = ''
while name == ''
  print "What is your Trainer name? > "
  name = gets.chomp
end

player = Player.new(name)

game = WordGuess.new(player)
game.play
