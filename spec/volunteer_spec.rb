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
end
