class Text

    attr_accessor :content
    attr_accessor :font
    attr_accessor :x
    attr_accessor :y
    attr_accessor :z
    attr_accessor :zoomX
    attr_accessor :zoomY
    attr_accessor :color
    attr_accessor :mode

    def initialize(content,font = Font.new(24))
        @content = content
        @font = font
        @x = 0
        @y = 0
        @z = 0
        @zoomX = 1.0
        @zoomY = 1.0
        @color = 0xff_ffffff
        @mode = :default
    end

    def draw
        @font.draw_markup(@content,@x,@y,@z,@zoomX,@zoomY,@color)
    end

    def width
        return @font.markup_width(@content)
    end

    def height
        return @font.height
    end

end
