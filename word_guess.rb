require 'faker'

class WordGuess

  def initialize(type)
    # access scene through @@scenes[type][level][scene]
    @@scenes = {
      grass: [
        File.read("bulbasaur.txt").split("next"),
        File.read("ivysaur.txt").split("next"),
        File.read("venusaur.txt").split("next")
      ],
      fire: [
        File.read("charmander.txt").split("next"),
        File.read("charmeleon.txt").split("next"),
        File.read("charizard.txt").split("next")
      ],
      water: [
        File.read("squirtle.txt").split("next"),
        File.read("wartortle.txt").split("next"),
        File.read("blastoise.txt").split("next")
      ]
    }

    @@characters = {
      grass: ["Bulbasaur", "Ivysaur", "Venusaur"],
      fire: ["Charmander", "Charmeleon", "Charizard"],
      water: ["Squirtle", "Wartortle", "Blastoise"]
    }
    @level = 0
    @type = type
  end

  def start_new_game
    if @level == 3
      @level = 0
      @type = @@characters.keys.sample
      puts "Now try to evolve a #{@type} type pokemon."
    end
    @secret_word = Faker::Pokemon.name.upcase
    @user_progress = Array.new(@secret_word.length,"_")
    @character = @@characters[@type][@level]
    @scenes = @@scenes[@type][@level]
    @current_index = 0
    @bad_guesses = []
    @remaining_guesses = 5
    puts "You're at level #{@level+1}"
  end

  def get_guess
    print "\nMake a guess: "
    guess = gets.chomp.upcase

    while @bad_guesses.include?(guess) || @user_progress.include?(guess)
      puts "You already guessed that!"
      print "Guess again: "
      guess = gets.chomp.upcase
    end
    return guess
  end

  def make_move
    correct_guess = false
    guess = get_guess
    if guess == @secret_word
      @user_progress = @secret_word.split("")
      correct_guess = true
    else
      @secret_word.each_char.with_index do |char, index|
        if char == guess
          @user_progress[index] = char
          correct_guess = true
        end
      end
    end
    guess_badly(guess) unless correct_guess
  end

  def guess_badly(guess)
    @remaining_guesses -= 1
    @current_index += 1
    @bad_guesses << guess
  end

  def display_board
    puts @scenes[@current_index]
    puts @user_progress.join(" ")
    puts "Guesses: #{@bad_guesses.join(", ")}" if @bad_guesses.length > 0 && !winner?
    puts "Remaining Guesses: #{@remaining_guesses}" unless winner?
  end

  def winner?
    !@user_progress.include? "_"
  end

  def loser?
    @remaining_guesses == 0
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
      if winner? || loser?
        display_board
        if winner?
          puts "YOU WIN"
          @level += 1
          if @level == 3
            puts "You fully evolved your #{@type} type pokemon! Go you!"
            @@characters.delete(@type)
            if @@characters.length == 0
              puts "You have now evolved all the starter pokemon. You win the game!!"
              exit
            end
          end
        elsif loser?
          puts "YOU LOST IT WAS #{@secret_word} YOU FAILURE"
        end
        ask_play_again
      end
    end
  end

end

type = ""
until type == :fire || type == :water || type == :grass
  print "Fire, Water, or Grass? "
  type = gets.chomp.downcase.to_sym
end
game = WordGuess.new(type)
game.play
