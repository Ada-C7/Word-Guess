require 'colorize'
class Game
  attr_accessor :display, :guess_letter, :guesses, :misses, :miss_art, :win
  attr_reader :answer

  def initialize
    @win = false
    @answer = ["a", "n", "s", "w", "w", "e", "r"]
    @guesses = []
    @misses = []
    @display = []
    @guess_letter = ""
    @miss_art = ""
    generate_prompt


    # @show_index = show_index
  end
  def compare
    while @answer.count(@guess_letter) > 0
      replace_index = @answer.find_index(guess_letter)
      @display[replace_index] = guess_letter
      @answer[replace_index]= "_"
    end
    print @display
  end

  def display_prompt(replace_index, guess_letter)

    # print @display
  end

  def print_prompt
    print @display
  end

  def generate_prompt
    length = @answer.length
    length.times do
      @display.push("_")
    end
    current_display = @display.join(' ')
    print current_display
  end

  def check_misses
    misses = @misses.length
    case misses
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

  #we had a dream....we wanted to show players their missed guesses
  # def display_key
  # end

  def take_guess
    @guess_letter = gets.chomp
    if @answer.count(@guess_letter) == 0
      @misses << @guess_letter
    end
    return @guess_letter
  end

  def play
    while !@win
      take_guess
      compare
      check_misses
      display_art

      if @display.count("_") == 0 && @misses.count != 5
       puts "you win!"
        @win = true
      end
    end
  end

end

new_game = Game.new
new_game.play

#new_game.print_prompt
