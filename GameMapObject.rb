class GameMapObject

    attr_accessor :x
    attr_accessor :y
    attr_accessor :z

    def initialize(x,y,z)
        @x = x
        @y = y
        @z = z
    end

    def draw
    end

end
