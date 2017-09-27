require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require("./lib/volunteer")
require("pg")

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

get('/') do
  @project_list = Project.all()
  erb(:index)
end

post('/projects') do
  title = params["title"]
  new_project = Project.new({:id=> nil, :title=> title})
  new_project.save()
  @project_list = Project.all()
  erb(:index)
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:detail)
end

post('/projects/:id/volunteers') do
  @project = Project.find(params.fetch("id").to_i)
  name = params['name']
  volunteer = Volunteer.new({:name => name, :project_id => @project.id})
  volunteer.save
  redirect("/projects/#{@project.id}")
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit)
end

post('/projects/:id/edit') do
  title = params['title']
  @project_id = params[:id]
  @project = Project.find(params["id"].to_i)
  @project.update({:title => title})
  erb(:edit)
end

get('/projects/:id/delete') do
  @project = Project.find(params[:id].to_i())
  erb(:edit)
end

delete('/projects/:id/delete') do
  title = params['title']
  @project_id = params[:id]
  @project = Project.find(params["id"].to_i)
  @project.delete()
  Project.all()
  redirect('/')
end
