require 'opengl'
require 'glu'
require 'gosu'
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
