module PGM

    class PokemonWeakness

        attr_accessor :typeID
        attr_accessor :efficiencyRate

        def initialize(typeID,efficiencyRate)
            @typeID = typeID
            @efficiencyRate = efficiencyRate
        end

    end

end
