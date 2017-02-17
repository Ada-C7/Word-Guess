class Game
  attr_accessor :display
  attr_reader :answer

  def initialize
    @win = false
    @answer = ["a", "n", "s", "w", "w", "e", "r"]
    @guesses = []
    @display = []
    # @show_index = show_index
  end
  def compare
    while @answer.count(@guess_letter) > 0
      replace_index = @answer.find_index(guess_letter)
      @answer.delete_at(replace_index)
      display_prompt(replace_index, guess_letter)
      # return replace_index
      # print @display
    end
  end
  def display_prompt(replace_index, guess_letter)
    @display[replace_index] = guess_letter
    # print @display
  end
  def generate_prompt
    length = @answer.length
    puts length
    length.times do
      @display.push("_")
  end
      current_display = @display.join(' ')
      print current_display
  end
  def display_art
  end

  def display_key
  end

  def take_guess
  end
end

new_game = Game.new
@guess_letter = "w"
new_game.generate_prompt
