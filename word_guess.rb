class Game
  attr_accessor :display, :guess_letter
  attr_reader :answer

  def initialize
    @win = false
    @answer = ["a", "n", "s", "w", "w", "e", "r"]
    @guesses = []
    @display = []
    @guess_letter = "w"
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
      # print current_display
  end
  #
  # def display_art
  #   File.open(file_name) do |f|
  # f.each_line do |line|
  #   #I added in the colorize gem so if you want color use line 4, else you can omit
  #   line = line.colorize(:cyan)
  #   print line
  # end
  # end
  # end

  def display_key
  end

  def take_guess
  end
end

new_game = Game.new
new_game.generate_prompt
new_game.compare
#new_game.print_prompt
