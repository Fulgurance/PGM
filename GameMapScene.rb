class GameMapScene < GameScene3D

  attr_accessor :viewAngle
  attr_accessor :squareSize
  attr_accessor :cameraX,:cameraY,:cameraZ
  attr_accessor :cameraReferenceX,:cameraReferenceY,:cameraReferenceZ

  def initialize
    super
    @viewAngle = 45.0
    @squareSize = 32
    @aspectRatio = $gameWindow.width.to_f / $gameWindow.height.to_f
    @near,@far = 1.0, 700.0
    @cameraX,@cameraY,@cameraZ = 0.0,-320.0,200.0
    @cameraReferenceX,@cameraReferenceY,@cameraReferenceZ = 0.0,-64.0,0.0
    @upX,@upY,@upZ = 0.0,0.0,1.0
    @movementAnimationTime = Time.now
    @inputLeftTime,@inputRightTime,@inputUpTime,@inputDownTime = Time.now
    @player = GameMapPlayer.new("Red",0,-64,0)
  end

  def drawGraphics
    GL.Clear(GL::COLOR_BUFFER_BIT | GL::DEPTH_BUFFER_BIT)
    GL.Enable(GL::TEXTURE_2D)
    GL.Enable(GL::DEPTH_TEST)
    GL.MatrixMode(GL::PROJECTION)
    GL.LoadIdentity
    GLU.Perspective(@viewAngle,@aspectRatio,@near,@far)
    GL.MatrixMode(GL::MODELVIEW)
    GL.LoadIdentity
    GLU.LookAt(@cameraX,@cameraY,@cameraZ,@cameraReferenceX,@cameraReferenceY,@cameraReferenceZ,@upX,@upY,@upZ)
    drawMap
    @player.draw
  end

  def drawMap
  end

  def update
    updateInputs
  end

  def updateInputs
    if @player.movingLeft || @player.movingRight || @player.movingUp || @player.movingDown
      if @player.currentMovementDistance < self.squareSize &&
          (Time.now.to_f-@movementAnimationTime.to_f) > @player.animationSpeed
        @player.movingFrame += 1
        if @player.movingFrame > 3
          @player.movingFrame = 0
        end
        @movementAnimationTime = Time.now
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

end
