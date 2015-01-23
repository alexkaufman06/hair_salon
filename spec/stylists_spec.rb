require('spec_helper')

describe(Stylist) do

  describe('.all') do
    it('returns empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end


end
