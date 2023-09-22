class GameMessageScene < GameScene

    def initialize(text,skinNumber)
        super()

        #GLOBAL SETTINGS

        @color = Color.new(255,255,255,255)
        @path = "Graphics/Messages/#{skinNumber}.png"
        @space = 50
        @innerSpace = 30

        #CORNERS
        @backgroundTopLeft = Sprite.new(@path,{rect: [0,0,12,12]})
        @backgroundTopLeft.color = @color
        @backgroundTopLeft.x = @space
        @backgroundTopLeft.y = $gameWindow.height - 36 - @space - @innerSpace * 2

        @backgroundTopRight = Sprite.new(@path,{rect: [24,0,12,12]})
        @backgroundTopRight.color = @color
        @backgroundTopRight.x = $gameWindow.width - 12 - @space
        @backgroundTopRight.y = @backgroundTopLeft.y

        @backgroundBottomLeft = Sprite.new(@path,{rect: [0,24,12,12]})
        @backgroundBottomLeft.color = @color
        @backgroundBottomLeft.x = @space
        @backgroundBottomLeft.y = $gameWindow.height - 12 - @space


        @backgroundBottomRight = Sprite.new(@path,{rect: [24,24,12,12]})
        @backgroundBottomRight.color = @color
        @backgroundBottomRight.x = @backgroundTopRight.x
        @backgroundBottomRight.y = @backgroundBottomLeft.y

        #EDGES
        @backgroundEdgeLeft = Sprite.new(@path,{rect: [0,12,12,12],tileable: true})
        @backgroundEdgeLeft.color = @color
        @backgroundEdgeLeft.x = @space
        @backgroundEdgeLeft.y = $gameWindow.height - 24 - @space - @innerSpace * 2
        @backgroundEdgeLeft.zoomY = (@backgroundBottomLeft.y.to_f - @backgroundTopLeft.y.to_f-@backgroundTopLeft.width) / 12.0

        @backgroundEdgeRight = Sprite.new(@path,{rect: [24,12,12,12],tileable: true})
        @backgroundEdgeRight.color = @color
        @backgroundEdgeRight.x = $gameWindow.width - 12 - @space
        @backgroundEdgeRight.y = @backgroundEdgeLeft.y
        @backgroundEdgeRight.zoomY = @backgroundEdgeLeft.zoomY

        @backgroundEdgeUp = Sprite.new(@path,{rect: [12,0,12,12],tileable: true})
        @backgroundEdgeUp.color = @color
        @backgroundEdgeUp.x = 12 + @space
        @backgroundEdgeUp.y = $gameWindow.height - 36 - @space - @innerSpace * 2
        @backgroundEdgeUp.zoomX = (@backgroundTopRight.x.to_f - @backgroundTopLeft.x.to_f-@backgroundTopLeft.width) / 12.0

        @backgroundEdgeDown = Sprite.new(@path,{rect: [12,24,12,12],tileable: true})
        @backgroundEdgeDown.color = @color
        @backgroundEdgeDown.x = @backgroundEdgeUp.x
        @backgroundEdgeDown.y = $gameWindow.height - 12 - @space
        @backgroundEdgeDown.zoomX = @backgroundEdgeUp.zoomX

        #CENTER
        @backgroundCenter = Sprite.new(@path,{rect: [12,12,12,12],tileable: true})
        @backgroundCenter.color = @color
        @backgroundCenter.x = @backgroundEdgeUp.x
        @backgroundCenter.y = @backgroundEdgeRight.y
        @backgroundCenter.zoomX = @backgroundEdgeUp.zoomX
        @backgroundCenter.zoomY = @backgroundEdgeRight.zoomY


        #TEXT
        @text = Text.new(text)
        @text.x = $gameWindow.width / 2 - @text.width / 2
        @text.y = @backgroundCenter.y + @backgroundCenter.height / 2 * @backgroundCenter.zoomY - @text.height / 2
        @text.color = Color.new(255,0,0,0)

        @arrow = Sprite.new("Graphics/Messages/#{skinNumber}Arrow.png")
        @arrow.x = @backgroundEdgeRight.x - @innerSpace
        @arrow.y = @backgroundBottomRight.y - @innerSpace

        @clickSound = Sound.new("Audios/Sounds/Message.wav")
        @clickSound.play

        @delayBetweenInputs = 0.14
        @animationArrowSpeed = 0.15
        @arrowAnimationTime = Time.now
        @arrowReverseAnimation = false
    end

    def draw
        @backgroundBottomLeft.draw
        @backgroundBottomRight.draw
        @backgroundTopLeft.draw
        @backgroundTopRight.draw
        @backgroundEdgeDown.draw
        @backgroundEdgeLeft.draw
        @backgroundEdgeRight.draw
        @backgroundEdgeUp.draw
        @backgroundCenter.draw
        @text.draw
        @arrow.draw
    end

    def updateArrow
        if (Time.now.to_f-@arrowAnimationTime.to_f) > @animationArrowSpeed
            if !@arrowReverseAnimation
                @arrow.y += 1
            else
                @arrow.y -= 1
            end

            if @arrow.y >= @backgroundBottomRight.y - @innerSpace + 3
                @arrowReverseAnimation = true
            end

            if @arrow.y <= @backgroundBottomRight.y - @innerSpace
                @arrowReverseAnimation = false
            end

            @arrowAnimationTime = Time.now
        end
    end

    def update
        updateInputs
        updateArrow
    end

    def updateInputs
        if Input.pressed(Key::KeyboardReturn)
            @clickSound.play
            $gameWindow.currentGameScene.standby = false
            Input.reset
        end
    end

end
