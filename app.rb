require'sinatra'
require'sinatra/reloader'
also_reload('lib/**/*.rb')
require'./lib/project'
require'./lib/volunteer'
require'pg'

DB = PG.connect({:dbname => "volunteer_tracker"})

get("/") do
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:index)
end

get("/projects_sorted") do
  @projects = Project.sort_name
  @volunteers = Volunteer.all()
  erb(:index)
end

post("/projects") do
  project_name = params.fetch("project-name")
  project = Project.new({:project_name => project_name})
  project.save()
  erb(:success)
end

get("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project)
end

get("/projects/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

patch("/projects/:id") do
  project_name = params.fetch("new-project-name")
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:project_name => project_name})
  erb(:project)
end

delete("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:index)
end


get("/volunteers_sorted") do
  @volunteers = Volunteer.sort_name
  @projects = Project.all()
  erb(:index)
end

get("/volunteers/:id") do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  erb(:volunteer)
end

post("/volunteers") do
  first_name = params.fetch("volunteer-first")
  last_name = params.fetch("volunteer-last")
  hours = params.fetch('hours')
  project_id = params.fetch('project_id').to_i
  @project = Project.find(project_id)
  @volunteer = Volunteer.new({:first_name => first_name, :last_name => last_name, :hours => hours, :project_id => project_id})
  @volunteer.save()
  erb(:success)
end

get("/volunteers/:id/edit") do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  erb(:volunteer_edit)
end

patch("/volunteers/:id") do
  hours = params.fetch('new-hours')
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @volunteer.update({:hours => hours})
  erb(:volunteer)
end

delete("/volunteers/:id") do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @volunteer.delete()
  @volunteers = Volunteer.all()
  erb(:index)
end
