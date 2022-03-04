class GameScene3D < GameScene

  def initialize
    GL.load_lib()
    GLU.load_lib()
  end

  def draw
    Gosu.gl do
      drawGraphics
    end
  end

  def drawGraphics
  end

end
