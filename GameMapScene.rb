class GameMapScene < GameScene3D

  attr_accessor :squareSize
  attr_accessor :objects
  attr_accessor :events
  attr_accessor :standby
  attr_accessor :allowRunning
  attr_accessor :allowBicycle
  attr_accessor :player

  def initialize(name,panelNumber,playerX,playerY,playerZ,mapWidth=32,mapHeight=32,backgroundMusic=nil)
    super()
    @name = name
    @panelNumber = panelNumber
    @allowRunning = true
    @allowBicycle = true
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
    @panelTime = Time.now
    @panelDuration = 3.0
    @delayBeforeNextInput = 0.2
    @openMenuSound = Sound.new("Audios/Sounds/OpenMenu.wav")
    @bumpSound = Sound.new("Audios/Sounds/Bump.wav")
    @grassSound = Sound.new("Audios/Sounds/Grass.wav")
    @bicycleSound = Sound.new("Audios/Sounds/Bicycle.wav")
    @bicycleMusic = Music.new("Audios/Musics/Bicycle.wav")
    @surfingMusic = Music.new("Audios/Musics/Surfing.wav")
    if backgroundMusic != nil
      @backgroundMusic = Gosu::Song.new(backgroundMusic)
      @backgroundMusic.play(true)
    end
    @panelSprite = Sprite.new("Graphics/MapPanel/#{@panelNumber}.png")
    @panelSprite.color = Color.new(100,255,255,255)
    @panelText = Text.new(@name,Font.new(24))
    @panelText.x = @panelSprite.x+@panelSprite.width/2-@panelText.width/2
    @panelText.y = @panelSprite.y+@panelSprite.height/2-@panelText.height/2
    @panelText.z = @panelSprite.z+1
    @panelText.color = Color::WHITE
    @standby = false
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
    drawMenu
    drawMapPanel
    drawMap
    drawPlayer
    drawObjects
    drawEvents
  end

  def drawMenu
    @menu.draw if @menu != nil
  end

  def drawMapPanel
    if @panelText != nil
      @panelSprite.draw
      @panelText.draw
      if (Time.now.to_f-@panelTime.to_f) > @panelDuration
        @panelText = nil
        @panelSprite = nil
      end
    end
  end

  def drawMap
  end

  def drawPlayer
    @player.draw
  end

  def drawObjects
    @objects.each do |object|
      object.draw
    end
  end

  def drawEvents
    @events.each do |event|
      event.draw
    end
  end

  def update
    if @player.surfing
      @player.update
      @bicycleMusic.stop
      if @backgroundMusic != nil
        @backgroundMusic.stop
      end
      @surfingMusic.play(true)
    else
      @surfingMusic.stop
      if @player.onBicycle
        @bicycleMusic.play(true)
      else
        if @backgroundMusic != nil
          @backgroundMusic.play(true)
        end
      end
    end

    updateObjects
    updateEvents
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

  def updateCamera
    @cameraX = @player.realX+@squareSize/2
    @cameraY = @angleY + @player.realY+@squareSize
    @cameraZ = @angleZ + @player.realZ
    @cameraReferenceX = @player.realX+@squareSize/2
    @cameraReferenceY = @player.realY+@squareSize
    @cameraReferenceZ = @player.realZ
  end

  def updateInputs

    if Input.keepPressed(Key::KeyboardEscape) && !@standby && @player.currentMovementDistance == 0
      @panelText = nil
      @panelSprite = nil
      @openMenuSound.play
      @standby = true
      @menu = GameMenuScene.new
    end

    if !@standby
      @menu = nil
      if !@player.surfing && @allowBicycle && Input.pressed(Key::KeyboardRightControl) && (Time.now.to_f-Input.lastPressedTime(Key::KeyboardRightControl).to_f) > @delayBeforeNextInput
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
        Input.resetTime(Key::KeyboardRightControl)
      end

      if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
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
        if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
          @player.runLeft
        elsif @player.onBicycle
          @player.cyclingLeft
        else
          if @player.surfing
            @player.surfLeft
          else
            @player.moveLeft
          end
        end
      elsif @player.movingRight && @player.currentMovementDistance < @squareSize
        if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
          @player.runRight
        elsif @player.onBicycle
          @player.cyclingRight
        else
          if @player.surfing
            @player.surfRight
          else
            @player.moveRight
          end
        end
      elsif @player.movingUp && @player.currentMovementDistance < @squareSize
        if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
          @player.runUp
        elsif @player.onBicycle
          @player.cyclingUp
        else
          if @player.surfing
            @player.surfUp
          else
            @player.moveUp
          end
        end
      elsif @player.movingDown && @player.currentMovementDistance < @squareSize
        if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
          @player.runDown
        elsif @player.onBicycle
          @player.cyclingDown
        else
          if @player.surfing
            @player.surfDown
          else
            @player.moveDown
          end
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

        if Input.pressed(Key::KeyboardLeft)
          @player.direction = 0
          if Input.keepPressed(Key::KeyboardLeft,@player.delayBeforeMoving)
            nextSquare = @player.nextSquare(0)
            if (@player.x-@squareSize) >= @mapX && nextSquare.rightPassable && square.leftPassable && !@player.nextEntity(0).is_a?(GameMapEvent)
              if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
                @player.runLeft
              elsif @player.onBicycle
                @player.cyclingLeft
              else
                if @player.surfing
                  @player.surfLeft
                else
                  @player.moveLeft
                end
              end
              @player.x -= @squareSize
              if nextSquare.class == Grass
                @grassSound.play
              end
            else
              if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
                @player.playRunningLeft
              elsif @player.onBicycle
                @player.playCyclingLeft
              else
                if @player.surfing
                  @player.playSurfingLeft
                else
                  @player.playMovingLeft
                end
              end
              if @player.movingOneStep
                @bumpSound.play
              end
            end
          end
        elsif Input.pressed(Key::KeyboardRight)
          @player.direction = 1
          if Input.keepPressed(Key::KeyboardRight,@player.delayBeforeMoving)
            nextSquare = @player.nextSquare(1)
            if (@player.x+@squareSize) < (@mapX+@mapWidth) && nextSquare.leftPassable && square.rightPassable && !@player.nextEntity(1).is_a?(GameMapEvent)
              if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
                @player.runRight
              elsif @player.onBicycle
                @player.cyclingRight
              else
                if @player.surfing
                  @player.surfRight
                else
                  @player.moveRight
                end
              end
              @player.x += @squareSize
              if nextSquare.class == Grass
                @grassSound.play
              end
            else
              if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
                @player.playRunningRight
              elsif @player.onBicycle
                @player.playCyclingRight
              else
                if @player.surfing
                  @player.playSurfingRight
                else
                  @player.playMovingRight
                end
              end
              if @player.movingOneStep
                @bumpSound.play
              end
            end
          end
        elsif Input.pressed(Key::KeyboardUp)
          @player.direction = 2
          if Input.keepPressed(Key::KeyboardUp,@player.delayBeforeMoving)
            nextSquare = @player.nextSquare(2)
            if (@player.y+@squareSize) < (@mapY+@mapHeight) && nextSquare.downPassable && square.upPassable && !@player.nextEntity(2).is_a?(GameMapEvent)
              if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
                @player.runUp
              elsif @player.onBicycle
                @player.cyclingUp
              else
                if @player.surfing
                  @player.surfUp
                else
                  @player.moveUp
                end
              end
              @player.y += @squareSize
              if nextSquare.class == Grass
                @grassSound.play
              end
            else
              if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
                @player.playRunningUp
              elsif @player.onBicycle
                @player.playCyclingUp
              else
                if @player.surfing
                  @player.playSurfingUp
                else
                  @player.playMovingUp
                end
              end
              if @player.movingOneStep
                @bumpSound.play
              end
            end
          end
        elsif Input.pressed(Key::KeyboardDown)
          @player.direction = 3
          if Input.keepPressed(Key::KeyboardDown,@player.delayBeforeMoving)
            nextSquare = @player.nextSquare(3)
            if (@player.y-@squareSize) >= @mapY && nextSquare.upPassable && square.downPassable && !@player.nextEntity(3).is_a?(GameMapEvent)
              if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
                @player.runDown
              elsif @player.onBicycle
                @player.cyclingDown
              else
                if @player.surfing
                  @player.surfDown
                else
                  @player.moveDown
                end
              end
              @player.y -= @squareSize
              if nextSquare.class == Grass
                @grassSound.play
              end
            else
              if Input.pressed(Key::KeyboardRightShift) && !@player.onBicycle && @allowRunning && !@player.surfing
                @player.playRunningDown
              elsif @player.onBicycle
                @player.playCyclingDown
              else
                if @player.surfing
                  @player.playSurfingDown
                else
                  @player.playMovingDown
                end
              end
              if @player.movingOneStep
                @bumpSound.play
              end
            end
          end
        else
          if (Time.now.to_f-Input.lastPressedTime(Key::KeyboardLeft).to_f) > @player.delayBeforeMoving
            Input.resetTime(Key::KeyboardLeft)
          end
          if (Time.now.to_f-Input.lastPressedTime(Key::KeyboardRight).to_f) > @player.delayBeforeMoving
            Input.resetTime(Key::KeyboardRight)
          end
          if (Time.now.to_f-Input.lastPressedTime(Key::KeyboardUp).to_f) > @player.delayBeforeMoving
            Input.resetTime(Key::KeyboardUp)
          end
          if (Time.now.to_f-Input.lastPressedTime(Key::KeyboardDown).to_f) > @player.delayBeforeMoving
            Input.resetTime(Key::KeyboardDown)
          end

          @player.realX = @player.x+@squareSize/2-@player.sprite.width/2
          @player.realY = @player.y

          case @player.direction
          when 0
            if @player.onBicycle
              @player.lookOnBicycleLeft
            elsif @player.surfing
              @player.lookSurfingLeft
            else
              @player.lookLeft
            end
          when 1
            if @player.onBicycle
              @player.lookOnBicycleRight
            elsif @player.surfing
              @player.lookSurfingRight
            else
              @player.lookRight
            end
          when 2
            if @player.onBicycle
              @player.lookOnBicycleUp
            elsif @player.surfing
              @player.lookSurfingUp
            else
              @player.lookUp
            end
          when 3
            if @player.onBicycle
              @player.lookOnBicycleDown
            elsif @player.surfing
              @player.lookSurfingDown
            else
              @player.lookDown
            end
          end
        end
      end
    else
      @menu.update if @menu != nil
    end
  end

end
