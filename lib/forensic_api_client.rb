# frozen_string_literal: true
require 'http'

module KittenRescue
  class ForensicApiClient
    HOST = 'http://which-technical-exercise.herokuapp.com'

    attr_reader :email

    def initialize(email: '')
      @email = email
    end

    def get_directions
      response = HTTP.get(forensics_uri('directions'))
      parse_response(response)
    end

    def get_location(x: 0, y: 0)
      response = HTTP.get(forensics_uri("location/#{:x}/#{:y}"))
      parse_response(response)["message"]
    end

    private

    def forensics_uri(action)
      uri = [HOST, 'api', email, action].join('/')
    end

    def parse_response(response)
      return {} if response.status != 200
      JSON.parse(response.body)
    end
  end
end