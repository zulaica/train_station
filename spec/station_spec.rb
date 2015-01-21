require('spec_helper')

describe(Station) do

  describe(".all") do
    it("starts off with an empty list of stations") do
      expect(Station.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns as list of stations by their ID number") do
      test_station = Station.new({:name => "Bobby Boulders Ct", :id => nil})
      test_station.save()
      test_station2 = Station.new({:name => "Dirt McGurt St", :id => nil})
      test_station2.save()
      expect(Station.find(test_station2.id())).to(eq(test_station2))
    end
  end

  describe("#save") do
    it("lets you save stations to the database") do
      station = Station.new({:name => "Don Rodriguez Ave", :id => nil})
      station.save()
      expect(Station.all()).to(eq([station]))
    end
  end

  describe("#name") do
    it("tells you the station name") do
      station = Station.new({:name => "Shaolin Station", :id => nil})
      expect(station.name()).to(eq("Shaolin Station"))
    end
  end

  describe("#id") do
    it("sets the ID when you save it") do
      station = Station.new({:name => "Killer Bees Station", :id => nil})
      station.save()
      expect(station.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("makes sure stations are equal if they share a name") do
      station1 = Station.new({:name => "36th and Chamber Pl", :id => nil})
      station2 = Station.new({:name => "36th and Chamber Pl", :id => nil})
      expect(station1).to(eq(station2))
    end
  end




end
