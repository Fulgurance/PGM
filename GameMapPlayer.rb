class GameMapPlayer < GameMapMovableObject

    attr_accessor :animationRunningSpeed
    attr_accessor :animationCyclingSpeed
    attr_accessor :onBicycle

    def initialize(spriteName,x,y,z,sizeX=32,sizeY=0,sizeZ=64,direction=3)
        super(spriteName,x,y,z,sizeX,sizeY,sizeZ,direction=3)
        @spriteName = spriteName
        @sprite = Sprite.new("Graphics/Player/#{@spriteName}Down.png",retro: true)
        @direction = direction
        @speed = 1.3
        @runningSpeed = 2.3
        @cyclingSpeed = 3.6
        @animationSpeed = 0.2
        @animationRunningSpeed = 0.15
        @animationCyclingSpeed = 0.1
        @currentMovementDistance = 0
        @pressedButtonTime = 0.0
        @movingFrame = 0
        @onBicycle = false
        @delayBeforeMoving = 0.3
    end

    def lookOnBicycleLeft
        @movingFrame = 0
        @sprite.insert("Graphics/Player/#{@spriteName}OnBicycleLeft.png",0,0)
    end

    def lookOnBicycleRight
        @movingFrame = 0
        @sprite.insert("Graphics/Player/#{@spriteName}OnBicycleRight.png",0,0)
    end

    def lookOnBicycleUp
        @movingFrame = 0
        @sprite.insert("Graphics/Player/#{@spriteName}OnBicycleUp.png",0,0)
    end

    def lookOnBicycleDown
        @movingFrame = 0
        @sprite.insert("Graphics/Player/#{@spriteName}OnBicycleDown.png",0,0)
    end

    def runLeft
        @movingLeft = true
        @currentMovementDistance += @runningSpeed
        @realX -= @runningSpeed
        playRunningLeft
    end

    def runRight
        @movingRight = true
        @currentMovementDistance += @runningSpeed
        @realX += @runningSpeed
        playRunningRight
    end

    def runUp
        @movingUp = true
        @currentMovementDistance += @runningSpeed
        @realY += @runningSpeed
        playRunningUp
    end

    def runDown
        @movingDown = true
        @currentMovementDistance += @runningSpeed
        @realY -= @runningSpeed
        playRunningDown
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

    def cyclingLeft
        @movingLeft = true
        @currentMovementDistance += @cyclingSpeed
        @realX -= @cyclingSpeed
        playCyclingLeft
    end

    def cyclingRight
        @movingRight = true
        @currentMovementDistance += @cyclingSpeed
        @realX += @cyclingSpeed
        playCyclingRight
    end

    def cyclingUp
        @movingUp = true
        @currentMovementDistance += @cyclingSpeed
        @realY += @cyclingSpeed
        playCyclingUp
    end

    def cyclingDown
        @movingDown = true
        @currentMovementDistance += @cyclingSpeed
        @realY -= @cyclingSpeed
        playCyclingDown
    end

    def playCyclingLeft
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingLeft1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingLeft.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingLeft2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingLeft.png",0,0)
        end
    end

    def playCyclingRight
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingRight1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingRight.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingRight2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingRight.png",0,0)
        end
    end

    def playCyclingUp
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingUp1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingUp.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingUp2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingUp.png",0,0)
        end
    end

    def playCyclingDown
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingDown1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingDown.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingDown2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}CyclingDown.png",0,0)
        end
    end

end
