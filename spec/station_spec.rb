require('spec_helper')

describe(Station) do

  describe(".all") do
    it("starts off with an empty list of stations") do
      expect(Station.all()).to(eq([]))
    end
  end

  # describe(".find") do
  #   it("returns as list of stations by their ID number") do
  #     test_station = Station.new({:name => "", :id => nil})
  #     test_station.save()
  #
  describe("#save") do
    it("lets you save stations to the database") do
      station = Station.new({:name => "Don Rodriguez Ave", :id => nil})
      station.save()
      expect(Station.all()).to(eq([station]))
    end
  end





end
