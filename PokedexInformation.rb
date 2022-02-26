module PGM

    class PokedexInformation

        attr_accessor :id
        attr_accessor :regionalID
        attr_accessor :name
        attr_accessor :category
        attr_accessor :typesID
        attr_accessor :abilities
        attr_accessor :hiddenAbility
        attr_accessor :gender
        attr_accessor :catchRate
        attr_accessor :eggGroups
        attr_accessor :hatchTime
        attr_accessor :height
        attr_accessor :weight
        attr_accessor :baseExperienceGiven
        attr_accessor :experienceGroup
        attr_accessor :statistics
        attr_accessor :bodyShape
        attr_accessor :color
        attr_accessor :baseFriendship

        def initialize( id,
                        regionalID,
                        name,
                        category,
                        typesID,
                        abilities,
                        hiddenAbility,
                        gender,
                        catchRate,
                        eggGroups,
                        hatchTime,
                        height,
                        weight,
                        baseExperienceGiven,
                        experienceGroup,
                        statistics,
                        bodyShape,
                        color,
                        baseFriendship)
            @id = id
            @regionalID = regionalID
            @name = name
            @category = category
            @typesID = typesID
            @abilities = abilities
            @hiddenAbility = hiddenAbility
            @gender = gender
            @catchRate = catchRate
            @eggGroups = eggGroups
            @hatchTime = hatchTime
            @height = height
            @weight = weight
            @baseExperienceGiven = baseExperienceGiven
            @experienceGroup = experienceGroup
            @statistics = statistics
            @bodyShape = bodyShape
            @color = color
            @baseFriendship = baseFriendship
        end

    end

end
