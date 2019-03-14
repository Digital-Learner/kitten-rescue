require_relative '../lib/operations'
require 'pry'

RSpec.describe KittenRescue::Operations do
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
end
