require('spec_helper')

describe(Client) do

  describe('.all') do
    it('returns empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  # describe('#==') do
  #   it('returns as equal when client names and IDs match') do
  #     client1 = Client.new({ :name => "Susie"})
  #
  #   end
  # end


end
