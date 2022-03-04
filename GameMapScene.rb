class GameMapScene < GameScene3D

  attr_accessor :viewAngle
  attr_accessor :squareSize
  attr_accessor :cameraX,:cameraY,:cameraZ
  attr_accessor :cameraReferenceX,:cameraReferenceY,:cameraReferenceZ

  def initialize
    super
    @viewAngle = 45.0
    @squareSize = 32
    @aspectRatio = $gameWindow.width.to_f / $gameWindow.height.to_f
    @near,@far = 1.0, 700.0
    @cameraX,@cameraY,@cameraZ = 0.0,-320.0,200.0
    @cameraReferenceX,@cameraReferenceY,@cameraReferenceZ = 0.0,-64.0,0.0
    @upX,@upY,@upZ = 0.0,0.0,1.0
  end

  def updateGraphics
    updateSetup
  end

  def updateSetup
    GL.Clear(GL::COLOR_BUFFER_BIT | GL::DEPTH_BUFFER_BIT)
    GL.Enable(GL::TEXTURE_2D)
    GL.Enable(GL::DEPTH_TEST)
    GL.MatrixMode(GL::PROJECTION)
    GL.LoadIdentity
    GLU.Perspective(@viewAngle,@aspectRatio,@near,@far)
    GL.MatrixMode(GL::MODELVIEW)
    GL.LoadIdentity
    GLU.LookAt(@cameraX,@cameraY,@cameraZ,@cameraReferenceX,@cameraReferenceY,@cameraReferenceZ,@upX,@upY,@upZ)
  end

end
