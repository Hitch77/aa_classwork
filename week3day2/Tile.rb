class Tile
    def initialize(tile)
        @tile = tile
        @given = false
    end

    def self.make(tile)
        @tile = tile
        @given = true
    end

    def to_s
    end
end