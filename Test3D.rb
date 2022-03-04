class Test3D < GameScene

  def initialize
    GL.load_lib()
    GLU.load_lib()

    @texture = Sprite.new('Test.png', retro: true)
    @texture1 = Sprite.new('Test1.png', retro: true)
    @texture2 = Sprite.new('Tree.png', retro: true)
    @texture3 = Sprite.new('RedDown.png', retro: true)
    @texture4 = Sprite.new('Panel.png', retro: true)
    @texture5 = Sprite.new('Test2.png', retro: true)

    @viewAngle = 45.0
    @cameraX,@cameraY = 0,-320
    @viewX,@viewY = 0,-64
    @characterX,@characterY = 0,-64
    @speed = 1.3
    @caseSize = 32
    @currentMovementDistance = 0
    @releasedButtonTime = 0
    @direction = 3
    @movingLeft,@movingRight,@movingUp,@movingDown = false
    @movingFrame = 0
    @timeBetweenFrame = 0.20
    @startingTime = Time.now
    @inputLeftTime,@inputRightTime,@inputUpTime,@inputDownTime = Time.now
    @delayBeforeMove = 0.3

    #@backgroundMusic = Gosu::Song.new("Test.wav")
    #@backgroundMusic.play(true)
  end

  def lookLeftDirection
    @movingFrame = 0
    @texture3.insert('RedLeft.png',0,0)
  end

  def lookRightDirection
    @movingFrame = 0
    @texture3.insert('RedRight.png',0,0)
  end

  def lookUpDirection
    @movingFrame = 0
    @texture3.insert('RedUp.png',0,0)
  end

  def lookDownDirection
    @movingFrame = 0
    @texture3.insert('RedDown.png',0,0)
  end

  def moveLeft
    @movingLeft = true
    @currentMovementDistance += @speed
    @characterX -= @speed
    @cameraX -= @speed
    @viewX -= @speed
    playMovingLeft
  end

  def moveRight
    @movingRight = true
    @currentMovementDistance += @speed
    @characterX += @speed
    @cameraX += @speed
    @viewX += @speed
    playMovingRight
  end

  def moveUp
    @movingUp = true
    @currentMovementDistance += @speed
    @characterY += @speed
    @cameraY += @speed
    @viewY += @speed
    playMovingUp
  end

  def moveDown
    @movingDown = true
    @currentMovementDistance += @speed
    @characterY -= @speed
    @cameraY -= @speed
    @viewY -= @speed
    playMovingDown
  end

  def playMovingLeft
    if @movingFrame == 0
      @texture3.insert('RedMoveLeft1.png',0,0)
    elsif @movingFrame == 1
      @texture3.insert('RedLeft.png',0,0)
    elsif @movingFrame == 2
      @texture3.insert('RedMoveLeft2.png',0,0)
    else
      @texture3.insert('RedLeft.png',0,0)
    end
  end

  def playMovingRight
    if @movingFrame == 0
      @texture3.insert('RedMoveRight1.png',0,0)
    elsif @movingFrame == 1
      @texture3.insert('RedRight.png',0,0)
    elsif @movingFrame == 2
      @texture3.insert('RedMoveRight2.png',0,0)
    else
      @texture3.insert('RedRight.png',0,0)
    end
  end

  def playMovingUp
    if @movingFrame == 0
      @texture3.insert('RedMoveUp1.png',0,0)
    elsif @movingFrame == 1
      @texture3.insert('RedUp.png',0,0)
    elsif @movingFrame == 2
      @texture3.insert('RedMoveUp2.png',0,0)
    else
      @texture3.insert('RedUp.png',0,0)
    end
  end

  def playMovingDown
    if @movingFrame == 0
      @texture3.insert('RedMoveDown1.png',0,0)
    elsif @movingFrame == 1
      @texture3.insert('RedDown.png',0,0)
    elsif @movingFrame == 2
      @texture3.insert('RedMoveDown2.png',0,0)
    else
      @texture3.insert('RedDown.png',0,0)
    end
  end

  def update
    if @movingLeft || @movingRight || @movingUp || @movingDown
      if @currentMovementDistance < @caseSize &&
          (Time.now.to_f-@startingTime.to_f) > @timeBetweenFrame
        @movingFrame += 1
        if @movingFrame > 3
          @movingFrame = 0
        end
        @startingTime = Time.now
      end
    end
    if @movingLeft && @currentMovementDistance < @caseSize
      moveLeft
    elsif @movingRight && @currentMovementDistance < @caseSize
      moveRight
    elsif @movingUp && @currentMovementDistance < @caseSize
      moveUp
    elsif @movingDown && @currentMovementDistance < @caseSize
      moveDown
    else
      @currentMovementDistance = 0
      @movingLeft,@movingRight,@movingUp,@movingDown = false
      if Gosu.button_down?(Gosu::KB_LEFT)
        @direction = 0
        if (Time.now.to_f-@inputLeftTime.to_f) > @delayBeforeMove
          if Gosu.button_down?(Gosu::KB_LEFT)
            moveLeft
          end
        end
      elsif Gosu.button_down?(Gosu::KB_RIGHT)
        @direction = 1
        if (Time.now.to_f-@inputRightTime.to_f) > @delayBeforeMove
          if Gosu.button_down?(Gosu::KB_RIGHT)
            moveRight
          end
        end
      elsif Gosu.button_down?(Gosu::KB_UP)
        @direction = 2
        if (Time.now.to_f-@inputUpTime.to_f) > @delayBeforeMove
          if Gosu.button_down?(Gosu::KB_UP)
            moveUp
          end
        end
      elsif Gosu.button_down?(Gosu::KB_DOWN)
        @direction = 3
        if (Time.now.to_f-@inputDownTime.to_f) > @delayBeforeMove
          if Gosu.button_down?(Gosu::KB_DOWN)
            moveDown
          end
        end
      else
        if (Time.now.to_f-@inputLeftTime.to_f) > @delayBeforeMove
          @inputLeftTime = Time.now
        end
        if (Time.now.to_f-@inputRightTime.to_f) > @delayBeforeMove
          @inputRightTime = Time.now
        end
        if (Time.now.to_f-@inputUpTime.to_f) > @delayBeforeMove
          @inputUpTime = Time.now
        end
        if (Time.now.to_f-@inputDownTime.to_f) > @delayBeforeMove
          @inputDownTime = Time.now
        end
        case @direction
        when 0
          lookLeftDirection
        when 1
          lookRightDirection
        when 2
          lookUpDirection
        when 3
          lookDownDirection
        end
      end
    end
  end

  def draw
    Gosu.gl do

      GL.Clear(GL::COLOR_BUFFER_BIT | GL::DEPTH_BUFFER_BIT)
      GL.Enable(GL::TEXTURE_2D)
      GL.Enable(GL::DEPTH_TEST)
      GL.MatrixMode(GL::PROJECTION)
      GL.LoadIdentity
      GLU.Perspective(@viewAngle, $gameWindow.width.to_f / $gameWindow.height.to_f, 1, 700)
      GL.MatrixMode(GL::MODELVIEW)
      GL.LoadIdentity
      GLU.LookAt(@cameraX,@cameraY,200,@viewX,@viewY,0,0,0,1)

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
