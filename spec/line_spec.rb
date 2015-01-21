require('spec_helper')

describe(Line) do

  describe(".all") do
    it("is an empty list of train lines") do
      expect(Line.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("makes sure lines are equal if they share a name") do
      line1 = Line.new({:name => "White Line", :id => nil})
      line2 = Line.new({:name => "White Line", :id => nil})
      expect(line1).to(eq(line2))
    end
  end





end
