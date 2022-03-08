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
    attr_accessor :leftPassable
    attr_accessor :rightPassable
    attr_accessor :upPassable
    attr_accessor :downPassable

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
        @leftPassable = false
        @rightPassable = false
        @upPassable = false
        @downPassable = false
    end

    def update
    end

    def draw
    end

end
