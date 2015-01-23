require('spec_helper')

describe(Stylist) do

  describe('.all') do
    it('returns empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the stylist into the database') do
      stylist = Stylist.new({ :name => "Bob" })
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe('#==') do
    it('returns as equal when stylist names and IDs match') do
      stylist1 = Stylist.new({ :name => "Susie"})
      stylist1.save()
      stylist1_from_db = Stylist.all().first()
      expect(stylist1).to(eq(stylist1_from_db))
    end
  end

end
