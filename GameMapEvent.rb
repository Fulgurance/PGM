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
        @previousRealX = @realX
        @previousRealY = @realY
    end

    def update
        super

        @x = (@realX/32).round * 32
        @y = (@realY/32).round * 32
        @z = (@realZ/32).round * 32

        if !@moving
            @realX = @x
            @realY = @y
            @realZ = @z
        end

        if @previousRealX == @realX
            @movingLeft = false
            @movingRight = false
        end

        if @previousRealY == @realY
            @movingUp = false
            @movingDown = false
        end

        @previousRealX = @realX
        @previousRealY = @realY
        @previousRealZ = @realZ
    end

end
