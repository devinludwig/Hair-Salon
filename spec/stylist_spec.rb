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
end
