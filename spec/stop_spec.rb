require('spec_helper')

describe(Stop) do

  describe(".all") do
    it("starts with an empty array of stops") do
      expect(Stop.all()).to(eq([]))
    end
  end

  describe(".find_station_lines") do
    it("return a list of lines for a station based on the station_id") do
      test_station = Station.new({:name => "36th and Chamber Pl", :id => nil})
      test_station.save()
      test_line1 = Line.new({:name => "White Line", :id => nil})
      test_line1.save()
      test_line2 = Line.new({:name => "Grey Line", :id => nil})
      test_line2.save()
      test_line3 = Line.new({:name => "Black Line", :id => nil})
      test_line3.save()
      test_station.add_line(test_line1.id())
      test_station.add_line(test_line3.id())
      expect(Stop.find_station_lines(test_station.id())).to(eq([test_line1.name(), test_line3.name()]))
    end
  end

  describe("#save") do
    it("pairs a station's ID to a line's ID") do
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
