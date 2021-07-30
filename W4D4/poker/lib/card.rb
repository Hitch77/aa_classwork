class Card
    attr_reader :rank, :suit
    RANKS = [:spade, :diamond, :heart, :club]
    SUITS = [:ace, :king, :queen, :jack]
    def initialize(rank, suit)
        @rank, @suit = rank, suit
    end
    
end

c = Card.new
p c