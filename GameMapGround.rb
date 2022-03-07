class GameMapGround < GameMapObject

    attr_accessor :spriteName
    attr_accessor :sprite
    attr_accessor :animated
    attr_accessor :animationSpeed

    def initialize(spriteName,passable,x,y,z,sizeX=32,sizeY=32,sizeZ=0)
        super(x,y,z,sizeX,sizeY,sizeZ)
        @spriteName = spriteName
        @sprite = Sprite.new("Graphics/Grounds/#{@spriteName}.png",retro: true)
        @passable = passable
        @animated = false
        @animationSpeed = 0.20
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
