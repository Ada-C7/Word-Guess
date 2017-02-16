require 'faker'

class Word
    attr_reader :theword

    def initialize
        @theword = Faker::Cat.name
    end
end

class Art
    attr_reader :theart

    def initialize(asciiart)
        @theart = asciiart
    end
end
