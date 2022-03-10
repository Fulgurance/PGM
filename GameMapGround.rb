class GameMapGround < GameMapObject

    attr_accessor :spriteName
    attr_accessor :sprite
    attr_accessor :animated
    attr_accessor :animationSpeed

    def initialize(spriteName,x,y,z,sizeX=32,sizeY=32,sizeZ=0)
        super(x,y,z,sizeX,sizeY,sizeZ)
        @spriteName = spriteName
        @sprite = Sprite.new("Graphics/Grounds/#{@spriteName}/0.png",retro: true)
        @animated = false
        @animationSpeed = 0.1
        @currentFrame = 0
        @frameTime = Time.now
    end

    def update
      if @animated
        if (Time.now.to_f-@frameTime.to_f) > @animationSpeed
          @currentFrame += 1
          if !File.exist?("Graphics/Grounds/#{@spriteName}/#{@currentFrame}.png")
            @currentFrame = 0
          end
          @sprite.insert("Graphics/Grounds/#{@spriteName}/#{@currentFrame}.png",0,0)
          @frameTime = Time.now
        end
      end
    end

    def draw
      GL.BindTexture(GL::TEXTURE_2D, @sprite.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1,1,1)

        GL.Begin(GL::QUADS)

          GL.TexCoord2d(@sprite.gl_tex_info.left,@sprite.gl_tex_info.bottom)
          GL.Vertex3f(@x, @y, @z)

          GL.TexCoord2d(@sprite.gl_tex_info.right,@sprite.gl_tex_info.bottom)
          GL.Vertex3f(@x+@sizeX, @y, @z)

          GL.TexCoord2d(@sprite.gl_tex_info.right,@sprite.gl_tex_info.top)
          GL.Vertex3f(@x+@sizeX, @y+@sizeY, @z)

          GL.TexCoord2d(@sprite.gl_tex_info.left,@sprite.gl_tex_info.top)
          GL.Vertex3f(@x, @y+@sizeY, @z)

        GL.End
      GL.PopMatrix
    end

end
