require 'faker'

class Word
    attr_reader :theword

    def initialize
        @stringword = 'ada' # Faker::Cat.name.downcase
        @player_lives = 3
    end

    def dashes
        @stringword.length.to_i.times do
            @answer = []
            @answer << '_'
            print @answer
        end
    end

    def guess
        @userguesses = []

        until @arrayword == @answer

            @letter = ''

            until ('a'..'z').cover?(@letter)
                print "\nPlease guess a letter! (a..z):  "
                @letter = gets.chomp.downcase
            end

            @userguesses << @letter
            puts

            @arrayword = @stringword.split('')

            if @arrayword.include?(@userguesses.last)

                @arrayword.each_with_index do |_val, index|
                    @answer[index] = if @arrayword[index] == @userguesses.last && !(@answer[index] == '_')
                                         @userguesses.last
                                     else
                                         '_'
                                         end
                    print @answer
                end
            else
                puts 'Wrong!'
                lose_life(@userguesses)
            end
            puts 'You have guessed ' + @userguesses.to_s + 'thus far'
            puts
            print @answer.join(' ')
            if @player_lives == 0
                puts 'Boo!'
                break
          end
        end
  end

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*
    private

    def lose_life(letter)
        if !@stringword.include?(@letter) && !@arrayword.include?(letter)
            @player_lives -= 1
        end
    end
end

class Art
    attr_reader :theart

    def initialize(asciiart)
        @theart = asciiart
    end
end

gameword = Word.new

gameword.dashes
gameword.guess
