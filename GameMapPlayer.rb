class GameMapPlayer < GameMapMovableObject

    attr_accessor :animationRunningSpeed
    attr_accessor :animationCyclingSpeed
    attr_accessor :onBicycle

    def initialize(spriteName,x,y,z,sizeX=32,sizeY=0,sizeZ=64,direction=3)
        super(spriteName,x,y,z,sizeX,sizeY,sizeZ,direction=3)
        @runningSpeed = 2.3
        @cyclingSpeed = 3.6
        @animationRunningSpeed = 0.15
        @animationCyclingSpeed = 0.1
        @onBicycle = false
    end

    def lookOnBicycleLeft
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/OnBicycleLeft.png",0,0)
    end

    def lookOnBicycleRight
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/OnBicycleRight.png",0,0)
    end

    def lookOnBicycleUp
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/OnBicycleUp.png",0,0)
    end

    def lookOnBicycleDown
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/OnBicycleDown.png",0,0)
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
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningLeft1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningLeft.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningLeft2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningLeft.png",0,0)
        end
    end

    def playRunningRight
        if @movingFrame == 0
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningRight1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningRight.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningRight2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningRight.png",0,0)
        end
    end

    def playRunningUp
        if @movingFrame == 0
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningUp1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningUp.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningUp2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningUp.png",0,0)
        end
    end

    def playRunningDown
        if @movingFrame == 0
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningDown1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningDown.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningDown2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/RunningDown.png",0,0)
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
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingLeft1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingLeft.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingLeft2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingLeft.png",0,0)
        end
    end

    def playCyclingRight
        if @movingFrame == 0
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingRight1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingRight.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingRight2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingRight.png",0,0)
        end
    end

    def playCyclingUp
        if @movingFrame == 0
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingUp1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingUp.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingUp2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingUp.png",0,0)
        end
    end

    def playCyclingDown
        if @movingFrame == 0
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingDown1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingDown.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingDown2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/CyclingDown.png",0,0)
        end
    end

end
