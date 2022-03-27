class GameScene3D < GameScene

  def initialize
    super
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
