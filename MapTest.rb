class Road < GameMapGround

  def initialize(x,y,z)
    super("1",x,y,z)
    self.sizeX = 64
    self.sizeY = 64
    self.leftPassable = true
    self.rightPassable = true
    self.upPassable = true
    self.downPassable = true
  end

end

class Grass < GameMapGround

  def initialize(x,y,z)
    super("2",x,y,z)
    self.sizeX = 32
    self.sizeY = 32
    self.leftPassable = true
    self.rightPassable = true
    self.upPassable = true
    self.downPassable = true
    @texture = Sprite.new('Graphics/Grass/1/1.png', retro: true)
    @texture1 = Sprite.new('Graphics/Grass/1/2.png', retro: true)
    @texture2 = Sprite.new('Graphics/Grass/1/3.png', retro: true)
    @texture3 = Sprite.new('Graphics/Grass/1/4.png', retro: true)
  end

  def draw
    #Bottom(Left)
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+@texture.width, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
        GL.Vertex3f(@x, @y, @z+@texture.height)

        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
        GL.Vertex3f(@x, @y+@texture.width, @z+@texture.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    #Bottom(Front)
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture.width, @y, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
        GL.Vertex3f(@x+@texture.width, @y, @z+@texture.height)

        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
        GL.Vertex3f(@x, @y, @z+@texture.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    #Bottom(Right)
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture.width, @y, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture.width, @y+@texture.width, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
        GL.Vertex3f(@x+@texture.width, @y+@texture.width, @z+@texture.height)

        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
        GL.Vertex3f(@x+@texture.width, @y, @z+@texture.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    #Bottom(Top)
    GL.BindTexture(GL::TEXTURE_2D, @texture1.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y, @z+@texture.height)

        GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture1.width, @y, @z+@texture.height)

        GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
        GL.Vertex3f(@x+@texture1.width, @y+@texture1.height, @z+@texture.height)

        GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
        GL.Vertex3f(@x, @y+@texture1.height, @z+@texture.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    #Draw Front Grass
    GL.BindTexture(GL::TEXTURE_2D, @texture2.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y, @z+@texture.height)

        GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture2.width, @y, @z+@texture.height)

        GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.top)
        GL.Vertex3f(@x+@texture2.width, @y, @z+@texture.height+@texture2.height)

        GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.top)
        GL.Vertex3f(@x, @y, @z+@texture.height+@texture2.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    ###
    GL.BindTexture(GL::TEXTURE_2D, @texture3.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture3.gl_tex_info.left,@texture3.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+6, @z+@texture.height)

        GL.TexCoord2d(@texture3.gl_tex_info.right,@texture3.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture3.width, @y+6, @z+@texture.height)

        GL.TexCoord2d(@texture3.gl_tex_info.right,@texture3.gl_tex_info.top)
        GL.Vertex3f(@x+@texture3.width, @y+6, @z+@texture.height+@texture3.height)

        GL.TexCoord2d(@texture3.gl_tex_info.left,@texture3.gl_tex_info.top)
        GL.Vertex3f(@x, @y+6, @z+@texture.height+@texture3.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    ###
    GL.BindTexture(GL::TEXTURE_2D, @texture2.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+12, @z+@texture.height)

        GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture2.width, @y+12, @z+@texture.height)

        GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.top)
        GL.Vertex3f(@x+@texture2.width, @y+12, @z+@texture.height+@texture2.height)

        GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.top)
        GL.Vertex3f(@x, @y+12, @z+@texture.height+@texture2.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    ###
    GL.BindTexture(GL::TEXTURE_2D, @texture3.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture3.gl_tex_info.left,@texture3.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+18, @z+@texture.height)

        GL.TexCoord2d(@texture3.gl_tex_info.right,@texture3.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture3.width, @y+18, @z+@texture.height)

        GL.TexCoord2d(@texture3.gl_tex_info.right,@texture3.gl_tex_info.top)
        GL.Vertex3f(@x+@texture3.width, @y+18, @z+@texture.height+@texture3.height)

        GL.TexCoord2d(@texture3.gl_tex_info.left,@texture3.gl_tex_info.top)
        GL.Vertex3f(@x, @y+18, @z+@texture.height+@texture3.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    ###
    GL.BindTexture(GL::TEXTURE_2D, @texture2.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+24, @z+@texture.height)

        GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture2.width, @y+24, @z+@texture.height)

        GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.top)
        GL.Vertex3f(@x+@texture2.width, @y+24, @z+@texture.height+@texture2.height)

        GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.top)
        GL.Vertex3f(@x, @y+24, @z+@texture.height+@texture2.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    ###
    GL.BindTexture(GL::TEXTURE_2D, @texture3.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture3.gl_tex_info.left,@texture3.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+30, @z+@texture.height)

        GL.TexCoord2d(@texture3.gl_tex_info.right,@texture3.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture2.width, @y+30, @z+@texture.height)

        GL.TexCoord2d(@texture3.gl_tex_info.right,@texture3.gl_tex_info.top)
        GL.Vertex3f(@x+@texture3.width, @y+30, @z+@texture.height+@texture3.height)

        GL.TexCoord2d(@texture3.gl_tex_info.left,@texture3.gl_tex_info.top)
        GL.Vertex3f(@x, @y+30, @z+@texture.height+@texture3.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    #Top(Left)
    GL.BindTexture(GL::TEXTURE_2D, @texture3.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture3.gl_tex_info.left,@texture3.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+@texture3.width, @z+@texture.height)

        GL.TexCoord2d(@texture3.gl_tex_info.right,@texture3.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y, @z+@texture.height)

        GL.TexCoord2d(@texture3.gl_tex_info.right,@texture3.gl_tex_info.top)
        GL.Vertex3f(@x, @y, @z+@texture.height+@texture3.height)

        GL.TexCoord2d(@texture3.gl_tex_info.left,@texture3.gl_tex_info.top)
        GL.Vertex3f(@x, @y+@texture3.width, @z+@texture.height+@texture3.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    #Top(Right)
    GL.BindTexture(GL::TEXTURE_2D, @texture2.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture2.width, @y+@texture2.width, @z+@texture.height)

        GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture2.width, @y, @z+@texture.height)

        GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.top)
        GL.Vertex3f(@x+@texture2.width, @y, @z+@texture.height+@texture2.height)

        GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.top)
        GL.Vertex3f(@x+@texture2.width, @y+@texture2.width, @z+@texture.height+@texture2.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

  end

end

class Water < GameMapGround

  def initialize(x,y,z)
    super("3",x,y,z)
    self.sizeX = 32
    self.sizeY = 32
    self.animated = true
    self.leftPassable = true
    self.rightPassable = true
    self.upPassable = true
    self.downPassable = true
  end

end

class ShortGrass < GameMapGround

  def initialize(x,y,z)
    super("2",x,y,z)
    self.sizeX = 96
    self.sizeY = 96
    self.leftPassable = true
    self.rightPassable = true
    self.upPassable = true
    self.downPassable = true
  end

end

class Panel < GameMapObject

  def initialize(x,y,z)
      super(x,y,z)
      self.leftPassable = false
      self.rightPassable = false
      self.upPassable = false
      self.downPassable = false
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
      self.sizeX = 128
      self.sizeY = 128
      self.sizeZ = 96
      self.leftPassable = true
      self.rightPassable = true
      self.upPassable = true
      self.downPassable = true
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

class Event1 < GameMapEvent

  def initialize(spriteName,x,y,z)
    super(spriteName,x,y,z)
    self.leftPassable = false
    self.rightPassable = false
    self.upPassable = false
    self.downPassable = false
  end

end

class MapTest < GameMapScene

  def initialize(playerX,playerY,playerZ)
    super(playerX,playerY,playerZ,9*32,9*32)#,"Test.wav")
    @texture2 = Sprite.new('Tree.png', retro: true)

    @objects = [Road.new(0,0,0),
                Road.new(64,0,0),
                Road.new(128,0,0),
                Grass.new(192,0,0),
                Grass.new(222,0,0),
                Grass.new(254,0,0),
                Grass.new(192,32,0),
                Grass.new(222,32,0),
                Grass.new(254,32,0),
                Grass.new(192,64,0),
                Grass.new(222,64,0),
                Grass.new(254,64,0),
                Road.new(0,64,0),
                Road.new(0,128,0),
                ShortGrass.new(0,192,0),
                ShortGrass.new(96,192,0),
                ShortGrass.new(192,192,0),
                Water.new(192,96,0),
                Water.new(222,96,0),
                Water.new(254,96,0),
                Water.new(192,128,0),
                Water.new(222,128,0),
                Water.new(254,128,0),
                Water.new(192,160,0),
                Water.new(222,160,0),
                Water.new(254,160,0),
                Building.new(64,64,0),
                Panel.new(32,32,0)]
    @events = [Event1.new("BoyHero",64,32,0)]
  end

end
