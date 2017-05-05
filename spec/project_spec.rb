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
end
