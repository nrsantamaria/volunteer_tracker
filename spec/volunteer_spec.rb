require'spec_helper'

describe(Volunteer) do

  describe('#initialize') do
    it('will create a new volunteer') do
      vol_Steve_Jobs = Volunteer.new({:first_name => 'Steve', :last_name => 'Jobs'})
      expect(vol_Steve_Jobs.first_name()).to(eq('Steve'))
    end
  end
end
