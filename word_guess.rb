require 'colorize'
require 'faker'
class Game
  attr_accessor :display, :guess_letter, :guesses, :misses, :miss_art, :win, :answer, :word


  def initialize
    @win = false
    @answer =
    @guesses = []
    @misses = []
    @display = []
    @guess_letter = ""
    @miss_art = ""
    @word = ""
    generate_prompt
  end

  def generate_prompt
    length = @answer.length
    length.times do
      @display.push("_")
    end
    current_display = @display.join(' ')
    print current_display
  end

  def make_answer
    @word = [Faker::Color.color_name.split(""),Faker::Space.planet.split(""),Faker::Team.creature.split("")].sample
    @answer = @word
  end




  def take_guess
    print "Guess a letter:"
    @guess_letter = gets.chomp
    if @answer.count(@guess_letter) == 0
      @misses << @guess_letter
    end
    return @guess_letter
  end

  def compare
    while @answer.count(@guess_letter) > 0
      replace_index = @answer.find_index(guess_letter)
      @display[replace_index] = guess_letter
      @answer[replace_index]= " _"
    end
     print @display.join(" ")
  end





  def check_misses
    misses = @misses.length
    case misses
    when 0
      @miss_art = "gorilla0.txt"
    when 1
      @miss_art = "gorilla.txt"
    when 2
      @miss_art = "gorilla1.txt"
    when 3
      @miss_art = "gorilla2.txt"
    when 4
      @miss_art = "gorilla3.txt"
    when 5
      @miss_art = "gorilla4.txt"
    when 6
      @miss_art = "gorilla5.txt"
    end
    return @miss_art
  end


  def display_art
    puts "\n\n\n\n"
    File.open(@miss_art) do |f|
      f.each_line do |line|
        #I added in the colorize gem so if you want color use line 4, else you can omit
        line = line.colorize(:cyan)
        print line
      end
    end
  end



  def play
    make_answer
    generate_prompt
    while !@win
      take_guess
      compare
      check_misses
      display_art

      if @display.count("_") == 0 && @misses.count != 6
        puts "you win!"
        @win = true
      elsif  @misses.count == 6
        File.open(@miss_art) do |f|
          f.each_line do |line|
            #I added in the colorize gem so if you want color use line 4, else you can omit
            line = line.colorize(:cyan)
            print line
          end
          puts "you lose!"
          puts "The answer was: #{@word}"
          @win = true
        end
      end
    end
  end
end


new_game = Game.new
new_game.play

#new_game.print_prompt
