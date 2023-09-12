class GameMessageScene < GameScene

    def initialize(text,skinNumber)
        super()

        #GLOBAL SETTINGS
        @color = Color.new(180,255,255,255)
        @path = "Graphics/Messages/#{skinNumber}.png"
        @space = 5

        #CORNERS
        @backgroundTopLeft = Sprite.new(@path,{rect: [0,0,16,16]})
        @backgroundTopLeft.color = @color
        @backgroundTopLeft.x = @space
        @backgroundTopLeft.y = $gameWindow.height - 64 / 2 - @space

        @backgroundTopRight = Sprite.new(@path,{rect: [32,0,16,16]})
        @backgroundTopRight.color = @color
        @backgroundTopRight.x = $gameWindow.width - 16 - @space
        @backgroundTopRight.y = @backgroundTopLeft.y

        @backgroundBottomLeft = Sprite.new(@path,{rect: [0,32,16,16]})
        @backgroundBottomLeft.color = @color
        @backgroundBottomLeft.x = @space
        @backgroundBottomLeft.y = $gameWindow.height - 16 - @space

        @backgroundBottomRight = Sprite.new(@path,{rect: [32,32,16,16]})
        @backgroundBottomRight.color = @color
        @backgroundBottomRight.x = @backgroundTopRight.x
        @backgroundBottomRight.y = @backgroundBottomLeft.y

        #EDGES
        @backgroundEdgeLeft = Sprite.new(@path,{rect: [0,16,16,16]})
        @backgroundEdgeLeft.color = @color
        @backgroundEdgeLeft.x = @space
        @backgroundEdgeLeft.y = $gameWindow.height - 32 - @space
        @backgroundEdgeLeft.zoomY = (@backgroundBottomLeft.y.to_f - @backgroundEdgeLeft.y.to_f) / 16.0

        @backgroundEdgeRight = Sprite.new(@path,{rect: [32,16,16,16]})
        @backgroundEdgeRight.color = @color
        @backgroundEdgeRight.x = $gameWindow.width - 16 - @space
        @backgroundEdgeRight.y = @backgroundEdgeLeft.y
        @backgroundEdgeRight.zoomY = @backgroundEdgeLeft.zoomY

        @backgroundEdgeUp = Sprite.new(@path,{rect: [16,0,16,16]})
        @backgroundEdgeUp.color = @colorColor.new(180,255,255,255)
        @backgroundEdgeUp.x = 16 + @space
        @backgroundEdgeUp.y = $gameWindow.height - 64 - @space
        @backgroundEdgeUp.zoomX = (@backgroundTopLeft.x.to_f - @backgroundTopLeft.x.to_f) / 16.0

        @backgroundEdgeDown = Sprite.new(@path,{rect: [32,32,16,16]})
        @backgroundEdgeDown.color = @color
        @backgroundEdgeDown.x = @backgroundEdgeUp.x
        @backgroundEdgeDown.y = $gameWindow.height - 16 - @space
        @backgroundEdgeDown.zoomX = @backgroundEdgeUp.zoomX

        #CENTER
        @backgroundCenter = Sprite.new(@path,{rect: [32,32,16,16]})
        @backgroundCenter.color = @color
        @backgroundCenter.x = @backgroundEdgeUp.x
        @backgroundCenter.y = @backgroundEdgeRight.y
        @backgroundCenter.zoomX = @backgroundEdgeUp.zoomX
        @backgroundCenter.zoomY = @backgroundEdgeRight.zoomY

        @text = Text.new(text)
        @text.x = @backgroundCenter.x / 2 - @text.width / 2
        @text.y = @backgroundCenter.y / 2 - @text.height / 2

        @clickSound = Sound.new("Audios/Sounds/Message.wav")
        @clickSound.play

        @delayBetweenInputs = 0.14
    end

    def draw
        @background.draw
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
