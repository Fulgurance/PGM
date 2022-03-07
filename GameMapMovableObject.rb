class GameMapMovableObject < GameMapObject

    attr_accessor :spriteName
    attr_accessor :sprite
    attr_accessor :direction
    attr_accessor :speed
    attr_accessor :animationSpeed
    attr_accessor :currentMovementDistance
    attr_accessor :movingFrame
    attr_accessor :movingLeft
    attr_accessor :movingRight
    attr_accessor :movingUp
    attr_accessor :movingDown
    attr_accessor :delayBeforeMoving

    def initialize(spriteName,x,y,z,sizeX=32,sizeY=32,sizeZ=32,direction=3)
        super(x,y,z,sizeX,sizeY,sizeZ)
        @spriteName = spriteName
        @sprite = Sprite.new("Graphics/Player/#{@spriteName}Down.png",retro: true)
        @direction = direction
        @speed = 1.3
        @animationSpeed = 0.20
        @currentMovementDistance = 0
        @movingLeft = false
        @movingRight = false
        @movingUp = false
        @movingDown = false
        @pressedButtonTime = 0.0
        @movingFrame = 0
        @delayBeforeMoving = 0.3
    end

    def lookLeft
        @movingFrame = 0
        @sprite.insert("Graphics/Player/#{@spriteName}Left.png",0,0)
    end

    def lookRight
        @movingFrame = 0
        @sprite.insert("Graphics/Player/#{@spriteName}Right.png",0,0)
    end

    def lookUp
        @movingFrame = 0
        @sprite.insert("Graphics/Player/#{@spriteName}Up.png",0,0)
    end

    def lookDown
        @movingFrame = 0
        @sprite.insert("Graphics/Player/#{@spriteName}Down.png",0,0)
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

    def playMovingLeft
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}MoveLeft1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}Left.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}MoveLeft2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}Left.png",0,0)
        end
    end

    def playMovingRight
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}MoveRight1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}Right.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}MoveRight2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}Right.png",0,0)
        end
    end

    def playMovingUp
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}MoveUp1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}Up.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}MoveUp2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}Up.png",0,0)
        end
    end

    def playMovingDown
        if @movingFrame == 0
            @sprite.insert("Graphics/Player/#{@spriteName}MoveDown1.png",0,0)
        elsif @movingFrame == 1
            @sprite.insert("Graphics/Player/#{@spriteName}Down.png",0,0)
        elsif @movingFrame == 2
            @sprite.insert("Graphics/Player/#{@spriteName}MoveDown2.png",0,0)
        else
            @sprite.insert("Graphics/Player/#{@spriteName}Down.png",0,0)
        end
    end

    def draw
        GL.BindTexture(GL::TEXTURE_2D, @sprite.gl_tex_info.tex_name)
        GL.Enable(GL::ALPHA_TEST)
        GL.AlphaFunc(GL::GREATER,0)

        GL.PushMatrix
        GL.Translatef(@realX+$gameWindow.currentGameScene.squareSize/2,@realY+$gameWindow.currentGameScene.squareSize/2,@realZ)
        GL.Rotatef(-$gameWindow.currentGameScene.viewAngle,1,0,0)
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
