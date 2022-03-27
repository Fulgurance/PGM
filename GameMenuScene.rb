class GameMenuScene < GameScene

    def initialize
        super
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

        @cursorMenuSound = Sound.new("Audios/Sounds/CursorMenu.wav")
        @selectMenuSound = Sound.new("Audios/Sounds/SelectMenu.wav")
        @exitMenuSound = Sound.new("Audios/Sounds/ExitMenu.wav")

        @index = 0
        @delayBetweenInputs = 0.14
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
            #@pokedexText.color = Color.new(255,255,255,255)
            #@pokemonText.color = Color.new(255,90,90,90)
            #@bagText.color = Color.new(255,90,90,90)
            #@saveText.color = Color.new(255,90,90,90)
        when 1
            @pokedexIcon.insert("Graphics/Menu/Pokedex.png",0,0)
            @pokemonIcon.insert("Graphics/Menu/PokemonSelected.png",0,0)
            @bagIcon.insert("Graphics/Menu/Bag.png",0,0)
            @saveIcon.insert("Graphics/Menu/Save.png",0,0)
            #@pokedexText.color = Color.new(255,90,90,90)
            #@pokemonText.color = Color.new(255,255,255,255)
            #@bagText.color = Color.new(255,90,90,90)
            #@saveText.color = Color.new(255,90,90,90)
        when 2
            @pokedexIcon.insert("Graphics/Menu/Pokedex.png",0,0)
            @pokemonIcon.insert("Graphics/Menu/Pokemon.png",0,0)
            @bagIcon.insert("Graphics/Menu/BagSelected.png",0,0)
            @saveIcon.insert("Graphics/Menu/Save.png",0,0)
            #@pokedexText.color = Color.new(255,90,90,90)
            #@pokemonText.color = Color.new(255,90,90,90)
            #@bagText.color = Color.new(255,255,255,255)
            #@saveText.color = Color.new(255,90,90,90)
        when 3
            @pokedexIcon.insert("Graphics/Menu/Pokedex.png",0,0)
            @pokemonIcon.insert("Graphics/Menu/Pokemon.png",0,0)
            @bagIcon.insert("Graphics/Menu/Bag.png",0,0)
            @saveIcon.insert("Graphics/Menu/SaveSelected.png",0,0)
            #@pokedexText.color = Color.new(255,90,90,90)
            #@pokemonText.color = Color.new(255,90,90,90)
            #@bagText.color = Color.new(255,90,90,90)
            #@saveText.color = Color.new(255,255,255,255)
        end
        updateInputs
    end

    def updateInputs
        if Input.pressed(Key::KeyboardEscape)
            @exitMenuSound.play
            $gameWindow.currentGameScene.standby = false
            Input.reset
        end

        if Input.pressed(Key::KeyboardLeft) && (Time.now.to_f-Input.lastPressedTime(Key::KeyboardLeft).to_f) > @delayBetweenInputs
            @cursorMenuSound.play
            @index -=1
            @index = 3 if @index < 0
            Input.resetTime(Key::KeyboardLeft)
        end

        if Input.pressed(Key::KeyboardRight) && (Time.now.to_f-Input.lastPressedTime(Key::KeyboardRight).to_f) > @delayBetweenInputs
            @cursorMenuSound.play
            @index +=1
            @index = 0 if @index > 3
            Input.resetTime(Key::KeyboardRight)
        end

        if Input.pressed(Key::KeyboardReturn)
            @selectMenuSound.play
        end
    end

end
