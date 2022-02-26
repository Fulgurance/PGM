module PGM

    class PokemonType

        attr_accessor :id
        attr_accessor :name
        attr_accessor :weaknesses

        def initialize(id,name,weaknesses)
            @id = id
            @name = name
            @weaknesses = weaknesses
        end

    end

end
