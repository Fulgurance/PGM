class GameMapMovableObject < GameMapObject

    attr_accessor :spriteName
    attr_accessor :sprite
    attr_accessor :direction
    attr_accessor :speed
    attr_accessor :animationSpeed
    attr_accessor :currentMovementDistance
    attr_accessor :movingOneStep
    attr_accessor :movingFrame
    attr_accessor :movingLeft
    attr_accessor :movingRight
    attr_accessor :movingUp
    attr_accessor :movingDown
    attr_accessor :delayBeforeMoving
    attr_accessor :movementAnimationTime

    def initialize(spriteName,x,y,z,sizeX=32,sizeY=32,sizeZ=32,direction=3)
        super(x,y,z,sizeX,sizeY,sizeZ)
        @spriteName = spriteName
        @sprite = Sprite.new("Graphics/Characters/#{@spriteName}/Down.png",retro: true)
        @direction = direction
        @speed = 1.3
        @animationSpeed = 0.2
        @currentMovementDistance = 0
        @movingOneStep = false
        @movingLeft = false
        @movingRight = false
        @movingUp = false
        @movingDown = false
        @movingFrame = 0
        @delayBeforeMoving = 0.3
        @movementAnimationTime = Time.now
    end

    def update
        if (Time.now.to_f-@movementAnimationTime.to_f) > @animationSpeed
            @movingFrame += 1
            if @movingFrame == 2
                @movingOneStep = true
            end
            if @movingFrame > 3
                @movingFrame = 0
                @movingOneStep = true
            end
            @movementAnimationTime = Time.now
        else
            @movingOneStep = false
        end
    end

    def lookLeft
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/Left.png",0,0)
    end

    def lookRight
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/Right.png",0,0)
    end

    def lookUp
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/Up.png",0,0)
    end

    def lookDown
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/Down.png",0,0)
    end

    def moveLeft
        @movingLeft = true
        @currentMovementDistance += @speed
        @realX -= @speed
        playMovingLeft
    end

    def moveRight
        @movingRight = true
        @currentMovementDistance += @speed
        @realX += @speed
        playMovingRight
    end

    def moveUp
        @movingUp = true
        @currentMovementDistance += @speed
        @realY += @speed
        playMovingUp
    end

    def moveDown
        @movingDown = true
        @currentMovementDistance += @speed
        @realY -= @speed
        playMovingDown
    end

    def moving
        return @movingLeft || @moveRight || @movingUp || @movingDown
    end

    def playMovingLeft
        if @movingFrame == 0
            @sprite.insert("Graphics/Characters/#{@spriteName}/MoveLeft1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/Left.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/MoveLeft2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/Left.png",0,0)
        end
    end

    def playMovingRight
        if @movingFrame == 0
            @sprite.insert("Graphics/Characters/#{@spriteName}/MoveRight1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/Right.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/MoveRight2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/Right.png",0,0)
        end
    end

    def playMovingUp
        if @movingFrame == 0
            @sprite.insert("Graphics/Characters/#{@spriteName}/MoveUp1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/Up.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/MoveUp2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/Up.png",0,0)
        end
    end

    def playMovingDown
        if @movingFrame == 0
            @sprite.insert("Graphics/Characters/#{@spriteName}/MoveDown1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Characters/#{@spriteName}/Down.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Characters/#{@spriteName}/MoveDown2.png",0,0)
        else
            @sprite.insert("Graphics/Characters/#{@spriteName}/Down.png",0,0)
        end
    end

    def currentSquare
        result = 0
        $gameWindow.currentGameScene.objects.each do |object|
            if self.x < object.x+object.sizeX && self.x >= object.x && self.y < object.y+object.sizeY && self.y >= object.y
                result = object
            end
        end
        return result
    end

    def nextSquare(direction)
        result = 0
        ($gameWindow.currentGameScene.objects+$gameWindow.currentGameScene.events).each do |object|
            case direction
            when 0
                if (self.x-$gameWindow.currentGameScene.squareSize) < object.x+object.sizeX && (self.x-$gameWindow.currentGameScene.squareSize) >= object.x && (self.y) >= object.y && (self.y) < object.y+object.sizeY
                result = object
                end
            when 1
                if (self.x+$gameWindow.currentGameScene.squareSize) >= object.x && (self.x+$gameWindow.currentGameScene.squareSize) < object.x+object.sizeX && (self.y) >= object.y && (self.y) < object.y+object.sizeY
                result = object
                end
            when 2
                if (self.y+$gameWindow.currentGameScene.squareSize) >= object.y && (self.y+$gameWindow.currentGameScene.squareSize) < object.y+object.sizeY && (self.x) >= object.x && (self.x) < object.x+object.sizeX
                result = object
                end
            when 3
                if (self.y-$gameWindow.currentGameScene.squareSize) < object.y+object.sizeY && (self.y-$gameWindow.currentGameScene.squareSize) >= object.y  && (self.x) >= object.x && (self.x) < object.x+object.sizeX
                result = object
                end
            end
        end
        return result
    end

    def draw
        GL.BindTexture(GL::TEXTURE_2D, @sprite.gl_tex_info.tex_name)
        GL.Enable(GL::ALPHA_TEST)
        GL.AlphaFunc(GL::GREATER,0)

        GL.PushMatrix
        GL.Translatef(@realX+$gameWindow.currentGameScene.squareSize/2,@realY+$gameWindow.currentGameScene.squareSize/2,@realZ)
        GL.Rotatef(-28,1,0,0)
        GL.Scalef(@sprite.width,@sprite.height,@sprite.height)

        GL.Begin(GL::QUADS)
            GL.TexCoord2d(@sprite.gl_tex_info.left,@sprite.gl_tex_info.bottom)
            GL.Vertex3f(-0.5, 0.0, 0.0)

            GL.TexCoord2d(@sprite.gl_tex_info.right,@sprite.gl_tex_info.bottom)
            GL.Vertex3f(0.5, 0.0, 0.0)

            GL.TexCoord2d(@sprite.gl_tex_info.right,@sprite.gl_tex_info.top)
            GL.Vertex3f(0.5, 0.0, 1.0)

            GL.TexCoord2d(@sprite.gl_tex_info.left,@sprite.gl_tex_info.top)
            GL.Vertex3f(-0.5, 0.0, 1.0)
        GL.End

      GL.Disable(GL::ALPHA_TEST)
      GL.PopMatrix
    end

end
