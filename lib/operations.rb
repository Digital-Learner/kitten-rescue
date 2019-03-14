# frozen_string_literal: true
require './lib/location'
require './lib/forensic_api_client'

module KittenRescue
  class Operations
    VALID_DIRECTIONS = %w(forward left right)

    attr_reader :directions, :locations
    # attr_writer :directions

    def initialize
      @directions = []
      @locations = []
      @locations << Location.new
    end

    def gather_evidence
      data = api_client.get_directions
      return if data["directions"].empty?
      @directions = data["directions"]
    end

    def process_evidence
      process_directions if valid_directions?
      return @locations
    end

    private

    def api_client
      KittenRescue::ForensicApiClient.new(email: 'example@example.com')
    end

    def valid_directions?
      return false if @directions.empty?
      @directions.all? { |d| KittenRescue::Operations::VALID_DIRECTIONS.include?(d) }
    end

    def process_directions
      directions.each do |direction|
        new_position = create_and_update_position(last_position: locations.last)
        new_position.bearing -= 90 if direction == "left"
        new_position.bearing += 90 if direction == "right"
        move(new_position)
        @locations << new_position
      end
    end

    def create_and_update_position(last_position:)
      coordinates = last_position.coordinates
      Location.new(x: coordinates[:x], y: coordinates[:y], bearing: last_position.bearing)
    end

    def move(position)
      case position.bearing
      when 0
        position.coordinates[:y] += 1
      when 90
        position.coordinates[:x] += 1
      when 180
        position.coordinates[:y] -= 1
      when 270
        position.coordinates[:x] -= 1
      end
    end
  end
end
