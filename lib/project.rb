class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def title
    @title
  end

  def id
    @id
  end

  def save
    saved_project = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = saved_project.first().fetch("id").to_i
  end

  def ==(another_project)
    self.title().==(another_project.title()).&(self.id().==(another_project.id()))
  end

  def self.all()
    all_projects = DB.exec('SELECT * FROM projects;')
    projects = []
      all_projects.each() do |project|
        title = project.fetch("title")
        id = project.fetch("id").to_i
        projects.push(Project.new({:title => title, :id => id}))
      end
    projects
  end

end #Project class
