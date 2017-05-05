require'spec_helper'

describe(Project) do

  describe('#initialize') do
    it('will create a new project') do
      project1 = Project.new({:project_name => 'Beach Clean Up', :id => 1})
      expect(project1.project_name()).to(eq('Beach Clean Up'))
    end
  end

  describe('.all') do
    it('will return an empty array') do
      expect(Project.all()).to(eq([]))
    end
  end
end
