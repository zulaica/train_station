require('spec_helper')

describe(Stop) do

  describe(".all") do
    it("starts with an empty array of stops") do
      expect(Stop.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("makes sure stops are equal if they share a station_id") do
      stop1 = Stop.new({:station_id => 1, :line_id => 1})
      stop2 = Stop.new({:station_id => 1, :line_id => 1})
      expect(stop1).to(eq(stop2))
    end
  end


end
