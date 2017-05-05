require'spec_helper'

describe(Project) do

  describe('#initialize') do
    it('will create a new project') do
      project1 = Project.new({:project_name => 'Beach Clean Up'})
      expect(project1.project_name()).to(eq('Beach Clean Up'))
    end
  end

  describe('.all') do
    it('will return an empty array') do
      expect(Project.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save a new project to an array') do
        project1 = Project.new({:project_name => 'Beach Clean Up'})
        project1.save()
        project2 = Project.new({:project_name => 'Park Clean Up'})
        project2.save()
        expect(Project.all()).to(eq([project1, project2]))
    end
  end

  describe('#==') do
    it('is the same project if it has the same information') do
    project1 = Project.new({:project_name => 'Beach Clean Up'})
    project2 = Project.new({:project_name => 'Beach Clean Up'})
    expect(project1).to(eq(project2))
    end
  end

  describe('.find') do
    it('will find a project based on the id') do
      project1 = Project.new({:project_name => 'Beach Clean Up'})
      project1.save()
      project2 = Project.new({:project_name => 'Park Clean Up'})
      project2.save()
      expect(Project.find(project1.id())).to(eq(project1))
    end
  end

  describe('.sort_name') do
    it('will sort projects by their name') do
      project1 = Project.new({:project_name => 'Park Clean Up'})
      project1.save()
      project2 = Project.new({:project_name => 'Beach Clean Up'})
      project2.save()
      expect(Project.sort_name()).to(eq([project2, project1]))
    end
  end

  describe('#update') do
    it('will update the first name of a volunteer') do
      vol_Bill_Gates = Volunteer.new({:first_name => 'Bill', :last_name => 'Gates', :hours => '350', :project_id => 1})
      vol_Bill_Gates.save()
      vol_Bill_Gates.update({:first_name => 'William', :last_name => nil, :hours => '350', :project_id => 1})
      expect(vol_Bill_Gates.first_name()).to(eq('William'))
    end
    it('will update the hours of a volunteer') do
      vol_Bill_Gates = Volunteer.new({:first_name => 'Bill', :last_name => 'Gates', :hours => '350', :project_id => 1})
      vol_Bill_Gates.save()
      vol_Bill_Gates.update({:first_name => 'Bill', :last_name => 'Gates', :hours => '400', :project_id => 1})
      expect(vol_Bill_Gates.hours()).to(eq('400'))
    end
  end

  describe('#delete') do
    it('will let you delete a volunteer') do
      vol_Steve_Jobs = Volunteer.new({:first_name => 'Steve', :last_name => 'Jobs', :hours => '300', :project_id => 1})
      vol_Steve_Jobs.save()
      vol_Bill_Gates = Volunteer.new({:first_name => 'Bill', :last_name => 'Gates', :hours => '350', :project_id => 1})
      vol_Bill_Gates.save()
      vol_Steve_Jobs.delete()
      expect(Volunteer.all()).to(eq([vol_Bill_Gates]))
    end
  end
end
