require_relative '../lib/location'
require 'pry'

RSpec.describe KittenRescue::Location do
  describe "defaults" do
    it { is_expected.to respond_to :bearing }
    it { is_expected.to respond_to :coordinates }

    it "has coordinates of '{x: 0, y: 0}'" do
      expect(subject.coordinates).to include ({x: 0, y: 0})
    end

    it "has a bearing of 0 '(North)'" do
      expect(subject.bearing).to eq 0
    end
  end
end