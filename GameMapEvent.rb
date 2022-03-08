class GameMapEvent < GameMapMovableObject

    def initialize(spriteName,x,y,z,sizeX=32,sizeY=32,sizeZ=32,direction=3)
        super(spriteName,x,y,z,sizeX,sizeY,sizeZ,direction=3)
        @spriteName = spriteName
        @sprite = Sprite.new("Graphics/Characters/#{@spriteName}/Down.png",retro: true)
        @direction = direction
        @speed = 1.3
        @animationSpeed = 0.2
        @currentMovementDistance = 0
        @pressedButtonTime = 0.0
        @movingFrame = 0
        @delayBeforeMoving = 0.3
    end

    def update
    end

end
