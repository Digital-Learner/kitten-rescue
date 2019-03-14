require 'pry'
require_relative '../lib/forensic_api_client'

RSpec.describe KittenRescue::ForensicApiClient do
  describe "initialize" do
    it { is_expected.to respond_to :email }
  end
end