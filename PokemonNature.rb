module PGM

    class PokemonNature

        attr_accessor :id
        attr_accessor :name
        attr_accessor :bonus

        def initialize(id,name,bonus)
            @id = id
            @name = name
            @bonus = bonus
        end

    end

end
