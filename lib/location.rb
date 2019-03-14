# frozen_string_literal: true
module KittenRescue
  class Location
    attr_accessor :bearing, :coordinates

    def initialize
       @bearing = 0
       @coordinates = {x: 0, y: 0}
    end

    def coordinates=(x: , y:)
      @coordinates = {x: x, y: y}
    end
  end
end
