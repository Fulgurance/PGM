class GameMapEvent < GameMapMovableObject

    def initialize(spriteName,x,y,z,sizeX=32,sizeY=32,sizeZ=32,direction=3)
        super(spriteName,x,y,z,sizeX,sizeY,sizeZ,direction=3)
        @spriteName = spriteName
        @sprite = Sprite.new("Graphics/Characters/#{@spriteName}/Down.png",retro: true)
        @direction = direction
        @speed = 1.3
        @animationSpeed = 0.2
        @currentMovementDistance = 0
        @movingFrame = 0
        @delayBeforeMoving = 0.3
    end

    def moveLeft
        if !nextEntity(0).kind_of?(GameMapEvent) && !nextEntity(0).kind_of?(GameMapPlayer)
            super
        else
            if !lookingLeft
                lookLeft
            else
                playMovingLeft
            end
        end
    end

    def moveRight
        if !nextEntity(1).kind_of?(GameMapEvent) && !nextEntity(1).kind_of?(GameMapPlayer)
            super
        else
            if !lookingRight
                lookRight
            else
                playMovingRight
            end
        end
    end

    def moveUp
        if !nextEntity(2).kind_of?(GameMapEvent) && !nextEntity(2).kind_of?(GameMapPlayer)
            super
        else
            if !lookingUp
                lookUp
            else
                playMovingUp
            end
        end
    end

    def moveDown
        if !nextEntity(3).kind_of?(GameMapEvent) && !nextEntity(3).kind_of?(GameMapPlayer)
            super
        else
            if !lookingDown
                lookDown
            else
                playMovingDown
            end
        end
    end

end
