class GameMenuScene < GameScene

    def initialize
        @background = Sprite.new("Graphics/Menu/Background.png")
        @background.color = Color.new(120,255,255,255)
        @pokedexIcon = Sprite.new("Graphics/Menu/PokedexSelected.png")
        @pokedexIcon.x = ($gameWindow.width-4*@pokedexIcon.width)/5
        @pokedexIcon.y = $gameWindow.height/2-@pokedexIcon.width/2
        @pokedexIcon.z = @background.z+1
        @pokemonIcon = Sprite.new("Graphics/Menu/Pokemon.png")
        @pokemonIcon.x = ($gameWindow.width-4*@pokedexIcon.width)/5 +
                            @pokedexIcon.width +
                            ($gameWindow.width-4*@pokedexIcon.width)/5
        @pokemonIcon.y = $gameWindow.height/2-@pokedexIcon.width/2
        @pokemonIcon.z = @background.z+1
        @bagIcon = Sprite.new("Graphics/Menu/Bag.png")
        @bagIcon.x = ($gameWindow.width-4*@pokedexIcon.width)/5 +
                            @pokedexIcon.width +
                            ($gameWindow.width-4*@pokedexIcon.width)/5 +
                            @pokemonIcon.width +
                            ($gameWindow.width-4*@pokedexIcon.width)/5
        @bagIcon.y = $gameWindow.height/2-@pokedexIcon.width/2
        @bagIcon.z = @background.z+1
        @saveIcon = Sprite.new("Graphics/Menu/Save.png")
        @saveIcon.x = ($gameWindow.width-4*@pokedexIcon.width)/5 +
                            @pokedexIcon.width +
                            ($gameWindow.width-4*@pokedexIcon.width)/5 +
                            @pokemonIcon.width +
                            ($gameWindow.width-4*@pokedexIcon.width)/5 +
                            @bagIcon.width +
                            ($gameWindow.width-4*@pokedexIcon.width)/5
        @saveIcon.y = $gameWindow.height/2-@pokedexIcon.width/2
        @saveIcon.z = @background.z+1

        @pokedexText = Text.new("Pokédex")
        @pokedexText.x = @pokedexIcon.x+@pokedexIcon.width/2-@pokedexText.width/2
        @pokedexText.y = @pokedexIcon.y+@pokedexIcon.height+5
        @pokedexText.z = @pokedexIcon.z+1
        @pokemonText = Text.new("Pokémon")
        @pokemonText.x = @pokemonIcon.x+@pokemonIcon.width/2-@pokemonText.width/2
        @pokemonText.y = @pokemonIcon.y+@pokemonIcon.height+5
        @pokemonText.z = @pokemonIcon.z+1
        @bagText = Text.new("Sac")
        @bagText.x = @bagIcon.x+@bagIcon.width/2-@bagText.width/2
        @bagText.y = @bagIcon.y+@bagIcon.height+5
        @bagText.z = @bagIcon.z+1
        @saveText = Text.new("Sauvegarder")
        @saveText.x = @saveIcon.x+@saveIcon.width/2-@saveText.width/2
        @saveText.y = @saveIcon.y+@saveIcon.height+5
        @saveText.z = @saveIcon.z+1

        @delayBeforeNextInput = 0.2
        @inputEscapeTime = Time.now
        @cursorTime = Time.now
        @index = 0

        @cursorMenuSound = Sound.new("Audios/Sounds/CursorMenu.wav")
        @exitMenuSound = Sound.new("Audios/Sounds/ExitMenu.wav")
    end

    def draw
        @background.draw
        @pokedexIcon.draw
        @pokemonIcon.draw
        @bagIcon.draw
        @saveIcon.draw
        @pokedexText.draw
        @pokemonText.draw
        @bagText.draw
        @saveText.draw
    end

    def update
        case @index
        when 0
            @pokedexIcon.insert("Graphics/Menu/PokedexSelected.png",0,0)
            @pokemonIcon.insert("Graphics/Menu/Pokemon.png",0,0)
            @bagIcon.insert("Graphics/Menu/Bag.png",0,0)
            @saveIcon.insert("Graphics/Menu/Save.png",0,0)
        when 1
            @pokedexIcon.insert("Graphics/Menu/Pokedex.png",0,0)
            @pokemonIcon.insert("Graphics/Menu/PokemonSelected.png",0,0)
            @bagIcon.insert("Graphics/Menu/Bag.png",0,0)
            @saveIcon.insert("Graphics/Menu/Save.png",0,0)
        when 2
            @pokedexIcon.insert("Graphics/Menu/Pokedex.png",0,0)
            @pokemonIcon.insert("Graphics/Menu/Pokemon.png",0,0)
            @bagIcon.insert("Graphics/Menu/BagSelected.png",0,0)
            @saveIcon.insert("Graphics/Menu/Save.png",0,0)
        when 3
            @pokedexIcon.insert("Graphics/Menu/Pokedex.png",0,0)
            @pokemonIcon.insert("Graphics/Menu/Pokemon.png",0,0)
            @bagIcon.insert("Graphics/Menu/Bag.png",0,0)
            @saveIcon.insert("Graphics/Menu/SaveSelected.png",0,0)
        end
        updateInputs
    end

    def updateInputs
        if Gosu.button_down?(Gosu::KB_ESCAPE) && (Time.now.to_f-@inputEscapeTime.to_f) > @delayBeforeNextInput
            @exitMenuSound.play
            $gameWindow.currentGameScene.standby = false
            $gameWindow.currentGameScene.inputEscapeTime = Time.now
        end

        if Gosu.button_down?(Gosu::KB_LEFT) && (Time.now.to_f-@cursorTime.to_f) > @delayBeforeNextInput
            @cursorMenuSound.play
            @index -=1
            @index = 3 if @index < 0
            @cursorTime = Time.now
        end

        if Gosu.button_down?(Gosu::KB_RIGHT) && (Time.now.to_f-@cursorTime.to_f) > @delayBeforeNextInput
            @cursorMenuSound.play
            @index +=1
            @index = 0 if @index > 3
            @cursorTime = Time.now
        end
    end

end
