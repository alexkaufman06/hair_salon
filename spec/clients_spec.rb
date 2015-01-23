require('spec_helper')

describe(Client) do

  describe('.all') do
    it('returns empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the client into the database') do
      client = Client.new({ :name => "Bob" })
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe('#==') do
    it('returns as equal when client names and IDs match') do
      client1 = Client.new({ :name => "Susie"})
      client1.save()
      client1_from_db = Client.all().first()
      expect(client1).to(eq(client1_from_db))
    end
  end

  describe('.find') do
    it("returns a client object given an id") do
      client = Client.new({ :name => "Bob" })
      client.save()
      expect(Client.find(client.id())).to(eq(client))
    end
  end

  describe('#update') do
    it('will update the name of a client') do
      client = Client.new({ :name => "Bob" })
      client.save()
      client.update({ :name => "Joey"})
      expect(client.name()).to(eq("Joey"))
    end
  end

  describe('#delete') do
    it('allows the user to delete a client from the database') do
      client = Client.new({ :name => "Joe" })
      client.save()
      client2 = Client.new({ :name => "Bob" })
      client2.save()
      client.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end
end
