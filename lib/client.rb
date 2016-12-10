class Client
  attr_reader(:name, :id, :stylist_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) rescue nil
    @stylist_id = attributes.fetch(:stylist_id) rescue nil
  end

  def save
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end

  def update(attributes)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = self.id()
    DB.exec("UPDATE clients SET stylist_id = #{@stylist_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM clients WHERE id = #{@id};")
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch('name')
      id = client.fetch('id').to_i()
      stylist_id = client.fetch('stylist_id').to_i()
      clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    clients.sort_by!{|i| i.name()}
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all.each() do |client|
      if client.id.eql?(id)
        found_client = client
      end
    end
    found_client
  end

  define_method(:==) do |another_client|
    name().==(another_client.name()).&(self.id().==(another_client.id()))
  end
end
