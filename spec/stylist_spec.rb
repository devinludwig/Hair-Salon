require('spec_helper')

describe(Stylist) do
  describe(".find") do
    it('returns a stylist based on its id') do
      stylist = Stylist.new({:name => "Blob Trapezoid"})
      stylist.save()
      expect(Stylist.find(stylist.id())).to(eq(stylist))
    end
  end

  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

    describe('#clients') do
      it("returns an array of the stylist's clients") do
        stylist = Stylist.new({:name => "Julia"})
        stylist.save()
        client = Client.new({:name => "Blob Trapezoid", :stylist_id => stylist.id()})
        client1 = Client.new({:name => "Blobby Trapezoid", :stylist_id => stylist.id() + 1})
        client.save()
        client1.save()
        expect(stylist.clients).to(eq([client]))
      end
    end

  describe('#save') do
    it("saves stylist to database") do
      stylist = Stylist.new({:name => "Blob Trapezoid"})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe('#name') do
    it("tells you stylist's name") do
      stylist = Stylist.new({:name => "Blob Trapezoid"})
      expect(stylist.name()).to(eq('Blob Trapezoid'))
    end
  end

  describe('#id') do
    it("tells you a stylist's id") do
      stylist = Stylist.new({:name => "Blob Trapezoid"})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      stylist = Stylist.new({:name => "Blob Trapezoid"})
      stylist1 = Stylist.new({:name => "Blob Trapezoid"})
      expect(stylist1).to(eq(stylist))
    end
  end

  describe("#update") do
    it("lets you update stylist's name in the database") do
      stylist = Stylist.new({:name => "Blob", :stylist_id => 1})
      stylist.save()
      stylist.update({:name => "Boobie"})
      expect(stylist.name()).to(eq("Boobie"))
    end
  end

  describe("#delete") do
    it("deletes stylist from the database") do
      stylist = Stylist.new({:name => "Blob"})
      stylist.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end
  end
end
