class GameBattleScene < GameScene#3D

  def initialize(backgroundMusicNumber=0)
    super()
    @viewAngle = 35.0
    @squareSize = 32.0
    @aspectRatio = $gameWindow.width.to_f / $gameWindow.height.to_f
    @near = 1.0
    @far = 700.0
    @angleY = -320.0
    @angleZ = 250.0
    @cameraX = 0#@player.realX+@squareSize/2
    @cameraY = 0#@angleY + @player.realY+@squareSize
    @cameraZ = 0#@angleZ + @player.realZ
    @cameraReferenceX = 0#@player.realX+@squareSize/2
    @cameraReferenceY = 0#@player.realY+@squareSize
    @cameraReferenceZ = 0#@player.realZ
    @upX = 0.0
    @upY = 0.0
    @upZ = 1.0
    @delayBeforeNextInput = 0.2
    @introFinished = false

    @backgroundMusicIntro = Music.new("Audios/Musics/Battle/#{backgroundMusicNumber}/Intro.wav")
    @backgroundMusicIntro.play(false)

    @backgroundMusic = Music.new("Audios/Musics/Battle/#{backgroundMusicNumber}/Main.wav")
    #@backgroundMusic.play(true)

  end

  # def drawGraphics
  #   GL.Clear(GL::COLOR_BUFFER_BIT | GL::DEPTH_BUFFER_BIT)
  #   GL.Enable(GL::TEXTURE_2D)
  #   GL.TexParameterf(GL::TEXTURE_2D, GL::TEXTURE_MIN_FILTER, GL::NEAREST);
  #   GL.TexParameterf(GL::TEXTURE_2D, GL::TEXTURE_MAG_FILTER, GL::NEAREST);
  #   GL.Enable(GL::DEPTH_TEST)
  #   GL.MatrixMode(GL::PROJECTION)
  #   GL.LoadIdentity
  #   GLU.Perspective(@viewAngle,@aspectRatio,@near,@far)
  #   GL.MatrixMode(GL::MODELVIEW)
  #   GL.LoadIdentity
  #   GLU.LookAt(@cameraX,@cameraY,@cameraZ,@cameraReferenceX,@cameraReferenceY,@cameraReferenceZ,@upX,@upY,@upZ)
  #   #drawMenu
  # end

  #def drawMenu
    #@menu.draw if @menu != nil
  #end

  def update
    if !@backgroundMusicIntro.playing? && @introFinished == false
      #@backgroundMusic.play(true)
      @introFinished = true
    end

    updateCamera
    updateInputs
  end

  def updateCamera
    #@cameraX = @player.realX+@squareSize/2
    #@cameraY = @angleY + @player.realY+@squareSize
    #@cameraZ = @angleZ + @player.realZ
    #@cameraReferenceX = @player.realX+@squareSize/2
    #@cameraReferenceY = @player.realY+@squareSize
    #@cameraReferenceZ = @player.realZ
  end

  def updateInputs

  end

end
