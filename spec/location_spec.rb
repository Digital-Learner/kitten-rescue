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

  describe "can receive coordinates" do
    it "has coordinates of '{x: 5, y: 0}'" do
      expect(described_class.new(x: 5).coordinates).to include ({x: 5, y: 0})
    end

    it "has coordinates of '{x: 0, y: 4}'" do
      expect(described_class.new(y: 4).coordinates).to include ({x: 0, y: 4})
    end

    it "has coordinates of '{x: 2, y: 3}'" do
      expect(described_class.new(x: 2, y: 3).coordinates).to include ({x: 2, y: 3})
    end

    it "has coordinates of '{x: -1, y: -3}'" do
      expect(described_class.new(x: -1, y: -3).coordinates).to include ({x: -1, y: -3})
    end
  end
end
