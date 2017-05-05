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
    it('will update a project name') do
      project1 = Project.new({:project_name => 'Park Clean Up'})
      project1.save()
      project1.update({:project_name => 'Clean Parks!'})
      expect(project1.project_name()).to(eq('Clean Parks!'))
    end
  end

  describe('#delete') do
    it('will delete a project') do
      project1 = Project.new({:project_name => 'Park Clean Up'})
      project1.save()
      project2 = Project.new({:project_name => 'Beach Clean Up'})
      project2.save()
      project1.delete()
      expect(Project.all()).to(eq([project2]))
    end
  end

  describe('#volunteers') do
    it('will add volunteers to a project') do
      project1 = Project.new({:project_name => 'Park Clean Up'})
      project1.save()
      vol_Steve_Jobs = Volunteer.new({:first_name => 'Steve', :last_name => 'Jobs', :hours => '300', :project_id => project1.id()})
      vol_Steve_Jobs.save()
      vol_Bill_Gates = Volunteer.new({:first_name => 'Bill', :last_name => 'Gates', :hours => '350', :project_id => project1.id()})
      vol_Bill_Gates.save()
      expect(project1.volunteers()).to(eq([vol_Steve_Jobs, vol_Bill_Gates]))
    end
  end
end
