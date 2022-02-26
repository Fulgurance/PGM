class StartingCredits < GameScene

    def initialize
        @creditsVisible = false
        @startGameFreakScreen = false
        @gameFreakScreenVisible = false

        @creditsTextColorRGB = 0
        @gameFreakSpriteAlpha = 0

        @creditsSpeed = 8
        @gameFreakSpeed = 6

        @startingSound = Gosu::Sample.new("Audios/SE/GameStart.wav")
        @creditsText = Text.new("©1995-2022 Game Freak Inc.")
        @gameFreakSprite = Sprite.new("Graphics/GameFreakCreditsScreen.png")

        @startingSound.play
    end

    def update
        if !@startGameFreakScreen
            if @creditsTextColorRGB >= 255
                @creditsVisible = true
                sleep(3)
            end
            if @creditsVisible && @creditsTextColorRGB <= 0
                @creditsText = nil
                @startGameFreakScreen = true
            end
            if !@creditsVisible
                @creditsTextColorRGB += @creditsSpeed
            else
                @creditsTextColorRGB -= @creditsSpeed
            end
        else
            if @gameFreakSpriteAlpha >= 255
                @gameFreakScreenVisible = true
                sleep(3)
            end
            if @gameFreakScreenVisible && @gameFreakSpriteAlpha <= 0
                @gameFreakSprite = nil
                #$gameWindow.currentGameScene = TitleScreen.new
                $gameWindow.currentGameScene = LoadingScreen.new
            end
            if !@gameFreakScreenVisible
                @gameFreakSpriteAlpha += @gameFreakSpeed
            else
                @gameFreakSpriteAlpha -= @gameFreakSpeed
            end
        end
    end

    def draw
        if !@startGameFreakScreen
            @creditsText.draw($gameWindow.width/2-@creditsText.width/2,$gameWindow.height/2-@creditsText.height/2,0,1.0,1.0, Color.new(255,@creditsTextColorRGB,@creditsTextColorRGB,@creditsTextColorRGB))
        else
            @gameFreakSprite.draw(0,0,0,1.0,1.0,Color.new(@gameFreakSpriteAlpha,255,255,255))
        end
    end

end
