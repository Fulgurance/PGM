class GameWindow < Gosu::Window

    attr_accessor :currentGameScene

    def initialize(title,width,height,options = {})
        super(width,height,options)
        @caption = title
    end

    def update
        if @currentGameScene != nil
            @currentGameScene.update
        end
    end

    def draw
        if @currentGameScene != nil
            @currentGameScene.draw
        end
    end

end
