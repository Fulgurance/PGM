module PGM

    class PokemonBattleStatistic

        attr_accessor :pokedexID
        attr_accessor :bonusValue

        def initialize(pokedexID,bonusValue)
            @pokedexID = pokedexID
            @battleBonusValue = bonusValue
        end

    end

end
