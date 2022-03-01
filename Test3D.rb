class Test3D < GameScene

  def initialize
    GL.load_lib()
    GLU.load_lib()

    @texture = Gosu::Image.new('Test.png')
    @texture1 = GLTexture.new('Test1.png')
    @texture2 = Gosu::Image.new('Tree.png')
    @texture3 = Gosu::Image.new('Character.png')

    @viewAngle = 45.0
    @cameraX,@cameraY = 0,-320
    @viewX,@viewY = 0,-64
    @characterX,@characterY = 0,-64
    @speed = 2.0

    #@backgroundMusic = Gosu::Song.new("Test.wav")
    #@backgroundMusic.play(true)
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT
      @characterX -= @speed
      @cameraX -= @speed
      @viewX -= @speed
    end
    if Gosu.button_down? Gosu::KB_RIGHT
      @characterX += @speed
      @cameraX += @speed
      @viewX += @speed
    end
    if Gosu.button_down? Gosu::KB_UP
      @characterY += @speed
      @cameraY += @speed
      @viewY += @speed
    end
    if Gosu.button_down? Gosu::KB_DOWN
      @characterY -= @speed
      @cameraY -= @speed
      @viewY -= @speed
    end
  end

  def draw
    Gosu.gl do

      GL.Clear(GL::COLOR_BUFFER_BIT | GL::DEPTH_BUFFER_BIT)
      GL.Enable(GL::TEXTURE_2D)
      GL.Enable(GL::DEPTH_TEST)
      GL.MatrixMode(GL::PROJECTION)
      GL.LoadIdentity
      GLU.Perspective(@viewAngle, $gameWindow.width.to_f / $gameWindow.height.to_f, 1, 1200)
      GL.MatrixMode(GL::MODELVIEW)
      GL.LoadIdentity
      GLU.LookAt(@cameraX,@cameraY,200,@viewX,@viewY,0,0,0,1)

      #DRAW THE BUILDING (Front)
      GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(@texture.width, 0, @texture.height)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
          GL.Vertex3f(-0.5, 0.0, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
          GL.Vertex3f(0.5, 0.0, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
          GL.Vertex3f(0.5, 0.0, 1.0)

          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
          GL.Vertex3f(-0.5, 0.0, 1.0)
        GL.End
      GL.PopMatrix

      #DRAW THE BUILDING (Left)
      GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)

      GL.PushMatrix
      GL.Translatef(-@texture.width/2,@texture.width/2,1)
      GL.Rotatef(90,0,0,1)
        GL.Scalef(@texture.width, 0, @texture.height)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
          GL.Vertex3f(-0.5, 0.0, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
          GL.Vertex3f(0.5, 0.0, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
          GL.Vertex3f(0.5, 0.0, 1.0)

          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
          GL.Vertex3f(-0.5, 0.0, 1.0)
        GL.End
      GL.PopMatrix

      #DRAW THE BUILDING (Right)
      GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)

      GL.PushMatrix
      GL.Translatef(@texture.width/2,@texture.width/2,1)
      GL.Rotatef(90,0,0,1)
        GL.Scalef(@texture.width, 0, @texture.height)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
          GL.Vertex3f(-0.5, 0.0, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
          GL.Vertex3f(0.5, 0.0, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
          GL.Vertex3f(0.5, 0.0, 1.0)

          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
          GL.Vertex3f(-0.5, 0.0, 1.0)
        GL.End
      GL.PopMatrix

      #DRAW THE GROUND
      GL.BindTexture(GL::TEXTURE_2D, @texture1.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(@texture1.width, @texture1.height, 0)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(-2, -2, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(2, -2, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(2, 2, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(-2, 2, 0.0)
        GL.End
      GL.PopMatrix

      #DRAW A TREE
      GL.BindTexture(GL::TEXTURE_2D, @texture2.gl_tex_info.tex_name)
      GL.Enable(GL::ALPHA_TEST)
      GL.AlphaFunc(GL::GREATER,0)

      GL.PushMatrix
      GL.Translatef(32*3,64,0)
      GL.Scalef(@texture2.width,@texture2.height, @texture2.height)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.bottom)
          GL.Vertex3f(-0.5, 0.0, 0.0)

          GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.bottom)
          GL.Vertex3f(0.5, 0.0, 0.0)

          GL.TexCoord2d(@texture2.gl_tex_info.right,@texture2.gl_tex_info.top)
          GL.Vertex3f(0.5, 0.0, 1.0)

          GL.TexCoord2d(@texture2.gl_tex_info.left,@texture2.gl_tex_info.top)
          GL.Vertex3f(-0.5, 0.0, 1.0)
        GL.End

      GL.Disable(GL::ALPHA_TEST)
      GL.PopMatrix

      #DRAW A CHARACTER
      GL.BindTexture(GL::TEXTURE_2D, @texture3.gl_tex_info.tex_name)
      GL.Enable(GL::ALPHA_TEST)
      GL.AlphaFunc(GL::GREATER,0)

      GL.PushMatrix
      GL.Translatef(@characterX,@characterY,0)
      GL.Rotatef(-@viewAngle,1,0,0)
        GL.Scalef(@texture3.width,@texture3.height,@texture3.height)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture3.gl_tex_info.left,@texture3.gl_tex_info.bottom)
          GL.Vertex3f(-0.5, 0.0, 0.0)

          GL.TexCoord2d(@texture3.gl_tex_info.right,@texture3.gl_tex_info.bottom)
          GL.Vertex3f(0.5, 0.0, 0.0)

          GL.TexCoord2d(@texture3.gl_tex_info.right,@texture3.gl_tex_info.top)
          GL.Vertex3f(0.5, 0.0, 1.0)

          GL.TexCoord2d(@texture3.gl_tex_info.left,@texture3.gl_tex_info.top)
          GL.Vertex3f(-0.5, 0.0, 1.0)
        GL.End
      GL.Disable(GL::ALPHA_TEST)
      GL.PopMatrix

    end

  end

end
