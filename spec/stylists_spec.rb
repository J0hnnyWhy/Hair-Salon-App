require('spec_helper')


describe(Stylists) do

  describe(".all") do
    it("starts off with no Stylists") do
      expect(Stylists.all()).to(eq([]))
    end
  end

    describe("#name") do
    it("tells you their name") do
      stylist = Stylists.new({:name => "Debbie", :id => nil})
      expect(stylist.name()).to(eq("Debbie"))
    end
  end

  describe("#id") do
    it("sets its ID when you save them") do
      stylist = Stylists.new({:name => "Debbie", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
