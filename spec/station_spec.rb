require('spec_helper')

describe(Station) do

  describe(".all") do
    it("starts off with an empty list of stations") do
      expect(Station.all()).to(eq([]))
    end
  end

  # describe(".find") do 
  #   it("returns as list of stations by their ID number") do
  #     test_station = Station.new({:name => "36th Chamber", :id => nil})
  #     test_station.save()
  #

end
