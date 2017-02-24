class Pond

  attr_accessor :counter

  def initialize
    @counter = 0
    @pond = []
    @frog = "____🐸____"
    @lilypad = "_________"
    # @player_guess = player_guess
    create_pond
  end

  def create_pond
    # CREATE POND
    @pond << @frog
    4.times do
      @pond << @lilypad
    end
  end

  def display_pond
    # DISPLAY POND
    puts
    @pond.each do |space|
      print space + "  "
    end
    puts
    # puts "displaying pond"
  end

  def update_pond
    @pond.length.times do |n|
      if n < @counter || n > @counter
        @pond[n] = @lilypad
      else
        @pond[n] = @frog
      end
    end
  end

end
