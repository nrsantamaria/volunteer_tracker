require'spec_helper'

describe(Volunteer) do

  describe('#initialize') do
    it('will create a new volunteer') do
      vol_Steve_Jobs = Volunteer.new({:first_name => 'Steve', :last_name => 'Jobs'})
      expect(vol_Steve_Jobs.first_name()).to(eq('Steve'))
    end
    it('will create a new volunteer') do
      vol_Steve_Jobs = Volunteer.new({:first_name => 'Steve', :last_name => 'Jobs'})
      expect(vol_Steve_Jobs.last_name()).to(eq('Jobs'))
    end
  end

  describe('.all') do
    it('will return an empty array at the start') do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will add new volunteers to an array') do
      vol_Steve_Jobs = Volunteer.new({:first_name => 'Steve', :last_name => 'Jobs'})
      vol_Steve_Jobs.save()
      vol_Bill_Gates = Volunteer.new({:first_name => 'Bill', :last_name => 'Gates'})
      vol_Bill_Gates.save()
      expect(Volunteer.all()).to(eq([vol_Steve_Jobs, vol_Bill_Gates]))
    end
  end

  describe('#==') do
    it('will be the same volunteer if they have the same information') do
      vol_Steve_Jobs = Volunteer.new({:first_name => 'Steve', :last_name => 'Jobs'})
      vol_Steve_Jobs2 = Volunteer.new({:first_name => 'Steve', :last_name => 'Jobs'})
      expect(vol_Steve_Jobs).to(eq(vol_Steve_Jobs2))
    end
  end
end
