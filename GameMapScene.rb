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
  attr_accessor :backgroundMusic

  def initialize(playerX,playerY,playerZ,mapWidth=32,mapHeight=32,backgroundMusic)
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
    @angleY = -320.0
    @angleZ = 250.0
    @cameraX = @player.realX+@squareSize/2
    @cameraY = @angleY + @player.realY+@squareSize
    @cameraZ = @angleZ + @player.realZ
    @cameraReferenceX = @player.realX+@squareSize/2
    @cameraReferenceY = @player.realY+@squareSize
    @cameraReferenceZ = @player.realZ
    @upX = 0.0
    @upY = 0.0
    @upZ = 1.0
    @movementAnimationTime = Time.now
    @inputLeftTime = Time.now
    @inputRightTime = Time.now
    @inputUpTime = Time.now
    @inputDownTime = Time.now
    @inputBicycleTime = Time.now
    @delayBeforeNextInput = 0.20
    @playBumpSound = false
    @bumpSound = Gosu::Sample.new("Audios/SE/Bump.wav")
    @bicycleSound = Gosu::Sample.new("Audios/SE/Bicycle.wav")
    @bicycleMusic = Gosu::Song.new("Audios/BGM/Bicycle.wav")
    if backgroundMusic != nil
      @backgroundMusic = Gosu::Song.new(backgroundMusic)
      @backgroundMusic.play(true)
    end
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
    square = currentSquare
    @player.realZ = square.z+square.sizeZ
    updateCamera
    updateInputs
  end

  def updateCamera
    @cameraX = @player.realX+@squareSize/2
    @cameraY = @angleY + @player.realY+@squareSize
    @cameraZ = @angleZ + @player.realZ
    @cameraReferenceX = @player.realX+@squareSize/2
    @cameraReferenceY = @player.realY+@squareSize
    @cameraReferenceZ = @player.realZ
  end

  def updateInputs
    if Gosu.button_down?(Gosu::KB_RIGHT_CONTROL) && (Time.now.to_f-@inputBicycleTime.to_f) > @delayBeforeNextInput
      if !@player.onBicycle
        if backgroundMusic != nil
          @backgroundMusic.stop
        end
        @bicycleSound.play
        @player.onBicycle = true
        @bicycleMusic.play(true)
      else
        @player.onBicycle = false
        @bicycleMusic.stop
        if backgroundMusic != nil
          @backgroundMusic.play(true)
        end
      end
      @inputBicycleTime = Time.now
    end
    if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
      if (Time.now.to_f-@movementAnimationTime.to_f) > @player.animationRunningSpeed
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
    elsif @player.onBicycle
      if (Time.now.to_f-@movementAnimationTime.to_f) > @player.animationCyclingSpeed
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
    else
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
    end
    if @player.movingLeft && @player.currentMovementDistance < @squareSize
      if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
        @player.runLeft
      elsif @player.onBicycle
        @player.cyclingLeft
      else
        @player.moveLeft
      end
    elsif @player.movingRight && @player.currentMovementDistance < @squareSize
      if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
        @player.runRight
      elsif @player.onBicycle
        @player.cyclingRight
      else
        @player.moveRight
      end
    elsif @player.movingUp && @player.currentMovementDistance < @squareSize
      if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
        @player.runUp
      elsif @player.onBicycle
        @player.cyclingUp
      else
        @player.moveUp
      end
    elsif @player.movingDown && @player.currentMovementDistance < @squareSize
      if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
        @player.runDown
      elsif @player.onBicycle
        @player.cyclingDown
      else
        @player.moveDown
      end
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
            if (@player.x-@squareSize) >= @mapX && nextSquare(0).rightPassable && currentSquare.leftPassable
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.runLeft
              elsif @player.onBicycle
                 @player.cyclingLeft
              else
                @player.moveLeft
              end
              @player.x -= @squareSize
            else
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.playRunningLeft
              elsif @player.onBicycle
                @player.playCyclingLeft
              else
                @player.playMovingLeft
              end
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
            if (@player.x+@squareSize) < (@mapX+@mapWidth) && nextSquare(1).leftPassable && currentSquare.rightPassable
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.runRight
              elsif @player.onBicycle
                @player.cyclingRight
              else
                @player.moveRight
              end
              @player.x += @squareSize
            else
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.playRunningRight
              elsif @player.onBicycle
                @player.playCyclingRight
              else
                @player.playMovingRight
              end
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
            if (@player.y+@squareSize) < (@mapY+@mapHeight) && nextSquare(2).downPassable && currentSquare.upPassable
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.runUp
              elsif @player.onBicycle
                @player.cyclingUp
              else
                @player.moveUp
              end
              @player.y += @squareSize
            else
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.playRunningUp
              elsif @player.onBicycle
                @player.playCyclingUp
              else
                @player.playMovingUp
              end
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
            if (@player.y-@squareSize) >= @mapY && nextSquare(3).upPassable && currentSquare.downPassable
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.runDown
              elsif @player.onBicycle
                @player.cyclingDown
              else
                @player.moveDown
              end
              @player.y -= @squareSize
            else
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.playRunningDown
              elsif @player.onBicycle
                @player.playCyclingDown
              else
                @player.playMovingDown
              end
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
          if @player.onBicycle
            @player.lookOnBicycleLeft
          else
            @player.lookLeft
          end
        when 1
          if @player.onBicycle
            @player.lookOnBicycleRight
          else
            @player.lookRight
          end
        when 2
          if @player.onBicycle
            @player.lookOnBicycleUp
          else
            @player.lookUp
          end
        when 3
          if @player.onBicycle
            @player.lookOnBicycleDown
          else
            @player.lookDown
          end
        end
      end
    end
  end

  def currentSquare
    result = 0
    @objects.each do |object|
      if @player.x < object.x+object.sizeX && @player.x >= object.x && @player.y < object.y+object.sizeY && @player.y >= object.y
        result = object
      end
    end
    return result
  end

  def nextSquare(direction)
    result = 0
    @objects.each do |object|
      case direction
      when 0
        if (@player.x-@squareSize) < object.x+object.sizeX && (@player.x-@squareSize) >= object.x && (@player.y) >= object.y && (@player.y) < object.y+object.sizeY
          result = object
        end
      when 1
        if (@player.x+@squareSize) >= object.x && (@player.x+@squareSize) < object.x+object.sizeX && (@player.y) >= object.y && (@player.y) < object.y+object.sizeY
          result = object
        end
      when 2
        if (@player.y+@squareSize) >= object.y && (@player.y+@squareSize) < object.y+object.sizeY && (@player.x) >= object.x && (@player.x) < object.x+object.sizeX
          result = object
        end
      when 3
        if (@player.y-@squareSize) < object.y+object.sizeY && (@player.y-@squareSize) >= object.y  && (@player.x) >= object.x && (@player.x) < object.x+object.sizeX
          result = object
        end
      end
    end
    return result
  end

end
