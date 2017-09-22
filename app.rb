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

post('/') do
  @project_app = params["title"]
  new_project = Project.new({:id=> @id_app, :title=> @title_app})
  new_project.save
  erb(:index)
end

get('/project/:id') do
  @project_list = Project.all()
  @project = Project.find(params[:id])
  erb(:project_list)
end
