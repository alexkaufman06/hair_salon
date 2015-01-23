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

  describe('.find') do
    it("returns a stylist object given an id") do
      stylist = Stylist.new({ :name => "Bob" })
      stylist.save()
      expect(Stylist.find(stylist.id())).to(eq(stylist))
    end
  end

  describe('#update') do
    it('will update the name of a stylist') do
      stylist = Stylist.new({ :name => "Bob" })
      stylist.save()
      stylist.update({ :name => "Joey"})
      expect(stylist.name()).to(eq("Joey"))
    end
  end

  describe('#delete') do
    it('allows the user to delete a stylist from the database') do
      stylist = Stylist.new({ :name => "Joe" })
      stylist.save()
      stylist2 = Stylist.new({ :name => "Bob" })
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end
end
