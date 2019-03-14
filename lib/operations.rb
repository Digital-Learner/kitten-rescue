# frozen_string_literal: true
require './lib/location'
require './lib/forensic_api_client'

module KittenRescue
  class Operations
    def gather_evidence
      data = api_client.get_directions
      return [] if data["directions"].empty?
      data["directions"]
    end

    private

    def api_client
      KittenRescue::ForensicApiClient.new(email: 'example@example.com')
    end
  end
end
