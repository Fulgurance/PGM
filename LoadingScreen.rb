class LoadingScreen < GameScene

    def initialize
        @flatPokeBallAngle = 0

        @background = Sprite.new("Graphics/LoadingScreenBackground.png")
        @flatPokeBall = Sprite.new("Graphics/FlatPokeBall.png")
    end

    def update
        if @flatPokeBallAngle >= 359
            @flatPokeBallAngle = 0
        else
            @flatPokeBallAngle += 1
        end
    end

    def draw
        @background.draw(0,0,0)
        @flatPokeBall.draw_rot(0,$gameWindow.height/2,1,@flatPokeBallAngle)
    end

end
