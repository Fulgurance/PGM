class GameMapPlayer < GameMapMovableObject

    attr_accessor :animationRunningSpeed

    def initialize(spriteName,x,y,z,sizeX=32,sizeY=0,sizeZ=64,direction=3)
        super(spriteName,x,y,z,sizeX,sizeY,sizeZ,direction=3)
        @spriteName = spriteName
        @sprite = Sprite.new("Graphics/Player/#{@spriteName}Down.png",retro: true)
        @direction = direction
        @speed = 1.3
        @runningSpeed = 2.3
        @animationSpeed = 0.2
        @animationRunningSpeed = 0.15
        @currentMovementDistance = 0
        @pressedButtonTime = 0.0
        @movingFrame = 0
        @movingLeft = false
        @movingRight = false
        @movingUp = false
        @movingDown = false
        @delayBeforeMoving = 0.3
    end

    def moveLeft
        super
        $gameWindow.currentGameScene.cameraX -= @speed
        $gameWindow.currentGameScene.cameraReferenceX -= @speed
    end

    def moveRight
        super
        $gameWindow.currentGameScene.cameraX += @speed
        $gameWindow.currentGameScene.cameraReferenceX += @speed
    end

    def moveUp
        super
        $gameWindow.currentGameScene.cameraY += @speed
        $gameWindow.currentGameScene.cameraReferenceY += @speed
    end

    def moveDown
        super
        $gameWindow.currentGameScene.cameraY -= @speed
        $gameWindow.currentGameScene.cameraReferenceY -= @speed
    end

    def runLeft
        @movingLeft = true
        @currentMovementDistance += @runningSpeed
        @realX -= @runningSpeed
        playRunningLeft
        $gameWindow.currentGameScene.cameraX -= @runningSpeed
        $gameWindow.currentGameScene.cameraReferenceX -= @runningSpeed
    end

    def runRight
        @movingRight = true
        @currentMovementDistance += @runningSpeed
        @realX += @runningSpeed
        playRunningRight
        $gameWindow.currentGameScene.cameraX += @runningSpeed
        $gameWindow.currentGameScene.cameraReferenceX += @runningSpeed
    end

    def runUp
        @movingUp = true
        @currentMovementDistance += @runningSpeed
        @realY += @runningSpeed
        playRunningUp
        $gameWindow.currentGameScene.cameraY += @runningSpeed
        $gameWindow.currentGameScene.cameraReferenceY += @runningSpeed
    end

    def runDown
        @movingDown = true
        @currentMovementDistance += @runningSpeed
        @realY -= @runningSpeed
        playRunningDown
        $gameWindow.currentGameScene.cameraY -= @runningSpeed
        $gameWindow.currentGameScene.cameraReferenceY -= @runningSpeed
    end

    def playRunningLeft
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}RunningLeft1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}RunningLeft.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}RunningLeft2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}RunningLeft.png",0,0)
        end
    end

    def playRunningRight
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}RunningRight1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}RunningRight.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}RunningRight2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}RunningRight.png",0,0)
        end
    end

    def playRunningUp
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}RunningUp1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}RunningUp.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}RunningUp2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}RunningUp.png",0,0)
        end
    end

    def playRunningDown
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}RunningDown1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}RunningDown.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}RunningDown2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}RunningDown.png",0,0)
        end
    end

end
