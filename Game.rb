require 'opengl'
require 'glu'
require 'gosu'
require './Color'
require './Font'
require './Text'
require './Sprite'
require './Sound'
require './Music'
require './GameWindow'
require './GameMapObject'
require './GameMapGround'
require './GameMapMovableObject'
require './GameMapEvent'
require './GameMapPlayer'
require './GameScene'
require './GameScene3D'
require './GameMapScene'
require './GameMenuScene'
require './StartingCreditsScene'
require './TitleScreenScene'
require './LoadingScreenScene'
require './MapTest'

$gameWindow = GameWindow.new("PGM",940,528)
$gameWindow.currentGameScene = MapTest.new("Carte de test",0,0,0,0)
#StartingCreditsScene.new
$gameWindow.show
