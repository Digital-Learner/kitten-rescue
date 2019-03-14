# frozen_string_literal: true
require 'http'

module KittenRescue
  class ForensicApiClient
    attr_reader :email

    def initialize(email: '')
      @email = email
    end
  end
end
