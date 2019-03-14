require_relative '../lib/operations'
require 'pry'

RSpec.describe KittenRescue::Operations do
  describe "#gather_evidence" do
    it "returns the array of directional details" do
      expect(subject.gather_evidence).not_to be_empty
    end
  end
end
