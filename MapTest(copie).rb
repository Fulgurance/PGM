class MapTest < GameMapScene

  def initialize(playerX,playerY,playerZ,mapWidth,mapHeight)
    super(playerX,playerY,playerZ,mapWidth,mapHeight)
    @texture = Sprite.new('Test.png', retro: true)
    @texture1 = Sprite.new('Test1.png', retro: true)
    @texture2 = Sprite.new('Tree.png', retro: true)
    @texture4 = Sprite.new('Panel.png', retro: true)
    @texture5 = Sprite.new('Test2.png', retro: true)

    #@backgroundMusic = Gosu::Song.new("Test.wav")
    #@backgroundMusic.play(true)
  end

  def drawMap
=begin
      #DRAW A PANEL
      GL.BindTexture(GL::TEXTURE_2D, @texture4.gl_tex_info.tex_name)
      GL.Enable(GL::ALPHA_TEST)
      GL.AlphaFunc(GL::GREATER,0)

      GL.PushMatrix
      GL.Scalef(1,1,1)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture4.gl_tex_info.left,@texture4.gl_tex_info.bottom)
          GL.Vertex3f(-32-@texture4.width/2, -32, 0.0)

          GL.TexCoord2d(@texture4.gl_tex_info.right,@texture4.gl_tex_info.bottom)
          GL.Vertex3f(-32+@texture4.width/2, -32, 0.0)

          GL.TexCoord2d(@texture4.gl_tex_info.right,@texture4.gl_tex_info.top)
          GL.Vertex3f(-32+@texture4.width/2, -32, @texture4.height)

          GL.TexCoord2d(@texture4.gl_tex_info.left,@texture.gl_tex_info.top)
          GL.Vertex3f(-32-@texture4.width/2, -32,@texture4.height)
        GL.End

      GL.Disable(GL::ALPHA_TEST)
      GL.PopMatrix

      #DRAW THE BUILDING (Front)
      GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1, 1, 1)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
          GL.Vertex3f(-@texture.width/2, 0.0, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
          GL.Vertex3f(@texture.width/2, 0.0, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
          GL.Vertex3f(@texture.width/2, 0.0, @texture.height)

          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
          GL.Vertex3f(-@texture.width/2, 0.0, @texture.height)
        GL.End
      GL.PopMatrix

      #DRAW THE BUILDING (Left)
      GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1, 1, 1)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
          GL.Vertex3f(-@texture.width/2, @texture.width, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
          GL.Vertex3f(-@texture.width/2, 0, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
          GL.Vertex3f(-@texture.width/2, 0.0, 90)

          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
          GL.Vertex3f(-@texture.width/2, @texture.width, @texture.height)
        GL.End
      GL.PopMatrix

      #DRAW THE BUILDING (Right)
      GL.BindTexture(GL::TEXTURE_2D, @texture.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1, 1, 1)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.bottom)
          GL.Vertex3f(@texture.width/2, @texture.width, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.bottom)
          GL.Vertex3f(@texture.width/2, 0, 0.0)

          GL.TexCoord2d(@texture.gl_tex_info.right,@texture.gl_tex_info.top)
          GL.Vertex3f(@texture.width/2, 0.0, 90)

          GL.TexCoord2d(@texture.gl_tex_info.left,@texture.gl_tex_info.top)
          GL.Vertex3f(@texture.width/2, @texture.width, @texture.height)
        GL.End
      GL.PopMatrix

      #DRAW THE BUILDING (UP)
      GL.BindTexture(GL::TEXTURE_2D, @texture5.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1, 1, 1)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture5.gl_tex_info.left,@texture5.gl_tex_info.bottom)
          GL.Vertex3f(-@texture5.width/2, 0.0, @texture5.height)

          GL.TexCoord2d(@texture5.gl_tex_info.right,@texture5.gl_tex_info.bottom)
          GL.Vertex3f(@texture5.width/2, 0.0, @texture5.height)

          GL.TexCoord2d(@texture5.gl_tex_info.right,@texture5.gl_tex_info.top)
          GL.Vertex3f(@texture5.width/2, @texture5.width, @texture5.height)

          GL.TexCoord2d(@texture5.gl_tex_info.left,@texture5.gl_tex_info.top)
          GL.Vertex3f(-@texture5.width/2, @texture5.width, @texture5.height)
        GL.End
      GL.PopMatrix
=end
      #DRAW THE GROUND
      GL.BindTexture(GL::TEXTURE_2D, @texture1.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1,1,1)

        GL.Begin(GL::QUADS)
          #b1
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(0.0, 0.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(64.0, 0.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(64.0, 64.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(0.0, 64.0, 0.0)

          #b2
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(64.0, 0.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(128.0, 0.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(128.0, 64.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(64.0, 64.0, 0.0)

          #b3
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(128.0, 0.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(192.0, 0.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(192.0, 64.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(128.0, 64.0, 0.0)

          #m1
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(0.0, 64.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(64.0, 64.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(64.0, 128.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(0.0, 128.0, 0.0)

          #m2
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(64.0, 64.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(128.0, 64.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(128.0, 128.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(64.0, 128.0, 0.0)

          #m3
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(128.0, 64.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(192.0, 64.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(192.0, 128.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(128.0, 128.0, 0.0)

          #h1
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(0.0, 128.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(64.0, 128.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(64.0, 192.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(0.0, 192.0, 0.0)

          #h2
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(64.0, 128.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(128.0, 128.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(128.0, 192.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(64.0, 192.0, 0.0)

          #h3
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(128.0, 128.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(192.0, 128.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(192.0, 192.0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(128.0, 192.0, 0.0)

        GL.End
      GL.PopMatrix
=begin
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
=end
    end

end
