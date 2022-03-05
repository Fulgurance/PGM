class GameMapObject

    attr_accessor :x
    attr_accessor :y
    attr_accessor :z
    attr_accessor :collisionZone
    attr_accessor :passable

    def initialize(x,y,z)
        @x = x
        @y = y
        @z = z
        @collisionZone = @collisionZone
        @passable = passable
    end

    def draw
    end

end
