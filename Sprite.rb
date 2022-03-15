class Sprite < Gosu::Image

    attr_accessor :x
    attr_accessor :y
    attr_accessor :z
    attr_accessor :zoomX
    attr_accessor :zoomY
    attr_accessor :color
    attr_accessor :mode

    def initialize(source, options = {})
        super(source,options)
        @x = 0
        @y = 0
        @z = 0
        @zoomX = 1.0
        @zoomY = 1.0
        @color = 0xff_ffffff
        @mode = :default
    end

    def draw
        super(@x,@y,@z,@zoomX,@zoomY,@color,@mode)
    end

end
