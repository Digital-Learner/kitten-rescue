require 'pry'
require_relative '../lib/forensic_api_client'

RSpec.describe KittenRescue::ForensicApiClient do
  describe "initialize" do
    it { is_expected.to respond_to :email }

    it "has a value for the constant HOST" do
      expect(KittenRescue::ForensicApiClient::HOST).to eq("http://which-technical-exercise.herokuapp.com")
    end

    it "constant HOST is not 'incorrect_constant_value'" do
      expect(KittenRescue::ForensicApiClient::HOST).not_to eq("incorrect_constant_value")
    end
  end

  describe "api calls" do
    let(:email) {'example@example.com'}

    context "#get_directions" do
      it "returns the forensics evidence gathered" do
        forensic_api = described_class.new(email: email)
        expect(forensic_api.get_directions).not_to be_empty
      end
    end
  end
end