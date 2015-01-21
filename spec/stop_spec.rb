require('spec_helper')

describe(Stop) do

  describe(".all") do
    it("starts with an empty array of stops") do
      expect(Stop.all()).to(eq([]))
    end
  end

  # describe(".find_station") do
  #   it("return a list of lines for a station based on the station_id") do
  #
  #   end
  # end

  describe("#save") do
    it("pairs a station's ID to a line's ID") do
# binding.pry
      test_station = Station.new({:name => "Gravel Pit", :id => nil})
      test_station.save()
      test_line = Line.new({:name => "White Line", :id => nil})
      test_line.save()
      test_stop = Stop.new({:id => nil, :station_id => test_station.id(), :line_id => test_line.id()})
      test_stop.save()
      expect(Stop.all()).to(eq([test_stop]))
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
