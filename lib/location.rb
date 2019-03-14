# frozen_string_literal: true
module KittenRescue
  class Location
    attr_accessor :bearing, :coordinates

    def initialize(x: 0, y: 0, bearing: 0)
       @bearing = bearing
       @coordinates = {x: x, y: y}
    end

    def coordinates=(x: , y:)
      @coordinates = {x: x, y: y}
    end
  end
end
