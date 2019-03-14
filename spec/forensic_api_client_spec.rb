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
    let(:forensics_api) { described_class.new(email: email) }

    context "#get_directions" do
      let(:subject) { forensics_api.get_directions }

      it "returns the forensics evidence gathered" do
        expect(subject).not_to be_empty
        expect(subject.keys).to include("directions")
        expect(subject.values).not_to be_empty
      end

      it "returns empty hash when response status is not 200" do
        expect(described_class.new(email: '').get_directions).to be_empty
      end
    end

    context "#get_location" do
      let(:subject) { forensics_api.get_location }

      it "returns the result of sending the calculated location" do
        expect(subject).not_to be_empty
        expect(subject.keys).to include("location")
        expect(subject.values).not_to be_empty
      end
    end

  end
end
