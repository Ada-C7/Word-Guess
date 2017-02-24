class Wheel
  attr_reader :slot

  def initialize
    @slots = [0,50,100,200,300,400,500,550,600]
    @slot = @slots.sample
  end

  def spin_wheel
    @slot = @slots.sample
  end

end
