class Panel < GameMapObject

  def initialize(x,y,z)
      super(x,y,z)
      @passable = false
      @texture = Sprite.new('Panel.png', retro: true)
  end

  def draw
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
      GL.Enable(GL::ALPHA_TEST)
      GL.AlphaFunc(GL::GREATER,0)

      GL.PushMatrix
        GL.Scalef(1,1,1)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
          GL.Vertex3f(@x+16-@texture.width/2, @y+16, @z)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
          GL.Vertex3f(@x+16+@texture.width/2, @y+16, @z)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
          GL.Vertex3f(@x+16+@texture.width/2, @y+16, @z+@texture.height)

          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
          GL.Vertex3f(@x+16-@texture.width/2, @y+16, @z+@texture.height)
        GL.End

        GL.Disable(GL::ALPHA_TEST)
      GL.PopMatrix
  end

end

class Building < GameMapObject

  def initialize(x,y,z)
      super(x,y,z)
      @sizeX = 128
      @sizeY = 128
      @sizeZ = 96
      @passable = false
      @texture1 = Sprite.new('Test.png', retro: true)
      @texture2 = Sprite.new('Test2.png', retro: true)
  end

  def draw
    #(Front)
      GL.BindTexture(GL::TEXTURE_2D, @texture1.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1, 1, 1)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(@x, @y, @z)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(@x+@sizeX, @y, @z)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(@x+@sizeX, @y, @z+@sizeZ)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(@x, @y, @z+@sizeZ)
        GL.End
      GL.PopMatrix

      #(Left)
      GL.BindTexture(GL::TEXTURE_2D, @texture1.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1, 1, 1)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(@x, @y+@sizeY, @z)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(@x, @y, @z)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(@x, @y, @z+@sizeZ)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(@x,@y+@sizeY,@z+@sizeZ)
        GL.End
      GL.PopMatrix

      #(Right)
      GL.BindTexture(GL::TEXTURE_2D, @texture1.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1, 1, 1)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(@x+@sizeX,@y,@z)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(@x+@sizeX,@y+@sizeY,@z)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(@x+@sizeX,@y+@sizeY,@z+@sizeZ)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(@x+@sizeX,@y,@z+@sizeZ)
        GL.End
      GL.PopMatrix
      #(Up)
      GL.BindTexture(GL::TEXTURE_2D, @texture2.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1, 1, 1)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.bottom)
          GL.Vertex3f(@x,@y,@z+@sizeZ)

          GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.bottom)
          GL.Vertex3f(@x+@sizeX,@y,@z+@sizeZ)

          GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.top)
          GL.Vertex3f(@x+@sizeX,@y+@sizeY,@z+@sizeZ)

          GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.top)
          GL.Vertex3f(@x, @y+@sizeY, @z+@sizeZ)
        GL.End
      GL.PopMatrix

  end

end

class MapTest < GameMapScene

  def initialize(playerX,playerY,playerZ)
    super(playerX,playerY,playerZ,9*32,9*32)
    @texture2 = Sprite.new('Tree.png', retro: true)

    @objects = [GameMapGround.new("1",true,0,0,0,64,64),
                GameMapGround.new("1",true,64,0,0,64,64),
                GameMapGround.new("1",true,128,0,0,64,64),
                GameMapGround.new("2",true,192,0,0,96,96),
                GameMapGround.new("1",true,0,64,0,64,64),
                GameMapGround.new("1",true,64,64,0,64,64),
                GameMapGround.new("1",true,128,64,0,64,64),
                GameMapGround.new("1",true,0,128,0,64,64),
                GameMapGround.new("1",true,64,128,0,64,64),
                GameMapGround.new("1",true,128,128,0,64,64),
                GameMapGround.new("2",true,0,192,0,96,96),
                GameMapGround.new("2",true,96,192,0,96,96),
                GameMapGround.new("2",true,192,192,0,96,96),
                GameMapGround.new("3",true,192,96,0,96,96),
                Building.new(64,64,0),
                Panel.new(32,32,0)]

    #@backgroundMusic = Gosu::Song.new("Test.wav")
    #@backgroundMusic.play(true)
  end

end
