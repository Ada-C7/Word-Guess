class Game


  def initialize
    @win = false
    @answer = []
    @guesses = []
    @display
    @show_index = show_index
  end

  def compare
    while @answer.count(guess_letter) > 0
      replace_index = @answer.find_index(guess_letter)
      @answer.delete_at(replace_index)
      display_prompt(replace_index, guess_letter)
    end
  end

  def display_prompt
  end

  def display_art
  end

  def display_key
  end

  def take_guess
  end


end
