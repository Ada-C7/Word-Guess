class GameWheel
  attr_reader :wheel, :player, :money

  def initialize
    @wheel = Wheel.new
    @player = Player.new("Aurora")
    @money = @player.money
    @vowels_bought = []
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
    buy_vowel_or_spin
  end

  def buy_vowel_or_spin
    print "\nWould you like to (b)uy a vowel, (s)pin the wheel, or (q)uit? "
    buy_or_spin = gets.chomp.downcase
    case buy_or_spin
    when "b", "buy", "vowel"
      if @money < 100
        puts "You don't have enough money to buy a vowel! (You need at least $100.)"
        buy_vowel_or_spin
      else
        buy_a_vowel
      end
    when "s", "spin", "wheel"
      spin_the_wheel
    when "q", "quit", "exit"
      puts "See ya!"
      exit!
    else
      buy_vowel_or_spin
    end
  end

  def buy_a_vowel
    vowel_price = -100
    print "What vowel would you like to buy? (a/e/i/o/u) "
    vowel = gets.chomp.downcase
    # at this point it's a valid vowel
    if @vowels_bought.include?(vowel) || !["a", "e", "i", "o", "u"].include?(vowel)
      puts "Sorry, what vowel?"
      buy_a_vowel
    end
    # at this point it's not a duplicate vowel
    @vowels_bought << vowel

    fortune_strikes(vowel_price)
    puts "You bought the letter #{vowel.upcase}. You now have $#{@money}."
    buy_vowel_or_spin
  end


  def spin_the_wheel
    puts "\nSpinning wheel...."
    slot = @wheel.spin_wheel
    puts "You landed on $#{slot}."
    fortune_strikes(slot)
    puts "You have $#{@money}."
    buy_vowel_or_spin
  end

  def spin_again?
    print "Would you like to spin again? (yes/no) "
    spin_again = gets.chomp.downcase
    case spin_again
    when "y", "yes"
      true
    when "n", "no"
      false
    else
      spin_again?
    end
  end

end
