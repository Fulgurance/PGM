class GameMapScene < GameScene3D

  attr_accessor :squareSize
  attr_accessor :objects
  attr_accessor :events

  def initialize(playerX,playerY,playerZ,mapWidth=32,mapHeight=32,backgroundMusic=nil)
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
    @player = GameMapPlayer.new("BoyHero",playerX,playerY,playerZ)
    @player.realX = @player.x+@squareSize/2-@player.sprite.width/2
    @player.realY = @player.y
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
    @inputLeftTime = Time.now
    @inputRightTime = Time.now
    @inputUpTime = Time.now
    @inputDownTime = Time.now
    @inputBicycleTime = Time.now
    @delayBeforeNextInput = 0.20
    @bumpSound = Gosu::Sample.new("Audios/SE/Bump.wav")
    @grassSound = Gosu::Sample.new("Audios/SE/Grass.wav")
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
    GL.TexParameterf(GL::TEXTURE_2D, GL::TEXTURE_MIN_FILTER, GL::NEAREST);
    GL.TexParameterf(GL::TEXTURE_2D, GL::TEXTURE_MAG_FILTER, GL::NEAREST);
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
    @events.each do |event|
      event.draw
    end
  end

  def drawMap
  end

  def update
    updateObjects
    updateEvents
    updatePlayer
    updateCamera
    updateInputs
  end

  def updateObjects
    @objects.each do |object|
      object.update
    end
  end

  def updateEvents
    @events.each do |event|
      event.update
    end
  end

  def updatePlayer
    square = @player.currentSquare
    @player.realZ = square.z+square.sizeZ
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
        if @backgroundMusic != nil
          @backgroundMusic.stop
        end
        @bicycleSound.play
        @player.onBicycle = true
        @bicycleMusic.play(true)
      else
        @player.onBicycle = false
        @bicycleMusic.stop
        if @backgroundMusic != nil
          @backgroundMusic.play(true)
        end
      end
      @inputBicycleTime = Time.now
    end

    if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
      if (Time.now.to_f-@player.movementAnimationTime.to_f) > @player.animationRunningSpeed
        @player.update
      else
        @player.movingOneStep = false
      end
    elsif @player.onBicycle
      if (Time.now.to_f-@player.movementAnimationTime.to_f) > @player.animationCyclingSpeed
        @player.update
      else
        @player.movingOneStep = false
      end
    else
      if (Time.now.to_f-@player.movementAnimationTime.to_f) > @player.animationSpeed
        @player.update
      else
        @player.movingOneStep = false
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
      @player.realX = @player.x+@squareSize/2-@player.sprite.width/2
      @player.realY = @player.y

      square = @player.currentSquare

      if Gosu.button_down?(Gosu::KB_LEFT)
        @player.direction = 0
        if (Time.now.to_f-@inputLeftTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_LEFT)
            nextSquare = @player.nextSquare(0)
            if (@player.x-@squareSize) >= @mapX && nextSquare.rightPassable && square.leftPassable
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.runLeft
              elsif @player.onBicycle
                 @player.cyclingLeft
              else
                @player.moveLeft
              end
              @player.x -= @squareSize
              if nextSquare.class == Grass
                @grassSound.play
              end
            else
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.playRunningLeft
              elsif @player.onBicycle
                @player.playCyclingLeft
              else
                @player.playMovingLeft
              end
              if @player.movingOneStep
                @bumpSound.play
              end
            end
          end
        end
      elsif Gosu.button_down?(Gosu::KB_RIGHT)
        @player.direction = 1
        if (Time.now.to_f-@inputRightTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_RIGHT)
            nextSquare = @player.nextSquare(1)
            if (@player.x+@squareSize) < (@mapX+@mapWidth) && nextSquare.leftPassable && square.rightPassable
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.runRight
              elsif @player.onBicycle
                @player.cyclingRight
              else
                @player.moveRight
              end
              @player.x += @squareSize
              if nextSquare.class == Grass
                @grassSound.play
              end
            else
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.playRunningRight
              elsif @player.onBicycle
                @player.playCyclingRight
              else
                @player.playMovingRight
              end
              if @player.movingOneStep
                @bumpSound.play
              end
            end
          end
        end
      elsif Gosu.button_down?(Gosu::KB_UP)
        @player.direction = 2
        if (Time.now.to_f-@inputUpTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_UP)
            nextSquare = @player.nextSquare(2)
            if (@player.y+@squareSize) < (@mapY+@mapHeight) && nextSquare.downPassable && square.upPassable
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.runUp
              elsif @player.onBicycle
                @player.cyclingUp
              else
                @player.moveUp
              end
              @player.y += @squareSize
              if nextSquare.class == Grass
                @grassSound.play
              end
            else
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.playRunningUp
              elsif @player.onBicycle
                @player.playCyclingUp
              else
                @player.playMovingUp
              end
              if @player.movingOneStep
                @bumpSound.play
              end
            end
          end
        end
      elsif Gosu.button_down?(Gosu::KB_DOWN)
        @player.direction = 3
        if (Time.now.to_f-@inputDownTime.to_f) > @player.delayBeforeMoving
          if Gosu.button_down?(Gosu::KB_DOWN)
            nextSquare = @player.nextSquare(3)
            if (@player.y-@squareSize) >= @mapY && nextSquare.upPassable && square.downPassable
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.runDown
              elsif @player.onBicycle
                @player.cyclingDown
              else
                @player.moveDown
              end
              @player.y -= @squareSize
              if nextSquare.class == Grass
                @grassSound.play
              end
            else
              if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) && !@player.onBicycle
                @player.playRunningDown
              elsif @player.onBicycle
                @player.playCyclingDown
              else
                @player.playMovingDown
              end
              if @player.movingOneStep
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

        @player.realX = @player.x+@squareSize/2-@player.sprite.width/2
        @player.realY = @player.y

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

end
