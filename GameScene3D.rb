class GameScene3D < GameScene

  def initialize
    GL.load_lib()
    GLU.load_lib()
  end

  def draw
    Gosu.gl do
      updateGraphics
    end
  end

  def updateGraphics
  end

end
