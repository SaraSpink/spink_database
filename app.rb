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
