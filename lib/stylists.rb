require('spec_helper')


describe(Stylists) do
  describe(".all") do
    it("starts off with no Stylists") do
      expect(Stylists.all()).to(eq([]))
    end
  end
end

