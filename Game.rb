require 'opengl'
require 'glu'
require 'gosu'
require './Color'
require './Font'
require './Text'
require './Sprite'
require './GameWindow'
require './GameMapObject'
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
$gameWindow.currentGameScene = MapTest.new(7,16,0,6*32,6*32)#StartingCredits.new
$gameWindow.show
