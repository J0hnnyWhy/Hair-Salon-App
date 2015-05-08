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

  describe("#==") do
    it("is the same stylist if they have the same name") do
      stylist1 = Stylists.new({:name => "Debbie", :id => nil})
      stylist2 = Stylists.new({:name => "Debbie", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end


  describe(".find") do
    it('returns a stylist by their ID') do
      test_stylist = Stylists.new({:name => "Debbie", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylists.new({:name => "Mike", :id => nil})
      test_stylist2.save()
      expect(Stylists.find(test_stylist.id())).to(eq(test_stylist))
    end
  end

end
