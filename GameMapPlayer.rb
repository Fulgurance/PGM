class GameMapPlayer < GameMapMovableObject

    def initialize(spriteName,x,y,z,sizeX=32,sizeY=0,sizeZ=64,direction=3)
        super(spriteName,x,y,z,sizeX,sizeY,sizeZ,direction=3)
        @spriteName = spriteName
        @sprite = Sprite.new("Graphics/Player/#{@spriteName}Down.png",retro: true)
        @direction = direction
        @speed = 1.3
        @animationSpeed = 0.20
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

end
