class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    stylists = []
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({ :name => name, :id => id }))
    end
    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_stylist|
    self.id() == another_stylist.id() && self.name() == another_stylist.name()
  end

  define_singleton_method(:find) do |search_id|
    Stylist.all().each do |stylist|
      if stylist.id() == search_id
        return stylist
      end
    end
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{self.id().to_i()};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};") 
  end

  define_method(:add_client) do |client|
      DB.exec("UPDATE clients SET stylist_id = #{self.id()} WHERE id = #{client.id().to_i()};")
  end

  define_method(:clients) do
    clients = []
    returned_client_ids = DB.exec("SELECT id FROM clients WHERE stylist_id = #{self.id()};")
    returned_client_ids.each() do |client_id_hash|
      client_id = client_id_hash.fetch('id').to_i()
      returned_client = DB.exec("SELECT * FROM clients WHERE id = #{client_id};")
      name = returned_client.first().fetch('name')
      id = returned_client.first().fetch('id').to_i()
      stylist_id = returned_client.first().fetch('stylist_id').to_i()
      clients.push(Client.new({ :name => name, :id => id, :stylist_id => stylist_id }))
    end
    clients
  end
end
