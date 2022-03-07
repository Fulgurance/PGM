require 'opengl'
require 'glu'
require 'gosu'
require './Color'
require './Font'
require './Text'
require './Sprite'
require './GameWindow'
require './GameMapObject'
require './GameMapGround'
require './GameMapMovableObject'
require './GameMapEvent'
require './GameMapPlayer'
require './GameScene'
require './GameScene3D'
require './GameMapScene'
require './StartingCredits'
require './TitleScreen'
require './LoadingScreen'
require './MapTest'

$gameWindow = GameWindow.new("Pokemon",940,528)
$gameWindow.currentGameScene = MapTest.new(0,0,0)#StartingCredits.new
$gameWindow.show
