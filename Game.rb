require 'opengl'
require 'glu'
require 'gosu'
require './Color'
require './Font'
require './Text'
require './Sprite'
require './Sprite3D'
require './GameWindow'
require './GameMapObject'
require './GameMapPlayer'
require './GameScene'
require './GameScene3D'
require './GameMapScene'
require './StartingCredits'
require './TitleScreen'
require './LoadingScreen'
require './Test3D'
require './MapTest'

$gameWindow = GameWindow.new("Pokemon",940,528)
$gameWindow.currentGameScene = MapTest.new#StartingCredits.new
$gameWindow.show
