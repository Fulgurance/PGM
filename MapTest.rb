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
    super("4",x,y,z)
    self.sizeX = 32
    self.sizeY = 32
    self.leftPassable = true
    self.rightPassable = true
    self.upPassable = true
    self.downPassable = true
    @texture = Sprite.new('Graphics/Grass/1/0.png', retro: true)
  end

  def draw
    super
    #Draw Front Grass
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

    ###
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture.width, @y+6, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+6, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
        GL.Vertex3f(@x, @y+6, @z+@texture.height)

        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
        GL.Vertex3f(@x+@texture.width, @y+6, @z+@texture.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    ###
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+12, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture.width, @y+12, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
        GL.Vertex3f(@x+@texture.width, @y+12, @z+@texture.height)

        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
        GL.Vertex3f(@x, @y+12, @z+@texture.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    ###
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture.width, @y+18, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+18, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
        GL.Vertex3f(@x, @y+18, @z+@texture.height)

        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
        GL.Vertex3f(@x+@texture.width, @y+18, @z+@texture.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    ###
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+24, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture.width, @y+24, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
        GL.Vertex3f(@x+@texture.width, @y+24, @z+@texture.height)

        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
        GL.Vertex3f(@x, @y+24, @z+@texture.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    ###
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture.width, @y+30, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+30, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
        GL.Vertex3f(@x, @y+30, @z+@texture.height)

        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
        GL.Vertex3f(@x+@texture.width, @y+30, @z+@texture.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    #Top(Left)
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x, @y+@texture.width, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
        GL.Vertex3f(@x, @y+@texture.width, @z+@texture.height)

        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
        GL.Vertex3f(@x, @y, @z+@texture.height)
      GL.End

      GL.Disable(GL::ALPHA_TEST)
    GL.PopMatrix

    #Top(Right)
    GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)
    GL.Enable(GL::ALPHA_TEST)
    GL.AlphaFunc(GL::GREATER,0)

    GL.PushMatrix
      GL.Scalef(1,1,1)

      GL.Begin(GL::QUADS)
        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture.width, @y+@texture.width, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
        GL.Vertex3f(@x+@texture.width, @y, @z)

        GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
        GL.Vertex3f(@x+@texture.width, @y, @z+@texture.height)

        GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
        GL.Vertex3f(@x+@texture.width, @y+@texture.width, @z+@texture.height)
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
      @texture1 = Sprite.new('Test.png', retro: true)
      @texture2 = Sprite.new('Test2.png', retro: true)

      self.leftPassable = true
    self.rightPassable = true
    self.upPassable = true
    self.downPassable = true
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

class Tree < GameMapObject

  def initialize(x,y,z)
      super(x,y,z)
      self.leftPassable = false
      self.rightPassable = false
      self.upPassable = false
      self.downPassable = false
      @texture = Sprite.new('Tree.png', retro: true)
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

class Event1 < GameMapEvent

  def initialize(spriteName,x,y,z)
    super(spriteName,x,y,z)
    self.leftPassable = false
    self.rightPassable = false
    self.upPassable = false
    self.downPassable = false
  end

  def update
    super
    #64,32,0

    #
    if self.realY == 0 && self.realX >= 64 && self.realX < 96
      moveRight
    end

    if self.realY == 32 && self.realX <= 96 && self.realX > 64
      moveLeft
    end

    if self.realX == 96 && self.realY >= 0 && self.realY < 32
      moveUp
    end

    #
    if self.realX == 64 && self.realY <= 32 && self.realY > 0
      moveDown
    end

  end

end

class MapTest < GameMapScene

  def initialize(name,panelNumber,playerX,playerY,playerZ)
    super(name,panelNumber,playerX,playerY,playerZ,20*32,20*32,"Test.wav")

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

                Water.new(286,0,0),
                Water.new(318,0,0),
                Water.new(350,0,0),
                Water.new(286,32,0),
                Water.new(318,32,0),
                Water.new(350,32,0),
                Water.new(286,64,0),
                Water.new(318,64,0),
                Water.new(350,64,0),

                Water.new(286,96,0),
                Water.new(318,96,0),
                Water.new(350,96,0),
                Water.new(286,128,0),
                Water.new(318,128,0),
                Water.new(350,128,0),
                Water.new(286,160,0),
                Water.new(318,160,0),
                Water.new(350,160,0),

                Water.new(286,192,0),
                Water.new(318,192,0),
                Water.new(350,192,0),
                Water.new(286,224,0),
                Water.new(318,224,0),
                Water.new(350,224,0),
                Water.new(286,256,0),
                Water.new(318,256,0),
                Water.new(350,256,0),

                Water.new(286,-32,0),
                Water.new(318,-32,0),
                Water.new(350,-32,0),
                Water.new(286,-64,0),
                Water.new(318,-64,0),
                Water.new(350,-64,0),
                Water.new(286,-96,0),
                Water.new(318,-96,0),
                Water.new(350,-96,0),

                Water.new(192,-32,0),
                Water.new(224,-32,0),
                Water.new(256,-32,0),
                Water.new(192,-64,0),
                Water.new(224,-64,0),
                Water.new(256,-64,0),
                Water.new(192,-96,0),
                Water.new(224,-96,0),
                Water.new(256,-96,0),

                Building.new(64,64,0),
                Panel.new(0,32,0),
                Tree.new(0,128,0),
                Tree.new(0,160,0),
                Tree.new(0,192,0),
                Tree.new(0,224,0),
                Tree.new(32,224,0),
                Tree.new(64,260,0),
                Tree.new(32,260,0),
                Tree.new(0,260,0),
                Tree.new(96,260,0),
                Tree.new(128,260,0),
                Tree.new(160,260,0),
                Tree.new(192,260,0),
                Tree.new(224,260,0),
                Tree.new(260,260,0),
                Tree.new(260,224,0),
                Tree.new(260,192,0)]
    @events = [Event1.new("BoyHero",64,32,0)]
  end

  def updateInputs
    super

    if Input.keepPressed(Key::KeyboardReturn) && !@standby && @player.currentMovementDistance == 0 && @player.x == 0 && @player.y == 0 && @player.lookingUp
      @standby = true
      @message = GameMessageScene.new("Salut! C'est parti !",0)
      @backgroundMusic.stop
      @standby = true
      @battle = GameBattleScene.new(0)
    end

    def drawGraphics
      super

      @message.draw if @message != nil
    end

    def update
      super

      if @standby
        @message.update if @message != nil
        @battle.update if @battle != nil
      else
        @message = nil
        @battle = nil
      end
    end

  end

end
