require 'faker'

class Word
    attr_reader :theword

    def initialize
        @stringword = 'ada' # Faker::Cat.name.downcase
    end

    def dashes
        @stringword.length.to_i.times do
            @answer = []
            @answer << '_'
            print @answer
        end
    end

    def guess
        @letter = ''

        until ('a'..'z').cover?(@letter)
            print "\nPlease guess a letter! (a..z):  "
            @letter = gets.chomp.downcase
        end

        @userguesses = []
        @userguesses << @letter
        puts
        puts 'You have guessed ' + @userguesses.to_s + 'thus far'
        @arrayword = @stringword.split('')

        if @arrayword.include?(@userguesses.last)

            @arrayword.each_with_index do |_val, index|
                @answer[index] = if @arrayword[index] == @userguesses.last
                                     @userguesses.last
                                 else
                                     '_'
                                     end

                print @answer.join(' ')
            end
        else
            puts 'Wrong!'
        end
    end

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*
    private

    def lose_life(letter)
        if !@stringword.include?(@letter) && !@arrayword.include?(letter)
            @player_lives = - 1
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
