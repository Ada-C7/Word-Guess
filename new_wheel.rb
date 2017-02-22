class Wheel
  attr_reader :slot

  def initialize
    @slots = [0,1,2,3,4,5]
    @slot = @slots.sample
  end

  def spin_wheel
    @slot = @slots.sample
  end

end

class Player
  attr_reader :name, :money

  def initialize(name)
    @name = name
    @money = 0
  end

  def money
    @money
  end


end

class Game
  attr_reader :wheel, :player

  def initialize
    @wheel = Wheel.new
    @player = Player.new("Aurora")
    @money = @player.money
  end

  def fortune_strikes(slot)
    if slot == 0
      puts "Oh, no! You went bankrupt!"
      @money = 0
    else
      @money += slot
    end
  end

  def welcome
    puts "Hi, #{@player.name}!"
    play_game
  end

  def continue_or_quit
    if roll_again?
      play_game
    else
      puts "See ya!"
      exit!
    end
  end

  def play_game
    puts "Spinning wheel...."
    slot = @wheel.spin_wheel
    puts "You landed on #{slot}."
    fortune_strikes(slot)
    puts "You have $#{@money}."
    continue_or_quit
  end

  def roll_again?
    print "Would you like to spin again? (yes/no) "
    spin_again = gets.chomp.downcase
    case spin_again
    when "y", "yes"
      true
    when "n", "no"
      false
    else
      roll_again?
    end
  end


end

new_game = Game.new
new_game.welcome
