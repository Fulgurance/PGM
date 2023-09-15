class GameMessageScene < GameScene

    def initialize(text,skinNumber)
        super()

        #GLOBAL SETTINGS
        @color = Color.new(180,255,255,255)
        @path = "Graphics/Messages/#{skinNumber}.png"
        @space = 5

        #CORNERS
        @backgroundTopLeft = Sprite.new(@path,{rect: [0,0,12,12]})
        @backgroundTopLeft.color = @color
        @backgroundTopLeft.x = @space
        @backgroundTopLeft.y = $gameWindow.height - 36 - @space

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
        @backgroundEdgeLeft.y = $gameWindow.height - 24 - @space
        @backgroundEdgeLeft.zoomY = (@backgroundBottomLeft.y.to_f - @backgroundTopLeft.y.to_f-@backgroundTopLeft.width) / 12.0

        @backgroundEdgeRight = Sprite.new(@path,{rect: [24,12,12,12],tileable: true})
        @backgroundEdgeRight.color = @color
        @backgroundEdgeRight.x = $gameWindow.width - 12 - @space
        @backgroundEdgeRight.y = @backgroundEdgeLeft.y
        @backgroundEdgeRight.zoomY = @backgroundEdgeLeft.zoomY

        @backgroundEdgeUp = Sprite.new(@path,{rect: [12,0,12,12],tileable: true})
        @backgroundEdgeUp.color = @color
        @backgroundEdgeUp.x = 12 + @space
        @backgroundEdgeUp.y = $gameWindow.height - 36 - @space
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

        @text = Text.new(text)
        @text.x = $gameWindow.width / 2 - @text.width / 2
        @text.y = @backgroundCenter.y + @backgroundCenter.height / 2 * @backgroundCenter.zoomY - @text.height / 2

        @clickSound = Sound.new("Audios/Sounds/Message.wav")
        @clickSound.play

        @delayBetweenInputs = 0.14
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
    end

    def update
        updateInputs
    end

    def updateInputs
        if Input.pressed(Key::KeyboardReturn)
            @clickSound.play
            $gameWindow.currentGameScene.standby = false
            Input.reset
        end
    end

end
