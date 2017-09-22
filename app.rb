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

post('/project') do
  title = params["title"]
  new_project = Project.new({:id=> nil, :title=> title})
  new_project.save()
  @project_list = Project.all()
  erb(:index)
end

get('/project/:id') do
  @project_id = Project.all()
  @project = Word.find(params[:id])
  erb(:project_list)
end
