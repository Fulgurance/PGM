require 'gosu'

require 'json'
require 'gl'
require 'glu'
require 'glut'
include Gl
include Glu

require './Color'
require './Font'
require './Text'
require './Sprite'
require './GameWindow'
require './GameScene'
require './StartingCredits'
require './TitleScreen'
require './LoadingScreen'
require './Test3D'

$gameWindow = GameWindow.new("Pokemon",940,528)
$gameWindow.currentGameScene = Test3D.new#StartingCredits.new
$gameWindow.show
