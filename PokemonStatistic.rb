module PGM

    class PokemonStatistic

        attr_accessor :pokedexID
        attr_accessor :iv
        attr_accessor :ev

        def initialize(pokedexID,iv,ev)
            @pokedexID = pokedexID
            @iv = iv
            @ev = ev
        end

    end

end
