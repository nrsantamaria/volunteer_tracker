class Project
  attr_accessor :project_name, :id

  def initialize(attributes)
    @project_name = attributes.fetch(:project_name)
    @id = attributes[:id]
  end

  def Project.all
    results = DB.exec("SELECT * FROM projects;")
    projects = []
    results.each() do |project|
      project_name = project.fetch('project_name')
      id = project.fetch('id').to_i()
      projects.push(Project.new({:project_name => project_name, :id => id}))
    end
    projects
  end
end
