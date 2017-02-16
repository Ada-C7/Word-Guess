require 'faker'

class Word
    attr_reader :theword

    def initialize
        @theword = Faker::Cat.name
    end

    def dashes
        @theword.length.to_i.times do
            print '_ '
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
