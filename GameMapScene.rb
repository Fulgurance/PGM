class GameMapScene < GameScene3D

  attr_accessor :mapX
  attr_accessor :mapY
  attr_accessor :mapZ
  attr_accessor :mapWidth
  attr_accessor :mapHeight
  attr_accessor :viewAngle
  attr_accessor :squareSize
  attr_accessor :cameraX
  attr_accessor :cameraY
  attr_accessor :cameraZ
  attr_accessor :cameraReferenceX
  attr_accessor :cameraReferenceY
  attr_accessor :cameraReferenceZ

  def initialize(playerX,playerY,playerZ,mapWidth,mapHeight)
    super()
    @mapX = 0.0
    @mapY = 0.0
    @mapZ = 0.0
    @mapWidth = mapWidth
    @mapHeight = mapHeight
    @viewAngle = 35.0
    @squareSize = 32.0
    @aspectRatio = $gameWindow.width.to_f / $gameWindow.height.to_f
    @near = 1.0
    @far = 700.0
    @objects = []
    @events = []
    @player = GameMapPlayer.new("Red",playerX,playerY,playerZ)
    @cameraX = 0.0 + @player.realX - @player.sprite.width/2
    @cameraY = -320.0
    @cameraZ = 250.0
    @cameraReferenceX = @player.realX - @player.sprite.width/2
    @cameraReferenceY = @player.realY
    @cameraReferenceZ = @player.realZ
    @upX = 0.0
    @upY = 0.0
    @upZ = 1.0
    @movementAnimationTime = Time.now
    @inputLeftTime = Time.now
    @inputRightTime = Time.now
    @inputUpTime = Time.now
    @inputDownTime = Time.now
    @playBumpSound = false
    @bumpSound = Gosu::Sample.new("Audios/SE/Bump.wav")
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
    @objects.each do |object|
      object.draw
    end
  end

  def drawMap
  end

  def update
    updateInputs
  end

  def updateInputs
    if (Time.now.to_f-@movementAnimationTime.to_f) > @player.animationSpeed
      @player.movingFrame += 1
      if @player.movingFrame == 2
        @playBumpSound = true
      end
      if @player.movingFrame > 3
        @player.movingFrame = 0
        @playBumpSound = true
      end
      @movementAnimationTime = Time.now
    else
      @playBumpSound = false
    end
    if @player.movingLeft && @player.currentMovementDistance < @squareSize
      @player.moveLeft
    elsif @player.movingRight && @player.currentMovementDistance < @squareSize
      @player.moveRight
    elsif @player.movingUp && @player.currentMovementDistance < @squareSize
      @player.moveUp
    elsif @player.movingDown && @player.currentMovementDistance < @squareSize
      @player.moveDown
    else
      @player.currentMovementDistance = 0
      @player.movingLeft = false
      @player.movingRight = false
      @player.movingUp = false
      @player.movingDown = false
      if Gosu.button_down?(Gosu::KB_LEFT)
        @player.direction = 0
        if (Time.now.to_f-@inputLeftTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_LEFT)
            if (@player.x-@squareSize) >= @mapX && directionPassable?(0)
              @player.moveLeft
              @player.x -= @squareSize
            else
              @player.playMovingLeft
              if @playBumpSound
                @bumpSound.play
              end
            end
          end
        end
      elsif Gosu.button_down?(Gosu::KB_RIGHT)
        @player.direction = 1
        if (Time.now.to_f-@inputRightTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_RIGHT)
            if (@player.x+@squareSize) < (@mapX+@mapWidth) && directionPassable?(1)
              @player.moveRight
              @player.x += @squareSize
            else
              @player.playMovingRight
              if @playBumpSound
                @bumpSound.play
              end
            end
          end
        end
      elsif Gosu.button_down?(Gosu::KB_UP)
        @player.direction = 2
        if (Time.now.to_f-@inputUpTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_UP)
            if (@player.y+@squareSize) < (@mapY+@mapHeight) && directionPassable?(2)
              @player.moveUp
              @player.y += @squareSize
            else
              @player.playMovingUp
              if @playBumpSound
                @bumpSound.play
              end
            end
          end
        end
      elsif Gosu.button_down?(Gosu::KB_DOWN)
        @player.direction = 3
        if (Time.now.to_f-@inputDownTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_DOWN)
            if (@player.y-@squareSize) >= @mapY && directionPassable?(3)
              @player.moveDown
              @player.y -= @squareSize
            else
              @player.playMovingDown
              if @playBumpSound
                @bumpSound.play
              end
            end
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

  def directionPassable?(direction)
    result = true
    @objects.each do |object|
      case direction
      when 0
        if (@player.x-@squareSize) < object.x+object.sizeX && (@player.x-@squareSize) >= object.x && (@player.y) >= object.y && (@player.y) <= object.y+object.sizeY && !object.passable
          result = false
        end
      when 1
        if (@player.x+@squareSize) >= object.x && (@player.x+@squareSize) < object.x+object.sizeX && (@player.y) >= object.y && (@player.y) < object.y+object.sizeY && !object.passable
          result = false
        end
      when 2
        if (@player.y+@squareSize) >= object.y && (@player.y+@squareSize) < object.y+object.sizeY && (@player.x) >= object.x && (@player.x) < object.x+object.sizeX && !object.passable
          result = false
        end
      when 3
        if (@player.y-@squareSize) < object.y+object.sizeY && (@player.y-@squareSize) >= object.y  && (@player.x) >= object.x && (@player.x) <= object.x+object.sizeX && !object.passable
          result = false
        end
      end
    end
    return result
  end

end
