module PGM

    class Player

        attr_accessor :id
        attr_accessor :name
        attr_accessor :trainerID
        attr_accessor :secretID
        attr_accessor :startingGameDate
        attr_accessor :firstHallOfFameDate
        attr_accessor :money
        attr_accessor :battlePoints
        attr_accessor :pokeMiles
        attr_accessor :watts
        attr_accessor :badges
        attr_accessor :bag
        attr_accessor :party


        def initialize( id,
                        name,
                        trainerID,
                        secretID,
                        startingGameDate,
                        firstHallOfFameDate,
                        money,
                        battlePoints,
                        pokeMiles,
                        watts,
                        badges,
                        bag,
                        party)
            @id = id
            @name = name
            @trainerID = trainerID
            @secretID = secretID
            @startingGameDate = startingGameDate
            @firstHallOfFameDate = firstHallOfFameDate
            @money = money
            @battlePoints = battlePoints
            @pokeMiles = pokeMiles
            @watts = watts
            @badges = badges
            @bag = bag
            @party = party
        end

    end

end
