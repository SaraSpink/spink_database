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
  @project_list = Project.all()
  @project = Project.find(params[:id])
  erb(:project_list)
end
