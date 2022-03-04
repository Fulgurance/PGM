class Sprite3D < Sprite

    attr_accessor :texture
    attr_accessor :x
    attr_accessor :y
    attr_accessor :z

    def initialize(textureFile)
        @texture = Sprite.new(textureFile, retro: true)
    end

    def draw
    end

end
