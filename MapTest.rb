class MapTest < GameMapScene

  def initialize
    super

    @texture = Sprite.new('Test.png', retro: true)
    @texture1 = Sprite.new('Test1.png', retro: true)
    @texture2 = Sprite.new('Tree.png', retro: true)
    @texture4 = Sprite.new('Panel.png', retro: true)
    @texture5 = Sprite.new('Test2.png', retro: true)

    @releasedButtonTime = 0.0
    @startingTime = Time.now
    @inputLeftTime,@inputRightTime,@inputUpTime,@inputDownTime = Time.now

    @player = GameMapPlayer.new("Red",0,-64,0)

    @backgroundMusic = Gosu::Song.new("Test.wav")
    @backgroundMusic.play(true)
  end

  def update
    if @player.movingLeft || @player.movingRight || @player.movingUp || @player.movingDown
      if @player.currentMovementDistance < self.squareSize &&
          (Time.now.to_f-@startingTime.to_f) > @player.animationSpeed
        @player.movingFrame += 1
        if @player.movingFrame > 3
          @player.movingFrame = 0
        end
        @startingTime = Time.now
      end
    end
    if @player.movingLeft && @player.currentMovementDistance < self.squareSize
      @player.moveLeft
    elsif @player.movingRight && @player.currentMovementDistance < self.squareSize
      @player.moveRight
    elsif @player.movingUp && @player.currentMovementDistance < self.squareSize
      @player.moveUp
    elsif @player.movingDown && @player.currentMovementDistance < self.squareSize
      @player.moveDown
    else
      @player.currentMovementDistance = 0
      @player.movingLeft,@player.movingRight,@player.movingUp,@player.movingDown = false
      if Gosu.button_down?(Gosu::KB_LEFT)
        @player.direction = 0
        if (Time.now.to_f-@inputLeftTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_LEFT)
            @player.moveLeft
          end
        end
      elsif Gosu.button_down?(Gosu::KB_RIGHT)
        @player.direction = 1
        if (Time.now.to_f-@inputRightTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_RIGHT)
            @player.moveRight
          end
        end
      elsif Gosu.button_down?(Gosu::KB_UP)
        @player.direction = 2
        if (Time.now.to_f-@inputUpTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_UP)
            @player.moveUp
          end
        end
      elsif Gosu.button_down?(Gosu::KB_DOWN)
        @player.direction = 3
        if (Time.now.to_f-@inputDownTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_DOWN)
            @player.moveDown
          end
        end
      else
        if (Time.now.to_f-@inputLeftTime.to_f) > @player.delayBeforeMoving
          @inputLeftTime = Time.now
        end
        if (Time.now.to_f-@inputRightTime.to_f) > @player.delayBeforeMoving
          @inputRightTime = Time.now
        end
        if (Time.now.to_f-@inputUpTime.to_f) > @player.delayBeforeMoving
          @inputUpTime = Time.now
        end
        if (Time.now.to_f-@inputDownTime.to_f) > @player.delayBeforeMoving
          @inputDownTime = Time.now
        end
        case @player.direction
        when 0
          @player.lookLeft
        when 1
          @player.lookRight
        when 2
          @player.lookUp
        when 3
          @player.lookDown
        end
      end
    end
  end

  def updateGraphics
    super
    drawMap
    @player.draw
  end

  def drawMap
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

      #DRAW THE GROUND
      GL.BindTexture(GL::TEXTURE_2D, @texture1.gl_tex_info.tex_name)

      GL.PushMatrix
        GL.Scalef(1,1,0)#(@texture1.width, @texture1.height, 0)

        GL.Begin(GL::QUADS)
          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(-64, -64, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(0, -64, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(0, 0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(-64, 0, 0.0)


          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(0, -64, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.bottom)
          GL.Vertex3f(64, -64, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.right,@texture1.gl_tex_info.top)
          GL.Vertex3f(64, 0, 0.0)

          GL.TexCoord2d(@texture1.gl_tex_info.left,@texture1.gl_tex_info.top)
          GL.Vertex3f(0, 0, 0.0)

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

    end

end
