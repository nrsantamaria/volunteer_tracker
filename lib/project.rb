class Project
  attr_accessor :project_name, :id

  def initialize(attributes)
    @project_name = attributes.fetch(:project_name)
    @id = attributes[:id]
  end
end
