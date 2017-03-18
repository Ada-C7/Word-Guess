class Wheel
  attr_reader :wheel_slot, :wheel_fortune
  def initialize
    @wheel_slots = {
      "bankrupt" => "0", # @player.money = 0,
      "50" => "50", # @player.money += (50 * @new_word.count(player_guess)),
      "100" => "100" # @player.money += (100 * @new_word.count(player_guess)),
    }
  end

  def spin_wheel
    # when wheel spins, a fortune is randomly chosen
    @wheel_slot = @wheel_slots.keys.sample
    wheel_fortune = @wheel_slots[@wheel_slot]
    puts "Wheel spinning..."
    puts "You have landed on #{@wheel_slot}"
    @fortune = @wheel_fortune
  end

  def fortune
    @fortune
  end

end

class Player
  attr_reader :name, :money
  def initialize(name)
    @money = 0
    @name = name
  end

  def greet_player
    puts "Hi, #{@name}!"
  end



  def display_money
    puts "from display, You have $#{@money}."
  end
end

class Game
  attr_reader
  def initialize
    @player = Player.new("Aurora")
    @wheel = Wheel.new
    @money = @player.money
    @fortune = @wheel.fortune.to_i
  end

  def welcome
    puts "\nWelcome to Wheel of Frog, #{@player.name}!"
    run_game
  end

  def accept_your_fortune(fortune)
    # this should change your money based on the fortune
    @money += fortune
    puts "You have $#{@money}."

  end

  def run_game
    fortune = @wheel.spin_wheel
    puts "wheel fortune is #{@fortune}"
    # @wheel.wheel_fortune
    accept_your_fortune(@fortune)
    # @player.display_money
  end

end


new_game = Game.new
new_game.welcome
