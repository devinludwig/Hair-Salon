class Stylist
  attr_reader(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) rescue nil
  end

  def save
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end

  def clients
    clients = []
    returned_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{@id}")
    returned_clients.each() do |client|
      name = client.fetch('name')
      id = client.fetch('id').to_i()
      stylist_id = client.fetch('stylist_id').to_i()
      clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    clients
  end

  def update(attributes)
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@stylist_id}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{@id};")
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists.sort_by!{|i| i.name()}
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all.each() do |stylist|
      if stylist.id.eql?(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:==) do |another_stylist|
    name().==(another_stylist.name()).&(self.id().==(another_stylist.id()))
  end
end
