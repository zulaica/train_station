require('spec_helper')

describe(Line) do

  describe('.all') do
    it("is an empty list of train lines") do
      expect(Line.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a line to the database") do
      test_line = Line.new({:name => "White Line", :id => nil})
      test_line.save()
      expect(Line.all()).to(eq([test_line]))
    end
  end

  describe('#name') do
    it("tells you the name of the line") do
      test_line = Line.new({:name => "White Line", :id => nil})
      expect(test_line.name()).to(eq("White Line"))
    end
  end

  describe('#id') do
    it("sets the ID when you save it") do
      test_line = Line.new({:name => "White Line", :id => nil})
      test_line.save()
      expect(test_line.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#add_stop') do
    it("associates a Line stop with a Station") do
      station = Station.new({:name => "Brooklyn Zoo", :id => nil})
      station.save()
      line = Line.new({:name => "White Line", :id => nil})
      line.save()
      the_stop = Stop.new({:station_id => station.id(), :line_id => line.id()})
      the_stop.save()
      expect(Stop.all()).to(eq([the_stop]))
    end
  end

  describe('#==') do
    it("makes sure lines are equal if they share a name") do
      line1 = Line.new({:name => "White Line", :id => nil})
      line2 = Line.new({:name => "White Line", :id => nil})
      expect(line1).to(eq(line2))
    end
  end

end
