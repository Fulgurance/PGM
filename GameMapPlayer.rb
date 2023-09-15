class GameMapPlayer < GameMapMovableObject

    attr_accessor :animationRunningSpeed
    attr_accessor :animationCyclingSpeed
    attr_accessor :onBicycle
    attr_accessor :surfing
    attr_accessor :surfingOriginRealZ

    def initialize(spriteName,x,y,z,sizeX=32,sizeY=0,sizeZ=64,direction=3)
        super(spriteName,x,y,z,sizeX,sizeY,sizeZ,direction=3)
        @runningSpeed = 2.3
        @cyclingSpeed = 3.6
        @surfingSpeed = 3.0
        @animationRunningSpeed = 0.15
        @animationCyclingSpeed = 0.1
        @animationSurfingSpeed = 0.15
        @onBicycle = false
        @surfing = false
        @surfingReverseAnimation = false
        @surfingAnimationTime = Time.now
    end

    def update
        square = currentSquare

        self.movingFrame += 1
        if self.movingFrame == 2
            self.movingOneStep = true
        end
        if self.movingFrame > 3
            self.movingFrame = 0
            self.movingOneStep = true
        end
        self.movementAnimationTime = Time.now

        if self.currentSquare.class == Water
            if @surfing == false
                @surfingOriginRealZ = @realZ
            end

            @onBicycle = false
            @surfing = true

            #TEMPORARY CORRECTION FOR WATER WITH DIFFERENT Z
            if (square.z - @realZ) >= 4
                @realZ += square.z - @realZ
            end

            if (@realZ - square.z) >= 4
                @realZ -= @realZ - square.z
            end

            if (Time.now.to_f-@surfingAnimationTime.to_f) > @animationSurfingSpeed

                if !@surfingReverseAnimation
                    @realZ -= 1
                else
                    @realZ += 1
                end

                if (square.z+square.sizeZ - @realZ) >= 3
                    @surfingReverseAnimation = true
                end

                if (square.z+square.sizeZ - @realZ) <= 0
                    @surfingReverseAnimation = false
                end

                @surfingAnimationTime = Time.now
            end

        else
            @surfing = false
            @realZ = square.z+square.sizeZ
        end
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

    def lookSurfingLeft
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/SurfingLeft.png",0,0)
    end

    def lookSurfingRight
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/SurfingRight.png",0,0)
    end

    def lookSurfingUp
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/SurfingUp.png",0,0)
    end

    def lookSurfingDown
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/SurfingDown.png",0,0)
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

    def surfLeft
        @movingLeft = true
        @currentMovementDistance += @surfingSpeed
        @realX -= @surfingSpeed
        playSurfingLeft
    end

    def surfRight
        @movingRight = true
        @currentMovementDistance += @surfingSpeed
        @realX += @surfingSpeed
        playSurfingRight
    end

    def surfUp
        @movingUp = true
        @currentMovementDistance += @surfingSpeed
        @realY += @surfingSpeed
        playSurfingUp
    end

    def surfDown
        @movingDown = true
        @currentMovementDistance += @surfingSpeed
        @realY -= @surfingSpeed
        playSurfingDown
    end

    def playSurfingLeft
        @sprite.insert("Graphics/Characters/#{@spriteName}/SurfingLeft.png",0,0)
    end

    def playSurfingRight
        @sprite.insert("Graphics/Characters/#{@spriteName}/SurfingRight.png",0,0)
    end

    def playSurfingUp
        @sprite.insert("Graphics/Characters/#{@spriteName}/SurfingUp.png",0,0)
    end

    def playSurfingDown
        @sprite.insert("Graphics/Characters/#{@spriteName}/SurfingDown.png",0,0)
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
