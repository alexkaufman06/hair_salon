class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    clients = []
    returned_clients = DB.exec("SELECT * FROM clients;")
    returned_clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      clients.push(Client.new({ :name => name, :id => id }))
    end
    clients
  end

end
