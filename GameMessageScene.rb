class GameMessageScene < GameScene

    def initialize(text)
        super()

        @background = Sprite.new("Graphics/Messages/0.png")
        @background.color = Color.new(180,255,255,255)
        @background.x = 0
        @background.y = $gameWindow.height - @background.height / 2

        @text = Text.new(text)
        @text.x = $gameWindow.width / 2 - @text.width / 2
        @text.y = $gameWindow.height - @background.height / 2 - @text.height / 2

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
