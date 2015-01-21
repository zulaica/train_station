require('spec_helper')

describe(Stop) do

  describe(".all") do
    it("starts with an empty array of stops") do
      expect(Stop.all()).to(eq([]))
    end
  end

end
