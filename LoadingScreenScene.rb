class LoadingScreenScene < GameScene

    def initialize
        super
        @flatPokeBallAngle = 0

        @background = Sprite.new("Graphics/LoadingScreen/LoadingScreenBackground.png")
        @flatPokeBall = Sprite.new("Graphics/LoadingScreen/FlatPokeBall.png")
    end

    def update
        if @flatPokeBallAngle >= 359
            @flatPokeBallAngle = 0
        else
            @flatPokeBallAngle += 1
        end
    end

    def draw
        @background.draw#(0,0,0)
        @flatPokeBall.draw_rot(0,$gameWindow.height/2,1,@flatPokeBallAngle)
    end

end
