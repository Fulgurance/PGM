class Text

    attr_accessor :font
    attr_accessor :content

    def initialize(content,font = Font.new(20))
        @content = content
        @font = font
    end

    def draw(x,y,z,scale_x,scale_y,color)
        @font.draw_markup(@content,x,y,z,scale_x,scale_y,color)
    end

    def width
        return @font.markup_width(@content)
    end

    def height
        return @font.height
    end

end
