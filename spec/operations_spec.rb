require_relative '../lib/operations'
require 'pry'

RSpec.describe KittenRescue::Operations do

  let(:responses) do
    [
      {"message"=>"The search party has already recovered the kittens and they're happily back at home. Please zip up your code and send it to richard.hart@which.co.uk"},
      {"message":"Unfortunately, the search party failed to recover the missing kittens. You have 4 attempts remaining."},
      {"message":"Congratulations! The search party successfully recovered the missing kittens. Please zip up your code and send it to richard.hart@which.co.uk"}
    ]
  end

  describe "#gather_evidence" do
    it "returns the array of directional details" do
      expect(subject.gather_evidence).not_to be_empty
    end
  end

  describe "#process_evidence" do
    before(:each) do
      subject.gather_evidence
    end

    it "builds an array of known location data" do
      expect(subject.process_evidence).to be_kind_of Array
      expect(subject.process_evidence).not_to be_empty
      expect(subject.process_evidence[0]).to be_instance_of(KittenRescue::Location)
    end
  end

  describe "#validate_location" do
    before(:each) do
      subject.gather_evidence
      subject.process_evidence
    end

    it "responds with a positive outcome" do
      expect([responses.first["message"], responses.last["message"]]).to include(subject.validate_location)
    end

    it "doesn't respond with a negative outcome" do
      expect(subject.validate_location).not_to eq responses[1]["message"]
    end
  end
end
