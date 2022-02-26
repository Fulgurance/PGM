module PGM

    class PokedexGender

        attr_accessor :id
        attr_accessor :asexual
        attr_accessor :maleRate

        def initialize(id,asexual,maleRate)
            @id = id
            @asexual = asexual
            @maleRate = maleRate
        end

    end

end
