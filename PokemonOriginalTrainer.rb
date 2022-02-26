module PGM

    class PokemonOriginalTrainer

        attr_accessor :id
        attr_accessor :secretID
        attr_accessor :name

        def initialize(id,secretID,name)
            @id = id
            @secretID = secretID
            @name = name
        end

    end

end
