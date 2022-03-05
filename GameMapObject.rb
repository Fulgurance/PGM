class GameMapObject

    attr_accessor :x
    attr_accessor :y
    attr_accessor :z
    attr_accessor :realX
    attr_accessor :realY
    attr_accessor :realZ
    attr_accessor :sizeX
    attr_accessor :sizeY
    attr_accessor :sizeZ
    attr_accessor :height
    attr_accessor :passable

    def initialize(x,y,z,sizeX=32,sizeY=32,sizeZ=32)
        @x = x
        @y = y
        @z = z
        @realX = x
        @realY = y
        @realZ = z
        @sizeX = sizeX
        @sizeY = sizeY
        @sizeZ = sizeZ
        @passable = passable
    end

    def draw
    end

end
