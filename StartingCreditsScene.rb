class StartingCreditsScene < GameScene

    def initialize
        super
        @creditsVisible = false
        @startGameFreakScreen = false
        @gameFreakScreenVisible = false

        @creditsTextAlpha = 0
        @gameFreakSpriteAlpha = 0

        @creditsSpeed = 8
        @gameFreakSpeed = 6

        @startingSound = Sound.new("Audios/Sounds/GameStart.wav")

        @creditsText = Text.new("©1995-2022 Game Freak Inc.")
        @creditsText.x = $gameWindow.width/2-@creditsText.width/2
        @creditsText.y = $gameWindow.height/2-@creditsText.height/2
        @creditsText.color = Color.new(@creditsTextAlpha,255,255,255)

        @gameFreakSprite = Sprite.new("Graphics/StartingCredits/GameFreakCreditsScreen.png")
        @gameFreakSprite.color = Color.new(@gameFreakSpriteAlpha,255,255,255)

        @startingSound.play
    end

    def update
        if !@startGameFreakScreen
            if @creditsTextAlpha >= 255
                @creditsVisible = true
                sleep(3)
            end
            if @creditsVisible && @creditsTextAlpha <= 0
                @creditsText = nil
                @startGameFreakScreen = true
            end
            if !@creditsVisible
                @creditsTextAlpha += @creditsSpeed
            else
                @creditsTextAlpha -= @creditsSpeed
            end
            if @creditsText != nil
                @creditsText.color = Color.new(@creditsTextAlpha,255,255,255)
            end
        else
            if @gameFreakSpriteAlpha >= 255
                @gameFreakScreenVisible = true
                sleep(3)
            end
            if @gameFreakScreenVisible && @gameFreakSpriteAlpha <= 0
                @gameFreakSprite = nil
                #$gameWindow.currentGameScene = TitleScreenScene.new
                $gameWindow.currentGameScene = LoadingScreenScene.new
                #$gameWindow.currentGameScene = MapTest.new("Carte de test",0,0,0,0)
            end
            if !@gameFreakScreenVisible
                @gameFreakSpriteAlpha += @gameFreakSpeed
            else
                @gameFreakSpriteAlpha -= @gameFreakSpeed
            end
            if @gameFreakSprite != nil
                @gameFreakSprite.color = Color.new(@gameFreakSpriteAlpha,255,255,255)
            end
        end
    end

    def draw
        @creditsText.draw if !@startGameFreakScreen
        @gameFreakSprite.draw if @startGameFreakScreen
    end

end
