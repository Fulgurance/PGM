class GameMapMovableObject < GameMapObject

    attr_accessor :spriteName
    attr_accessor :sprite
    attr_accessor :direction
    attr_accessor :speed
    attr_accessor :animationSpeed
    attr_accessor :currentMovementDistance
    attr_accessor :lookingLeft
    attr_accessor :lookingRight
    attr_accessor :lookingUp
    attr_accessor :lookingDown
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
        @lookingLeft = false
        @lookingRight = false
        @lookingUp = false
        @lookingDown = false
        @movingOneStep = false
        @movingLeft = false
        @movingRight = false
        @movingUp = false
        @movingDown = false
        @movingFrame = 0
        @delayBeforeMoving = 0.3
        @movementAnimationTime = Time.now
        @previousRealX = @realX
        @previousRealY = @realY
    end

    def update
        super

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

        @x = (@realX/32).round * 32
        @y = (@realY/32).round * 32
        @z = (@realZ/32).round * 32

        if @previousRealX == @realX
            @movingLeft = false
            @movingRight = false
            @realX = @x
        end

        if @previousRealY == @realY
            @movingUp = false
            @movingDown = false
            @realY = @y
        end

        @previousRealX = @realX
        @previousRealY = @realY
        @previousRealZ = @realZ
    end

    def lookLeft
        @lookingLeft = true
        @lookingRight = false
        @lookingUp = false
        @lookingDown = false
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/Left.png",0,0)
    end

    def lookRight
        @lookingLeft = false
        @lookingRight = true
        @lookingUp = false
        @lookingDown = false
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/Right.png",0,0)
    end

    def lookUp
        @lookingLeft = false
        @lookingRight = false
        @lookingUp = true
        @lookingDown = false
        @movingFrame = 0
        @sprite.insert("Graphics/Characters/#{@spriteName}/Up.png",0,0)
    end

    def lookDown
        @lookingLeft = false
        @lookingRight = false
        @lookingUp = false
        @lookingDown = true
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
        result = GameMapObject.new(0,0,0)

        $gameWindow.currentGameScene.objects.each do |object|
            if self.x < object.x+object.sizeX && self.x >= object.x && self.y < object.y+object.sizeY && self.y >= object.y
                result = object
            end
        end

        return result
    end

    def nextSquare(direction)
        result = GameMapObject.new(0,0,0)

        $gameWindow.currentGameScene.objects.each do |object|
            case direction
            when 0
                if  (self.x-$gameWindow.currentGameScene.squareSize) < object.x+object.sizeX && (self.x-$gameWindow.currentGameScene.squareSize) >= object.x && self.y >= object.y && self.y < object.y+object.sizeY
                    result = object
                end
            when 1
                if (self.x+$gameWindow.currentGameScene.squareSize) >= object.x && (self.x+$gameWindow.currentGameScene.squareSize) < object.x+object.sizeX && self.y >= object.y && self.y < object.y+object.sizeY
                    result = object
                end
            when 2
                if (self.y+$gameWindow.currentGameScene.squareSize) >= object.y && (self.y+$gameWindow.currentGameScene.squareSize) < object.y+object.sizeY && self.x >= object.x && self.x < object.x+object.sizeX
                    result = object
                end
            when 3
                if (self.y-$gameWindow.currentGameScene.squareSize) < object.y+object.sizeY && (self.y-$gameWindow.currentGameScene.squareSize) >= object.y  && self.x >= object.x && self.x < object.x+object.sizeX
                    result = object
                end
            end
        end

        return result
    end

    def nextEntity(direction)
        result = GameMapMovableObject.new("BoyHero",0,0,0)

        ($gameWindow.currentGameScene.events+[$gameWindow.currentGameScene.player]).each do |object|
            case direction
            when 0
                if  (self.x-$gameWindow.currentGameScene.squareSize) == object.x && self.y == object.y
                    result = object
                end
            when 1
                if (self.x+$gameWindow.currentGameScene.squareSize) == object.x && self.y == object.y
                    result = object
                end
            when 2
                if (self.y+$gameWindow.currentGameScene.squareSize) == object.y && self.x == object.x
                    result = object
                end
            when 3
                if (self.y-$gameWindow.currentGameScene.squareSize) == object.y && self.x == object.x
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
