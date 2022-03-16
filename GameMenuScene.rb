class GameMenuScene < GameScene

    def initialize
        @background = Sprite.new("Graphics/Menu/Background.png")
        @background.color = Color.new(120,255,255,255)
        @delayBeforeNextEscapeInput = 0.2
        @inputEscapeTime = Time.now
        @exitMenuSound = Sound.new("Audios/Sounds/ExitMenu.wav")
    end

    def draw
        @background.draw
    end

    def update
        if Gosu.button_down?(Gosu::KB_ESCAPE) && (Time.now.to_f-@inputEscapeTime.to_f) > @delayBeforeNextEscapeInput
            @exitMenuSound.play
            $gameWindow.currentGameScene.standby = false
            $gameWindow.currentGameScene.inputEscapeTime = Time.now
        end
    end

end
