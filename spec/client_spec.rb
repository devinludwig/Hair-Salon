require('spec_helper')

describe(Client) do
  describe(".find") do
    it('returns a client based on its id') do
      client = Client.new({:name => "Blob Trapezoid", :stylist_id => 1})
      client.save()
      expect(Client.find(client.id())).to(eq(client))
    end
  end

  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves client to database") do
      client = Client.new({:name => "Blob Trapezoid", :stylist_id => 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe('#name') do
    it("tells you client's name") do
      client = Client.new({:name => "Blob Trapezoid", :stylist_id => 1})
      expect(client.name()).to(eq('Blob Trapezoid'))
    end
  end

  describe('#id') do
    it("tells you a client's id") do
      client = Client.new({:name => "Blob Trapezoid", :stylist_id => 1})
      client.save()
      expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#stylist_id') do
    it("tells you client's stylist_id") do
      client = Client.new({:name => "Blob Trapezoid", :stylist_id => 7})
      expect(client.stylist_id()).to(eq(7))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name") do
      client = Client.new({:name => "Blob Trapezoid", :stylist_id => 1})
      client1 = Client.new({:name => "Blob Trapezoid", :stylist_id => 1})
      expect(client1).to(eq(client))
    end
  end

  describe("#update") do
    it("lets you update client's stylist in the database") do
      client = Client.new({:name => "Blob", :stylist_id => 1})
      client.save()
      client.update({:stylist_id => 2})
      expect(client.stylist_id()).to(eq(2))
    end
  end

  describe("#delete") do
    it("deletes client from the database") do
      client = Client.new({:name => "Blob", :stylist_id => 1})
      client.save()
      client.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
