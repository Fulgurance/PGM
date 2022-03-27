class InputKey

    attr_accessor :id
    attr_accessor :lastPressedTime

    def initialize(id=0)
        @id = id
        @lastPressedTime = Time.now
    end

end
