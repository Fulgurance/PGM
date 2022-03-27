module Input

    @keysTable = []
    @resetTime = Time.now
    @resetDelay = 0.3

    def self.reset
        @keysTable = []
        @resetTime = Time.now
    end

    def self.keyIndex(key)
        index = @keysTable.index {|item| item.id == key}
        if index == nil
            @keysTable << InputKey.new(key)
            index = @keysTable.size-1
        end
        return index
    end

    def self.lastPressedTime(key)
        return @keysTable[self.keyIndex(key)].lastPressedTime
    end

    def self.resetTime(key)
        @keysTable[self.keyIndex(key)].lastPressedTime = Time.now
    end

    def self.pressed(key)
        if Gosu.button_down?(key) && (Time.now-@resetTime) > @resetDelay
            return true
        else
            return false
        end
    end

    def self.keepPressed(key,delay=0.3)
        index = self.keyIndex(key)
        if (Time.now.to_f-@keysTable[index].lastPressedTime.to_f) >= delay && Gosu.button_down?(key) && (Time.now-@resetTime) > @resetDelay
            return true
        else
            return false
        end
    end

end
