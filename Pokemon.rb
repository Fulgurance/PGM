module PGM

    class Pokemon

        attr_accessor :pokedexInformationID
        attr_accessor :originalTrainer
        attr_accessor :catchingInformation
        attr_accessor :nickname
        attr_accessor :sex
        attr_accessor :shiny
        attr_accessor :level
        attr_accessor :experience
        attr_accessor :ballID
        attr_accessor :itemID
        attr_accessor :statistics
        attr_accessor :battleStatistics
        attr_accessor :nature
        attr_accessor :ability
        attr_accessor :moves

        def initialize( pokedexInformationID,
                        originalTrainer,
                        catchingInformation,
                        nickname,
                        sex,
                        shiny,
                        level,
                        experience,
                        ballID,
                        itemID,
                        statistics,
                        battleStatistics,
                        nature,
                        ability,
                        moves )
            @pokedexInformationID = pokedexInformationID
            @originalTrainer = originalTrainer
            @catchingInformation = catchingInformation
            @nickname = nickname
            @sex = sex
            @shiny = shiny
            @level = level
            @experience = experience
            @ballID = ballID
            @itemID = itemID
            @statistics = statistics
            @battleStatistics = battleStatistics
            @nature = nature
            @ability = ability
            @moves = moves
        end

    end

end
