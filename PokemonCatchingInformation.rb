module PGM

    class PokemonCatchingInformation

        attr_accessor :date
        attr_accessor :location
        attr_accessor :level

        def initialize(date,location,level)
            @date = date
            @location = location
            @level = level
        end

    end

end
